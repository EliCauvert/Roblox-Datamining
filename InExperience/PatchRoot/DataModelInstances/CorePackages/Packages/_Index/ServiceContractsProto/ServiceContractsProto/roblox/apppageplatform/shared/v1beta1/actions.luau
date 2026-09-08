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
		var2, var197 = protoModule.writeVarInt(var2, var3, t.ActionType.toNumber(self.action_type))
		buff = var2
		var1 = var3
	end
	if self.action_params ~= nil then
		local var4 = self.action_params:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var200 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
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
			error("Unsupported wire type: " .. var204)
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
		var23, var228 = protoModule.writeBuffer(var23, var24, var22, buffer.len(var22))
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
			error("Unsupported wire type: " .. var232)
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
		var39, var252 = protoModule.writeVarInt(var39, var40, t.ActionType.toNumber(self.action_type))
		buff = var39
		var38 = var40
	end
	if self.action_params ~= nil then
		local var41 = self.action_params:encode()
		local var42, var43 = protoModule.writeTag(buff, var38, 2, protoModule.wireTypes.lengthDelimited)
		var42, var255 = protoModule.writeBuffer(var42, var43, var41, buffer.len(var41))
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
			error("Unsupported wire type: " .. var259)
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
		var60, var283 = protoModule.writeBuffer(var60, var61, var59, buffer.len(var59))
		buff = var60
		var58 = var61
	end
	if self.title_key ~= nil then
		local var62 = self.title_key:encode()
		local var63, var64 = protoModule.writeTag(buff, var58, 2, protoModule.wireTypes.lengthDelimited)
		var63, var286 = protoModule.writeBuffer(var63, var64, var62, buffer.len(var62))
		buff = var63
		var58 = var64
	end
	if self.on_webview_close ~= nil then
		local var65 = self.on_webview_close:encode()
		local var66, var67 = protoModule.writeTag(buff, var58, 4, protoModule.wireTypes.lengthDelimited)
		var66, var289 = protoModule.writeBuffer(var66, var67, var65, buffer.len(var65))
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
			error("Unsupported wire type: " .. var293)
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
		var80, var317 = protoModule.writeVarInt(var80, var81, t.ActionType.toNumber(self.action_type))
		buff = var80
		var79 = var81
	end
	if self.action_params ~= nil then
		local var82 = self.action_params:encode()
		local var83, var84 = protoModule.writeTag(buff, var79, 2, protoModule.wireTypes.lengthDelimited)
		var83, var320 = protoModule.writeBuffer(var83, var84, var82, buffer.len(var82))
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
			error("Unsupported wire type: " .. var324)
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
		var101, var348 = protoModule.writeBuffer(var101, var102, var100, buffer.len(var100))
		buff = var101
		var99 = var102
	end
	if self.assignment_type ~= nil then
		local var103 = self.assignment_type:encode()
		local var104, var105 = protoModule.writeTag(buff, var99, 2, protoModule.wireTypes.lengthDelimited)
		var104, var351 = protoModule.writeBuffer(var104, var105, var103, buffer.len(var103))
		buff = var104
		var99 = var105
	end
	if self.social_link_type ~= nil then
		local var106 = self.social_link_type:encode()
		local var107, var108 = protoModule.writeTag(buff, var99, 3, protoModule.wireTypes.lengthDelimited)
		var107, var354 = protoModule.writeBuffer(var107, var108, var106, buffer.len(var106))
		buff = var107
		var99 = var108
	end
	if self.social_link_url ~= nil then
		local var109 = self.social_link_url:encode()
		local var110, var111 = protoModule.writeTag(buff, var99, 4, protoModule.wireTypes.lengthDelimited)
		var110, var357 = protoModule.writeBuffer(var110, var111, var109, buffer.len(var109))
		buff = var110
		var99 = var111
	end
	if self.social_link_display_type ~= nil then
		local var112 = self.social_link_display_type:encode()
		local var113, var114 = protoModule.writeTag(buff, var99, 5, protoModule.wireTypes.lengthDelimited)
		var113, var360 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
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
			error("Unsupported wire type: " .. var364)
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
		var125, var392 = protoModule.writeVarInt(var125, var126, t.ActionType.toNumber(self.action_type))
		buff = var125
		var124 = var126
	end
	if self.action_params ~= nil then
		local var127 = self.action_params:encode()
		local var128, var129 = protoModule.writeTag(buff, var124, 2, protoModule.wireTypes.lengthDelimited)
		var128, var395 = protoModule.writeBuffer(var128, var129, var127, buffer.len(var127))
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
			error("Unsupported wire type: " .. var399)
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
		var146, var423 = protoModule.writeBuffer(var146, var147, var145, buffer.len(var145))
		buff = var146
		var144 = var147
	end
	if self.universe_id ~= nil then
		local var148 = self.universe_id:encode()
		local var149, var150 = protoModule.writeTag(buff, var144, 2, protoModule.wireTypes.lengthDelimited)
		var149, var426 = protoModule.writeBuffer(var149, var150, var148, buffer.len(var148))
		buff = var149
		var144 = var150
	end
	if self.inherit_referral_session ~= nil then
		local var151 = self.inherit_referral_session:encode()
		local var152, var153 = protoModule.writeTag(buff, var144, 3, protoModule.wireTypes.lengthDelimited)
		var152, var429 = protoModule.writeBuffer(var152, var153, var151, buffer.len(var151))
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
			error("Unsupported wire type: " .. var433)
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
		var166, var457 = protoModule.writeVarInt(var166, var167, t.ActionType.toNumber(self.action_type))
		buff = var166
		var165 = var167
	end
	if self.action_params ~= nil then
		local var168 = self.action_params:encode()
		local var169, var170 = protoModule.writeTag(buff, var165, 2, protoModule.wireTypes.lengthDelimited)
		var169, var460 = protoModule.writeBuffer(var169, var170, var168, buffer.len(var168))
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
			error("Unsupported wire type: " .. var464)
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
		var187, var488 = protoModule.writeBuffer(var187, var188, var186, buffer.len(var186))
		buff = var187
		var185 = var188
	end
	if self.universe_id ~= nil then
		local var189 = self.universe_id:encode()
		local var190, var191 = protoModule.writeTag(buff, var185, 2, protoModule.wireTypes.lengthDelimited)
		var190, var491 = protoModule.writeBuffer(var190, var191, var189, buffer.len(var189))
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
			error("Unsupported wire type: " .. var495)
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
		var205, var517 = protoModule.writeVarInt(var205, var206, t.ActionType.toNumber(self.action_type))
		buff = var205
		var204 = var206
	end
	if self.action_params ~= nil then
		local var207 = self.action_params:encode()
		local var208, var209 = protoModule.writeTag(buff, var204, 2, protoModule.wireTypes.lengthDelimited)
		var208, var520 = protoModule.writeBuffer(var208, var209, var207, buffer.len(var207))
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
			error("Unsupported wire type: " .. var524)
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
		item_sub_type_name = if p12 == nil or p12.item_sub_type_name == nil then nil else p12.item_sub_type_name,
		item_price = if p12 == nil or p12.item_price == nil then nil else p12.item_price
	}, t_12)
end

function t_12:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var224 = 0
	
	if self.item_id ~= nil then
		local var225 = self.item_id:encode()
		local var226, var227 = protoModule.writeTag(buff, var224, 1, protoModule.wireTypes.lengthDelimited)
		var226, var548 = protoModule.writeBuffer(var226, var227, var225, buffer.len(var225))
		buff = var226
		var224 = var227
	end
	if self.item_type ~= nil then
		local var228 = self.item_type:encode()
		local var229, var230 = protoModule.writeTag(buff, var224, 2, protoModule.wireTypes.lengthDelimited)
		var229, var551 = protoModule.writeBuffer(var229, var230, var228, buffer.len(var228))
		buff = var229
		var224 = var230
	end
	if self.item_sub_type_name ~= nil then
		local var231 = self.item_sub_type_name:encode()
		local var232, var233 = protoModule.writeTag(buff, var224, 3, protoModule.wireTypes.lengthDelimited)
		var232, var554 = protoModule.writeBuffer(var232, var233, var231, buffer.len(var231))
		buff = var232
		var224 = var233
	end
	if self.item_price ~= nil then
		local var234 = self.item_price:encode()
		local var235, var236 = protoModule.writeTag(buff, var224, 4, protoModule.wireTypes.lengthDelimited)
		var235, var557 = protoModule.writeBuffer(var235, var236, var234, buffer.len(var234))
		buff = var235
		var224 = var236
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
			elseif var230 == 4 then
				local _ = nil
				local var239, var240 = protoModule.readBuffer(p12, var225)
				var225 = var240
				var224.item_price = propTypesModule.Int64Prop.decode(var239)
			else
				local _ = nil
				local var241, var242 = protoModule.readVarInt(p12, var225)
				var225 = var242 + var241
			end
		elseif var226 == protoModule.wireTypes.i32 then
			local _ = nil
			local var243, var244 = protoModule.readFixed32(p12, var225)
			local _ = var243
			var225 = var244
		elseif var226 == protoModule.wireTypes.i64 then
			local _ = nil
			local var245, var246 = protoModule.readFixed64(p12, var225)
			local _ = var245
			var225 = var246
		else
			error("Unsupported wire type: " .. var561)
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
	if self.item_price ~= nil then
		t.itemPrice = self.item_price:jsonEncode()
	end
	return t
end

function t_12:jsonDecode()
	-- upvalues: t_12 (ref), propTypesModule (ref)
	local var247 = t_12.new()
	
	if self.item_id ~= nil then
		var247.item_id = propTypesModule.StringProp.jsonDecode(self.item_id)
	end
	if self.itemId ~= nil then
		var247.item_id = propTypesModule.StringProp.jsonDecode(self.itemId)
	end
	if self.item_type ~= nil then
		var247.item_type = propTypesModule.StringProp.jsonDecode(self.item_type)
	end
	if self.itemType ~= nil then
		var247.item_type = propTypesModule.StringProp.jsonDecode(self.itemType)
	end
	if self.item_sub_type_name ~= nil then
		var247.item_sub_type_name = propTypesModule.StringProp.jsonDecode(self.item_sub_type_name)
	end
	if self.itemSubTypeName ~= nil then
		var247.item_sub_type_name = propTypesModule.StringProp.jsonDecode(self.itemSubTypeName)
	end
	if self.item_price ~= nil then
		var247.item_price = propTypesModule.Int64Prop.jsonDecode(self.item_price)
	end
	if self.itemPrice ~= nil then
		var247.item_price = propTypesModule.Int64Prop.jsonDecode(self.itemPrice)
	end
	return var247
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
	local var247 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var248, var249 = protoModule.writeTag(buff, var247, 1, protoModule.wireTypes.varint)
		var248, var587 = protoModule.writeVarInt(var248, var249, t.ActionType.toNumber(self.action_type))
		buff = var248
		var247 = var249
	end
	if self.action_params ~= nil then
		local var250 = self.action_params:encode()
		local var251, var252 = protoModule.writeTag(buff, var247, 2, protoModule.wireTypes.lengthDelimited)
		var251, var590 = protoModule.writeBuffer(var251, var252, var250, buffer.len(var250))
		buff = var251
		var247 = var252
	end
	local buff_1 = buffer.create(var247)
	buffer.copy(buff_1, 0, buff, 0, var247)
	
	return buff_1
end

function t_13.decode(p13)
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var247 = t_13.new()
	local var248 = 0
	while var248 < buffer.len(p13) do
		local _ = nil
		local var249 = nil
		local var250, var251, var252 = protoModule.readTag(p13, var248)
		local var253 = var250
		var249 = var251
		var248 = var252
		
		if var249 == protoModule.wireTypes.varint then
			if var253 == 1 then
				local _ = nil
				local var254, var255 = protoModule.readVarIntI32(p13, var248)
				local var256 = var254
				var248 = var255
				var247.action_type = t.ActionType.fromNumber(var256) or var256
			else
				local _ = nil
				local var257, var258 = protoModule.readVarInt(p13, var248)
				local _ = var257
				var248 = var258
			end
		end
		if var249 == protoModule.wireTypes.lengthDelimited then
			if var253 == 2 then
				local _ = nil
				local var259, var260 = protoModule.readBuffer(p13, var248)
				var248 = var260
				var247.action_params = t.OpenSeeAllAction_Params.decode(var259)
			else
				local _ = nil
				local var261, var262 = protoModule.readVarInt(p13, var248)
				var248 = var262 + var261
			end
		elseif var249 == protoModule.wireTypes.i32 then
			local _ = nil
			local var263, var264 = protoModule.readFixed32(p13, var248)
			local _ = var263
			var248 = var264
		elseif var249 == protoModule.wireTypes.i64 then
			local _ = nil
			local var265, var266 = protoModule.readFixed64(p13, var248)
			local _ = var265
			var248 = var266
		else
			error("Unsupported wire type: " .. var594)
		end
	end
	return var247
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
	local var267 = t_13.new()
	
	if self.action_type ~= nil then
		var267.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var267.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var267.action_params = t.OpenSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var267.action_params = t.OpenSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var267
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
	local var267 = 0
	
	if self.collection_id ~= nil then
		local var268 = self.collection_id:encode()
		local var269, var270 = protoModule.writeTag(buff, var267, 1, protoModule.wireTypes.lengthDelimited)
		var269, var618 = protoModule.writeBuffer(var269, var270, var268, buffer.len(var268))
		buff = var269
		var267 = var270
	end
	if self.game_set_target_id ~= nil then
		local var271 = self.game_set_target_id:encode()
		local var272, var273 = protoModule.writeTag(buff, var267, 2, protoModule.wireTypes.lengthDelimited)
		var272, var621 = protoModule.writeBuffer(var272, var273, var271, buffer.len(var271))
		buff = var272
		var267 = var273
	end
	if self.collection_position ~= nil then
		local var274 = self.collection_position:encode()
		local var275, var276 = protoModule.writeTag(buff, var267, 3, protoModule.wireTypes.lengthDelimited)
		var275, var624 = protoModule.writeBuffer(var275, var276, var274, buffer.len(var274))
		buff = var275
		var267 = var276
	end
	local buff_1 = buffer.create(var267)
	buffer.copy(buff_1, 0, buff, 0, var267)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), propTypesModule (ref)
	local var267 = t_14.new()
	local var268 = 0
	while var268 < buffer.len(p14) do
		local _ = nil
		local var269 = nil
		local var270, var271, var272 = protoModule.readTag(p14, var268)
		local var273 = var270
		var269 = var271
		var268 = var272
		
		if var269 == protoModule.wireTypes.varint then
			local _ = nil
			local var274, var275 = protoModule.readVarInt(p14, var268)
			local _ = var274
			var268 = var275
			continue
		end
		if var269 == protoModule.wireTypes.lengthDelimited then
			if var273 == 1 then
				local _ = nil
				local var276, var277 = protoModule.readBuffer(p14, var268)
				var268 = var277
				var267.collection_id = propTypesModule.StringProp.decode(var276)
			elseif var273 == 2 then
				local _ = nil
				local var278, var279 = protoModule.readBuffer(p14, var268)
				var268 = var279
				var267.game_set_target_id = propTypesModule.StringProp.decode(var278)
			elseif var273 == 3 then
				local _ = nil
				local var280, var281 = protoModule.readBuffer(p14, var268)
				var268 = var281
				var267.collection_position = propTypesModule.StringProp.decode(var280)
			else
				local _ = nil
				local var282, var283 = protoModule.readVarInt(p14, var268)
				var268 = var283 + var282
			end
		elseif var269 == protoModule.wireTypes.i32 then
			local _ = nil
			local var284, var285 = protoModule.readFixed32(p14, var268)
			local _ = var284
			var268 = var285
		elseif var269 == protoModule.wireTypes.i64 then
			local _ = nil
			local var286, var287 = protoModule.readFixed64(p14, var268)
			local _ = var286
			var268 = var287
		else
			error("Unsupported wire type: " .. var628)
		end
	end
	return var267
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
	local var288 = t_14.new()
	
	if self.collection_id ~= nil then
		var288.collection_id = propTypesModule.StringProp.jsonDecode(self.collection_id)
	end
	if self.collectionId ~= nil then
		var288.collection_id = propTypesModule.StringProp.jsonDecode(self.collectionId)
	end
	if self.game_set_target_id ~= nil then
		var288.game_set_target_id = propTypesModule.StringProp.jsonDecode(self.game_set_target_id)
	end
	if self.gameSetTargetId ~= nil then
		var288.game_set_target_id = propTypesModule.StringProp.jsonDecode(self.gameSetTargetId)
	end
	if self.collection_position ~= nil then
		var288.collection_position = propTypesModule.StringProp.jsonDecode(self.collection_position)
	end
	if self.collectionPosition ~= nil then
		var288.collection_position = propTypesModule.StringProp.jsonDecode(self.collectionPosition)
	end
	return var288
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
	local var288 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var289, var290 = protoModule.writeTag(buff, var288, 1, protoModule.wireTypes.varint)
		var289, var652 = protoModule.writeVarInt(var289, var290, t.ActionType.toNumber(self.action_type))
		buff = var289
		var288 = var290
	end
	if self.action_params ~= nil then
		local var291 = self.action_params:encode()
		local var292, var293 = protoModule.writeTag(buff, var288, 2, protoModule.wireTypes.lengthDelimited)
		var292, var655 = protoModule.writeBuffer(var292, var293, var291, buffer.len(var291))
		buff = var292
		var288 = var293
	end
	local buff_1 = buffer.create(var288)
	buffer.copy(buff_1, 0, buff, 0, var288)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var288 = t_15.new()
	local var289 = 0
	while var289 < buffer.len(p15) do
		local _ = nil
		local var290 = nil
		local var291, var292, var293 = protoModule.readTag(p15, var289)
		local var294 = var291
		var290 = var292
		var289 = var293
		
		if var290 == protoModule.wireTypes.varint then
			if var294 == 1 then
				local _ = nil
				local var295, var296 = protoModule.readVarIntI32(p15, var289)
				local var297 = var295
				var289 = var296
				var288.action_type = t.ActionType.fromNumber(var297) or var297
			else
				local _ = nil
				local var298, var299 = protoModule.readVarInt(p15, var289)
				local _ = var298
				var289 = var299
			end
		end
		if var290 == protoModule.wireTypes.lengthDelimited then
			if var294 == 2 then
				local _ = nil
				local var300, var301 = protoModule.readBuffer(p15, var289)
				var289 = var301
				var288.action_params = t.OpenSponsoredTooltipAction_Params.decode(var300)
			else
				local _ = nil
				local var302, var303 = protoModule.readVarInt(p15, var289)
				var289 = var303 + var302
			end
		elseif var290 == protoModule.wireTypes.i32 then
			local _ = nil
			local var304, var305 = protoModule.readFixed32(p15, var289)
			local _ = var304
			var289 = var305
		elseif var290 == protoModule.wireTypes.i64 then
			local _ = nil
			local var306, var307 = protoModule.readFixed64(p15, var289)
			local _ = var306
			var289 = var307
		else
			error("Unsupported wire type: " .. var659)
		end
	end
	return var288
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
	local var308 = t_15.new()
	
	if self.action_type ~= nil then
		var308.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var308.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var308.action_params = t.OpenSponsoredTooltipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var308.action_params = t.OpenSponsoredTooltipAction_Params.jsonDecode(self.actionParams)
	end
	return var308
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
	local var308 = t_16.new()
	local var309 = 0
	while var309 < buffer.len(p16) do
		local var310 = nil
		local _ = nil
		local var311, var312, var313 = protoModule.readTag(p16, var309)
		var310 = var311
		local var314 = var312
		var309 = var313
		
		if var314 == protoModule.wireTypes.varint then
			local _ = nil
			local var315, var316 = protoModule.readVarInt(p16, var309)
			local _ = var315
			var309 = var316
		elseif var314 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var317, var318 = protoModule.readVarInt(p16, var309)
			var309 = var318 + var317
		elseif var314 == protoModule.wireTypes.i32 then
			local _ = nil
			local var319, var320 = protoModule.readFixed32(p16, var309)
			local _ = var319
			var309 = var320
		elseif var314 == protoModule.wireTypes.i64 then
			local _ = nil
			local var321, var322 = protoModule.readFixed64(p16, var309)
			local _ = var321
			var309 = var322
		else
			error("Unsupported wire type: " .. var686)
		end
	end
	return var308
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
	local var323 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var324, var325 = protoModule.writeTag(buff, var323, 1, protoModule.wireTypes.varint)
		var324, var698 = protoModule.writeVarInt(var324, var325, t.ActionType.toNumber(self.action_type))
		buff = var324
		var323 = var325
	end
	if self.action_params ~= nil then
		local var326 = self.action_params:encode()
		local var327, var328 = protoModule.writeTag(buff, var323, 2, protoModule.wireTypes.lengthDelimited)
		var327, var701 = protoModule.writeBuffer(var327, var328, var326, buffer.len(var326))
		buff = var327
		var323 = var328
	end
	local buff_1 = buffer.create(var323)
	buffer.copy(buff_1, 0, buff, 0, var323)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref), t (ref)
	local var323 = t_17.new()
	local var324 = 0
	while var324 < buffer.len(p17) do
		local _ = nil
		local var325 = nil
		local var326, var327, var328 = protoModule.readTag(p17, var324)
		local var329 = var326
		var325 = var327
		var324 = var328
		
		if var325 == protoModule.wireTypes.varint then
			if var329 == 1 then
				local _ = nil
				local var330, var331 = protoModule.readVarIntI32(p17, var324)
				local var332 = var330
				var324 = var331
				var323.action_type = t.ActionType.fromNumber(var332) or var332
			else
				local _ = nil
				local var333, var334 = protoModule.readVarInt(p17, var324)
				local _ = var333
				var324 = var334
			end
		end
		if var325 == protoModule.wireTypes.lengthDelimited then
			if var329 == 2 then
				local _ = nil
				local var335, var336 = protoModule.readBuffer(p17, var324)
				var324 = var336
				var323.action_params = t.PlayButtonClickAction_Params.decode(var335)
			else
				local _ = nil
				local var337, var338 = protoModule.readVarInt(p17, var324)
				var324 = var338 + var337
			end
		elseif var325 == protoModule.wireTypes.i32 then
			local _ = nil
			local var339, var340 = protoModule.readFixed32(p17, var324)
			local _ = var339
			var324 = var340
		elseif var325 == protoModule.wireTypes.i64 then
			local _ = nil
			local var341, var342 = protoModule.readFixed64(p17, var324)
			local _ = var341
			var324 = var342
		else
			error("Unsupported wire type: " .. var705)
		end
	end
	return var323
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
	local var343 = t_17.new()
	
	if self.action_type ~= nil then
		var343.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var343.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var343.action_params = t.PlayButtonClickAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var343.action_params = t.PlayButtonClickAction_Params.jsonDecode(self.actionParams)
	end
	return var343
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
	local var343 = t_18.new()
	local var344 = 0
	while var344 < buffer.len(p18) do
		local var345 = nil
		local _ = nil
		local var346, var347, var348 = protoModule.readTag(p18, var344)
		var345 = var346
		local var349 = var347
		var344 = var348
		
		if var349 == protoModule.wireTypes.varint then
			local _ = nil
			local var350, var351 = protoModule.readVarInt(p18, var344)
			local _ = var350
			var344 = var351
		elseif var349 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var352, var353 = protoModule.readVarInt(p18, var344)
			var344 = var353 + var352
		elseif var349 == protoModule.wireTypes.i32 then
			local _ = nil
			local var354, var355 = protoModule.readFixed32(p18, var344)
			local _ = var354
			var344 = var355
		elseif var349 == protoModule.wireTypes.i64 then
			local _ = nil
			local var356, var357 = protoModule.readFixed64(p18, var344)
			local _ = var356
			var344 = var357
		else
			error("Unsupported wire type: " .. var732)
		end
	end
	return var343
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
	local var358 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var359, var360 = protoModule.writeTag(buff, var358, 1, protoModule.wireTypes.varint)
		var359, var744 = protoModule.writeVarInt(var359, var360, t.ActionType.toNumber(self.action_type))
		buff = var359
		var358 = var360
	end
	if self.action_params ~= nil then
		local var361 = self.action_params:encode()
		local var362, var363 = protoModule.writeTag(buff, var358, 2, protoModule.wireTypes.lengthDelimited)
		var362, var747 = protoModule.writeBuffer(var362, var363, var361, buffer.len(var361))
		buff = var362
		var358 = var363
	end
	local buff_1 = buffer.create(var358)
	buffer.copy(buff_1, 0, buff, 0, var358)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref), t (ref)
	local var358 = t_19.new()
	local var359 = 0
	while var359 < buffer.len(p19) do
		local _ = nil
		local var360 = nil
		local var361, var362, var363 = protoModule.readTag(p19, var359)
		local var364 = var361
		var360 = var362
		var359 = var363
		
		if var360 == protoModule.wireTypes.varint then
			if var364 == 1 then
				local _ = nil
				local var365, var366 = protoModule.readVarIntI32(p19, var359)
				local var367 = var365
				var359 = var366
				var358.action_type = t.ActionType.fromNumber(var367) or var367
			else
				local _ = nil
				local var368, var369 = protoModule.readVarInt(p19, var359)
				local _ = var368
				var359 = var369
			end
		end
		if var360 == protoModule.wireTypes.lengthDelimited then
			if var364 == 2 then
				local _ = nil
				local var370, var371 = protoModule.readBuffer(p19, var359)
				var359 = var371
				var358.action_params = t.UpdateUserSettingsAction_Params.decode(var370)
			else
				local _ = nil
				local var372, var373 = protoModule.readVarInt(p19, var359)
				var359 = var373 + var372
			end
		elseif var360 == protoModule.wireTypes.i32 then
			local _ = nil
			local var374, var375 = protoModule.readFixed32(p19, var359)
			local _ = var374
			var359 = var375
		elseif var360 == protoModule.wireTypes.i64 then
			local _ = nil
			local var376, var377 = protoModule.readFixed64(p19, var359)
			local _ = var376
			var359 = var377
		else
			error("Unsupported wire type: " .. var751)
		end
	end
	return var358
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
	local var378 = t_19.new()
	
	if self.action_type ~= nil then
		var378.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var378.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var378.action_params = t.UpdateUserSettingsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var378.action_params = t.UpdateUserSettingsAction_Params.jsonDecode(self.actionParams)
	end
	return var378
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
	local var378 = 0
	
	if self.settings ~= nil then
		local var379 = self.settings:encode()
		local var380, var381 = protoModule.writeTag(buff, var378, 1, protoModule.wireTypes.lengthDelimited)
		var380, var775 = protoModule.writeBuffer(var380, var381, var379, buffer.len(var379))
		buff = var380
		var378 = var381
	end
	if self.audit_data ~= nil then
		local var382 = self.audit_data:encode()
		local var383, var384 = protoModule.writeTag(buff, var378, 2, protoModule.wireTypes.lengthDelimited)
		var383, var778 = protoModule.writeBuffer(var383, var384, var382, buffer.len(var382))
		buff = var383
		var378 = var384
	end
	local buff_1 = buffer.create(var378)
	buffer.copy(buff_1, 0, buff, 0, var378)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref), propTypesModule (ref)
	local var378 = t_20.new()
	local var379 = 0
	while var379 < buffer.len(p20) do
		local _ = nil
		local var380 = nil
		local var381, var382, var383 = protoModule.readTag(p20, var379)
		local var384 = var381
		var380 = var382
		var379 = var383
		
		if var380 == protoModule.wireTypes.varint then
			local _ = nil
			local var385, var386 = protoModule.readVarInt(p20, var379)
			local _ = var385
			var379 = var386
			continue
		end
		if var380 == protoModule.wireTypes.lengthDelimited then
			if var384 == 1 then
				local _ = nil
				local var387, var388 = protoModule.readBuffer(p20, var379)
				var379 = var388
				var378.settings = propTypesModule.StructProp.decode(var387)
			elseif var384 == 2 then
				local _ = nil
				local var389, var390 = protoModule.readBuffer(p20, var379)
				var379 = var390
				var378.audit_data = propTypesModule.StringProp.decode(var389)
			else
				local _ = nil
				local var391, var392 = protoModule.readVarInt(p20, var379)
				var379 = var392 + var391
			end
		elseif var380 == protoModule.wireTypes.i32 then
			local _ = nil
			local var393, var394 = protoModule.readFixed32(p20, var379)
			local _ = var393
			var379 = var394
		elseif var380 == protoModule.wireTypes.i64 then
			local _ = nil
			local var395, var396 = protoModule.readFixed64(p20, var379)
			local _ = var395
			var379 = var396
		else
			error("Unsupported wire type: " .. var782)
		end
	end
	return var378
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
	local var397 = t_20.new()
	
	if self.settings ~= nil then
		var397.settings = propTypesModule.StructProp.jsonDecode(self.settings)
	end
	if self.audit_data ~= nil then
		var397.audit_data = propTypesModule.StringProp.jsonDecode(self.audit_data)
	end
	if self.auditData ~= nil then
		var397.audit_data = propTypesModule.StringProp.jsonDecode(self.auditData)
	end
	return var397
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
	local var397 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var398, var399 = protoModule.writeTag(buff, var397, 1, protoModule.wireTypes.varint)
		var398, var804 = protoModule.writeVarInt(var398, var399, t.ActionType.toNumber(self.action_type))
		buff = var398
		var397 = var399
	end
	if self.action_params ~= nil then
		local var400 = self.action_params:encode()
		local var401, var402 = protoModule.writeTag(buff, var397, 2, protoModule.wireTypes.lengthDelimited)
		var401, var807 = protoModule.writeBuffer(var401, var402, var400, buffer.len(var400))
		buff = var401
		var397 = var402
	end
	local buff_1 = buffer.create(var397)
	buffer.copy(buff_1, 0, buff, 0, var397)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref), t (ref)
	local var397 = t_21.new()
	local var398 = 0
	while var398 < buffer.len(p21) do
		local _ = nil
		local var399 = nil
		local var400, var401, var402 = protoModule.readTag(p21, var398)
		local var403 = var400
		var399 = var401
		var398 = var402
		
		if var399 == protoModule.wireTypes.varint then
			if var403 == 1 then
				local _ = nil
				local var404, var405 = protoModule.readVarIntI32(p21, var398)
				local var406 = var404
				var398 = var405
				var397.action_type = t.ActionType.fromNumber(var406) or var406
			else
				local _ = nil
				local var407, var408 = protoModule.readVarInt(p21, var398)
				local _ = var407
				var398 = var408
			end
		end
		if var399 == protoModule.wireTypes.lengthDelimited then
			if var403 == 2 then
				local _ = nil
				local var409, var410 = protoModule.readBuffer(p21, var398)
				var398 = var410
				var397.action_params = t.OpenTooltipAction_Params.decode(var409)
			else
				local _ = nil
				local var411, var412 = protoModule.readVarInt(p21, var398)
				var398 = var412 + var411
			end
		elseif var399 == protoModule.wireTypes.i32 then
			local _ = nil
			local var413, var414 = protoModule.readFixed32(p21, var398)
			local _ = var413
			var398 = var414
		elseif var399 == protoModule.wireTypes.i64 then
			local _ = nil
			local var415, var416 = protoModule.readFixed64(p21, var398)
			local _ = var415
			var398 = var416
		else
			error("Unsupported wire type: " .. var811)
		end
	end
	return var397
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
	local var417 = t_21.new()
	
	if self.action_type ~= nil then
		var417.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var417.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var417.action_params = t.OpenTooltipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var417.action_params = t.OpenTooltipAction_Params.jsonDecode(self.actionParams)
	end
	return var417
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
	local var417 = 0
	
	if self.tooltip_title ~= nil then
		local var418 = self.tooltip_title:encode()
		local var419, var420 = protoModule.writeTag(buff, var417, 1, protoModule.wireTypes.lengthDelimited)
		var419, var835 = protoModule.writeBuffer(var419, var420, var418, buffer.len(var418))
		buff = var419
		var417 = var420
	end
	if self.tooltip_info_text ~= nil then
		local var421 = self.tooltip_info_text:encode()
		local var422, var423 = protoModule.writeTag(buff, var417, 2, protoModule.wireTypes.lengthDelimited)
		var422, var838 = protoModule.writeBuffer(var422, var423, var421, buffer.len(var421))
		buff = var422
		var417 = var423
	end
	local buff_1 = buffer.create(var417)
	buffer.copy(buff_1, 0, buff, 0, var417)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), propTypesModule (ref)
	local var417 = t_22.new()
	local var418 = 0
	while var418 < buffer.len(p22) do
		local _ = nil
		local var419 = nil
		local var420, var421, var422 = protoModule.readTag(p22, var418)
		local var423 = var420
		var419 = var421
		var418 = var422
		
		if var419 == protoModule.wireTypes.varint then
			local _ = nil
			local var424, var425 = protoModule.readVarInt(p22, var418)
			local _ = var424
			var418 = var425
			continue
		end
		if var419 == protoModule.wireTypes.lengthDelimited then
			if var423 == 1 then
				local _ = nil
				local var426, var427 = protoModule.readBuffer(p22, var418)
				var418 = var427
				var417.tooltip_title = propTypesModule.StringProp.decode(var426)
			elseif var423 == 2 then
				local _ = nil
				local var428, var429 = protoModule.readBuffer(p22, var418)
				var418 = var429
				var417.tooltip_info_text = propTypesModule.StringProp.decode(var428)
			else
				local _ = nil
				local var430, var431 = protoModule.readVarInt(p22, var418)
				var418 = var431 + var430
			end
		elseif var419 == protoModule.wireTypes.i32 then
			local _ = nil
			local var432, var433 = protoModule.readFixed32(p22, var418)
			local _ = var432
			var418 = var433
		elseif var419 == protoModule.wireTypes.i64 then
			local _ = nil
			local var434, var435 = protoModule.readFixed64(p22, var418)
			local _ = var434
			var418 = var435
		else
			error("Unsupported wire type: " .. var842)
		end
	end
	return var417
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
	local var436 = t_22.new()
	
	if self.tooltip_title ~= nil then
		var436.tooltip_title = propTypesModule.StringProp.jsonDecode(self.tooltip_title)
	end
	if self.tooltipTitle ~= nil then
		var436.tooltip_title = propTypesModule.StringProp.jsonDecode(self.tooltipTitle)
	end
	if self.tooltip_info_text ~= nil then
		var436.tooltip_info_text = propTypesModule.StringProp.jsonDecode(self.tooltip_info_text)
	end
	if self.tooltipInfoText ~= nil then
		var436.tooltip_info_text = propTypesModule.StringProp.jsonDecode(self.tooltipInfoText)
	end
	return var436
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
	local var436 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var437, var438 = protoModule.writeTag(buff, var436, 1, protoModule.wireTypes.varint)
		var437, var864 = protoModule.writeVarInt(var437, var438, t.ActionType.toNumber(self.action_type))
		buff = var437
		var436 = var438
	end
	if self.action_params ~= nil then
		local var439 = self.action_params:encode()
		local var440, var441 = protoModule.writeTag(buff, var436, 2, protoModule.wireTypes.lengthDelimited)
		var440, var867 = protoModule.writeBuffer(var440, var441, var439, buffer.len(var439))
		buff = var440
		var436 = var441
	end
	local buff_1 = buffer.create(var436)
	buffer.copy(buff_1, 0, buff, 0, var436)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref), t (ref)
	local var436 = t_23.new()
	local var437 = 0
	while var437 < buffer.len(p23) do
		local _ = nil
		local var438 = nil
		local var439, var440, var441 = protoModule.readTag(p23, var437)
		local var442 = var439
		var438 = var440
		var437 = var441
		
		if var438 == protoModule.wireTypes.varint then
			if var442 == 1 then
				local _ = nil
				local var443, var444 = protoModule.readVarIntI32(p23, var437)
				local var445 = var443
				var437 = var444
				var436.action_type = t.ActionType.fromNumber(var445) or var445
			else
				local _ = nil
				local var446, var447 = protoModule.readVarInt(p23, var437)
				local _ = var446
				var437 = var447
			end
		end
		if var438 == protoModule.wireTypes.lengthDelimited then
			if var442 == 2 then
				local _ = nil
				local var448, var449 = protoModule.readBuffer(p23, var437)
				var437 = var449
				var436.action_params = t.OpenBadgeDetailsAction_Params.decode(var448)
			else
				local _ = nil
				local var450, var451 = protoModule.readVarInt(p23, var437)
				var437 = var451 + var450
			end
		elseif var438 == protoModule.wireTypes.i32 then
			local _ = nil
			local var452, var453 = protoModule.readFixed32(p23, var437)
			local _ = var452
			var437 = var453
		elseif var438 == protoModule.wireTypes.i64 then
			local _ = nil
			local var454, var455 = protoModule.readFixed64(p23, var437)
			local _ = var454
			var437 = var455
		else
			error("Unsupported wire type: " .. var871)
		end
	end
	return var436
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
	local var456 = t_23.new()
	
	if self.action_type ~= nil then
		var456.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var456.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var456.action_params = t.OpenBadgeDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var456.action_params = t.OpenBadgeDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var456
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
	local var456 = 0
	
	if self.badge_id ~= nil then
		local var457 = self.badge_id:encode()
		local var458, var459 = protoModule.writeTag(buff, var456, 1, protoModule.wireTypes.lengthDelimited)
		var458, var895 = protoModule.writeBuffer(var458, var459, var457, buffer.len(var457))
		buff = var458
		var456 = var459
	end
	if self.title_text ~= nil then
		local var460 = self.title_text:encode()
		local var461, var462 = protoModule.writeTag(buff, var456, 2, protoModule.wireTypes.lengthDelimited)
		var461, var898 = protoModule.writeBuffer(var461, var462, var460, buffer.len(var460))
		buff = var461
		var456 = var462
	end
	local buff_1 = buffer.create(var456)
	buffer.copy(buff_1, 0, buff, 0, var456)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), propTypesModule (ref)
	local var456 = t_24.new()
	local var457 = 0
	while var457 < buffer.len(p24) do
		local _ = nil
		local var458 = nil
		local var459, var460, var461 = protoModule.readTag(p24, var457)
		local var462 = var459
		var458 = var460
		var457 = var461
		
		if var458 == protoModule.wireTypes.varint then
			local _ = nil
			local var463, var464 = protoModule.readVarInt(p24, var457)
			local _ = var463
			var457 = var464
			continue
		end
		if var458 == protoModule.wireTypes.lengthDelimited then
			if var462 == 1 then
				local _ = nil
				local var465, var466 = protoModule.readBuffer(p24, var457)
				var457 = var466
				var456.badge_id = propTypesModule.StringProp.decode(var465)
			elseif var462 == 2 then
				local _ = nil
				local var467, var468 = protoModule.readBuffer(p24, var457)
				var457 = var468
				var456.title_text = propTypesModule.StringProp.decode(var467)
			else
				local _ = nil
				local var469, var470 = protoModule.readVarInt(p24, var457)
				var457 = var470 + var469
			end
		elseif var458 == protoModule.wireTypes.i32 then
			local _ = nil
			local var471, var472 = protoModule.readFixed32(p24, var457)
			local _ = var471
			var457 = var472
		elseif var458 == protoModule.wireTypes.i64 then
			local _ = nil
			local var473, var474 = protoModule.readFixed64(p24, var457)
			local _ = var473
			var457 = var474
		else
			error("Unsupported wire type: " .. var902)
		end
	end
	return var456
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
	local var475 = t_24.new()
	
	if self.badge_id ~= nil then
		var475.badge_id = propTypesModule.StringProp.jsonDecode(self.badge_id)
	end
	if self.badgeId ~= nil then
		var475.badge_id = propTypesModule.StringProp.jsonDecode(self.badgeId)
	end
	if self.title_text ~= nil then
		var475.title_text = propTypesModule.StringProp.jsonDecode(self.title_text)
	end
	if self.titleText ~= nil then
		var475.title_text = propTypesModule.StringProp.jsonDecode(self.titleText)
	end
	return var475
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
	local var475 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var476, var477 = protoModule.writeTag(buff, var475, 1, protoModule.wireTypes.varint)
		var476, var924 = protoModule.writeVarInt(var476, var477, t.ActionType.toNumber(self.action_type))
		buff = var476
		var475 = var477
	end
	if self.action_params ~= nil then
		local var478 = self.action_params:encode()
		local var479, var480 = protoModule.writeTag(buff, var475, 2, protoModule.wireTypes.lengthDelimited)
		var479, var927 = protoModule.writeBuffer(var479, var480, var478, buffer.len(var478))
		buff = var479
		var475 = var480
	end
	local buff_1 = buffer.create(var475)
	buffer.copy(buff_1, 0, buff, 0, var475)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref), t (ref)
	local var475 = t_25.new()
	local var476 = 0
	while var476 < buffer.len(p25) do
		local _ = nil
		local var477 = nil
		local var478, var479, var480 = protoModule.readTag(p25, var476)
		local var481 = var478
		var477 = var479
		var476 = var480
		
		if var477 == protoModule.wireTypes.varint then
			if var481 == 1 then
				local _ = nil
				local var482, var483 = protoModule.readVarIntI32(p25, var476)
				local var484 = var482
				var476 = var483
				var475.action_type = t.ActionType.fromNumber(var484) or var484
			else
				local _ = nil
				local var485, var486 = protoModule.readVarInt(p25, var476)
				local _ = var485
				var476 = var486
			end
		end
		if var477 == protoModule.wireTypes.lengthDelimited then
			if var481 == 2 then
				local _ = nil
				local var487, var488 = protoModule.readBuffer(p25, var476)
				var476 = var488
				var475.action_params = t.LoadMoreFromApiAction_Params.decode(var487)
			else
				local _ = nil
				local var489, var490 = protoModule.readVarInt(p25, var476)
				var476 = var490 + var489
			end
		elseif var477 == protoModule.wireTypes.i32 then
			local _ = nil
			local var491, var492 = protoModule.readFixed32(p25, var476)
			local _ = var491
			var476 = var492
		elseif var477 == protoModule.wireTypes.i64 then
			local _ = nil
			local var493, var494 = protoModule.readFixed64(p25, var476)
			local _ = var493
			var476 = var494
		else
			error("Unsupported wire type: " .. var931)
		end
	end
	return var475
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
	local var495 = t_25.new()
	
	if self.action_type ~= nil then
		var495.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var495.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var495.action_params = t.LoadMoreFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var495.action_params = t.LoadMoreFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var495
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
	local var495 = 0
	
	if self.surface_key ~= nil then
		local var496 = self.surface_key:encode()
		local var497, var498 = protoModule.writeTag(buff, var495, 1, protoModule.wireTypes.lengthDelimited)
		var497, var955 = protoModule.writeBuffer(var497, var498, var496, buffer.len(var496))
		buff = var497
		var495 = var498
	end
	if self.config_key ~= nil then
		local var499 = self.config_key:encode()
		local var500, var501 = protoModule.writeTag(buff, var495, 2, protoModule.wireTypes.lengthDelimited)
		var500, var958 = protoModule.writeBuffer(var500, var501, var499, buffer.len(var499))
		buff = var500
		var495 = var501
	end
	local buff_1 = buffer.create(var495)
	buffer.copy(buff_1, 0, buff, 0, var495)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref), propTypesModule (ref)
	local var495 = t_26.new()
	local var496 = 0
	while var496 < buffer.len(p26) do
		local _ = nil
		local var497 = nil
		local var498, var499, var500 = protoModule.readTag(p26, var496)
		local var501 = var498
		var497 = var499
		var496 = var500
		
		if var497 == protoModule.wireTypes.varint then
			local _ = nil
			local var502, var503 = protoModule.readVarInt(p26, var496)
			local _ = var502
			var496 = var503
			continue
		end
		if var497 == protoModule.wireTypes.lengthDelimited then
			if var501 == 1 then
				local _ = nil
				local var504, var505 = protoModule.readBuffer(p26, var496)
				var496 = var505
				var495.surface_key = propTypesModule.StringProp.decode(var504)
			elseif var501 == 2 then
				local _ = nil
				local var506, var507 = protoModule.readBuffer(p26, var496)
				var496 = var507
				var495.config_key = propTypesModule.StringProp.decode(var506)
			else
				local _ = nil
				local var508, var509 = protoModule.readVarInt(p26, var496)
				var496 = var509 + var508
			end
		elseif var497 == protoModule.wireTypes.i32 then
			local _ = nil
			local var510, var511 = protoModule.readFixed32(p26, var496)
			local _ = var510
			var496 = var511
		elseif var497 == protoModule.wireTypes.i64 then
			local _ = nil
			local var512, var513 = protoModule.readFixed64(p26, var496)
			local _ = var512
			var496 = var513
		else
			error("Unsupported wire type: " .. var962)
		end
	end
	return var495
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
	local var514 = t_26.new()
	
	if self.surface_key ~= nil then
		var514.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var514.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.config_key ~= nil then
		var514.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var514.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	return var514
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
	local var514 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var515, var516 = protoModule.writeTag(buff, var514, 1, protoModule.wireTypes.varint)
		var515, var984 = protoModule.writeVarInt(var515, var516, t.ActionType.toNumber(self.action_type))
		buff = var515
		var514 = var516
	end
	if self.action_params ~= nil then
		local var517 = self.action_params:encode()
		local var518, var519 = protoModule.writeTag(buff, var514, 2, protoModule.wireTypes.lengthDelimited)
		var518, var987 = protoModule.writeBuffer(var518, var519, var517, buffer.len(var517))
		buff = var518
		var514 = var519
	end
	local buff_1 = buffer.create(var514)
	buffer.copy(buff_1, 0, buff, 0, var514)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref), t (ref)
	local var514 = t_27.new()
	local var515 = 0
	while var515 < buffer.len(p27) do
		local _ = nil
		local var516 = nil
		local var517, var518, var519 = protoModule.readTag(p27, var515)
		local var520 = var517
		var516 = var518
		var515 = var519
		
		if var516 == protoModule.wireTypes.varint then
			if var520 == 1 then
				local _ = nil
				local var521, var522 = protoModule.readVarIntI32(p27, var515)
				local var523 = var521
				var515 = var522
				var514.action_type = t.ActionType.fromNumber(var523) or var523
			else
				local _ = nil
				local var524, var525 = protoModule.readVarInt(p27, var515)
				local _ = var524
				var515 = var525
			end
		end
		if var516 == protoModule.wireTypes.lengthDelimited then
			if var520 == 2 then
				local _ = nil
				local var526, var527 = protoModule.readBuffer(p27, var515)
				var515 = var527
				var514.action_params = t.ShareAction_Params.decode(var526)
			else
				local _ = nil
				local var528, var529 = protoModule.readVarInt(p27, var515)
				var515 = var529 + var528
			end
		elseif var516 == protoModule.wireTypes.i32 then
			local _ = nil
			local var530, var531 = protoModule.readFixed32(p27, var515)
			local _ = var530
			var515 = var531
		elseif var516 == protoModule.wireTypes.i64 then
			local _ = nil
			local var532, var533 = protoModule.readFixed64(p27, var515)
			local _ = var532
			var515 = var533
		else
			error("Unsupported wire type: " .. var991)
		end
	end
	return var514
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
	local var534 = t_27.new()
	
	if self.action_type ~= nil then
		var534.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var534.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var534.action_params = t.ShareAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var534.action_params = t.ShareAction_Params.jsonDecode(self.actionParams)
	end
	return var534
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
	local var534 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "generic_share_link_data" then
			local var535 = self.oneof_prop.value:encode()
			local var536, var537 = protoModule.writeTag(buff, var534, 1, protoModule.wireTypes.lengthDelimited)
			var536, var1015 = protoModule.writeBuffer(var536, var537, var535, buffer.len(var535))
			buff = var536
			var534 = var537
		elseif self.oneof_prop.type == "share_link_fetch_data" then
			local var538 = self.oneof_prop.value:encode()
			local var539, var540 = protoModule.writeTag(buff, var534, 2, protoModule.wireTypes.lengthDelimited)
			var539, var1018 = protoModule.writeBuffer(var539, var540, var538, buffer.len(var538))
			buff = var539
			var534 = var540
		end
	end
	local buff_1 = buffer.create(var534)
	buffer.copy(buff_1, 0, buff, 0, var534)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref), shareLinkDataModule (ref)
	local var534 = t_28.new()
	local var535 = 0
	while var535 < buffer.len(p28) do
		local _ = nil
		local var536 = nil
		local var537, var538, var539 = protoModule.readTag(p28, var535)
		local var540 = var537
		var536 = var538
		var535 = var539
		
		if var536 == protoModule.wireTypes.varint then
			local _ = nil
			local var541, var542 = protoModule.readVarInt(p28, var535)
			local _ = var541
			var535 = var542
			continue
		end
		if var536 == protoModule.wireTypes.lengthDelimited then
			if var540 == 1 then
				local _ = nil
				local var543, var544 = protoModule.readBuffer(p28, var535)
				var535 = var544
				var534.oneof_prop = {
					type = "generic_share_link_data",
					value = shareLinkDataModule.GenericShareLinkData.decode(var543)
				}
			elseif var540 == 2 then
				local _ = nil
				local var545, var546 = protoModule.readBuffer(p28, var535)
				var535 = var546
				var534.oneof_prop = {
					type = "share_link_fetch_data",
					value = shareLinkDataModule.ShareLinkFetchData.decode(var545)
				}
			else
				local _ = nil
				local var547, var548 = protoModule.readVarInt(p28, var535)
				var535 = var548 + var547
			end
		elseif var536 == protoModule.wireTypes.i32 then
			local _ = nil
			local var549, var550 = protoModule.readFixed32(p28, var535)
			local _ = var549
			var535 = var550
		elseif var536 == protoModule.wireTypes.i64 then
			local _ = nil
			local var551, var552 = protoModule.readFixed64(p28, var535)
			local _ = var551
			var535 = var552
		else
			error("Unsupported wire type: " .. var1022)
		end
	end
	return var534
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
	local var553 = t_28.new()
	
	if self.generic_share_link_data ~= nil then
		var553.oneof_prop = {
			type = "generic_share_link_data",
			value = shareLinkDataModule.GenericShareLinkData.jsonDecode(self.generic_share_link_data)
		}
	end
	if self.genericShareLinkData ~= nil then
		var553.oneof_prop = {
			type = "generic_share_link_data",
			value = shareLinkDataModule.GenericShareLinkData.jsonDecode(self.genericShareLinkData)
		}
	end
	if self.share_link_fetch_data ~= nil then
		var553.oneof_prop = {
			type = "share_link_fetch_data",
			value = shareLinkDataModule.ShareLinkFetchData.jsonDecode(self.share_link_fetch_data)
		}
	end
	if self.shareLinkFetchData ~= nil then
		var553.oneof_prop = {
			type = "share_link_fetch_data",
			value = shareLinkDataModule.ShareLinkFetchData.jsonDecode(self.shareLinkFetchData)
		}
	end
	return var553
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
	local var553 = 0
	
	if self.share_link_type ~= nil then
		local var554 = self.share_link_type:encode()
		local var555, var556 = protoModule.writeTag(buff, var553, 1, protoModule.wireTypes.lengthDelimited)
		var555, var1045 = protoModule.writeBuffer(var555, var556, var554, buffer.len(var554))
		buff = var555
		var553 = var556
	end
	if self.share_link_data ~= nil then
		local var557 = self.share_link_data:encode()
		local var558, var559 = protoModule.writeTag(buff, var553, 2, protoModule.wireTypes.lengthDelimited)
		var558, var1048 = protoModule.writeBuffer(var558, var559, var557, buffer.len(var557))
		buff = var558
		var553 = var559
	end
	if self.entry_point_key ~= nil then
		local var560 = self.entry_point_key:encode()
		local var561, var562 = protoModule.writeTag(buff, var553, 3, protoModule.wireTypes.lengthDelimited)
		var561, var1051 = protoModule.writeBuffer(var561, var562, var560, buffer.len(var560))
		buff = var561
		var553 = var562
	end
	local buff_1 = buffer.create(var553)
	buffer.copy(buff_1, 0, buff, 0, var553)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var553 = t_29.new()
	local var554 = 0
	while var554 < buffer.len(p29) do
		local _ = nil
		local var555 = nil
		local var556, var557, var558 = protoModule.readTag(p29, var554)
		local var559 = var556
		var555 = var557
		var554 = var558
		
		if var555 == protoModule.wireTypes.varint then
			local _ = nil
			local var560, var561 = protoModule.readVarInt(p29, var554)
			local _ = var560
			var554 = var561
			continue
		end
		if var555 == protoModule.wireTypes.lengthDelimited then
			if var559 == 1 then
				local _ = nil
				local var562, var563 = protoModule.readBuffer(p29, var554)
				var554 = var563
				var553.share_link_type = propTypesModule.StringProp.decode(var562)
			elseif var559 == 2 then
				local _ = nil
				local var564, var565 = protoModule.readBuffer(p29, var554)
				var554 = var565
				var553.share_link_data = t.ShareAction_ShareLinkData.decode(var564)
			elseif var559 == 3 then
				local _ = nil
				local var566, var567 = protoModule.readBuffer(p29, var554)
				var554 = var567
				var553.entry_point_key = propTypesModule.StringProp.decode(var566)
			else
				local _ = nil
				local var568, var569 = protoModule.readVarInt(p29, var554)
				var554 = var569 + var568
			end
		elseif var555 == protoModule.wireTypes.i32 then
			local _ = nil
			local var570, var571 = protoModule.readFixed32(p29, var554)
			local _ = var570
			var554 = var571
		elseif var555 == protoModule.wireTypes.i64 then
			local _ = nil
			local var572, var573 = protoModule.readFixed64(p29, var554)
			local _ = var572
			var554 = var573
		else
			error("Unsupported wire type: " .. var1055)
		end
	end
	return var553
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
	local var574 = t_29.new()
	
	if self.share_link_type ~= nil then
		var574.share_link_type = propTypesModule.StringProp.jsonDecode(self.share_link_type)
	end
	if self.shareLinkType ~= nil then
		var574.share_link_type = propTypesModule.StringProp.jsonDecode(self.shareLinkType)
	end
	if self.share_link_data ~= nil then
		var574.share_link_data = t.ShareAction_ShareLinkData.jsonDecode(self.share_link_data)
	end
	if self.shareLinkData ~= nil then
		var574.share_link_data = t.ShareAction_ShareLinkData.jsonDecode(self.shareLinkData)
	end
	if self.entry_point_key ~= nil then
		var574.entry_point_key = propTypesModule.StringProp.jsonDecode(self.entry_point_key)
	end
	if self.entryPointKey ~= nil then
		var574.entry_point_key = propTypesModule.StringProp.jsonDecode(self.entryPointKey)
	end
	return var574
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
	local var574 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var575, var576 = protoModule.writeTag(buff, var574, 1, protoModule.wireTypes.varint)
		var575, var1079 = protoModule.writeVarInt(var575, var576, t.ActionType.toNumber(self.action_type))
		buff = var575
		var574 = var576
	end
	if self.action_params ~= nil then
		local var577 = self.action_params:encode()
		local var578, var579 = protoModule.writeTag(buff, var574, 2, protoModule.wireTypes.lengthDelimited)
		var578, var1082 = protoModule.writeBuffer(var578, var579, var577, buffer.len(var577))
		buff = var578
		var574 = var579
	end
	local buff_1 = buffer.create(var574)
	buffer.copy(buff_1, 0, buff, 0, var574)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref), t (ref)
	local var574 = t_30.new()
	local var575 = 0
	while var575 < buffer.len(p30) do
		local _ = nil
		local var576 = nil
		local var577, var578, var579 = protoModule.readTag(p30, var575)
		local var580 = var577
		var576 = var578
		var575 = var579
		
		if var576 == protoModule.wireTypes.varint then
			if var580 == 1 then
				local _ = nil
				local var581, var582 = protoModule.readVarIntI32(p30, var575)
				local var583 = var581
				var575 = var582
				var574.action_type = t.ActionType.fromNumber(var583) or var583
			else
				local _ = nil
				local var584, var585 = protoModule.readVarInt(p30, var575)
				local _ = var584
				var575 = var585
			end
		end
		if var576 == protoModule.wireTypes.lengthDelimited then
			if var580 == 2 then
				local _ = nil
				local var586, var587 = protoModule.readBuffer(p30, var575)
				var575 = var587
				var574.action_params = t.OpenAbuseReportAction_Params.decode(var586)
			else
				local _ = nil
				local var588, var589 = protoModule.readVarInt(p30, var575)
				var575 = var589 + var588
			end
		elseif var576 == protoModule.wireTypes.i32 then
			local _ = nil
			local var590, var591 = protoModule.readFixed32(p30, var575)
			local _ = var590
			var575 = var591
		elseif var576 == protoModule.wireTypes.i64 then
			local _ = nil
			local var592, var593 = protoModule.readFixed64(p30, var575)
			local _ = var592
			var575 = var593
		else
			error("Unsupported wire type: " .. var1086)
		end
	end
	return var574
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
	local var594 = t_30.new()
	
	if self.action_type ~= nil then
		var594.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var594.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var594.action_params = t.OpenAbuseReportAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var594.action_params = t.OpenAbuseReportAction_Params.jsonDecode(self.actionParams)
	end
	return var594
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
	local var594 = 0
	
	if self.target_id ~= nil then
		local var595 = self.target_id:encode()
		local var596, var597 = protoModule.writeTag(buff, var594, 1, protoModule.wireTypes.lengthDelimited)
		var596, var1110 = protoModule.writeBuffer(var596, var597, var595, buffer.len(var595))
		buff = var596
		var594 = var597
	end
	if self.abuse_vector ~= nil then
		local var598 = self.abuse_vector:encode()
		local var599, var600 = protoModule.writeTag(buff, var594, 2, protoModule.wireTypes.lengthDelimited)
		var599, var1113 = protoModule.writeBuffer(var599, var600, var598, buffer.len(var598))
		buff = var599
		var594 = var600
	end
	if self.asset_type_name ~= nil then
		local var601 = self.asset_type_name:encode()
		local var602, var603 = protoModule.writeTag(buff, var594, 3, protoModule.wireTypes.lengthDelimited)
		var602, var1116 = protoModule.writeBuffer(var602, var603, var601, buffer.len(var601))
		buff = var602
		var594 = var603
	end
	if self.universe_id ~= nil then
		local var604 = self.universe_id:encode()
		local var605, var606 = protoModule.writeTag(buff, var594, 4, protoModule.wireTypes.lengthDelimited)
		var605, var1119 = protoModule.writeBuffer(var605, var606, var604, buffer.len(var604))
		buff = var605
		var594 = var606
	end
	if self.group_id ~= nil then
		local var607 = self.group_id:encode()
		local var608, var609 = protoModule.writeTag(buff, var594, 5, protoModule.wireTypes.lengthDelimited)
		var608, var1122 = protoModule.writeBuffer(var608, var609, var607, buffer.len(var607))
		buff = var608
		var594 = var609
	end
	local buff_1 = buffer.create(var594)
	buffer.copy(buff_1, 0, buff, 0, var594)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref), propTypesModule (ref)
	local var594 = t_31.new()
	local var595 = 0
	while var595 < buffer.len(p31) do
		local _ = nil
		local var596 = nil
		local var597, var598, var599 = protoModule.readTag(p31, var595)
		local var600 = var597
		var596 = var598
		var595 = var599
		
		if var596 == protoModule.wireTypes.varint then
			local _ = nil
			local var601, var602 = protoModule.readVarInt(p31, var595)
			local _ = var601
			var595 = var602
			continue
		end
		if var596 == protoModule.wireTypes.lengthDelimited then
			if var600 == 1 then
				local _ = nil
				local var603, var604 = protoModule.readBuffer(p31, var595)
				var595 = var604
				var594.target_id = propTypesModule.StringProp.decode(var603)
			elseif var600 == 2 then
				local _ = nil
				local var605, var606 = protoModule.readBuffer(p31, var595)
				var595 = var606
				var594.abuse_vector = propTypesModule.StringProp.decode(var605)
			elseif var600 == 3 then
				local _ = nil
				local var607, var608 = protoModule.readBuffer(p31, var595)
				var595 = var608
				var594.asset_type_name = propTypesModule.StringProp.decode(var607)
			elseif var600 == 4 then
				local _ = nil
				local var609, var610 = protoModule.readBuffer(p31, var595)
				var595 = var610
				var594.universe_id = propTypesModule.StringProp.decode(var609)
			elseif var600 == 5 then
				local _ = nil
				local var611, var612 = protoModule.readBuffer(p31, var595)
				var595 = var612
				var594.group_id = propTypesModule.StringProp.decode(var611)
			else
				local _ = nil
				local var613, var614 = protoModule.readVarInt(p31, var595)
				var595 = var614 + var613
			end
		elseif var596 == protoModule.wireTypes.i32 then
			local _ = nil
			local var615, var616 = protoModule.readFixed32(p31, var595)
			local _ = var615
			var595 = var616
		elseif var596 == protoModule.wireTypes.i64 then
			local _ = nil
			local var617, var618 = protoModule.readFixed64(p31, var595)
			local _ = var617
			var595 = var618
		else
			error("Unsupported wire type: " .. var1126)
		end
	end
	return var594
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
	local var619 = t_31.new()
	
	if self.target_id ~= nil then
		var619.target_id = propTypesModule.StringProp.jsonDecode(self.target_id)
	end
	if self.targetId ~= nil then
		var619.target_id = propTypesModule.StringProp.jsonDecode(self.targetId)
	end
	if self.abuse_vector ~= nil then
		var619.abuse_vector = propTypesModule.StringProp.jsonDecode(self.abuse_vector)
	end
	if self.abuseVector ~= nil then
		var619.abuse_vector = propTypesModule.StringProp.jsonDecode(self.abuseVector)
	end
	if self.asset_type_name ~= nil then
		var619.asset_type_name = propTypesModule.StringProp.jsonDecode(self.asset_type_name)
	end
	if self.assetTypeName ~= nil then
		var619.asset_type_name = propTypesModule.StringProp.jsonDecode(self.assetTypeName)
	end
	if self.universe_id ~= nil then
		var619.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var619.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.group_id ~= nil then
		var619.group_id = propTypesModule.StringProp.jsonDecode(self.group_id)
	end
	if self.groupId ~= nil then
		var619.group_id = propTypesModule.StringProp.jsonDecode(self.groupId)
	end
	return var619
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
	local var619 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var620, var621 = protoModule.writeTag(buff, var619, 1, protoModule.wireTypes.varint)
		var620, var1154 = protoModule.writeVarInt(var620, var621, t.ActionType.toNumber(self.action_type))
		buff = var620
		var619 = var621
	end
	if self.action_params ~= nil then
		local var622 = self.action_params:encode()
		local var623, var624 = protoModule.writeTag(buff, var619, 2, protoModule.wireTypes.lengthDelimited)
		var623, var1157 = protoModule.writeBuffer(var623, var624, var622, buffer.len(var622))
		buff = var623
		var619 = var624
	end
	local buff_1 = buffer.create(var619)
	buffer.copy(buff_1, 0, buff, 0, var619)
	
	return buff_1
end

function t_32.decode(p32)
	-- upvalues: t_32 (ref), protoModule (ref), t (ref)
	local var619 = t_32.new()
	local var620 = 0
	while var620 < buffer.len(p32) do
		local _ = nil
		local var621 = nil
		local var622, var623, var624 = protoModule.readTag(p32, var620)
		local var625 = var622
		var621 = var623
		var620 = var624
		
		if var621 == protoModule.wireTypes.varint then
			if var625 == 1 then
				local _ = nil
				local var626, var627 = protoModule.readVarIntI32(p32, var620)
				local var628 = var626
				var620 = var627
				var619.action_type = t.ActionType.fromNumber(var628) or var628
			else
				local _ = nil
				local var629, var630 = protoModule.readVarInt(p32, var620)
				local _ = var629
				var620 = var630
			end
		end
		if var621 == protoModule.wireTypes.lengthDelimited then
			if var625 == 2 then
				local _ = nil
				local var631, var632 = protoModule.readBuffer(p32, var620)
				var620 = var632
				var619.action_params = t.RemoveBadgeFromInventoryAction_Params.decode(var631)
			else
				local _ = nil
				local var633, var634 = protoModule.readVarInt(p32, var620)
				var620 = var634 + var633
			end
		elseif var621 == protoModule.wireTypes.i32 then
			local _ = nil
			local var635, var636 = protoModule.readFixed32(p32, var620)
			local _ = var635
			var620 = var636
		elseif var621 == protoModule.wireTypes.i64 then
			local _ = nil
			local var637, var638 = protoModule.readFixed64(p32, var620)
			local _ = var637
			var620 = var638
		else
			error("Unsupported wire type: " .. var1161)
		end
	end
	return var619
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
	local var639 = t_32.new()
	
	if self.action_type ~= nil then
		var639.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var639.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var639.action_params = t.RemoveBadgeFromInventoryAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var639.action_params = t.RemoveBadgeFromInventoryAction_Params.jsonDecode(self.actionParams)
	end
	return var639
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
	local var639 = 0
	
	if self.asset_id ~= nil then
		local var640 = self.asset_id:encode()
		local var641, var642 = protoModule.writeTag(buff, var639, 1, protoModule.wireTypes.lengthDelimited)
		var641, var1185 = protoModule.writeBuffer(var641, var642, var640, buffer.len(var640))
		buff = var641
		var639 = var642
	end
	local buff_1 = buffer.create(var639)
	buffer.copy(buff_1, 0, buff, 0, var639)
	
	return buff_1
end

function t_33.decode(p33)
	-- upvalues: t_33 (ref), protoModule (ref), propTypesModule (ref)
	local var639 = t_33.new()
	local var640 = 0
	while var640 < buffer.len(p33) do
		local _ = nil
		local var641 = nil
		local var642, var643, var644 = protoModule.readTag(p33, var640)
		local var645 = var642
		var641 = var643
		var640 = var644
		
		if var641 == protoModule.wireTypes.varint then
			local _ = nil
			local var646, var647 = protoModule.readVarInt(p33, var640)
			local _ = var646
			var640 = var647
			continue
		end
		if var641 == protoModule.wireTypes.lengthDelimited then
			if var645 == 1 then
				local _ = nil
				local var648, var649 = protoModule.readBuffer(p33, var640)
				var640 = var649
				var639.asset_id = propTypesModule.StringProp.decode(var648)
			else
				local _ = nil
				local var650, var651 = protoModule.readVarInt(p33, var640)
				var640 = var651 + var650
			end
		elseif var641 == protoModule.wireTypes.i32 then
			local _ = nil
			local var652, var653 = protoModule.readFixed32(p33, var640)
			local _ = var652
			var640 = var653
		elseif var641 == protoModule.wireTypes.i64 then
			local _ = nil
			local var654, var655 = protoModule.readFixed64(p33, var640)
			local _ = var654
			var640 = var655
		else
			error("Unsupported wire type: " .. var1189)
		end
	end
	return var639
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
	local var656 = t_33.new()
	
	if self.asset_id ~= nil then
		var656.asset_id = propTypesModule.StringProp.jsonDecode(self.asset_id)
	end
	if self.assetId ~= nil then
		var656.asset_id = propTypesModule.StringProp.jsonDecode(self.assetId)
	end
	return var656
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
	local var656 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var657, var658 = protoModule.writeTag(buff, var656, 1, protoModule.wireTypes.varint)
		var657, var1209 = protoModule.writeVarInt(var657, var658, t.ActionType.toNumber(self.action_type))
		buff = var657
		var656 = var658
	end
	if self.action_params ~= nil then
		local var659 = self.action_params:encode()
		local var660, var661 = protoModule.writeTag(buff, var656, 2, protoModule.wireTypes.lengthDelimited)
		var660, var1212 = protoModule.writeBuffer(var660, var661, var659, buffer.len(var659))
		buff = var660
		var656 = var661
	end
	local buff_1 = buffer.create(var656)
	buffer.copy(buff_1, 0, buff, 0, var656)
	
	return buff_1
end

function t_34.decode(p34)
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var656 = t_34.new()
	local var657 = 0
	while var657 < buffer.len(p34) do
		local _ = nil
		local var658 = nil
		local var659, var660, var661 = protoModule.readTag(p34, var657)
		local var662 = var659
		var658 = var660
		var657 = var661
		
		if var658 == protoModule.wireTypes.varint then
			if var662 == 1 then
				local _ = nil
				local var663, var664 = protoModule.readVarIntI32(p34, var657)
				local var665 = var663
				var657 = var664
				var656.action_type = t.ActionType.fromNumber(var665) or var665
			else
				local _ = nil
				local var666, var667 = protoModule.readVarInt(p34, var657)
				local _ = var666
				var657 = var667
			end
		end
		if var658 == protoModule.wireTypes.lengthDelimited then
			if var662 == 2 then
				local _ = nil
				local var668, var669 = protoModule.readBuffer(p34, var657)
				var657 = var669
				var656.action_params = t.OpenProfileAction_Params.decode(var668)
			else
				local _ = nil
				local var670, var671 = protoModule.readVarInt(p34, var657)
				var657 = var671 + var670
			end
		elseif var658 == protoModule.wireTypes.i32 then
			local _ = nil
			local var672, var673 = protoModule.readFixed32(p34, var657)
			local _ = var672
			var657 = var673
		elseif var658 == protoModule.wireTypes.i64 then
			local _ = nil
			local var674, var675 = protoModule.readFixed64(p34, var657)
			local _ = var674
			var657 = var675
		else
			error("Unsupported wire type: " .. var1216)
		end
	end
	return var656
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
	local var676 = t_34.new()
	
	if self.action_type ~= nil then
		var676.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var676.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var676.action_params = t.OpenProfileAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var676.action_params = t.OpenProfileAction_Params.jsonDecode(self.actionParams)
	end
	return var676
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
	local var676 = 0
	
	if self.profile_id ~= nil then
		local var677 = self.profile_id:encode()
		local var678, var679 = protoModule.writeTag(buff, var676, 1, protoModule.wireTypes.lengthDelimited)
		var678, var1240 = protoModule.writeBuffer(var678, var679, var677, buffer.len(var677))
		buff = var678
		var676 = var679
	end
	if self.profile_type ~= nil then
		local var680 = self.profile_type:encode()
		local var681, var682 = protoModule.writeTag(buff, var676, 2, protoModule.wireTypes.lengthDelimited)
		var681, var1243 = protoModule.writeBuffer(var681, var682, var680, buffer.len(var680))
		buff = var681
		var676 = var682
	end
	if self.source ~= nil then
		local var683 = self.source:encode()
		local var684, var685 = protoModule.writeTag(buff, var676, 3, protoModule.wireTypes.lengthDelimited)
		var684, var1246 = protoModule.writeBuffer(var684, var685, var683, buffer.len(var683))
		buff = var684
		var676 = var685
	end
	local buff_1 = buffer.create(var676)
	buffer.copy(buff_1, 0, buff, 0, var676)
	
	return buff_1
end

function t_35.decode(p35)
	-- upvalues: t_35 (ref), protoModule (ref), propTypesModule (ref)
	local var676 = t_35.new()
	local var677 = 0
	while var677 < buffer.len(p35) do
		local _ = nil
		local var678 = nil
		local var679, var680, var681 = protoModule.readTag(p35, var677)
		local var682 = var679
		var678 = var680
		var677 = var681
		
		if var678 == protoModule.wireTypes.varint then
			local _ = nil
			local var683, var684 = protoModule.readVarInt(p35, var677)
			local _ = var683
			var677 = var684
			continue
		end
		if var678 == protoModule.wireTypes.lengthDelimited then
			if var682 == 1 then
				local _ = nil
				local var685, var686 = protoModule.readBuffer(p35, var677)
				var677 = var686
				var676.profile_id = propTypesModule.StringProp.decode(var685)
			elseif var682 == 2 then
				local _ = nil
				local var687, var688 = protoModule.readBuffer(p35, var677)
				var677 = var688
				var676.profile_type = propTypesModule.StringProp.decode(var687)
			elseif var682 == 3 then
				local _ = nil
				local var689, var690 = protoModule.readBuffer(p35, var677)
				var677 = var690
				var676.source = propTypesModule.StringProp.decode(var689)
			else
				local _ = nil
				local var691, var692 = protoModule.readVarInt(p35, var677)
				var677 = var692 + var691
			end
		elseif var678 == protoModule.wireTypes.i32 then
			local _ = nil
			local var693, var694 = protoModule.readFixed32(p35, var677)
			local _ = var693
			var677 = var694
		elseif var678 == protoModule.wireTypes.i64 then
			local _ = nil
			local var695, var696 = protoModule.readFixed64(p35, var677)
			local _ = var695
			var677 = var696
		else
			error("Unsupported wire type: " .. var1250)
		end
	end
	return var676
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
	local var697 = t_35.new()
	
	if self.profile_id ~= nil then
		var697.profile_id = propTypesModule.StringProp.jsonDecode(self.profile_id)
	end
	if self.profileId ~= nil then
		var697.profile_id = propTypesModule.StringProp.jsonDecode(self.profileId)
	end
	if self.profile_type ~= nil then
		var697.profile_type = propTypesModule.StringProp.jsonDecode(self.profile_type)
	end
	if self.profileType ~= nil then
		var697.profile_type = propTypesModule.StringProp.jsonDecode(self.profileType)
	end
	if self.source ~= nil then
		var697.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var697
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
	local var697 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var698, var699 = protoModule.writeTag(buff, var697, 1, protoModule.wireTypes.varint)
		var698, var1274 = protoModule.writeVarInt(var698, var699, t.ActionType.toNumber(self.action_type))
		buff = var698
		var697 = var699
	end
	if self.action_params ~= nil then
		local var700 = self.action_params:encode()
		local var701, var702 = protoModule.writeTag(buff, var697, 2, protoModule.wireTypes.lengthDelimited)
		var701, var1277 = protoModule.writeBuffer(var701, var702, var700, buffer.len(var700))
		buff = var701
		var697 = var702
	end
	local buff_1 = buffer.create(var697)
	buffer.copy(buff_1, 0, buff, 0, var697)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var697 = t_36.new()
	local var698 = 0
	while var698 < buffer.len(p36) do
		local _ = nil
		local var699 = nil
		local var700, var701, var702 = protoModule.readTag(p36, var698)
		local var703 = var700
		var699 = var701
		var698 = var702
		
		if var699 == protoModule.wireTypes.varint then
			if var703 == 1 then
				local _ = nil
				local var704, var705 = protoModule.readVarIntI32(p36, var698)
				local var706 = var704
				var698 = var705
				var697.action_type = t.ActionType.fromNumber(var706) or var706
			else
				local _ = nil
				local var707, var708 = protoModule.readVarInt(p36, var698)
				local _ = var707
				var698 = var708
			end
		end
		if var699 == protoModule.wireTypes.lengthDelimited then
			if var703 == 2 then
				local _ = nil
				local var709, var710 = protoModule.readBuffer(p36, var698)
				var698 = var710
				var697.action_params = t.OpenFacialAgeEstimationAction_Params.decode(var709)
			else
				local _ = nil
				local var711, var712 = protoModule.readVarInt(p36, var698)
				var698 = var712 + var711
			end
		elseif var699 == protoModule.wireTypes.i32 then
			local _ = nil
			local var713, var714 = protoModule.readFixed32(p36, var698)
			local _ = var713
			var698 = var714
		elseif var699 == protoModule.wireTypes.i64 then
			local _ = nil
			local var715, var716 = protoModule.readFixed64(p36, var698)
			local _ = var715
			var698 = var716
		else
			error("Unsupported wire type: " .. var1281)
		end
	end
	return var697
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
	local var717 = t_36.new()
	
	if self.action_type ~= nil then
		var717.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var717.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var717.action_params = t.OpenFacialAgeEstimationAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var717.action_params = t.OpenFacialAgeEstimationAction_Params.jsonDecode(self.actionParams)
	end
	return var717
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
	local var717 = 0
	
	if self.user_id ~= nil then
		local var718 = self.user_id:encode()
		local var719, var720 = protoModule.writeTag(buff, var717, 1, protoModule.wireTypes.lengthDelimited)
		var719, var1305 = protoModule.writeBuffer(var719, var720, var718, buffer.len(var718))
		buff = var719
		var717 = var720
	end
	if self.source ~= nil then
		local var721 = self.source:encode()
		local var722, var723 = protoModule.writeTag(buff, var717, 2, protoModule.wireTypes.lengthDelimited)
		var722, var1308 = protoModule.writeBuffer(var722, var723, var721, buffer.len(var721))
		buff = var722
		var717 = var723
	end
	if self.context ~= nil then
		local var724 = self.context:encode()
		local var725, var726 = protoModule.writeTag(buff, var717, 3, protoModule.wireTypes.lengthDelimited)
		var725, var1311 = protoModule.writeBuffer(var725, var726, var724, buffer.len(var724))
		buff = var725
		var717 = var726
	end
	if self.is_in_experience ~= nil then
		local var727 = self.is_in_experience:encode()
		local var728, var729 = protoModule.writeTag(buff, var717, 4, protoModule.wireTypes.lengthDelimited)
		var728, var1314 = protoModule.writeBuffer(var728, var729, var727, buffer.len(var727))
		buff = var728
		var717 = var729
	end
	if self.on_success ~= nil then
		local var730 = self.on_success:encode()
		local var731, var732 = protoModule.writeTag(buff, var717, 5, protoModule.wireTypes.lengthDelimited)
		var731, var1317 = protoModule.writeBuffer(var731, var732, var730, buffer.len(var730))
		buff = var731
		var717 = var732
	end
	if self.on_failure ~= nil then
		local var733 = self.on_failure:encode()
		local var734, var735 = protoModule.writeTag(buff, var717, 6, protoModule.wireTypes.lengthDelimited)
		var734, var1320 = protoModule.writeBuffer(var734, var735, var733, buffer.len(var733))
		buff = var734
		var717 = var735
	end
	if self.should_include_vpc ~= nil then
		local var736 = self.should_include_vpc:encode()
		local var737, var738 = protoModule.writeTag(buff, var717, 7, protoModule.wireTypes.lengthDelimited)
		var737, var1323 = protoModule.writeBuffer(var737, var738, var736, buffer.len(var736))
		buff = var737
		var717 = var738
	end
	local buff_1 = buffer.create(var717)
	buffer.copy(buff_1, 0, buff, 0, var717)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var717 = t_37.new()
	local var718 = 0
	while var718 < buffer.len(p37) do
		local _ = nil
		local var719 = nil
		local var720, var721, var722 = protoModule.readTag(p37, var718)
		local var723 = var720
		var719 = var721
		var718 = var722
		
		if var719 == protoModule.wireTypes.varint then
			local _ = nil
			local var724, var725 = protoModule.readVarInt(p37, var718)
			local _ = var724
			var718 = var725
			continue
		end
		if var719 == protoModule.wireTypes.lengthDelimited then
			if var723 == 1 then
				local _ = nil
				local var726, var727 = protoModule.readBuffer(p37, var718)
				var718 = var727
				var717.user_id = propTypesModule.StringProp.decode(var726)
			elseif var723 == 2 then
				local _ = nil
				local var728, var729 = protoModule.readBuffer(p37, var718)
				var718 = var729
				var717.source = propTypesModule.StringProp.decode(var728)
			elseif var723 == 3 then
				local _ = nil
				local var730, var731 = protoModule.readBuffer(p37, var718)
				var718 = var731
				var717.context = propTypesModule.StringProp.decode(var730)
			elseif var723 == 4 then
				local _ = nil
				local var732, var733 = protoModule.readBuffer(p37, var718)
				var718 = var733
				var717.is_in_experience = propTypesModule.BoolProp.decode(var732)
			elseif var723 == 5 then
				local _ = nil
				local var734, var735 = protoModule.readBuffer(p37, var718)
				var718 = var735
				var717.on_success = t.ActionProp.decode(var734)
			elseif var723 == 6 then
				local _ = nil
				local var736, var737 = protoModule.readBuffer(p37, var718)
				var718 = var737
				var717.on_failure = t.ActionProp.decode(var736)
			elseif var723 == 7 then
				local _ = nil
				local var738, var739 = protoModule.readBuffer(p37, var718)
				var718 = var739
				var717.should_include_vpc = propTypesModule.BoolProp.decode(var738)
			else
				local _ = nil
				local var740, var741 = protoModule.readVarInt(p37, var718)
				var718 = var741 + var740
			end
		elseif var719 == protoModule.wireTypes.i32 then
			local _ = nil
			local var742, var743 = protoModule.readFixed32(p37, var718)
			local _ = var742
			var718 = var743
		elseif var719 == protoModule.wireTypes.i64 then
			local _ = nil
			local var744, var745 = protoModule.readFixed64(p37, var718)
			local _ = var744
			var718 = var745
		else
			error("Unsupported wire type: " .. var1327)
		end
	end
	return var717
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
	local var746 = t_37.new()
	
	if self.user_id ~= nil then
		var746.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var746.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var746.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.context ~= nil then
		var746.context = propTypesModule.StringProp.jsonDecode(self.context)
	end
	if self.is_in_experience ~= nil then
		var746.is_in_experience = propTypesModule.BoolProp.jsonDecode(self.is_in_experience)
	end
	if self.isInExperience ~= nil then
		var746.is_in_experience = propTypesModule.BoolProp.jsonDecode(self.isInExperience)
	end
	if self.on_success ~= nil then
		var746.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var746.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var746.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var746.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	if self.should_include_vpc ~= nil then
		var746.should_include_vpc = propTypesModule.BoolProp.jsonDecode(self.should_include_vpc)
	end
	if self.shouldIncludeVpc ~= nil then
		var746.should_include_vpc = propTypesModule.BoolProp.jsonDecode(self.shouldIncludeVpc)
	end
	return var746
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
	local var746 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var747, var748 = protoModule.writeTag(buff, var746, 1, protoModule.wireTypes.varint)
		var747, var1359 = protoModule.writeVarInt(var747, var748, t.ActionType.toNumber(self.action_type))
		buff = var747
		var746 = var748
	end
	if self.action_params ~= nil then
		local var749 = self.action_params:encode()
		local var750, var751 = protoModule.writeTag(buff, var746, 2, protoModule.wireTypes.lengthDelimited)
		var750, var1362 = protoModule.writeBuffer(var750, var751, var749, buffer.len(var749))
		buff = var750
		var746 = var751
	end
	local buff_1 = buffer.create(var746)
	buffer.copy(buff_1, 0, buff, 0, var746)
	
	return buff_1
end

function t_38.decode(p38)
	-- upvalues: t_38 (ref), protoModule (ref), t (ref)
	local var746 = t_38.new()
	local var747 = 0
	while var747 < buffer.len(p38) do
		local _ = nil
		local var748 = nil
		local var749, var750, var751 = protoModule.readTag(p38, var747)
		local var752 = var749
		var748 = var750
		var747 = var751
		
		if var748 == protoModule.wireTypes.varint then
			if var752 == 1 then
				local _ = nil
				local var753, var754 = protoModule.readVarIntI32(p38, var747)
				local var755 = var753
				var747 = var754
				var746.action_type = t.ActionType.fromNumber(var755) or var755
			else
				local _ = nil
				local var756, var757 = protoModule.readVarInt(p38, var747)
				local _ = var756
				var747 = var757
			end
		end
		if var748 == protoModule.wireTypes.lengthDelimited then
			if var752 == 2 then
				local _ = nil
				local var758, var759 = protoModule.readBuffer(p38, var747)
				var747 = var759
				var746.action_params = t.ShowToastAction_Params.decode(var758)
			else
				local _ = nil
				local var760, var761 = protoModule.readVarInt(p38, var747)
				var747 = var761 + var760
			end
		elseif var748 == protoModule.wireTypes.i32 then
			local _ = nil
			local var762, var763 = protoModule.readFixed32(p38, var747)
			local _ = var762
			var747 = var763
		elseif var748 == protoModule.wireTypes.i64 then
			local _ = nil
			local var764, var765 = protoModule.readFixed64(p38, var747)
			local _ = var764
			var747 = var765
		else
			error("Unsupported wire type: " .. var1366)
		end
	end
	return var746
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
	local var766 = t_38.new()
	
	if self.action_type ~= nil then
		var766.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var766.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var766.action_params = t.ShowToastAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var766.action_params = t.ShowToastAction_Params.jsonDecode(self.actionParams)
	end
	return var766
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
	local var766 = 0
	
	if self.toast_message ~= nil then
		local var767 = self.toast_message:encode()
		local var768, var769 = protoModule.writeTag(buff, var766, 1, protoModule.wireTypes.lengthDelimited)
		var768, var1390 = protoModule.writeBuffer(var768, var769, var767, buffer.len(var767))
		buff = var768
		var766 = var769
	end
	if self.toast_type ~= nil then
		local var770 = self.toast_type:encode()
		local var771, var772 = protoModule.writeTag(buff, var766, 2, protoModule.wireTypes.lengthDelimited)
		var771, var1393 = protoModule.writeBuffer(var771, var772, var770, buffer.len(var770))
		buff = var771
		var766 = var772
	end
	if self.dismiss_prompt ~= nil then
		local var773 = self.dismiss_prompt:encode()
		local var774, var775 = protoModule.writeTag(buff, var766, 3, protoModule.wireTypes.lengthDelimited)
		var774, var1396 = protoModule.writeBuffer(var774, var775, var773, buffer.len(var773))
		buff = var774
		var766 = var775
	end
	if self.prompt_type ~= nil then
		local var776 = self.prompt_type:encode()
		local var777, var778 = protoModule.writeTag(buff, var766, 4, protoModule.wireTypes.lengthDelimited)
		var777, var1399 = protoModule.writeBuffer(var777, var778, var776, buffer.len(var776))
		buff = var777
		var766 = var778
	end
	if self.prompt_id ~= nil then
		local var779 = self.prompt_id:encode()
		local var780, var781 = protoModule.writeTag(buff, var766, 5, protoModule.wireTypes.lengthDelimited)
		var780, var1402 = protoModule.writeBuffer(var780, var781, var779, buffer.len(var779))
		buff = var780
		var766 = var781
	end
	local buff_1 = buffer.create(var766)
	buffer.copy(buff_1, 0, buff, 0, var766)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref), propTypesModule (ref)
	local var766 = t_39.new()
	local var767 = 0
	while var767 < buffer.len(p39) do
		local _ = nil
		local var768 = nil
		local var769, var770, var771 = protoModule.readTag(p39, var767)
		local var772 = var769
		var768 = var770
		var767 = var771
		
		if var768 == protoModule.wireTypes.varint then
			local _ = nil
			local var773, var774 = protoModule.readVarInt(p39, var767)
			local _ = var773
			var767 = var774
			continue
		end
		if var768 == protoModule.wireTypes.lengthDelimited then
			if var772 == 1 then
				local _ = nil
				local var775, var776 = protoModule.readBuffer(p39, var767)
				var767 = var776
				var766.toast_message = propTypesModule.StringProp.decode(var775)
			elseif var772 == 2 then
				local _ = nil
				local var777, var778 = protoModule.readBuffer(p39, var767)
				var767 = var778
				var766.toast_type = propTypesModule.StringProp.decode(var777)
			elseif var772 == 3 then
				local _ = nil
				local var779, var780 = protoModule.readBuffer(p39, var767)
				var767 = var780
				var766.dismiss_prompt = propTypesModule.BoolProp.decode(var779)
			elseif var772 == 4 then
				local _ = nil
				local var781, var782 = protoModule.readBuffer(p39, var767)
				var767 = var782
				var766.prompt_type = propTypesModule.StringProp.decode(var781)
			elseif var772 == 5 then
				local _ = nil
				local var783, var784 = protoModule.readBuffer(p39, var767)
				var767 = var784
				var766.prompt_id = propTypesModule.StringProp.decode(var783)
			else
				local _ = nil
				local var785, var786 = protoModule.readVarInt(p39, var767)
				var767 = var786 + var785
			end
		elseif var768 == protoModule.wireTypes.i32 then
			local _ = nil
			local var787, var788 = protoModule.readFixed32(p39, var767)
			local _ = var787
			var767 = var788
		elseif var768 == protoModule.wireTypes.i64 then
			local _ = nil
			local var789, var790 = protoModule.readFixed64(p39, var767)
			local _ = var789
			var767 = var790
		else
			error("Unsupported wire type: " .. var1406)
		end
	end
	return var766
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
	local var791 = t_39.new()
	
	if self.toast_message ~= nil then
		var791.toast_message = propTypesModule.StringProp.jsonDecode(self.toast_message)
	end
	if self.toastMessage ~= nil then
		var791.toast_message = propTypesModule.StringProp.jsonDecode(self.toastMessage)
	end
	if self.toast_type ~= nil then
		var791.toast_type = propTypesModule.StringProp.jsonDecode(self.toast_type)
	end
	if self.toastType ~= nil then
		var791.toast_type = propTypesModule.StringProp.jsonDecode(self.toastType)
	end
	if self.dismiss_prompt ~= nil then
		var791.dismiss_prompt = propTypesModule.BoolProp.jsonDecode(self.dismiss_prompt)
	end
	if self.dismissPrompt ~= nil then
		var791.dismiss_prompt = propTypesModule.BoolProp.jsonDecode(self.dismissPrompt)
	end
	if self.prompt_type ~= nil then
		var791.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var791.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var791.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var791.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	return var791
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
	local var791 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var792, var793 = protoModule.writeTag(buff, var791, 1, protoModule.wireTypes.varint)
		var792, var1434 = protoModule.writeVarInt(var792, var793, t.ActionType.toNumber(self.action_type))
		buff = var792
		var791 = var793
	end
	if self.action_params ~= nil then
		local var794 = self.action_params:encode()
		local var795, var796 = protoModule.writeTag(buff, var791, 2, protoModule.wireTypes.lengthDelimited)
		var795, var1437 = protoModule.writeBuffer(var795, var796, var794, buffer.len(var794))
		buff = var795
		var791 = var796
	end
	local buff_1 = buffer.create(var791)
	buffer.copy(buff_1, 0, buff, 0, var791)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var791 = t_40.new()
	local var792 = 0
	while var792 < buffer.len(p40) do
		local _ = nil
		local var793 = nil
		local var794, var795, var796 = protoModule.readTag(p40, var792)
		local var797 = var794
		var793 = var795
		var792 = var796
		
		if var793 == protoModule.wireTypes.varint then
			if var797 == 1 then
				local _ = nil
				local var798, var799 = protoModule.readVarIntI32(p40, var792)
				local var800 = var798
				var792 = var799
				var791.action_type = t.ActionType.fromNumber(var800) or var800
			else
				local _ = nil
				local var801, var802 = protoModule.readVarInt(p40, var792)
				local _ = var801
				var792 = var802
			end
		end
		if var793 == protoModule.wireTypes.lengthDelimited then
			if var797 == 2 then
				local _ = nil
				local var803, var804 = protoModule.readBuffer(p40, var792)
				var792 = var804
				var791.action_params = t.OpenPhoneUpsellModalAction_Params.decode(var803)
			else
				local _ = nil
				local var805, var806 = protoModule.readVarInt(p40, var792)
				var792 = var806 + var805
			end
		elseif var793 == protoModule.wireTypes.i32 then
			local _ = nil
			local var807, var808 = protoModule.readFixed32(p40, var792)
			local _ = var807
			var792 = var808
		elseif var793 == protoModule.wireTypes.i64 then
			local _ = nil
			local var809, var810 = protoModule.readFixed64(p40, var792)
			local _ = var809
			var792 = var810
		else
			error("Unsupported wire type: " .. var1441)
		end
	end
	return var791
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
	local var811 = t_40.new()
	
	if self.action_type ~= nil then
		var811.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var811.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var811.action_params = t.OpenPhoneUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var811.action_params = t.OpenPhoneUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var811
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
	local var811 = 0
	
	if self.voice_opt_in ~= nil then
		local var812 = self.voice_opt_in:encode()
		local var813, var814 = protoModule.writeTag(buff, var811, 1, protoModule.wireTypes.lengthDelimited)
		var813, var1465 = protoModule.writeBuffer(var813, var814, var812, buffer.len(var812))
		buff = var813
		var811 = var814
	end
	if self.event_context ~= nil then
		local var815 = self.event_context:encode()
		local var816, var817 = protoModule.writeTag(buff, var811, 2, protoModule.wireTypes.lengthDelimited)
		var816, var1468 = protoModule.writeBuffer(var816, var817, var815, buffer.len(var815))
		buff = var816
		var811 = var817
	end
	if self.origin ~= nil then
		local var818 = self.origin:encode()
		local var819, var820 = protoModule.writeTag(buff, var811, 3, protoModule.wireTypes.lengthDelimited)
		var819, var1471 = protoModule.writeBuffer(var819, var820, var818, buffer.len(var818))
		buff = var819
		var811 = var820
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		local var821 = self.should_autofill_android_phone_number_at_launch:encode()
		local var822, var823 = protoModule.writeTag(buff, var811, 4, protoModule.wireTypes.lengthDelimited)
		var822, var1474 = protoModule.writeBuffer(var822, var823, var821, buffer.len(var821))
		buff = var822
		var811 = var823
	end
	if self.add_phone_description_key ~= nil then
		local var824 = self.add_phone_description_key:encode()
		local var825, var826 = protoModule.writeTag(buff, var811, 5, protoModule.wireTypes.lengthDelimited)
		var825, var1477 = protoModule.writeBuffer(var825, var826, var824, buffer.len(var824))
		buff = var825
		var811 = var826
	end
	if self.on_success ~= nil then
		local var827 = self.on_success:encode()
		local var828, var829 = protoModule.writeTag(buff, var811, 6, protoModule.wireTypes.lengthDelimited)
		var828, var1480 = protoModule.writeBuffer(var828, var829, var827, buffer.len(var827))
		buff = var828
		var811 = var829
	end
	if self.on_failure ~= nil then
		local var830 = self.on_failure:encode()
		local var831, var832 = protoModule.writeTag(buff, var811, 7, protoModule.wireTypes.lengthDelimited)
		var831, var1483 = protoModule.writeBuffer(var831, var832, var830, buffer.len(var830))
		buff = var831
		var811 = var832
	end
	if self.on_cancelled ~= nil then
		local var833 = self.on_cancelled:encode()
		local var834, var835 = protoModule.writeTag(buff, var811, 8, protoModule.wireTypes.lengthDelimited)
		var834, var1486 = protoModule.writeBuffer(var834, var835, var833, buffer.len(var833))
		buff = var834
		var811 = var835
	end
	local buff_1 = buffer.create(var811)
	buffer.copy(buff_1, 0, buff, 0, var811)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var811 = t_41.new()
	local var812 = 0
	while var812 < buffer.len(p41) do
		local _ = nil
		local var813 = nil
		local var814, var815, var816 = protoModule.readTag(p41, var812)
		local var817 = var814
		var813 = var815
		var812 = var816
		
		if var813 == protoModule.wireTypes.varint then
			local _ = nil
			local var818, var819 = protoModule.readVarInt(p41, var812)
			local _ = var818
			var812 = var819
			continue
		end
		if var813 == protoModule.wireTypes.lengthDelimited then
			if var817 == 1 then
				local _ = nil
				local var820, var821 = protoModule.readBuffer(p41, var812)
				var812 = var821
				var811.voice_opt_in = propTypesModule.BoolProp.decode(var820)
			elseif var817 == 2 then
				local _ = nil
				local var822, var823 = protoModule.readBuffer(p41, var812)
				var812 = var823
				var811.event_context = propTypesModule.StringProp.decode(var822)
			elseif var817 == 3 then
				local _ = nil
				local var824, var825 = protoModule.readBuffer(p41, var812)
				var812 = var825
				var811.origin = propTypesModule.StringProp.decode(var824)
			elseif var817 == 4 then
				local _ = nil
				local var826, var827 = protoModule.readBuffer(p41, var812)
				var812 = var827
				var811.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.decode(var826)
			elseif var817 == 5 then
				local _ = nil
				local var828, var829 = protoModule.readBuffer(p41, var812)
				var812 = var829
				var811.add_phone_description_key = propTypesModule.StringProp.decode(var828)
			elseif var817 == 6 then
				local _ = nil
				local var830, var831 = protoModule.readBuffer(p41, var812)
				var812 = var831
				var811.on_success = t.ActionProp.decode(var830)
			elseif var817 == 7 then
				local _ = nil
				local var832, var833 = protoModule.readBuffer(p41, var812)
				var812 = var833
				var811.on_failure = t.ActionProp.decode(var832)
			elseif var817 == 8 then
				local _ = nil
				local var834, var835 = protoModule.readBuffer(p41, var812)
				var812 = var835
				var811.on_cancelled = t.ActionProp.decode(var834)
			else
				local _ = nil
				local var836, var837 = protoModule.readVarInt(p41, var812)
				var812 = var837 + var836
			end
		elseif var813 == protoModule.wireTypes.i32 then
			local _ = nil
			local var838, var839 = protoModule.readFixed32(p41, var812)
			local _ = var838
			var812 = var839
		elseif var813 == protoModule.wireTypes.i64 then
			local _ = nil
			local var840, var841 = protoModule.readFixed64(p41, var812)
			local _ = var840
			var812 = var841
		else
			error("Unsupported wire type: " .. var1490)
		end
	end
	return var811
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
	local var842 = t_41.new()
	
	if self.voice_opt_in ~= nil then
		var842.voice_opt_in = propTypesModule.BoolProp.jsonDecode(self.voice_opt_in)
	end
	if self.voiceOptIn ~= nil then
		var842.voice_opt_in = propTypesModule.BoolProp.jsonDecode(self.voiceOptIn)
	end
	if self.event_context ~= nil then
		var842.event_context = propTypesModule.StringProp.jsonDecode(self.event_context)
	end
	if self.eventContext ~= nil then
		var842.event_context = propTypesModule.StringProp.jsonDecode(self.eventContext)
	end
	if self.origin ~= nil then
		var842.origin = propTypesModule.StringProp.jsonDecode(self.origin)
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		var842.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.jsonDecode(self.should_autofill_android_phone_number_at_launch)
	end
	if self.shouldAutofillAndroidPhoneNumberAtLaunch ~= nil then
		var842.should_autofill_android_phone_number_at_launch = propTypesModule.BoolProp.jsonDecode(self.shouldAutofillAndroidPhoneNumberAtLaunch)
	end
	if self.add_phone_description_key ~= nil then
		var842.add_phone_description_key = propTypesModule.StringProp.jsonDecode(self.add_phone_description_key)
	end
	if self.addPhoneDescriptionKey ~= nil then
		var842.add_phone_description_key = propTypesModule.StringProp.jsonDecode(self.addPhoneDescriptionKey)
	end
	if self.on_success ~= nil then
		var842.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var842.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var842.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var842.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	if self.on_cancelled ~= nil then
		var842.on_cancelled = t.ActionProp.jsonDecode(self.on_cancelled)
	end
	if self.onCancelled ~= nil then
		var842.on_cancelled = t.ActionProp.jsonDecode(self.onCancelled)
	end
	return var842
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
	local var842 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var843, var844 = protoModule.writeTag(buff, var842, 1, protoModule.wireTypes.varint)
		var843, var1524 = protoModule.writeVarInt(var843, var844, t.ActionType.toNumber(self.action_type))
		buff = var843
		var842 = var844
	end
	if self.action_params ~= nil then
		local var845 = self.action_params:encode()
		local var846, var847 = protoModule.writeTag(buff, var842, 2, protoModule.wireTypes.lengthDelimited)
		var846, var1527 = protoModule.writeBuffer(var846, var847, var845, buffer.len(var845))
		buff = var846
		var842 = var847
	end
	local buff_1 = buffer.create(var842)
	buffer.copy(buff_1, 0, buff, 0, var842)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var842 = t_42.new()
	local var843 = 0
	while var843 < buffer.len(p42) do
		local _ = nil
		local var844 = nil
		local var845, var846, var847 = protoModule.readTag(p42, var843)
		local var848 = var845
		var844 = var846
		var843 = var847
		
		if var844 == protoModule.wireTypes.varint then
			if var848 == 1 then
				local _ = nil
				local var849, var850 = protoModule.readVarIntI32(p42, var843)
				local var851 = var849
				var843 = var850
				var842.action_type = t.ActionType.fromNumber(var851) or var851
			else
				local _ = nil
				local var852, var853 = protoModule.readVarInt(p42, var843)
				local _ = var852
				var843 = var853
			end
		end
		if var844 == protoModule.wireTypes.lengthDelimited then
			if var848 == 2 then
				local _ = nil
				local var854, var855 = protoModule.readBuffer(p42, var843)
				var843 = var855
				var842.action_params = t.OpenEmailUpsellModalAction_Params.decode(var854)
			else
				local _ = nil
				local var856, var857 = protoModule.readVarInt(p42, var843)
				var843 = var857 + var856
			end
		elseif var844 == protoModule.wireTypes.i32 then
			local _ = nil
			local var858, var859 = protoModule.readFixed32(p42, var843)
			local _ = var858
			var843 = var859
		elseif var844 == protoModule.wireTypes.i64 then
			local _ = nil
			local var860, var861 = protoModule.readFixed64(p42, var843)
			local _ = var860
			var843 = var861
		else
			error("Unsupported wire type: " .. var1531)
		end
	end
	return var842
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
	local var862 = t_42.new()
	
	if self.action_type ~= nil then
		var862.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var862.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var862.action_params = t.OpenEmailUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var862.action_params = t.OpenEmailUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var862
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
	local var862 = 0
	
	if self.add_email_over13_text_key ~= nil then
		local var863 = self.add_email_over13_text_key:encode()
		local var864, var865 = protoModule.writeTag(buff, var862, 1, protoModule.wireTypes.lengthDelimited)
		var864, var1555 = protoModule.writeBuffer(var864, var865, var863, buffer.len(var863))
		buff = var864
		var862 = var865
	end
	if self.add_email_title_key ~= nil then
		local var866 = self.add_email_title_key:encode()
		local var867, var868 = protoModule.writeTag(buff, var862, 2, protoModule.wireTypes.lengthDelimited)
		var867, var1558 = protoModule.writeBuffer(var867, var868, var866, buffer.len(var866))
		buff = var867
		var862 = var868
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		local var869 = self.is_email_modal_called_from_home_page:encode()
		local var870, var871 = protoModule.writeTag(buff, var862, 3, protoModule.wireTypes.lengthDelimited)
		var870, var1561 = protoModule.writeBuffer(var870, var871, var869, buffer.len(var869))
		buff = var870
		var862 = var871
	end
	if self.event_context ~= nil then
		local var872 = self.event_context:encode()
		local var873, var874 = protoModule.writeTag(buff, var862, 4, protoModule.wireTypes.lengthDelimited)
		var873, var1564 = protoModule.writeBuffer(var873, var874, var872, buffer.len(var872))
		buff = var873
		var862 = var874
	end
	if self.origin ~= nil then
		local var875 = self.origin:encode()
		local var876, var877 = protoModule.writeTag(buff, var862, 5, protoModule.wireTypes.lengthDelimited)
		var876, var1567 = protoModule.writeBuffer(var876, var877, var875, buffer.len(var875))
		buff = var876
		var862 = var877
	end
	if self.section ~= nil then
		local var878 = self.section:encode()
		local var879, var880 = protoModule.writeTag(buff, var862, 6, protoModule.wireTypes.lengthDelimited)
		var879, var1570 = protoModule.writeBuffer(var879, var880, var878, buffer.len(var878))
		buff = var879
		var862 = var880
	end
	if self.on_success ~= nil then
		local var881 = self.on_success:encode()
		local var882, var883 = protoModule.writeTag(buff, var862, 7, protoModule.wireTypes.lengthDelimited)
		var882, var1573 = protoModule.writeBuffer(var882, var883, var881, buffer.len(var881))
		buff = var882
		var862 = var883
	end
	if self.on_failure ~= nil then
		local var884 = self.on_failure:encode()
		local var885, var886 = protoModule.writeTag(buff, var862, 8, protoModule.wireTypes.lengthDelimited)
		var885, var1576 = protoModule.writeBuffer(var885, var886, var884, buffer.len(var884))
		buff = var885
		var862 = var886
	end
	local buff_1 = buffer.create(var862)
	buffer.copy(buff_1, 0, buff, 0, var862)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var862 = t_43.new()
	local var863 = 0
	while var863 < buffer.len(p43) do
		local _ = nil
		local var864 = nil
		local var865, var866, var867 = protoModule.readTag(p43, var863)
		local var868 = var865
		var864 = var866
		var863 = var867
		
		if var864 == protoModule.wireTypes.varint then
			local _ = nil
			local var869, var870 = protoModule.readVarInt(p43, var863)
			local _ = var869
			var863 = var870
			continue
		end
		if var864 == protoModule.wireTypes.lengthDelimited then
			if var868 == 1 then
				local _ = nil
				local var871, var872 = protoModule.readBuffer(p43, var863)
				var863 = var872
				var862.add_email_over13_text_key = propTypesModule.StringProp.decode(var871)
			elseif var868 == 2 then
				local _ = nil
				local var873, var874 = protoModule.readBuffer(p43, var863)
				var863 = var874
				var862.add_email_title_key = propTypesModule.StringProp.decode(var873)
			elseif var868 == 3 then
				local _ = nil
				local var875, var876 = protoModule.readBuffer(p43, var863)
				var863 = var876
				var862.is_email_modal_called_from_home_page = propTypesModule.BoolProp.decode(var875)
			elseif var868 == 4 then
				local _ = nil
				local var877, var878 = protoModule.readBuffer(p43, var863)
				var863 = var878
				var862.event_context = propTypesModule.StringProp.decode(var877)
			elseif var868 == 5 then
				local _ = nil
				local var879, var880 = protoModule.readBuffer(p43, var863)
				var863 = var880
				var862.origin = propTypesModule.StringProp.decode(var879)
			elseif var868 == 6 then
				local _ = nil
				local var881, var882 = protoModule.readBuffer(p43, var863)
				var863 = var882
				var862.section = propTypesModule.StringProp.decode(var881)
			elseif var868 == 7 then
				local _ = nil
				local var883, var884 = protoModule.readBuffer(p43, var863)
				var863 = var884
				var862.on_success = t.ActionProp.decode(var883)
			elseif var868 == 8 then
				local _ = nil
				local var885, var886 = protoModule.readBuffer(p43, var863)
				var863 = var886
				var862.on_failure = t.ActionProp.decode(var885)
			else
				local _ = nil
				local var887, var888 = protoModule.readVarInt(p43, var863)
				var863 = var888 + var887
			end
		elseif var864 == protoModule.wireTypes.i32 then
			local _ = nil
			local var889, var890 = protoModule.readFixed32(p43, var863)
			local _ = var889
			var863 = var890
		elseif var864 == protoModule.wireTypes.i64 then
			local _ = nil
			local var891, var892 = protoModule.readFixed64(p43, var863)
			local _ = var891
			var863 = var892
		else
			error("Unsupported wire type: " .. var1580)
		end
	end
	return var862
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
	local var893 = t_43.new()
	
	if self.add_email_over13_text_key ~= nil then
		var893.add_email_over13_text_key = propTypesModule.StringProp.jsonDecode(self.add_email_over13_text_key)
	end
	if self.addEmailOver13TextKey ~= nil then
		var893.add_email_over13_text_key = propTypesModule.StringProp.jsonDecode(self.addEmailOver13TextKey)
	end
	if self.add_email_title_key ~= nil then
		var893.add_email_title_key = propTypesModule.StringProp.jsonDecode(self.add_email_title_key)
	end
	if self.addEmailTitleKey ~= nil then
		var893.add_email_title_key = propTypesModule.StringProp.jsonDecode(self.addEmailTitleKey)
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		var893.is_email_modal_called_from_home_page = propTypesModule.BoolProp.jsonDecode(self.is_email_modal_called_from_home_page)
	end
	if self.isEmailModalCalledFromHomePage ~= nil then
		var893.is_email_modal_called_from_home_page = propTypesModule.BoolProp.jsonDecode(self.isEmailModalCalledFromHomePage)
	end
	if self.event_context ~= nil then
		var893.event_context = propTypesModule.StringProp.jsonDecode(self.event_context)
	end
	if self.eventContext ~= nil then
		var893.event_context = propTypesModule.StringProp.jsonDecode(self.eventContext)
	end
	if self.origin ~= nil then
		var893.origin = propTypesModule.StringProp.jsonDecode(self.origin)
	end
	if self.section ~= nil then
		var893.section = propTypesModule.StringProp.jsonDecode(self.section)
	end
	if self.on_success ~= nil then
		var893.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		var893.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		var893.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		var893.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	return var893
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
	local var893 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var894, var895 = protoModule.writeTag(buff, var893, 1, protoModule.wireTypes.varint)
		var894, var1614 = protoModule.writeVarInt(var894, var895, t.ActionType.toNumber(self.action_type))
		buff = var894
		var893 = var895
	end
	if self.action_params ~= nil then
		local var896 = self.action_params:encode()
		local var897, var898 = protoModule.writeTag(buff, var893, 2, protoModule.wireTypes.lengthDelimited)
		var897, var1617 = protoModule.writeBuffer(var897, var898, var896, buffer.len(var896))
		buff = var897
		var893 = var898
	end
	local buff_1 = buffer.create(var893)
	buffer.copy(buff_1, 0, buff, 0, var893)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref), t (ref)
	local var893 = t_44.new()
	local var894 = 0
	while var894 < buffer.len(p44) do
		local _ = nil
		local var895 = nil
		local var896, var897, var898 = protoModule.readTag(p44, var894)
		local var899 = var896
		var895 = var897
		var894 = var898
		
		if var895 == protoModule.wireTypes.varint then
			if var899 == 1 then
				local _ = nil
				local var900, var901 = protoModule.readVarIntI32(p44, var894)
				local var902 = var900
				var894 = var901
				var893.action_type = t.ActionType.fromNumber(var902) or var902
			else
				local _ = nil
				local var903, var904 = protoModule.readVarInt(p44, var894)
				local _ = var903
				var894 = var904
			end
		end
		if var895 == protoModule.wireTypes.lengthDelimited then
			if var899 == 2 then
				local _ = nil
				local var905, var906 = protoModule.readBuffer(p44, var894)
				var894 = var906
				var893.action_params = t.OpenAddConnectionsPageAction_Params.decode(var905)
			else
				local _ = nil
				local var907, var908 = protoModule.readVarInt(p44, var894)
				var894 = var908 + var907
			end
		elseif var895 == protoModule.wireTypes.i32 then
			local _ = nil
			local var909, var910 = protoModule.readFixed32(p44, var894)
			local _ = var909
			var894 = var910
		elseif var895 == protoModule.wireTypes.i64 then
			local _ = nil
			local var911, var912 = protoModule.readFixed64(p44, var894)
			local _ = var911
			var894 = var912
		else
			error("Unsupported wire type: " .. var1621)
		end
	end
	return var893
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
	local var913 = t_44.new()
	
	if self.action_type ~= nil then
		var913.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var913.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var913.action_params = t.OpenAddConnectionsPageAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var913.action_params = t.OpenAddConnectionsPageAction_Params.jsonDecode(self.actionParams)
	end
	return var913
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
	local var913 = 0
	
	if self.user_id ~= nil then
		local var914 = self.user_id:encode()
		local var915, var916 = protoModule.writeTag(buff, var913, 1, protoModule.wireTypes.lengthDelimited)
		var915, var1645 = protoModule.writeBuffer(var915, var916, var914, buffer.len(var914))
		buff = var915
		var913 = var916
	end
	if self.source ~= nil then
		local var917 = self.source:encode()
		local var918, var919 = protoModule.writeTag(buff, var913, 2, protoModule.wireTypes.lengthDelimited)
		var918, var1648 = protoModule.writeBuffer(var918, var919, var917, buffer.len(var917))
		buff = var918
		var913 = var919
	end
	local buff_1 = buffer.create(var913)
	buffer.copy(buff_1, 0, buff, 0, var913)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref), propTypesModule (ref)
	local var913 = t_45.new()
	local var914 = 0
	while var914 < buffer.len(p45) do
		local _ = nil
		local var915 = nil
		local var916, var917, var918 = protoModule.readTag(p45, var914)
		local var919 = var916
		var915 = var917
		var914 = var918
		
		if var915 == protoModule.wireTypes.varint then
			local _ = nil
			local var920, var921 = protoModule.readVarInt(p45, var914)
			local _ = var920
			var914 = var921
			continue
		end
		if var915 == protoModule.wireTypes.lengthDelimited then
			if var919 == 1 then
				local _ = nil
				local var922, var923 = protoModule.readBuffer(p45, var914)
				var914 = var923
				var913.user_id = propTypesModule.StringProp.decode(var922)
			elseif var919 == 2 then
				local _ = nil
				local var924, var925 = protoModule.readBuffer(p45, var914)
				var914 = var925
				var913.source = propTypesModule.StringProp.decode(var924)
			else
				local _ = nil
				local var926, var927 = protoModule.readVarInt(p45, var914)
				var914 = var927 + var926
			end
		elseif var915 == protoModule.wireTypes.i32 then
			local _ = nil
			local var928, var929 = protoModule.readFixed32(p45, var914)
			local _ = var928
			var914 = var929
		elseif var915 == protoModule.wireTypes.i64 then
			local _ = nil
			local var930, var931 = protoModule.readFixed64(p45, var914)
			local _ = var930
			var914 = var931
		else
			error("Unsupported wire type: " .. var1652)
		end
	end
	return var913
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
	local var932 = t_45.new()
	
	if self.user_id ~= nil then
		var932.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var932.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var932.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var932
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
	local var932 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var933, var934 = protoModule.writeTag(buff, var932, 1, protoModule.wireTypes.varint)
		var933, var1674 = protoModule.writeVarInt(var933, var934, t.ActionType.toNumber(self.action_type))
		buff = var933
		var932 = var934
	end
	if self.action_params ~= nil then
		local var935 = self.action_params:encode()
		local var936, var937 = protoModule.writeTag(buff, var932, 2, protoModule.wireTypes.lengthDelimited)
		var936, var1677 = protoModule.writeBuffer(var936, var937, var935, buffer.len(var935))
		buff = var936
		var932 = var937
	end
	local buff_1 = buffer.create(var932)
	buffer.copy(buff_1, 0, buff, 0, var932)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref), t (ref)
	local var932 = t_46.new()
	local var933 = 0
	while var933 < buffer.len(p46) do
		local _ = nil
		local var934 = nil
		local var935, var936, var937 = protoModule.readTag(p46, var933)
		local var938 = var935
		var934 = var936
		var933 = var937
		
		if var934 == protoModule.wireTypes.varint then
			if var938 == 1 then
				local _ = nil
				local var939, var940 = protoModule.readVarIntI32(p46, var933)
				local var941 = var939
				var933 = var940
				var932.action_type = t.ActionType.fromNumber(var941) or var941
			else
				local _ = nil
				local var942, var943 = protoModule.readVarInt(p46, var933)
				local _ = var942
				var933 = var943
			end
		end
		if var934 == protoModule.wireTypes.lengthDelimited then
			if var938 == 2 then
				local _ = nil
				local var944, var945 = protoModule.readBuffer(p46, var933)
				var933 = var945
				var932.action_params = t.OpenMarketplaceAction_Params.decode(var944)
			else
				local _ = nil
				local var946, var947 = protoModule.readVarInt(p46, var933)
				var933 = var947 + var946
			end
		elseif var934 == protoModule.wireTypes.i32 then
			local _ = nil
			local var948, var949 = protoModule.readFixed32(p46, var933)
			local _ = var948
			var933 = var949
		elseif var934 == protoModule.wireTypes.i64 then
			local _ = nil
			local var950, var951 = protoModule.readFixed64(p46, var933)
			local _ = var950
			var933 = var951
		else
			error("Unsupported wire type: " .. var1681)
		end
	end
	return var932
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
	local var952 = t_46.new()
	
	if self.action_type ~= nil then
		var952.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var952.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var952.action_params = t.OpenMarketplaceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var952.action_params = t.OpenMarketplaceAction_Params.jsonDecode(self.actionParams)
	end
	return var952
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
	local var952 = 0
	
	if self.user_id ~= nil then
		local var953 = self.user_id:encode()
		local var954, var955 = protoModule.writeTag(buff, var952, 1, protoModule.wireTypes.lengthDelimited)
		var954, var1705 = protoModule.writeBuffer(var954, var955, var953, buffer.len(var953))
		buff = var954
		var952 = var955
	end
	if self.source ~= nil then
		local var956 = self.source:encode()
		local var957, var958 = protoModule.writeTag(buff, var952, 2, protoModule.wireTypes.lengthDelimited)
		var957, var1708 = protoModule.writeBuffer(var957, var958, var956, buffer.len(var956))
		buff = var957
		var952 = var958
	end
	local buff_1 = buffer.create(var952)
	buffer.copy(buff_1, 0, buff, 0, var952)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref), propTypesModule (ref)
	local var952 = t_47.new()
	local var953 = 0
	while var953 < buffer.len(p47) do
		local _ = nil
		local var954 = nil
		local var955, var956, var957 = protoModule.readTag(p47, var953)
		local var958 = var955
		var954 = var956
		var953 = var957
		
		if var954 == protoModule.wireTypes.varint then
			local _ = nil
			local var959, var960 = protoModule.readVarInt(p47, var953)
			local _ = var959
			var953 = var960
			continue
		end
		if var954 == protoModule.wireTypes.lengthDelimited then
			if var958 == 1 then
				local _ = nil
				local var961, var962 = protoModule.readBuffer(p47, var953)
				var953 = var962
				var952.user_id = propTypesModule.StringProp.decode(var961)
			elseif var958 == 2 then
				local _ = nil
				local var963, var964 = protoModule.readBuffer(p47, var953)
				var953 = var964
				var952.source = propTypesModule.StringProp.decode(var963)
			else
				local _ = nil
				local var965, var966 = protoModule.readVarInt(p47, var953)
				var953 = var966 + var965
			end
		elseif var954 == protoModule.wireTypes.i32 then
			local _ = nil
			local var967, var968 = protoModule.readFixed32(p47, var953)
			local _ = var967
			var953 = var968
		elseif var954 == protoModule.wireTypes.i64 then
			local _ = nil
			local var969, var970 = protoModule.readFixed64(p47, var953)
			local _ = var969
			var953 = var970
		else
			error("Unsupported wire type: " .. var1712)
		end
	end
	return var952
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
	local var971 = t_47.new()
	
	if self.user_id ~= nil then
		var971.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var971.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		var971.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var971
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
	local var971 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var972, var973 = protoModule.writeTag(buff, var971, 1, protoModule.wireTypes.varint)
		var972, var1734 = protoModule.writeVarInt(var972, var973, t.ActionType.toNumber(self.action_type))
		buff = var972
		var971 = var973
	end
	if self.action_params ~= nil then
		local var974 = self.action_params:encode()
		local var975, var976 = protoModule.writeTag(buff, var971, 2, protoModule.wireTypes.lengthDelimited)
		var975, var1737 = protoModule.writeBuffer(var975, var976, var974, buffer.len(var974))
		buff = var975
		var971 = var976
	end
	local buff_1 = buffer.create(var971)
	buffer.copy(buff_1, 0, buff, 0, var971)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref), t (ref)
	local var971 = t_48.new()
	local var972 = 0
	while var972 < buffer.len(p48) do
		local _ = nil
		local var973 = nil
		local var974, var975, var976 = protoModule.readTag(p48, var972)
		local var977 = var974
		var973 = var975
		var972 = var976
		
		if var973 == protoModule.wireTypes.varint then
			if var977 == 1 then
				local _ = nil
				local var978, var979 = protoModule.readVarIntI32(p48, var972)
				local var980 = var978
				var972 = var979
				var971.action_type = t.ActionType.fromNumber(var980) or var980
			else
				local _ = nil
				local var981, var982 = protoModule.readVarInt(p48, var972)
				local _ = var981
				var972 = var982
			end
		end
		if var973 == protoModule.wireTypes.lengthDelimited then
			if var977 == 2 then
				local _ = nil
				local var983, var984 = protoModule.readBuffer(p48, var972)
				var972 = var984
				var971.action_params = t.HideProfileCompletionAction_Params.decode(var983)
			else
				local _ = nil
				local var985, var986 = protoModule.readVarInt(p48, var972)
				var972 = var986 + var985
			end
		elseif var973 == protoModule.wireTypes.i32 then
			local _ = nil
			local var987, var988 = protoModule.readFixed32(p48, var972)
			local _ = var987
			var972 = var988
		elseif var973 == protoModule.wireTypes.i64 then
			local _ = nil
			local var989, var990 = protoModule.readFixed64(p48, var972)
			local _ = var989
			var972 = var990
		else
			error("Unsupported wire type: " .. var1741)
		end
	end
	return var971
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
	local var991 = t_48.new()
	
	if self.action_type ~= nil then
		var991.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var991.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var991.action_params = t.HideProfileCompletionAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var991.action_params = t.HideProfileCompletionAction_Params.jsonDecode(self.actionParams)
	end
	return var991
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
	local var991 = 0
	
	if self.user_id ~= nil then
		local var992 = self.user_id:encode()
		local var993, var994 = protoModule.writeTag(buff, var991, 1, protoModule.wireTypes.lengthDelimited)
		var993, var1765 = protoModule.writeBuffer(var993, var994, var992, buffer.len(var992))
		buff = var993
		var991 = var994
	end
	if self.prompt_id ~= nil then
		local var995 = self.prompt_id:encode()
		local var996, var997 = protoModule.writeTag(buff, var991, 2, protoModule.wireTypes.lengthDelimited)
		var996, var1768 = protoModule.writeBuffer(var996, var997, var995, buffer.len(var995))
		buff = var996
		var991 = var997
	end
	if self.source ~= nil then
		local var998 = self.source:encode()
		local var999, var1000 = protoModule.writeTag(buff, var991, 3, protoModule.wireTypes.lengthDelimited)
		var999, var1771 = protoModule.writeBuffer(var999, var1000, var998, buffer.len(var998))
		buff = var999
		var991 = var1000
	end
	if self.prompt_type ~= nil then
		local var1001 = self.prompt_type:encode()
		local var1002, var1003 = protoModule.writeTag(buff, var991, 4, protoModule.wireTypes.lengthDelimited)
		var1002, var1774 = protoModule.writeBuffer(var1002, var1003, var1001, buffer.len(var1001))
		buff = var1002
		var991 = var1003
	end
	local buff_1 = buffer.create(var991)
	buffer.copy(buff_1, 0, buff, 0, var991)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref), propTypesModule (ref)
	local var991 = t_49.new()
	local var992 = 0
	while var992 < buffer.len(p49) do
		local _ = nil
		local var993 = nil
		local var994, var995, var996 = protoModule.readTag(p49, var992)
		local var997 = var994
		var993 = var995
		var992 = var996
		
		if var993 == protoModule.wireTypes.varint then
			local _ = nil
			local var998, var999 = protoModule.readVarInt(p49, var992)
			local _ = var998
			var992 = var999
			continue
		end
		if var993 == protoModule.wireTypes.lengthDelimited then
			if var997 == 1 then
				local _ = nil
				local var1000, var1001 = protoModule.readBuffer(p49, var992)
				var992 = var1001
				var991.user_id = propTypesModule.StringProp.decode(var1000)
			elseif var997 == 2 then
				local _ = nil
				local var1002, var1003 = protoModule.readBuffer(p49, var992)
				var992 = var1003
				var991.prompt_id = propTypesModule.StringProp.decode(var1002)
			elseif var997 == 3 then
				local _ = nil
				local var1004, var1005 = protoModule.readBuffer(p49, var992)
				var992 = var1005
				var991.source = propTypesModule.StringProp.decode(var1004)
			elseif var997 == 4 then
				local _ = nil
				local var1006, var1007 = protoModule.readBuffer(p49, var992)
				var992 = var1007
				var991.prompt_type = propTypesModule.StringProp.decode(var1006)
			else
				local _ = nil
				local var1008, var1009 = protoModule.readVarInt(p49, var992)
				var992 = var1009 + var1008
			end
		elseif var993 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1010, var1011 = protoModule.readFixed32(p49, var992)
			local _ = var1010
			var992 = var1011
		elseif var993 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1012, var1013 = protoModule.readFixed64(p49, var992)
			local _ = var1012
			var992 = var1013
		else
			error("Unsupported wire type: " .. var1778)
		end
	end
	return var991
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
	local var1014 = t_49.new()
	
	if self.user_id ~= nil then
		var1014.user_id = propTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1014.user_id = propTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.prompt_id ~= nil then
		var1014.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var1014.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.source ~= nil then
		var1014.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.prompt_type ~= nil then
		var1014.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1014.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	return var1014
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
	local var1014 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1015, var1016 = protoModule.writeTag(buff, var1014, 1, protoModule.wireTypes.varint)
		var1015, var1804 = protoModule.writeVarInt(var1015, var1016, t.ActionType.toNumber(self.action_type))
		buff = var1015
		var1014 = var1016
	end
	if self.action_params ~= nil then
		local var1017 = self.action_params:encode()
		local var1018, var1019 = protoModule.writeTag(buff, var1014, 2, protoModule.wireTypes.lengthDelimited)
		var1018, var1807 = protoModule.writeBuffer(var1018, var1019, var1017, buffer.len(var1017))
		buff = var1018
		var1014 = var1019
	end
	local buff_1 = buffer.create(var1014)
	buffer.copy(buff_1, 0, buff, 0, var1014)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var1014 = t_50.new()
	local var1015 = 0
	while var1015 < buffer.len(p50) do
		local _ = nil
		local var1016 = nil
		local var1017, var1018, var1019 = protoModule.readTag(p50, var1015)
		local var1020 = var1017
		var1016 = var1018
		var1015 = var1019
		
		if var1016 == protoModule.wireTypes.varint then
			if var1020 == 1 then
				local _ = nil
				local var1021, var1022 = protoModule.readVarIntI32(p50, var1015)
				local var1023 = var1021
				var1015 = var1022
				var1014.action_type = t.ActionType.fromNumber(var1023) or var1023
			else
				local _ = nil
				local var1024, var1025 = protoModule.readVarInt(p50, var1015)
				local _ = var1024
				var1015 = var1025
			end
		end
		if var1016 == protoModule.wireTypes.lengthDelimited then
			if var1020 == 2 then
				local _ = nil
				local var1026, var1027 = protoModule.readBuffer(p50, var1015)
				var1015 = var1027
				var1014.action_params = t.SelectMarketplaceCatalogCategory_Params.decode(var1026)
			else
				local _ = nil
				local var1028, var1029 = protoModule.readVarInt(p50, var1015)
				var1015 = var1029 + var1028
			end
		elseif var1016 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1030, var1031 = protoModule.readFixed32(p50, var1015)
			local _ = var1030
			var1015 = var1031
		elseif var1016 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1032, var1033 = protoModule.readFixed64(p50, var1015)
			local _ = var1032
			var1015 = var1033
		else
			error("Unsupported wire type: " .. var1811)
		end
	end
	return var1014
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
	local var1034 = t_50.new()
	
	if self.action_type ~= nil then
		var1034.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1034.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1034.action_params = t.SelectMarketplaceCatalogCategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1034.action_params = t.SelectMarketplaceCatalogCategory_Params.jsonDecode(self.actionParams)
	end
	return var1034
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
	local var1034 = 0
	
	if self.category_id ~= nil then
		local var1035 = self.category_id:encode()
		local var1036, var1037 = protoModule.writeTag(buff, var1034, 1, protoModule.wireTypes.lengthDelimited)
		var1036, var1835 = protoModule.writeBuffer(var1036, var1037, var1035, buffer.len(var1035))
		buff = var1036
		var1034 = var1037
	end
	local buff_1 = buffer.create(var1034)
	buffer.copy(buff_1, 0, buff, 0, var1034)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref), propTypesModule (ref)
	local var1034 = t_51.new()
	local var1035 = 0
	while var1035 < buffer.len(p51) do
		local _ = nil
		local var1036 = nil
		local var1037, var1038, var1039 = protoModule.readTag(p51, var1035)
		local var1040 = var1037
		var1036 = var1038
		var1035 = var1039
		
		if var1036 == protoModule.wireTypes.varint then
			local _ = nil
			local var1041, var1042 = protoModule.readVarInt(p51, var1035)
			local _ = var1041
			var1035 = var1042
			continue
		end
		if var1036 == protoModule.wireTypes.lengthDelimited then
			if var1040 == 1 then
				local _ = nil
				local var1043, var1044 = protoModule.readBuffer(p51, var1035)
				var1035 = var1044
				var1034.category_id = propTypesModule.StringProp.decode(var1043)
			else
				local _ = nil
				local var1045, var1046 = protoModule.readVarInt(p51, var1035)
				var1035 = var1046 + var1045
			end
		elseif var1036 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1047, var1048 = protoModule.readFixed32(p51, var1035)
			local _ = var1047
			var1035 = var1048
		elseif var1036 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1049, var1050 = protoModule.readFixed64(p51, var1035)
			local _ = var1049
			var1035 = var1050
		else
			error("Unsupported wire type: " .. var1839)
		end
	end
	return var1034
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
	local var1051 = t_51.new()
	
	if self.category_id ~= nil then
		var1051.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var1051.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	return var1051
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
	local var1051 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1052, var1053 = protoModule.writeTag(buff, var1051, 1, protoModule.wireTypes.varint)
		var1052, var1859 = protoModule.writeVarInt(var1052, var1053, t.ActionType.toNumber(self.action_type))
		buff = var1052
		var1051 = var1053
	end
	if self.action_params ~= nil then
		local var1054 = self.action_params:encode()
		local var1055, var1056 = protoModule.writeTag(buff, var1051, 2, protoModule.wireTypes.lengthDelimited)
		var1055, var1862 = protoModule.writeBuffer(var1055, var1056, var1054, buffer.len(var1054))
		buff = var1055
		var1051 = var1056
	end
	local buff_1 = buffer.create(var1051)
	buffer.copy(buff_1, 0, buff, 0, var1051)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1051 = t_52.new()
	local var1052 = 0
	while var1052 < buffer.len(p52) do
		local _ = nil
		local var1053 = nil
		local var1054, var1055, var1056 = protoModule.readTag(p52, var1052)
		local var1057 = var1054
		var1053 = var1055
		var1052 = var1056
		
		if var1053 == protoModule.wireTypes.varint then
			if var1057 == 1 then
				local _ = nil
				local var1058, var1059 = protoModule.readVarIntI32(p52, var1052)
				local var1060 = var1058
				var1052 = var1059
				var1051.action_type = t.ActionType.fromNumber(var1060) or var1060
			else
				local _ = nil
				local var1061, var1062 = protoModule.readVarInt(p52, var1052)
				local _ = var1061
				var1052 = var1062
			end
		end
		if var1053 == protoModule.wireTypes.lengthDelimited then
			if var1057 == 2 then
				local _ = nil
				local var1063, var1064 = protoModule.readBuffer(p52, var1052)
				var1052 = var1064
				var1051.action_params = t.SelectMarketplaceCatalogSubcategory_Params.decode(var1063)
			else
				local _ = nil
				local var1065, var1066 = protoModule.readVarInt(p52, var1052)
				var1052 = var1066 + var1065
			end
		elseif var1053 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1067, var1068 = protoModule.readFixed32(p52, var1052)
			local _ = var1067
			var1052 = var1068
		elseif var1053 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1069, var1070 = protoModule.readFixed64(p52, var1052)
			local _ = var1069
			var1052 = var1070
		else
			error("Unsupported wire type: " .. var1866)
		end
	end
	return var1051
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
	local var1071 = t_52.new()
	
	if self.action_type ~= nil then
		var1071.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1071.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1071.action_params = t.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1071.action_params = t.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(self.actionParams)
	end
	return var1071
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
	local var1071 = 0
	
	if self.subcategory_id ~= nil then
		local var1072 = self.subcategory_id:encode()
		local var1073, var1074 = protoModule.writeTag(buff, var1071, 1, protoModule.wireTypes.lengthDelimited)
		var1073, var1890 = protoModule.writeBuffer(var1073, var1074, var1072, buffer.len(var1072))
		buff = var1073
		var1071 = var1074
	end
	local buff_1 = buffer.create(var1071)
	buffer.copy(buff_1, 0, buff, 0, var1071)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref), propTypesModule (ref)
	local var1071 = t_53.new()
	local var1072 = 0
	while var1072 < buffer.len(p53) do
		local _ = nil
		local var1073 = nil
		local var1074, var1075, var1076 = protoModule.readTag(p53, var1072)
		local var1077 = var1074
		var1073 = var1075
		var1072 = var1076
		
		if var1073 == protoModule.wireTypes.varint then
			local _ = nil
			local var1078, var1079 = protoModule.readVarInt(p53, var1072)
			local _ = var1078
			var1072 = var1079
			continue
		end
		if var1073 == protoModule.wireTypes.lengthDelimited then
			if var1077 == 1 then
				local _ = nil
				local var1080, var1081 = protoModule.readBuffer(p53, var1072)
				var1072 = var1081
				var1071.subcategory_id = propTypesModule.StringProp.decode(var1080)
			else
				local _ = nil
				local var1082, var1083 = protoModule.readVarInt(p53, var1072)
				var1072 = var1083 + var1082
			end
		elseif var1073 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1084, var1085 = protoModule.readFixed32(p53, var1072)
			local _ = var1084
			var1072 = var1085
		elseif var1073 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1086, var1087 = protoModule.readFixed64(p53, var1072)
			local _ = var1086
			var1072 = var1087
		else
			error("Unsupported wire type: " .. var1894)
		end
	end
	return var1071
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
	local var1088 = t_53.new()
	
	if self.subcategory_id ~= nil then
		var1088.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var1088.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	return var1088
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
	local var1088 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1089, var1090 = protoModule.writeTag(buff, var1088, 1, protoModule.wireTypes.varint)
		var1089, var1914 = protoModule.writeVarInt(var1089, var1090, t.ActionType.toNumber(self.action_type))
		buff = var1089
		var1088 = var1090
	end
	if self.action_params ~= nil then
		local var1091 = self.action_params:encode()
		local var1092, var1093 = protoModule.writeTag(buff, var1088, 2, protoModule.wireTypes.lengthDelimited)
		var1092, var1917 = protoModule.writeBuffer(var1092, var1093, var1091, buffer.len(var1091))
		buff = var1092
		var1088 = var1093
	end
	local buff_1 = buffer.create(var1088)
	buffer.copy(buff_1, 0, buff, 0, var1088)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref), t (ref)
	local var1088 = t_54.new()
	local var1089 = 0
	while var1089 < buffer.len(p54) do
		local _ = nil
		local var1090 = nil
		local var1091, var1092, var1093 = protoModule.readTag(p54, var1089)
		local var1094 = var1091
		var1090 = var1092
		var1089 = var1093
		
		if var1090 == protoModule.wireTypes.varint then
			if var1094 == 1 then
				local _ = nil
				local var1095, var1096 = protoModule.readVarIntI32(p54, var1089)
				local var1097 = var1095
				var1089 = var1096
				var1088.action_type = t.ActionType.fromNumber(var1097) or var1097
			else
				local _ = nil
				local var1098, var1099 = protoModule.readVarInt(p54, var1089)
				local _ = var1098
				var1089 = var1099
			end
		end
		if var1090 == protoModule.wireTypes.lengthDelimited then
			if var1094 == 2 then
				local _ = nil
				local var1100, var1101 = protoModule.readBuffer(p54, var1089)
				var1089 = var1101
				var1088.action_params = t.OpenMarketplaceCatalogSeeAll_Params.decode(var1100)
			else
				local _ = nil
				local var1102, var1103 = protoModule.readVarInt(p54, var1089)
				var1089 = var1103 + var1102
			end
		elseif var1090 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1104, var1105 = protoModule.readFixed32(p54, var1089)
			local _ = var1104
			var1089 = var1105
		elseif var1090 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1106, var1107 = protoModule.readFixed64(p54, var1089)
			local _ = var1106
			var1089 = var1107
		else
			error("Unsupported wire type: " .. var1921)
		end
	end
	return var1088
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
	local var1108 = t_54.new()
	
	if self.action_type ~= nil then
		var1108.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1108.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1108.action_params = t.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1108.action_params = t.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(self.actionParams)
	end
	return var1108
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
	local var1108 = 0
	
	if self.sort_id ~= nil then
		local var1109 = self.sort_id:encode()
		local var1110, var1111 = protoModule.writeTag(buff, var1108, 1, protoModule.wireTypes.lengthDelimited)
		var1110, var1945 = protoModule.writeBuffer(var1110, var1111, var1109, buffer.len(var1109))
		buff = var1110
		var1108 = var1111
	end
	if self.title ~= nil then
		local var1112 = self.title:encode()
		local var1113, var1114 = protoModule.writeTag(buff, var1108, 2, protoModule.wireTypes.lengthDelimited)
		var1113, var1948 = protoModule.writeBuffer(var1113, var1114, var1112, buffer.len(var1112))
		buff = var1113
		var1108 = var1114
	end
	if self.description ~= nil then
		local var1115 = self.description:encode()
		local var1116, var1117 = protoModule.writeTag(buff, var1108, 3, protoModule.wireTypes.lengthDelimited)
		var1116, var1951 = protoModule.writeBuffer(var1116, var1117, var1115, buffer.len(var1115))
		buff = var1116
		var1108 = var1117
	end
	if self.tooltip_text ~= nil then
		local var1118 = self.tooltip_text:encode()
		local var1119, var1120 = protoModule.writeTag(buff, var1108, 4, protoModule.wireTypes.lengthDelimited)
		var1119, var1954 = protoModule.writeBuffer(var1119, var1120, var1118, buffer.len(var1118))
		buff = var1119
		var1108 = var1120
	end
	local buff_1 = buffer.create(var1108)
	buffer.copy(buff_1, 0, buff, 0, var1108)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref), propTypesModule (ref)
	local var1108 = t_55.new()
	local var1109 = 0
	while var1109 < buffer.len(p55) do
		local _ = nil
		local var1110 = nil
		local var1111, var1112, var1113 = protoModule.readTag(p55, var1109)
		local var1114 = var1111
		var1110 = var1112
		var1109 = var1113
		
		if var1110 == protoModule.wireTypes.varint then
			local _ = nil
			local var1115, var1116 = protoModule.readVarInt(p55, var1109)
			local _ = var1115
			var1109 = var1116
			continue
		end
		if var1110 == protoModule.wireTypes.lengthDelimited then
			if var1114 == 1 then
				local _ = nil
				local var1117, var1118 = protoModule.readBuffer(p55, var1109)
				var1109 = var1118
				var1108.sort_id = propTypesModule.StringProp.decode(var1117)
			elseif var1114 == 2 then
				local _ = nil
				local var1119, var1120 = protoModule.readBuffer(p55, var1109)
				var1109 = var1120
				var1108.title = propTypesModule.StringProp.decode(var1119)
			elseif var1114 == 3 then
				local _ = nil
				local var1121, var1122 = protoModule.readBuffer(p55, var1109)
				var1109 = var1122
				var1108.description = propTypesModule.StringProp.decode(var1121)
			elseif var1114 == 4 then
				local _ = nil
				local var1123, var1124 = protoModule.readBuffer(p55, var1109)
				var1109 = var1124
				var1108.tooltip_text = propTypesModule.StringProp.decode(var1123)
			else
				local _ = nil
				local var1125, var1126 = protoModule.readVarInt(p55, var1109)
				var1109 = var1126 + var1125
			end
		elseif var1110 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1127, var1128 = protoModule.readFixed32(p55, var1109)
			local _ = var1127
			var1109 = var1128
		elseif var1110 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1129, var1130 = protoModule.readFixed64(p55, var1109)
			local _ = var1129
			var1109 = var1130
		else
			error("Unsupported wire type: " .. var1958)
		end
	end
	return var1108
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
	local var1131 = t_55.new()
	
	if self.sort_id ~= nil then
		var1131.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var1131.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	if self.title ~= nil then
		var1131.title = propTypesModule.StringProp.jsonDecode(self.title)
	end
	if self.description ~= nil then
		var1131.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.tooltip_text ~= nil then
		var1131.tooltip_text = propTypesModule.StringProp.jsonDecode(self.tooltip_text)
	end
	if self.tooltipText ~= nil then
		var1131.tooltip_text = propTypesModule.StringProp.jsonDecode(self.tooltipText)
	end
	return var1131
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
	local var1131 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1132, var1133 = protoModule.writeTag(buff, var1131, 1, protoModule.wireTypes.varint)
		var1132, var1984 = protoModule.writeVarInt(var1132, var1133, t.ActionType.toNumber(self.action_type))
		buff = var1132
		var1131 = var1133
	end
	if self.action_params ~= nil then
		local var1134 = self.action_params:encode()
		local var1135, var1136 = protoModule.writeTag(buff, var1131, 2, protoModule.wireTypes.lengthDelimited)
		var1135, var1987 = protoModule.writeBuffer(var1135, var1136, var1134, buffer.len(var1134))
		buff = var1135
		var1131 = var1136
	end
	local buff_1 = buffer.create(var1131)
	buffer.copy(buff_1, 0, buff, 0, var1131)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref), t (ref)
	local var1131 = t_56.new()
	local var1132 = 0
	while var1132 < buffer.len(p56) do
		local _ = nil
		local var1133 = nil
		local var1134, var1135, var1136 = protoModule.readTag(p56, var1132)
		local var1137 = var1134
		var1133 = var1135
		var1132 = var1136
		
		if var1133 == protoModule.wireTypes.varint then
			if var1137 == 1 then
				local _ = nil
				local var1138, var1139 = protoModule.readVarIntI32(p56, var1132)
				local var1140 = var1138
				var1132 = var1139
				var1131.action_type = t.ActionType.fromNumber(var1140) or var1140
			else
				local _ = nil
				local var1141, var1142 = protoModule.readVarInt(p56, var1132)
				local _ = var1141
				var1132 = var1142
			end
		end
		if var1133 == protoModule.wireTypes.lengthDelimited then
			if var1137 == 2 then
				local _ = nil
				local var1143, var1144 = protoModule.readBuffer(p56, var1132)
				var1132 = var1144
				var1131.action_params = t.CloseMarketplaceCategoryTooltip_Params.decode(var1143)
			else
				local _ = nil
				local var1145, var1146 = protoModule.readVarInt(p56, var1132)
				var1132 = var1146 + var1145
			end
		elseif var1133 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1147, var1148 = protoModule.readFixed32(p56, var1132)
			local _ = var1147
			var1132 = var1148
		elseif var1133 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1149, var1150 = protoModule.readFixed64(p56, var1132)
			local _ = var1149
			var1132 = var1150
		else
			error("Unsupported wire type: " .. var1991)
		end
	end
	return var1131
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
	local var1151 = t_56.new()
	
	if self.action_type ~= nil then
		var1151.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1151.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1151.action_params = t.CloseMarketplaceCategoryTooltip_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1151.action_params = t.CloseMarketplaceCategoryTooltip_Params.jsonDecode(self.actionParams)
	end
	return var1151
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
	local var1151 = 0
	
	if self.tooltip_id ~= nil then
		local var1152 = self.tooltip_id:encode()
		local var1153, var1154 = protoModule.writeTag(buff, var1151, 1, protoModule.wireTypes.lengthDelimited)
		var1153, var2015 = protoModule.writeBuffer(var1153, var1154, var1152, buffer.len(var1152))
		buff = var1153
		var1151 = var1154
	end
	local buff_1 = buffer.create(var1151)
	buffer.copy(buff_1, 0, buff, 0, var1151)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref), propTypesModule (ref)
	local var1151 = t_57.new()
	local var1152 = 0
	while var1152 < buffer.len(p57) do
		local _ = nil
		local var1153 = nil
		local var1154, var1155, var1156 = protoModule.readTag(p57, var1152)
		local var1157 = var1154
		var1153 = var1155
		var1152 = var1156
		
		if var1153 == protoModule.wireTypes.varint then
			local _ = nil
			local var1158, var1159 = protoModule.readVarInt(p57, var1152)
			local _ = var1158
			var1152 = var1159
			continue
		end
		if var1153 == protoModule.wireTypes.lengthDelimited then
			if var1157 == 1 then
				local _ = nil
				local var1160, var1161 = protoModule.readBuffer(p57, var1152)
				var1152 = var1161
				var1151.tooltip_id = propTypesModule.StringProp.decode(var1160)
			else
				local _ = nil
				local var1162, var1163 = protoModule.readVarInt(p57, var1152)
				var1152 = var1163 + var1162
			end
		elseif var1153 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1164, var1165 = protoModule.readFixed32(p57, var1152)
			local _ = var1164
			var1152 = var1165
		elseif var1153 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1166, var1167 = protoModule.readFixed64(p57, var1152)
			local _ = var1166
			var1152 = var1167
		else
			error("Unsupported wire type: " .. var2019)
		end
	end
	return var1151
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
	local var1168 = t_57.new()
	
	if self.tooltip_id ~= nil then
		var1168.tooltip_id = propTypesModule.StringProp.jsonDecode(self.tooltip_id)
	end
	if self.tooltipId ~= nil then
		var1168.tooltip_id = propTypesModule.StringProp.jsonDecode(self.tooltipId)
	end
	return var1168
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
	local var1168 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1169, var1170 = protoModule.writeTag(buff, var1168, 1, protoModule.wireTypes.varint)
		var1169, var2039 = protoModule.writeVarInt(var1169, var1170, t.ActionType.toNumber(self.action_type))
		buff = var1169
		var1168 = var1170
	end
	if self.action_params ~= nil then
		local var1171 = self.action_params:encode()
		local var1172, var1173 = protoModule.writeTag(buff, var1168, 2, protoModule.wireTypes.lengthDelimited)
		var1172, var2042 = protoModule.writeBuffer(var1172, var1173, var1171, buffer.len(var1171))
		buff = var1172
		var1168 = var1173
	end
	local buff_1 = buffer.create(var1168)
	buffer.copy(buff_1, 0, buff, 0, var1168)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref), t (ref)
	local var1168 = t_58.new()
	local var1169 = 0
	while var1169 < buffer.len(p58) do
		local _ = nil
		local var1170 = nil
		local var1171, var1172, var1173 = protoModule.readTag(p58, var1169)
		local var1174 = var1171
		var1170 = var1172
		var1169 = var1173
		
		if var1170 == protoModule.wireTypes.varint then
			if var1174 == 1 then
				local _ = nil
				local var1175, var1176 = protoModule.readVarIntI32(p58, var1169)
				local var1177 = var1175
				var1169 = var1176
				var1168.action_type = t.ActionType.fromNumber(var1177) or var1177
			else
				local _ = nil
				local var1178, var1179 = protoModule.readVarInt(p58, var1169)
				local _ = var1178
				var1169 = var1179
			end
		end
		if var1170 == protoModule.wireTypes.lengthDelimited then
			if var1174 == 2 then
				local _ = nil
				local var1180, var1181 = protoModule.readBuffer(p58, var1169)
				var1169 = var1181
				var1168.action_params = t.ResizeMarketplaceCatalog_Params.decode(var1180)
			else
				local _ = nil
				local var1182, var1183 = protoModule.readVarInt(p58, var1169)
				var1169 = var1183 + var1182
			end
		elseif var1170 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1184, var1185 = protoModule.readFixed32(p58, var1169)
			local _ = var1184
			var1169 = var1185
		elseif var1170 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1186, var1187 = protoModule.readFixed64(p58, var1169)
			local _ = var1186
			var1169 = var1187
		else
			error("Unsupported wire type: " .. var2046)
		end
	end
	return var1168
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
	local var1188 = t_58.new()
	
	if self.action_type ~= nil then
		var1188.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1188.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1188.action_params = t.ResizeMarketplaceCatalog_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1188.action_params = t.ResizeMarketplaceCatalog_Params.jsonDecode(self.actionParams)
	end
	return var1188
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
	local var1188 = 0
	
	if self.category_id ~= nil then
		local var1189 = self.category_id:encode()
		local var1190, var1191 = protoModule.writeTag(buff, var1188, 1, protoModule.wireTypes.lengthDelimited)
		var1190, var2070 = protoModule.writeBuffer(var1190, var1191, var1189, buffer.len(var1189))
		buff = var1190
		var1188 = var1191
	end
	if self.subcategory_id ~= nil then
		local var1192 = self.subcategory_id:encode()
		local var1193, var1194 = protoModule.writeTag(buff, var1188, 2, protoModule.wireTypes.lengthDelimited)
		var1193, var2073 = protoModule.writeBuffer(var1193, var1194, var1192, buffer.len(var1192))
		buff = var1193
		var1188 = var1194
	end
	if self.screen_size ~= nil then
		local var1195 = self.screen_size:encode()
		local var1196, var1197 = protoModule.writeTag(buff, var1188, 3, protoModule.wireTypes.lengthDelimited)
		var1196, var2076 = protoModule.writeBuffer(var1196, var1197, var1195, buffer.len(var1195))
		buff = var1196
		var1188 = var1197
	end
	local buff_1 = buffer.create(var1188)
	buffer.copy(buff_1, 0, buff, 0, var1188)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref), propTypesModule (ref)
	local var1188 = t_59.new()
	local var1189 = 0
	while var1189 < buffer.len(p59) do
		local _ = nil
		local var1190 = nil
		local var1191, var1192, var1193 = protoModule.readTag(p59, var1189)
		local var1194 = var1191
		var1190 = var1192
		var1189 = var1193
		
		if var1190 == protoModule.wireTypes.varint then
			local _ = nil
			local var1195, var1196 = protoModule.readVarInt(p59, var1189)
			local _ = var1195
			var1189 = var1196
			continue
		end
		if var1190 == protoModule.wireTypes.lengthDelimited then
			if var1194 == 1 then
				local _ = nil
				local var1197, var1198 = protoModule.readBuffer(p59, var1189)
				var1189 = var1198
				var1188.category_id = propTypesModule.StringProp.decode(var1197)
			elseif var1194 == 2 then
				local _ = nil
				local var1199, var1200 = protoModule.readBuffer(p59, var1189)
				var1189 = var1200
				var1188.subcategory_id = propTypesModule.StringProp.decode(var1199)
			elseif var1194 == 3 then
				local _ = nil
				local var1201, var1202 = protoModule.readBuffer(p59, var1189)
				var1189 = var1202
				var1188.screen_size = propTypesModule.StringProp.decode(var1201)
			else
				local _ = nil
				local var1203, var1204 = protoModule.readVarInt(p59, var1189)
				var1189 = var1204 + var1203
			end
		elseif var1190 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1205, var1206 = protoModule.readFixed32(p59, var1189)
			local _ = var1205
			var1189 = var1206
		elseif var1190 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1207, var1208 = protoModule.readFixed64(p59, var1189)
			local _ = var1207
			var1189 = var1208
		else
			error("Unsupported wire type: " .. var2080)
		end
	end
	return var1188
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
	local var1209 = t_59.new()
	
	if self.category_id ~= nil then
		var1209.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var1209.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	if self.subcategory_id ~= nil then
		var1209.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var1209.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	if self.screen_size ~= nil then
		var1209.screen_size = propTypesModule.StringProp.jsonDecode(self.screen_size)
	end
	if self.screenSize ~= nil then
		var1209.screen_size = propTypesModule.StringProp.jsonDecode(self.screenSize)
	end
	return var1209
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
	local var1209 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1210, var1211 = protoModule.writeTag(buff, var1209, 1, protoModule.wireTypes.varint)
		var1210, var2104 = protoModule.writeVarInt(var1210, var1211, t.ActionType.toNumber(self.action_type))
		buff = var1210
		var1209 = var1211
	end
	if self.action_params ~= nil then
		local var1212 = self.action_params:encode()
		local var1213, var1214 = protoModule.writeTag(buff, var1209, 2, protoModule.wireTypes.lengthDelimited)
		var1213, var2107 = protoModule.writeBuffer(var1213, var1214, var1212, buffer.len(var1212))
		buff = var1213
		var1209 = var1214
	end
	local buff_1 = buffer.create(var1209)
	buffer.copy(buff_1, 0, buff, 0, var1209)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref), t (ref)
	local var1209 = t_60.new()
	local var1210 = 0
	while var1210 < buffer.len(p60) do
		local _ = nil
		local var1211 = nil
		local var1212, var1213, var1214 = protoModule.readTag(p60, var1210)
		local var1215 = var1212
		var1211 = var1213
		var1210 = var1214
		
		if var1211 == protoModule.wireTypes.varint then
			if var1215 == 1 then
				local _ = nil
				local var1216, var1217 = protoModule.readVarIntI32(p60, var1210)
				local var1218 = var1216
				var1210 = var1217
				var1209.action_type = t.ActionType.fromNumber(var1218) or var1218
			else
				local _ = nil
				local var1219, var1220 = protoModule.readVarInt(p60, var1210)
				local _ = var1219
				var1210 = var1220
			end
		end
		if var1211 == protoModule.wireTypes.lengthDelimited then
			if var1215 == 2 then
				local _ = nil
				local var1221, var1222 = protoModule.readBuffer(p60, var1210)
				var1210 = var1222
				var1209.action_params = t.OpenChartsSortDetailAction_Params.decode(var1221)
			else
				local _ = nil
				local var1223, var1224 = protoModule.readVarInt(p60, var1210)
				var1210 = var1224 + var1223
			end
		elseif var1211 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1225, var1226 = protoModule.readFixed32(p60, var1210)
			local _ = var1225
			var1210 = var1226
		elseif var1211 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1227, var1228 = protoModule.readFixed64(p60, var1210)
			local _ = var1227
			var1210 = var1228
		else
			error("Unsupported wire type: " .. var2111)
		end
	end
	return var1209
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
	local var1229 = t_60.new()
	
	if self.action_type ~= nil then
		var1229.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1229.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1229.action_params = t.OpenChartsSortDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1229.action_params = t.OpenChartsSortDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var1229
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
	local var1229 = 0
	
	if self.sort_id ~= nil then
		local var1230 = self.sort_id:encode()
		local var1231, var1232 = protoModule.writeTag(buff, var1229, 1, protoModule.wireTypes.lengthDelimited)
		var1231, var2135 = protoModule.writeBuffer(var1231, var1232, var1230, buffer.len(var1230))
		buff = var1231
		var1229 = var1232
	end
	if self.secondary_sort_id ~= nil then
		local var1233 = self.secondary_sort_id:encode()
		local var1234, var1235 = protoModule.writeTag(buff, var1229, 2, protoModule.wireTypes.lengthDelimited)
		var1234, var2138 = protoModule.writeBuffer(var1234, var1235, var1233, buffer.len(var1233))
		buff = var1234
		var1229 = var1235
	end
	local buff_1 = buffer.create(var1229)
	buffer.copy(buff_1, 0, buff, 0, var1229)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref), propTypesModule (ref)
	local var1229 = t_61.new()
	local var1230 = 0
	while var1230 < buffer.len(p61) do
		local _ = nil
		local var1231 = nil
		local var1232, var1233, var1234 = protoModule.readTag(p61, var1230)
		local var1235 = var1232
		var1231 = var1233
		var1230 = var1234
		
		if var1231 == protoModule.wireTypes.varint then
			local _ = nil
			local var1236, var1237 = protoModule.readVarInt(p61, var1230)
			local _ = var1236
			var1230 = var1237
			continue
		end
		if var1231 == protoModule.wireTypes.lengthDelimited then
			if var1235 == 1 then
				local _ = nil
				local var1238, var1239 = protoModule.readBuffer(p61, var1230)
				var1230 = var1239
				var1229.sort_id = propTypesModule.StringProp.decode(var1238)
			elseif var1235 == 2 then
				local _ = nil
				local var1240, var1241 = protoModule.readBuffer(p61, var1230)
				var1230 = var1241
				var1229.secondary_sort_id = propTypesModule.Int32Prop.decode(var1240)
			else
				local _ = nil
				local var1242, var1243 = protoModule.readVarInt(p61, var1230)
				var1230 = var1243 + var1242
			end
		elseif var1231 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1244, var1245 = protoModule.readFixed32(p61, var1230)
			local _ = var1244
			var1230 = var1245
		elseif var1231 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1246, var1247 = protoModule.readFixed64(p61, var1230)
			local _ = var1246
			var1230 = var1247
		else
			error("Unsupported wire type: " .. var2142)
		end
	end
	return var1229
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
	local var1248 = t_61.new()
	
	if self.sort_id ~= nil then
		var1248.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var1248.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	if self.secondary_sort_id ~= nil then
		var1248.secondary_sort_id = propTypesModule.Int32Prop.jsonDecode(self.secondary_sort_id)
	end
	if self.secondarySortId ~= nil then
		var1248.secondary_sort_id = propTypesModule.Int32Prop.jsonDecode(self.secondarySortId)
	end
	return var1248
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
	local var1248 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1249, var1250 = protoModule.writeTag(buff, var1248, 1, protoModule.wireTypes.varint)
		var1249, var2164 = protoModule.writeVarInt(var1249, var1250, t.ActionType.toNumber(self.action_type))
		buff = var1249
		var1248 = var1250
	end
	if self.action_params ~= nil then
		local var1251 = self.action_params:encode()
		local var1252, var1253 = protoModule.writeTag(buff, var1248, 2, protoModule.wireTypes.lengthDelimited)
		var1252, var2167 = protoModule.writeBuffer(var1252, var1253, var1251, buffer.len(var1251))
		buff = var1252
		var1248 = var1253
	end
	local buff_1 = buffer.create(var1248)
	buffer.copy(buff_1, 0, buff, 0, var1248)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref), t (ref)
	local var1248 = t_62.new()
	local var1249 = 0
	while var1249 < buffer.len(p62) do
		local _ = nil
		local var1250 = nil
		local var1251, var1252, var1253 = protoModule.readTag(p62, var1249)
		local var1254 = var1251
		var1250 = var1252
		var1249 = var1253
		
		if var1250 == protoModule.wireTypes.varint then
			if var1254 == 1 then
				local _ = nil
				local var1255, var1256 = protoModule.readVarIntI32(p62, var1249)
				local var1257 = var1255
				var1249 = var1256
				var1248.action_type = t.ActionType.fromNumber(var1257) or var1257
			else
				local _ = nil
				local var1258, var1259 = protoModule.readVarInt(p62, var1249)
				local _ = var1258
				var1249 = var1259
			end
		end
		if var1250 == protoModule.wireTypes.lengthDelimited then
			if var1254 == 2 then
				local _ = nil
				local var1260, var1261 = protoModule.readBuffer(p62, var1249)
				var1249 = var1261
				var1248.action_params = t.OpenSongDetailAction_Params.decode(var1260)
			else
				local _ = nil
				local var1262, var1263 = protoModule.readVarInt(p62, var1249)
				var1249 = var1263 + var1262
			end
		elseif var1250 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1264, var1265 = protoModule.readFixed32(p62, var1249)
			local _ = var1264
			var1249 = var1265
		elseif var1250 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1266, var1267 = protoModule.readFixed64(p62, var1249)
			local _ = var1266
			var1249 = var1267
		else
			error("Unsupported wire type: " .. var2171)
		end
	end
	return var1248
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
	local var1268 = t_62.new()
	
	if self.action_type ~= nil then
		var1268.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1268.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1268.action_params = t.OpenSongDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1268.action_params = t.OpenSongDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var1268
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
	local var1268 = 0
	
	if self.song_id ~= nil then
		local var1269 = self.song_id:encode()
		local var1270, var1271 = protoModule.writeTag(buff, var1268, 1, protoModule.wireTypes.lengthDelimited)
		var1270, var2195 = protoModule.writeBuffer(var1270, var1271, var1269, buffer.len(var1269))
		buff = var1270
		var1268 = var1271
	end
	local buff_1 = buffer.create(var1268)
	buffer.copy(buff_1, 0, buff, 0, var1268)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref), propTypesModule (ref)
	local var1268 = t_63.new()
	local var1269 = 0
	while var1269 < buffer.len(p63) do
		local _ = nil
		local var1270 = nil
		local var1271, var1272, var1273 = protoModule.readTag(p63, var1269)
		local var1274 = var1271
		var1270 = var1272
		var1269 = var1273
		
		if var1270 == protoModule.wireTypes.varint then
			local _ = nil
			local var1275, var1276 = protoModule.readVarInt(p63, var1269)
			local _ = var1275
			var1269 = var1276
			continue
		end
		if var1270 == protoModule.wireTypes.lengthDelimited then
			if var1274 == 1 then
				local _ = nil
				local var1277, var1278 = protoModule.readBuffer(p63, var1269)
				var1269 = var1278
				var1268.song_id = propTypesModule.StringProp.decode(var1277)
			else
				local _ = nil
				local var1279, var1280 = protoModule.readVarInt(p63, var1269)
				var1269 = var1280 + var1279
			end
		elseif var1270 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1281, var1282 = protoModule.readFixed32(p63, var1269)
			local _ = var1281
			var1269 = var1282
		elseif var1270 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1283, var1284 = protoModule.readFixed64(p63, var1269)
			local _ = var1283
			var1269 = var1284
		else
			error("Unsupported wire type: " .. var2199)
		end
	end
	return var1268
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
	local var1285 = t_63.new()
	
	if self.song_id ~= nil then
		var1285.song_id = propTypesModule.StringProp.jsonDecode(self.song_id)
	end
	if self.songId ~= nil then
		var1285.song_id = propTypesModule.StringProp.jsonDecode(self.songId)
	end
	return var1285
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
	local var1285 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1286, var1287 = protoModule.writeTag(buff, var1285, 1, protoModule.wireTypes.varint)
		var1286, var2219 = protoModule.writeVarInt(var1286, var1287, t.ActionType.toNumber(self.action_type))
		buff = var1286
		var1285 = var1287
	end
	if self.action_params ~= nil then
		local var1288 = self.action_params:encode()
		local var1289, var1290 = protoModule.writeTag(buff, var1285, 2, protoModule.wireTypes.lengthDelimited)
		var1289, var2222 = protoModule.writeBuffer(var1289, var1290, var1288, buffer.len(var1288))
		buff = var1289
		var1285 = var1290
	end
	local buff_1 = buffer.create(var1285)
	buffer.copy(buff_1, 0, buff, 0, var1285)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var1285 = t_64.new()
	local var1286 = 0
	while var1286 < buffer.len(p64) do
		local _ = nil
		local var1287 = nil
		local var1288, var1289, var1290 = protoModule.readTag(p64, var1286)
		local var1291 = var1288
		var1287 = var1289
		var1286 = var1290
		
		if var1287 == protoModule.wireTypes.varint then
			if var1291 == 1 then
				local _ = nil
				local var1292, var1293 = protoModule.readVarIntI32(p64, var1286)
				local var1294 = var1292
				var1286 = var1293
				var1285.action_type = t.ActionType.fromNumber(var1294) or var1294
			else
				local _ = nil
				local var1295, var1296 = protoModule.readVarInt(p64, var1286)
				local _ = var1295
				var1286 = var1296
			end
		end
		if var1287 == protoModule.wireTypes.lengthDelimited then
			if var1291 == 2 then
				local _ = nil
				local var1297, var1298 = protoModule.readBuffer(p64, var1286)
				var1286 = var1298
				var1285.action_params = t.OpenMarketplaceCatalogFilters_Params.decode(var1297)
			else
				local _ = nil
				local var1299, var1300 = protoModule.readVarInt(p64, var1286)
				var1286 = var1300 + var1299
			end
		elseif var1287 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1301, var1302 = protoModule.readFixed32(p64, var1286)
			local _ = var1301
			var1286 = var1302
		elseif var1287 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1303, var1304 = protoModule.readFixed64(p64, var1286)
			local _ = var1303
			var1286 = var1304
		else
			error("Unsupported wire type: " .. var2226)
		end
	end
	return var1285
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
	local var1305 = t_64.new()
	
	if self.action_type ~= nil then
		var1305.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1305.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1305.action_params = t.OpenMarketplaceCatalogFilters_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1305.action_params = t.OpenMarketplaceCatalogFilters_Params.jsonDecode(self.actionParams)
	end
	return var1305
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
	local var1305 = t_65.new()
	local var1306 = 0
	while var1306 < buffer.len(p65) do
		local var1307 = nil
		local _ = nil
		local var1308, var1309, var1310 = protoModule.readTag(p65, var1306)
		var1307 = var1308
		local var1311 = var1309
		var1306 = var1310
		
		if var1311 == protoModule.wireTypes.varint then
			local _ = nil
			local var1312, var1313 = protoModule.readVarInt(p65, var1306)
			local _ = var1312
			var1306 = var1313
		elseif var1311 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1314, var1315 = protoModule.readVarInt(p65, var1306)
			var1306 = var1315 + var1314
		elseif var1311 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1316, var1317 = protoModule.readFixed32(p65, var1306)
			local _ = var1316
			var1306 = var1317
		elseif var1311 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1318, var1319 = protoModule.readFixed64(p65, var1306)
			local _ = var1318
			var1306 = var1319
		else
			error("Unsupported wire type: " .. var2253)
		end
	end
	return var1305
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
	local var1320 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1321, var1322 = protoModule.writeTag(buff, var1320, 1, protoModule.wireTypes.varint)
		var1321, var2265 = protoModule.writeVarInt(var1321, var1322, t.ActionType.toNumber(self.action_type))
		buff = var1321
		var1320 = var1322
	end
	if self.action_params ~= nil then
		local var1323 = self.action_params:encode()
		local var1324, var1325 = protoModule.writeTag(buff, var1320, 2, protoModule.wireTypes.lengthDelimited)
		var1324, var2268 = protoModule.writeBuffer(var1324, var1325, var1323, buffer.len(var1323))
		buff = var1324
		var1320 = var1325
	end
	local buff_1 = buffer.create(var1320)
	buffer.copy(buff_1, 0, buff, 0, var1320)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var1320 = t_66.new()
	local var1321 = 0
	while var1321 < buffer.len(p66) do
		local _ = nil
		local var1322 = nil
		local var1323, var1324, var1325 = protoModule.readTag(p66, var1321)
		local var1326 = var1323
		var1322 = var1324
		var1321 = var1325
		
		if var1322 == protoModule.wireTypes.varint then
			if var1326 == 1 then
				local _ = nil
				local var1327, var1328 = protoModule.readVarIntI32(p66, var1321)
				local var1329 = var1327
				var1321 = var1328
				var1320.action_type = t.ActionType.fromNumber(var1329) or var1329
			else
				local _ = nil
				local var1330, var1331 = protoModule.readVarInt(p66, var1321)
				local _ = var1330
				var1321 = var1331
			end
		end
		if var1322 == protoModule.wireTypes.lengthDelimited then
			if var1326 == 2 then
				local _ = nil
				local var1332, var1333 = protoModule.readBuffer(p66, var1321)
				var1321 = var1333
				var1320.action_params = t.RefreshFromApiAction_Params.decode(var1332)
			else
				local _ = nil
				local var1334, var1335 = protoModule.readVarInt(p66, var1321)
				var1321 = var1335 + var1334
			end
		elseif var1322 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1336, var1337 = protoModule.readFixed32(p66, var1321)
			local _ = var1336
			var1321 = var1337
		elseif var1322 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1338, var1339 = protoModule.readFixed64(p66, var1321)
			local _ = var1338
			var1321 = var1339
		else
			error("Unsupported wire type: " .. var2272)
		end
	end
	return var1320
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
	local var1340 = t_66.new()
	
	if self.action_type ~= nil then
		var1340.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1340.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1340.action_params = t.RefreshFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1340.action_params = t.RefreshFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var1340
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
	local var1340 = 0
	
	if self.surface_key ~= nil then
		local var1341 = self.surface_key:encode()
		local var1342, var1343 = protoModule.writeTag(buff, var1340, 1, protoModule.wireTypes.lengthDelimited)
		var1342, var2296 = protoModule.writeBuffer(var1342, var1343, var1341, buffer.len(var1341))
		buff = var1342
		var1340 = var1343
	end
	if self.config_key ~= nil then
		local var1344 = self.config_key:encode()
		local var1345, var1346 = protoModule.writeTag(buff, var1340, 2, protoModule.wireTypes.lengthDelimited)
		var1345, var2299 = protoModule.writeBuffer(var1345, var1346, var1344, buffer.len(var1344))
		buff = var1345
		var1340 = var1346
	end
	local buff_1 = buffer.create(var1340)
	buffer.copy(buff_1, 0, buff, 0, var1340)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref), propTypesModule (ref)
	local var1340 = t_67.new()
	local var1341 = 0
	while var1341 < buffer.len(p67) do
		local _ = nil
		local var1342 = nil
		local var1343, var1344, var1345 = protoModule.readTag(p67, var1341)
		local var1346 = var1343
		var1342 = var1344
		var1341 = var1345
		
		if var1342 == protoModule.wireTypes.varint then
			local _ = nil
			local var1347, var1348 = protoModule.readVarInt(p67, var1341)
			local _ = var1347
			var1341 = var1348
			continue
		end
		if var1342 == protoModule.wireTypes.lengthDelimited then
			if var1346 == 1 then
				local _ = nil
				local var1349, var1350 = protoModule.readBuffer(p67, var1341)
				var1341 = var1350
				var1340.surface_key = propTypesModule.StringProp.decode(var1349)
			elseif var1346 == 2 then
				local _ = nil
				local var1351, var1352 = protoModule.readBuffer(p67, var1341)
				var1341 = var1352
				var1340.config_key = propTypesModule.StringProp.decode(var1351)
			else
				local _ = nil
				local var1353, var1354 = protoModule.readVarInt(p67, var1341)
				var1341 = var1354 + var1353
			end
		elseif var1342 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1355, var1356 = protoModule.readFixed32(p67, var1341)
			local _ = var1355
			var1341 = var1356
		elseif var1342 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1357, var1358 = protoModule.readFixed64(p67, var1341)
			local _ = var1357
			var1341 = var1358
		else
			error("Unsupported wire type: " .. var2303)
		end
	end
	return var1340
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
	local var1359 = t_67.new()
	
	if self.surface_key ~= nil then
		var1359.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var1359.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.config_key ~= nil then
		var1359.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1359.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	return var1359
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
	local var1359 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1360, var1361 = protoModule.writeTag(buff, var1359, 1, protoModule.wireTypes.varint)
		var1360, var2325 = protoModule.writeVarInt(var1360, var1361, t.ActionType.toNumber(self.action_type))
		buff = var1360
		var1359 = var1361
	end
	if self.action_params ~= nil then
		local var1362 = self.action_params:encode()
		local var1363, var1364 = protoModule.writeTag(buff, var1359, 2, protoModule.wireTypes.lengthDelimited)
		var1363, var2328 = protoModule.writeBuffer(var1363, var1364, var1362, buffer.len(var1362))
		buff = var1363
		var1359 = var1364
	end
	local buff_1 = buffer.create(var1359)
	buffer.copy(buff_1, 0, buff, 0, var1359)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref), t (ref)
	local var1359 = t_68.new()
	local var1360 = 0
	while var1360 < buffer.len(p68) do
		local _ = nil
		local var1361 = nil
		local var1362, var1363, var1364 = protoModule.readTag(p68, var1360)
		local var1365 = var1362
		var1361 = var1363
		var1360 = var1364
		
		if var1361 == protoModule.wireTypes.varint then
			if var1365 == 1 then
				local _ = nil
				local var1366, var1367 = protoModule.readVarIntI32(p68, var1360)
				local var1368 = var1366
				var1360 = var1367
				var1359.action_type = t.ActionType.fromNumber(var1368) or var1368
			else
				local _ = nil
				local var1369, var1370 = protoModule.readVarInt(p68, var1360)
				local _ = var1369
				var1360 = var1370
			end
		end
		if var1361 == protoModule.wireTypes.lengthDelimited then
			if var1365 == 2 then
				local _ = nil
				local var1371, var1372 = protoModule.readBuffer(p68, var1360)
				var1360 = var1372
				var1359.action_params = t.RefreshHomeAction_Params.decode(var1371)
			else
				local _ = nil
				local var1373, var1374 = protoModule.readVarInt(p68, var1360)
				var1360 = var1374 + var1373
			end
		elseif var1361 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1375, var1376 = protoModule.readFixed32(p68, var1360)
			local _ = var1375
			var1360 = var1376
		elseif var1361 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1377, var1378 = protoModule.readFixed64(p68, var1360)
			local _ = var1377
			var1360 = var1378
		else
			error("Unsupported wire type: " .. var2332)
		end
	end
	return var1359
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
	local var1379 = t_68.new()
	
	if self.action_type ~= nil then
		var1379.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1379.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1379.action_params = t.RefreshHomeAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1379.action_params = t.RefreshHomeAction_Params.jsonDecode(self.actionParams)
	end
	return var1379
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
	local var1379 = 0
	
	if self.request_intent ~= nil then
		local var1380 = self.request_intent:encode()
		local var1381, var1382 = protoModule.writeTag(buff, var1379, 1, protoModule.wireTypes.lengthDelimited)
		var1381, var2356 = protoModule.writeBuffer(var1381, var1382, var1380, buffer.len(var1380))
		buff = var1381
		var1379 = var1382
	end
	local buff_1 = buffer.create(var1379)
	buffer.copy(buff_1, 0, buff, 0, var1379)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref), propTypesModule (ref)
	local var1379 = t_69.new()
	local var1380 = 0
	while var1380 < buffer.len(p69) do
		local _ = nil
		local var1381 = nil
		local var1382, var1383, var1384 = protoModule.readTag(p69, var1380)
		local var1385 = var1382
		var1381 = var1383
		var1380 = var1384
		
		if var1381 == protoModule.wireTypes.varint then
			local _ = nil
			local var1386, var1387 = protoModule.readVarInt(p69, var1380)
			local _ = var1386
			var1380 = var1387
			continue
		end
		if var1381 == protoModule.wireTypes.lengthDelimited then
			if var1385 == 1 then
				local _ = nil
				local var1388, var1389 = protoModule.readBuffer(p69, var1380)
				var1380 = var1389
				var1379.request_intent = propTypesModule.StringProp.decode(var1388)
			else
				local _ = nil
				local var1390, var1391 = protoModule.readVarInt(p69, var1380)
				var1380 = var1391 + var1390
			end
		elseif var1381 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1392, var1393 = protoModule.readFixed32(p69, var1380)
			local _ = var1392
			var1380 = var1393
		elseif var1381 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1394, var1395 = protoModule.readFixed64(p69, var1380)
			local _ = var1394
			var1380 = var1395
		else
			error("Unsupported wire type: " .. var2360)
		end
	end
	return var1379
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
	local var1396 = t_69.new()
	
	if self.request_intent ~= nil then
		var1396.request_intent = propTypesModule.StringProp.jsonDecode(self.request_intent)
	end
	if self.requestIntent ~= nil then
		var1396.request_intent = propTypesModule.StringProp.jsonDecode(self.requestIntent)
	end
	return var1396
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
	local var1396 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1397, var1398 = protoModule.writeTag(buff, var1396, 1, protoModule.wireTypes.varint)
		var1397, var2380 = protoModule.writeVarInt(var1397, var1398, t.ActionType.toNumber(self.action_type))
		buff = var1397
		var1396 = var1398
	end
	if self.action_params ~= nil then
		local var1399 = self.action_params:encode()
		local var1400, var1401 = protoModule.writeTag(buff, var1396, 2, protoModule.wireTypes.lengthDelimited)
		var1400, var2383 = protoModule.writeBuffer(var1400, var1401, var1399, buffer.len(var1399))
		buff = var1400
		var1396 = var1401
	end
	local buff_1 = buffer.create(var1396)
	buffer.copy(buff_1, 0, buff, 0, var1396)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref), t (ref)
	local var1396 = t_70.new()
	local var1397 = 0
	while var1397 < buffer.len(p70) do
		local _ = nil
		local var1398 = nil
		local var1399, var1400, var1401 = protoModule.readTag(p70, var1397)
		local var1402 = var1399
		var1398 = var1400
		var1397 = var1401
		
		if var1398 == protoModule.wireTypes.varint then
			if var1402 == 1 then
				local _ = nil
				local var1403, var1404 = protoModule.readVarIntI32(p70, var1397)
				local var1405 = var1403
				var1397 = var1404
				var1396.action_type = t.ActionType.fromNumber(var1405) or var1405
			else
				local _ = nil
				local var1406, var1407 = protoModule.readVarInt(p70, var1397)
				local _ = var1406
				var1397 = var1407
			end
		end
		if var1398 == protoModule.wireTypes.lengthDelimited then
			if var1402 == 2 then
				local _ = nil
				local var1408, var1409 = protoModule.readBuffer(p70, var1397)
				var1397 = var1409
				var1396.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.decode(var1408)
			else
				local _ = nil
				local var1410, var1411 = protoModule.readVarInt(p70, var1397)
				var1397 = var1411 + var1410
			end
		elseif var1398 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1412, var1413 = protoModule.readFixed32(p70, var1397)
			local _ = var1412
			var1397 = var1413
		elseif var1398 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1414, var1415 = protoModule.readFixed64(p70, var1397)
			local _ = var1414
			var1397 = var1415
		else
			error("Unsupported wire type: " .. var2387)
		end
	end
	return var1396
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
	local var1416 = t_70.new()
	
	if self.action_type ~= nil then
		var1416.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1416.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1416.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1416.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.jsonDecode(self.actionParams)
	end
	return var1416
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
	local var1416 = 0
	
	if self.topic_id ~= nil then
		local var1417 = self.topic_id:encode()
		local var1418, var1419 = protoModule.writeTag(buff, var1416, 1, protoModule.wireTypes.lengthDelimited)
		var1418, var2411 = protoModule.writeBuffer(var1418, var1419, var1417, buffer.len(var1417))
		buff = var1418
		var1416 = var1419
	end
	if self.selected_option ~= nil then
		local var1420 = self.selected_option:encode()
		local var1421, var1422 = protoModule.writeTag(buff, var1416, 2, protoModule.wireTypes.lengthDelimited)
		var1421, var2414 = protoModule.writeBuffer(var1421, var1422, var1420, buffer.len(var1420))
		buff = var1421
		var1416 = var1422
	end
	if self.request_intent ~= nil then
		local var1423 = self.request_intent:encode()
		local var1424, var1425 = protoModule.writeTag(buff, var1416, 3, protoModule.wireTypes.lengthDelimited)
		var1424, var2417 = protoModule.writeBuffer(var1424, var1425, var1423, buffer.len(var1423))
		buff = var1424
		var1416 = var1425
	end
	if self.feed_item_key ~= nil then
		local var1426 = self.feed_item_key:encode()
		local var1427, var1428 = protoModule.writeTag(buff, var1416, 4, protoModule.wireTypes.lengthDelimited)
		var1427, var2420 = protoModule.writeBuffer(var1427, var1428, var1426, buffer.len(var1426))
		buff = var1427
		var1416 = var1428
	end
	local buff_1 = buffer.create(var1416)
	buffer.copy(buff_1, 0, buff, 0, var1416)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref), propTypesModule (ref)
	local var1416 = t_71.new()
	local var1417 = 0
	while var1417 < buffer.len(p71) do
		local _ = nil
		local var1418 = nil
		local var1419, var1420, var1421 = protoModule.readTag(p71, var1417)
		local var1422 = var1419
		var1418 = var1420
		var1417 = var1421
		
		if var1418 == protoModule.wireTypes.varint then
			local _ = nil
			local var1423, var1424 = protoModule.readVarInt(p71, var1417)
			local _ = var1423
			var1417 = var1424
			continue
		end
		if var1418 == protoModule.wireTypes.lengthDelimited then
			if var1422 == 1 then
				local _ = nil
				local var1425, var1426 = protoModule.readBuffer(p71, var1417)
				var1417 = var1426
				var1416.topic_id = propTypesModule.StringProp.decode(var1425)
			elseif var1422 == 2 then
				local _ = nil
				local var1427, var1428 = protoModule.readBuffer(p71, var1417)
				var1417 = var1428
				var1416.selected_option = propTypesModule.StringProp.decode(var1427)
			elseif var1422 == 3 then
				local _ = nil
				local var1429, var1430 = protoModule.readBuffer(p71, var1417)
				var1417 = var1430
				var1416.request_intent = propTypesModule.StringProp.decode(var1429)
			elseif var1422 == 4 then
				local _ = nil
				local var1431, var1432 = protoModule.readBuffer(p71, var1417)
				var1417 = var1432
				var1416.feed_item_key = propTypesModule.StringProp.decode(var1431)
			else
				local _ = nil
				local var1433, var1434 = protoModule.readVarInt(p71, var1417)
				var1417 = var1434 + var1433
			end
		elseif var1418 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1435, var1436 = protoModule.readFixed32(p71, var1417)
			local _ = var1435
			var1417 = var1436
		elseif var1418 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1437, var1438 = protoModule.readFixed64(p71, var1417)
			local _ = var1437
			var1417 = var1438
		else
			error("Unsupported wire type: " .. var2424)
		end
	end
	return var1416
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
	local var1439 = t_71.new()
	
	if self.topic_id ~= nil then
		var1439.topic_id = propTypesModule.StringProp.jsonDecode(self.topic_id)
	end
	if self.topicId ~= nil then
		var1439.topic_id = propTypesModule.StringProp.jsonDecode(self.topicId)
	end
	if self.selected_option ~= nil then
		var1439.selected_option = propTypesModule.StringProp.jsonDecode(self.selected_option)
	end
	if self.selectedOption ~= nil then
		var1439.selected_option = propTypesModule.StringProp.jsonDecode(self.selectedOption)
	end
	if self.request_intent ~= nil then
		var1439.request_intent = propTypesModule.StringProp.jsonDecode(self.request_intent)
	end
	if self.requestIntent ~= nil then
		var1439.request_intent = propTypesModule.StringProp.jsonDecode(self.requestIntent)
	end
	if self.feed_item_key ~= nil then
		var1439.feed_item_key = propTypesModule.StringProp.jsonDecode(self.feed_item_key)
	end
	if self.feedItemKey ~= nil then
		var1439.feed_item_key = propTypesModule.StringProp.jsonDecode(self.feedItemKey)
	end
	return var1439
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
	local var1439 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1440, var1441 = protoModule.writeTag(buff, var1439, 1, protoModule.wireTypes.varint)
		var1440, var2450 = protoModule.writeVarInt(var1440, var1441, t.ActionType.toNumber(self.action_type))
		buff = var1440
		var1439 = var1441
	end
	if self.action_params ~= nil then
		local var1442 = self.action_params:encode()
		local var1443, var1444 = protoModule.writeTag(buff, var1439, 2, protoModule.wireTypes.lengthDelimited)
		var1443, var2453 = protoModule.writeBuffer(var1443, var1444, var1442, buffer.len(var1442))
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
				var1439.action_params = t.RsvpToEventAction_Params.decode(var1451)
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
			error("Unsupported wire type: " .. var2457)
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
		var1459.action_params = t.RsvpToEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1459.action_params = t.RsvpToEventAction_Params.jsonDecode(self.actionParams)
	end
	return var1459
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
	local var1459 = 0
	
	if self.event_id ~= nil then
		local var1460 = self.event_id:encode()
		local var1461, var1462 = protoModule.writeTag(buff, var1459, 1, protoModule.wireTypes.lengthDelimited)
		var1461, var2481 = protoModule.writeBuffer(var1461, var1462, var1460, buffer.len(var1460))
		buff = var1461
		var1459 = var1462
	end
	if self.user_rsvp ~= nil then
		local var1463 = self.user_rsvp:encode()
		local var1464, var1465 = protoModule.writeTag(buff, var1459, 2, protoModule.wireTypes.lengthDelimited)
		var1464, var2484 = protoModule.writeBuffer(var1464, var1465, var1463, buffer.len(var1463))
		buff = var1464
		var1459 = var1465
	end
	if self.notifications_modal_identifier ~= nil then
		local var1466 = self.notifications_modal_identifier:encode()
		local var1467, var1468 = protoModule.writeTag(buff, var1459, 3, protoModule.wireTypes.lengthDelimited)
		var1467, var2487 = protoModule.writeBuffer(var1467, var1468, var1466, buffer.len(var1466))
		buff = var1467
		var1459 = var1468
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
			elseif var1465 == 2 then
				local _ = nil
				local var1470, var1471 = protoModule.readBuffer(p73, var1460)
				var1460 = var1471
				var1459.user_rsvp = propTypesModule.BoolProp.decode(var1470)
			elseif var1465 == 3 then
				local _ = nil
				local var1472, var1473 = protoModule.readBuffer(p73, var1460)
				var1460 = var1473
				var1459.notifications_modal_identifier = propTypesModule.StringProp.decode(var1472)
			else
				local _ = nil
				local var1474, var1475 = protoModule.readVarInt(p73, var1460)
				var1460 = var1475 + var1474
			end
		elseif var1461 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1476, var1477 = protoModule.readFixed32(p73, var1460)
			local _ = var1476
			var1460 = var1477
		elseif var1461 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1478, var1479 = protoModule.readFixed64(p73, var1460)
			local _ = var1478
			var1460 = var1479
		else
			error("Unsupported wire type: " .. var2491)
		end
	end
	return var1459
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
	local var1480 = t_73.new()
	
	if self.event_id ~= nil then
		var1480.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var1480.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	if self.user_rsvp ~= nil then
		var1480.user_rsvp = propTypesModule.BoolProp.jsonDecode(self.user_rsvp)
	end
	if self.userRsvp ~= nil then
		var1480.user_rsvp = propTypesModule.BoolProp.jsonDecode(self.userRsvp)
	end
	if self.notifications_modal_identifier ~= nil then
		var1480.notifications_modal_identifier = propTypesModule.StringProp.jsonDecode(self.notifications_modal_identifier)
	end
	if self.notificationsModalIdentifier ~= nil then
		var1480.notifications_modal_identifier = propTypesModule.StringProp.jsonDecode(self.notificationsModalIdentifier)
	end
	return var1480
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
	local var1480 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1481, var1482 = protoModule.writeTag(buff, var1480, 1, protoModule.wireTypes.varint)
		var1481, var2515 = protoModule.writeVarInt(var1481, var1482, t.ActionType.toNumber(self.action_type))
		buff = var1481
		var1480 = var1482
	end
	if self.action_params ~= nil then
		local var1483 = self.action_params:encode()
		local var1484, var1485 = protoModule.writeTag(buff, var1480, 2, protoModule.wireTypes.lengthDelimited)
		var1484, var2518 = protoModule.writeBuffer(var1484, var1485, var1483, buffer.len(var1483))
		buff = var1484
		var1480 = var1485
	end
	local buff_1 = buffer.create(var1480)
	buffer.copy(buff_1, 0, buff, 0, var1480)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var1480 = t_74.new()
	local var1481 = 0
	while var1481 < buffer.len(p74) do
		local _ = nil
		local var1482 = nil
		local var1483, var1484, var1485 = protoModule.readTag(p74, var1481)
		local var1486 = var1483
		var1482 = var1484
		var1481 = var1485
		
		if var1482 == protoModule.wireTypes.varint then
			if var1486 == 1 then
				local _ = nil
				local var1487, var1488 = protoModule.readVarIntI32(p74, var1481)
				local var1489 = var1487
				var1481 = var1488
				var1480.action_type = t.ActionType.fromNumber(var1489) or var1489
			else
				local _ = nil
				local var1490, var1491 = protoModule.readVarInt(p74, var1481)
				local _ = var1490
				var1481 = var1491
			end
		end
		if var1482 == protoModule.wireTypes.lengthDelimited then
			if var1486 == 2 then
				local _ = nil
				local var1492, var1493 = protoModule.readBuffer(p74, var1481)
				var1481 = var1493
				var1480.action_params = t.OpenEventDetailsAction_Params.decode(var1492)
			else
				local _ = nil
				local var1494, var1495 = protoModule.readVarInt(p74, var1481)
				var1481 = var1495 + var1494
			end
		elseif var1482 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1496, var1497 = protoModule.readFixed32(p74, var1481)
			local _ = var1496
			var1481 = var1497
		elseif var1482 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1498, var1499 = protoModule.readFixed64(p74, var1481)
			local _ = var1498
			var1481 = var1499
		else
			error("Unsupported wire type: " .. var2522)
		end
	end
	return var1480
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
	local var1500 = t_74.new()
	
	if self.action_type ~= nil then
		var1500.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1500.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1500.action_params = t.OpenEventDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1500.action_params = t.OpenEventDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return var1500
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
	local var1500 = 0
	
	if self.event_id ~= nil then
		local var1501 = self.event_id:encode()
		local var1502, var1503 = protoModule.writeTag(buff, var1500, 1, protoModule.wireTypes.lengthDelimited)
		var1502, var2546 = protoModule.writeBuffer(var1502, var1503, var1501, buffer.len(var1501))
		buff = var1502
		var1500 = var1503
	end
	local buff_1 = buffer.create(var1500)
	buffer.copy(buff_1, 0, buff, 0, var1500)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref), propTypesModule (ref)
	local var1500 = t_75.new()
	local var1501 = 0
	while var1501 < buffer.len(p75) do
		local _ = nil
		local var1502 = nil
		local var1503, var1504, var1505 = protoModule.readTag(p75, var1501)
		local var1506 = var1503
		var1502 = var1504
		var1501 = var1505
		
		if var1502 == protoModule.wireTypes.varint then
			local _ = nil
			local var1507, var1508 = protoModule.readVarInt(p75, var1501)
			local _ = var1507
			var1501 = var1508
			continue
		end
		if var1502 == protoModule.wireTypes.lengthDelimited then
			if var1506 == 1 then
				local _ = nil
				local var1509, var1510 = protoModule.readBuffer(p75, var1501)
				var1501 = var1510
				var1500.event_id = propTypesModule.StringProp.decode(var1509)
			else
				local _ = nil
				local var1511, var1512 = protoModule.readVarInt(p75, var1501)
				var1501 = var1512 + var1511
			end
		elseif var1502 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1513, var1514 = protoModule.readFixed32(p75, var1501)
			local _ = var1513
			var1501 = var1514
		elseif var1502 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1515, var1516 = protoModule.readFixed64(p75, var1501)
			local _ = var1515
			var1501 = var1516
		else
			error("Unsupported wire type: " .. var2550)
		end
	end
	return var1500
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
	local var1517 = t_75.new()
	
	if self.event_id ~= nil then
		var1517.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var1517.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var1517
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
	local var1517 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1518, var1519 = protoModule.writeTag(buff, var1517, 1, protoModule.wireTypes.varint)
		var1518, var2570 = protoModule.writeVarInt(var1518, var1519, t.ActionType.toNumber(self.action_type))
		buff = var1518
		var1517 = var1519
	end
	if self.action_params ~= nil then
		local var1520 = self.action_params:encode()
		local var1521, var1522 = protoModule.writeTag(buff, var1517, 2, protoModule.wireTypes.lengthDelimited)
		var1521, var2573 = protoModule.writeBuffer(var1521, var1522, var1520, buffer.len(var1520))
		buff = var1521
		var1517 = var1522
	end
	local buff_1 = buffer.create(var1517)
	buffer.copy(buff_1, 0, buff, 0, var1517)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var1517 = t_76.new()
	local var1518 = 0
	while var1518 < buffer.len(p76) do
		local _ = nil
		local var1519 = nil
		local var1520, var1521, var1522 = protoModule.readTag(p76, var1518)
		local var1523 = var1520
		var1519 = var1521
		var1518 = var1522
		
		if var1519 == protoModule.wireTypes.varint then
			if var1523 == 1 then
				local _ = nil
				local var1524, var1525 = protoModule.readVarIntI32(p76, var1518)
				local var1526 = var1524
				var1518 = var1525
				var1517.action_type = t.ActionType.fromNumber(var1526) or var1526
			else
				local _ = nil
				local var1527, var1528 = protoModule.readVarInt(p76, var1518)
				local _ = var1527
				var1518 = var1528
			end
		end
		if var1519 == protoModule.wireTypes.lengthDelimited then
			if var1523 == 2 then
				local _ = nil
				local var1529, var1530 = protoModule.readBuffer(p76, var1518)
				var1518 = var1530
				var1517.action_params = t.OpenBadgesSeeAllAction_Params.decode(var1529)
			else
				local _ = nil
				local var1531, var1532 = protoModule.readVarInt(p76, var1518)
				var1518 = var1532 + var1531
			end
		elseif var1519 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1533, var1534 = protoModule.readFixed32(p76, var1518)
			local _ = var1533
			var1518 = var1534
		elseif var1519 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1535, var1536 = protoModule.readFixed64(p76, var1518)
			local _ = var1535
			var1518 = var1536
		else
			error("Unsupported wire type: " .. var2577)
		end
	end
	return var1517
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
	local var1537 = t_76.new()
	
	if self.action_type ~= nil then
		var1537.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1537.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1537.action_params = t.OpenBadgesSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1537.action_params = t.OpenBadgesSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var1537
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
	local var1537 = 0
	
	if self.universe_id ~= nil then
		local var1538 = self.universe_id:encode()
		local var1539, var1540 = protoModule.writeTag(buff, var1537, 1, protoModule.wireTypes.lengthDelimited)
		var1539, var2601 = protoModule.writeBuffer(var1539, var1540, var1538, buffer.len(var1538))
		buff = var1539
		var1537 = var1540
	end
	local buff_1 = buffer.create(var1537)
	buffer.copy(buff_1, 0, buff, 0, var1537)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), propTypesModule (ref)
	local var1537 = t_77.new()
	local var1538 = 0
	while var1538 < buffer.len(p77) do
		local _ = nil
		local var1539 = nil
		local var1540, var1541, var1542 = protoModule.readTag(p77, var1538)
		local var1543 = var1540
		var1539 = var1541
		var1538 = var1542
		
		if var1539 == protoModule.wireTypes.varint then
			local _ = nil
			local var1544, var1545 = protoModule.readVarInt(p77, var1538)
			local _ = var1544
			var1538 = var1545
			continue
		end
		if var1539 == protoModule.wireTypes.lengthDelimited then
			if var1543 == 1 then
				local _ = nil
				local var1546, var1547 = protoModule.readBuffer(p77, var1538)
				var1538 = var1547
				var1537.universe_id = propTypesModule.StringProp.decode(var1546)
			else
				local _ = nil
				local var1548, var1549 = protoModule.readVarInt(p77, var1538)
				var1538 = var1549 + var1548
			end
		elseif var1539 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1550, var1551 = protoModule.readFixed32(p77, var1538)
			local _ = var1550
			var1538 = var1551
		elseif var1539 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1552, var1553 = protoModule.readFixed64(p77, var1538)
			local _ = var1552
			var1538 = var1553
		else
			error("Unsupported wire type: " .. var2605)
		end
	end
	return var1537
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
	local var1554 = t_77.new()
	
	if self.universe_id ~= nil then
		var1554.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1554.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1554
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
	local var1554 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1555, var1556 = protoModule.writeTag(buff, var1554, 1, protoModule.wireTypes.varint)
		var1555, var2625 = protoModule.writeVarInt(var1555, var1556, t.ActionType.toNumber(self.action_type))
		buff = var1555
		var1554 = var1556
	end
	if self.action_params ~= nil then
		local var1557 = self.action_params:encode()
		local var1558, var1559 = protoModule.writeTag(buff, var1554, 2, protoModule.wireTypes.lengthDelimited)
		var1558, var2628 = protoModule.writeBuffer(var1558, var1559, var1557, buffer.len(var1557))
		buff = var1558
		var1554 = var1559
	end
	local buff_1 = buffer.create(var1554)
	buffer.copy(buff_1, 0, buff, 0, var1554)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref), t (ref)
	local var1554 = t_78.new()
	local var1555 = 0
	while var1555 < buffer.len(p78) do
		local _ = nil
		local var1556 = nil
		local var1557, var1558, var1559 = protoModule.readTag(p78, var1555)
		local var1560 = var1557
		var1556 = var1558
		var1555 = var1559
		
		if var1556 == protoModule.wireTypes.varint then
			if var1560 == 1 then
				local _ = nil
				local var1561, var1562 = protoModule.readVarIntI32(p78, var1555)
				local var1563 = var1561
				var1555 = var1562
				var1554.action_type = t.ActionType.fromNumber(var1563) or var1563
			else
				local _ = nil
				local var1564, var1565 = protoModule.readVarInt(p78, var1555)
				local _ = var1564
				var1555 = var1565
			end
		end
		if var1556 == protoModule.wireTypes.lengthDelimited then
			if var1560 == 2 then
				local _ = nil
				local var1566, var1567 = protoModule.readBuffer(p78, var1555)
				var1555 = var1567
				var1554.action_params = t.OpenExperienceStoreSeeAllAction_Params.decode(var1566)
			else
				local _ = nil
				local var1568, var1569 = protoModule.readVarInt(p78, var1555)
				var1555 = var1569 + var1568
			end
		elseif var1556 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1570, var1571 = protoModule.readFixed32(p78, var1555)
			local _ = var1570
			var1555 = var1571
		elseif var1556 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1572, var1573 = protoModule.readFixed64(p78, var1555)
			local _ = var1572
			var1555 = var1573
		else
			error("Unsupported wire type: " .. var2632)
		end
	end
	return var1554
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
	local var1574 = t_78.new()
	
	if self.action_type ~= nil then
		var1574.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1574.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1574.action_params = t.OpenExperienceStoreSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1574.action_params = t.OpenExperienceStoreSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return var1574
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
	local var1574 = 0
	
	if self.universe_id ~= nil then
		local var1575 = self.universe_id:encode()
		local var1576, var1577 = protoModule.writeTag(buff, var1574, 1, protoModule.wireTypes.lengthDelimited)
		var1576, var2656 = protoModule.writeBuffer(var1576, var1577, var1575, buffer.len(var1575))
		buff = var1576
		var1574 = var1577
	end
	local buff_1 = buffer.create(var1574)
	buffer.copy(buff_1, 0, buff, 0, var1574)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref), propTypesModule (ref)
	local var1574 = t_79.new()
	local var1575 = 0
	while var1575 < buffer.len(p79) do
		local _ = nil
		local var1576 = nil
		local var1577, var1578, var1579 = protoModule.readTag(p79, var1575)
		local var1580 = var1577
		var1576 = var1578
		var1575 = var1579
		
		if var1576 == protoModule.wireTypes.varint then
			local _ = nil
			local var1581, var1582 = protoModule.readVarInt(p79, var1575)
			local _ = var1581
			var1575 = var1582
			continue
		end
		if var1576 == protoModule.wireTypes.lengthDelimited then
			if var1580 == 1 then
				local _ = nil
				local var1583, var1584 = protoModule.readBuffer(p79, var1575)
				var1575 = var1584
				var1574.universe_id = propTypesModule.StringProp.decode(var1583)
			else
				local _ = nil
				local var1585, var1586 = protoModule.readVarInt(p79, var1575)
				var1575 = var1586 + var1585
			end
		elseif var1576 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1587, var1588 = protoModule.readFixed32(p79, var1575)
			local _ = var1587
			var1575 = var1588
		elseif var1576 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1589, var1590 = protoModule.readFixed64(p79, var1575)
			local _ = var1589
			var1575 = var1590
		else
			error("Unsupported wire type: " .. var2660)
		end
	end
	return var1574
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
	local var1591 = t_79.new()
	
	if self.universe_id ~= nil then
		var1591.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1591.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1591
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
	local var1591 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1592, var1593 = protoModule.writeTag(buff, var1591, 1, protoModule.wireTypes.varint)
		var1592, var2680 = protoModule.writeVarInt(var1592, var1593, t.ActionType.toNumber(self.action_type))
		buff = var1592
		var1591 = var1593
	end
	if self.action_params ~= nil then
		local var1594 = self.action_params:encode()
		local var1595, var1596 = protoModule.writeTag(buff, var1591, 2, protoModule.wireTypes.lengthDelimited)
		var1595, var2683 = protoModule.writeBuffer(var1595, var1596, var1594, buffer.len(var1594))
		buff = var1595
		var1591 = var1596
	end
	local buff_1 = buffer.create(var1591)
	buffer.copy(buff_1, 0, buff, 0, var1591)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var1591 = t_80.new()
	local var1592 = 0
	while var1592 < buffer.len(p80) do
		local _ = nil
		local var1593 = nil
		local var1594, var1595, var1596 = protoModule.readTag(p80, var1592)
		local var1597 = var1594
		var1593 = var1595
		var1592 = var1596
		
		if var1593 == protoModule.wireTypes.varint then
			if var1597 == 1 then
				local _ = nil
				local var1598, var1599 = protoModule.readVarIntI32(p80, var1592)
				local var1600 = var1598
				var1592 = var1599
				var1591.action_type = t.ActionType.fromNumber(var1600) or var1600
			else
				local _ = nil
				local var1601, var1602 = protoModule.readVarInt(p80, var1592)
				local _ = var1601
				var1592 = var1602
			end
		end
		if var1593 == protoModule.wireTypes.lengthDelimited then
			if var1597 == 2 then
				local _ = nil
				local var1603, var1604 = protoModule.readBuffer(p80, var1592)
				var1592 = var1604
				var1591.action_params = t.OpenSubscriptionPurchasePageAction_Params.decode(var1603)
			else
				local _ = nil
				local var1605, var1606 = protoModule.readVarInt(p80, var1592)
				var1592 = var1606 + var1605
			end
		elseif var1593 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1607, var1608 = protoModule.readFixed32(p80, var1592)
			local _ = var1607
			var1592 = var1608
		elseif var1593 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1609, var1610 = protoModule.readFixed64(p80, var1592)
			local _ = var1609
			var1592 = var1610
		else
			error("Unsupported wire type: " .. var2687)
		end
	end
	return var1591
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
	local var1611 = t_80.new()
	
	if self.action_type ~= nil then
		var1611.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1611.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1611.action_params = t.OpenSubscriptionPurchasePageAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1611.action_params = t.OpenSubscriptionPurchasePageAction_Params.jsonDecode(self.actionParams)
	end
	return var1611
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
	local var1611 = 0
	
	if self.subscription_id ~= nil then
		local var1612 = self.subscription_id:encode()
		local var1613, var1614 = protoModule.writeTag(buff, var1611, 1, protoModule.wireTypes.lengthDelimited)
		var1613, var2711 = protoModule.writeBuffer(var1613, var1614, var1612, buffer.len(var1612))
		buff = var1613
		var1611 = var1614
	end
	if self.universe_id ~= nil then
		local var1615 = self.universe_id:encode()
		local var1616, var1617 = protoModule.writeTag(buff, var1611, 2, protoModule.wireTypes.lengthDelimited)
		var1616, var2714 = protoModule.writeBuffer(var1616, var1617, var1615, buffer.len(var1615))
		buff = var1616
		var1611 = var1617
	end
	if self.creator_name ~= nil then
		local var1618 = self.creator_name:encode()
		local var1619, var1620 = protoModule.writeTag(buff, var1611, 3, protoModule.wireTypes.lengthDelimited)
		var1619, var2717 = protoModule.writeBuffer(var1619, var1620, var1618, buffer.len(var1618))
		buff = var1619
		var1611 = var1620
	end
	if self.creator_verified ~= nil then
		local var1621 = self.creator_verified:encode()
		local var1622, var1623 = protoModule.writeTag(buff, var1611, 4, protoModule.wireTypes.lengthDelimited)
		var1622, var2720 = protoModule.writeBuffer(var1622, var1623, var1621, buffer.len(var1621))
		buff = var1622
		var1611 = var1623
	end
	if self.name ~= nil then
		local var1624 = self.name:encode()
		local var1625, var1626 = protoModule.writeTag(buff, var1611, 5, protoModule.wireTypes.lengthDelimited)
		var1625, var2723 = protoModule.writeBuffer(var1625, var1626, var1624, buffer.len(var1624))
		buff = var1625
		var1611 = var1626
	end
	if self.description ~= nil then
		local var1627 = self.description:encode()
		local var1628, var1629 = protoModule.writeTag(buff, var1611, 6, protoModule.wireTypes.lengthDelimited)
		var1628, var2726 = protoModule.writeBuffer(var1628, var1629, var1627, buffer.len(var1627))
		buff = var1628
		var1611 = var1629
	end
	if self.image_asset_id ~= nil then
		local var1630 = self.image_asset_id:encode()
		local var1631, var1632 = protoModule.writeTag(buff, var1611, 7, protoModule.wireTypes.lengthDelimited)
		var1631, var2729 = protoModule.writeBuffer(var1631, var1632, var1630, buffer.len(var1630))
		buff = var1631
		var1611 = var1632
	end
	if self.period_type ~= nil then
		local var1633 = self.period_type:encode()
		local var1634, var1635 = protoModule.writeTag(buff, var1611, 8, protoModule.wireTypes.lengthDelimited)
		var1634, var2732 = protoModule.writeBuffer(var1634, var1635, var1633, buffer.len(var1633))
		buff = var1634
		var1611 = var1635
	end
	if self.is_subscribed ~= nil then
		local var1636 = self.is_subscribed:encode()
		local var1637, var1638 = protoModule.writeTag(buff, var1611, 9, protoModule.wireTypes.lengthDelimited)
		var1637, var2735 = protoModule.writeBuffer(var1637, var1638, var1636, buffer.len(var1636))
		buff = var1637
		var1611 = var1638
	end
	if self.price_display ~= nil then
		local var1639 = self.price_display:encode()
		local var1640, var1641 = protoModule.writeTag(buff, var1611, 10, protoModule.wireTypes.lengthDelimited)
		var1640, var2738 = protoModule.writeBuffer(var1640, var1641, var1639, buffer.len(var1639))
		buff = var1640
		var1611 = var1641
	end
	if self.price_in_robux ~= nil then
		local var1642 = self.price_in_robux:encode()
		local var1643, var1644 = protoModule.writeTag(buff, var1611, 11, protoModule.wireTypes.lengthDelimited)
		var1643, var2741 = protoModule.writeBuffer(var1643, var1644, var1642, buffer.len(var1642))
		buff = var1643
		var1611 = var1644
	end
	if self.price_tier ~= nil then
		local var1645 = self.price_tier:encode()
		local var1646, var1647 = protoModule.writeTag(buff, var1611, 12, protoModule.wireTypes.lengthDelimited)
		var1646, var2744 = protoModule.writeBuffer(var1646, var1647, var1645, buffer.len(var1645))
		buff = var1646
		var1611 = var1647
	end
	if self.thumbnail_string ~= nil then
		local var1648 = self.thumbnail_string:encode()
		local var1649, var1650 = protoModule.writeTag(buff, var1611, 13, protoModule.wireTypes.lengthDelimited)
		var1649, var2747 = protoModule.writeBuffer(var1649, var1650, var1648, buffer.len(var1648))
		buff = var1649
		var1611 = var1650
	end
	local buff_1 = buffer.create(var1611)
	buffer.copy(buff_1, 0, buff, 0, var1611)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref), propTypesModule (ref)
	local var1611 = t_81.new()
	local var1612 = 0
	while var1612 < buffer.len(p81) do
		local _ = nil
		local var1613 = nil
		local var1614, var1615, var1616 = protoModule.readTag(p81, var1612)
		local var1617 = var1614
		var1613 = var1615
		var1612 = var1616
		
		if var1613 == protoModule.wireTypes.varint then
			local _ = nil
			local var1618, var1619 = protoModule.readVarInt(p81, var1612)
			local _ = var1618
			var1612 = var1619
			continue
		end
		if var1613 == protoModule.wireTypes.lengthDelimited then
			if var1617 == 1 then
				local _ = nil
				local var1620, var1621 = protoModule.readBuffer(p81, var1612)
				var1612 = var1621
				var1611.subscription_id = propTypesModule.StringProp.decode(var1620)
			elseif var1617 == 2 then
				local _ = nil
				local var1622, var1623 = protoModule.readBuffer(p81, var1612)
				var1612 = var1623
				var1611.universe_id = propTypesModule.StringProp.decode(var1622)
			elseif var1617 == 3 then
				local _ = nil
				local var1624, var1625 = protoModule.readBuffer(p81, var1612)
				var1612 = var1625
				var1611.creator_name = propTypesModule.StringProp.decode(var1624)
			elseif var1617 == 4 then
				local _ = nil
				local var1626, var1627 = protoModule.readBuffer(p81, var1612)
				var1612 = var1627
				var1611.creator_verified = propTypesModule.BoolProp.decode(var1626)
			elseif var1617 == 5 then
				local _ = nil
				local var1628, var1629 = protoModule.readBuffer(p81, var1612)
				var1612 = var1629
				var1611.name = propTypesModule.StringProp.decode(var1628)
			elseif var1617 == 6 then
				local _ = nil
				local var1630, var1631 = protoModule.readBuffer(p81, var1612)
				var1612 = var1631
				var1611.description = propTypesModule.StringProp.decode(var1630)
			elseif var1617 == 7 then
				local _ = nil
				local var1632, var1633 = protoModule.readBuffer(p81, var1612)
				var1612 = var1633
				var1611.image_asset_id = propTypesModule.Int64Prop.decode(var1632)
			elseif var1617 == 8 then
				local _ = nil
				local var1634, var1635 = protoModule.readBuffer(p81, var1612)
				var1612 = var1635
				var1611.period_type = propTypesModule.StringProp.decode(var1634)
			elseif var1617 == 9 then
				local _ = nil
				local var1636, var1637 = protoModule.readBuffer(p81, var1612)
				var1612 = var1637
				var1611.is_subscribed = propTypesModule.BoolProp.decode(var1636)
			elseif var1617 == 10 then
				local _ = nil
				local var1638, var1639 = protoModule.readBuffer(p81, var1612)
				var1612 = var1639
				var1611.price_display = propTypesModule.StringProp.decode(var1638)
			elseif var1617 == 11 then
				local _ = nil
				local var1640, var1641 = protoModule.readBuffer(p81, var1612)
				var1612 = var1641
				var1611.price_in_robux = propTypesModule.Int64Prop.decode(var1640)
			elseif var1617 == 12 then
				local _ = nil
				local var1642, var1643 = protoModule.readBuffer(p81, var1612)
				var1612 = var1643
				var1611.price_tier = propTypesModule.Int64Prop.decode(var1642)
			elseif var1617 == 13 then
				local _ = nil
				local var1644, var1645 = protoModule.readBuffer(p81, var1612)
				var1612 = var1645
				var1611.thumbnail_string = propTypesModule.StringProp.decode(var1644)
			else
				local _ = nil
				local var1646, var1647 = protoModule.readVarInt(p81, var1612)
				var1612 = var1647 + var1646
			end
		elseif var1613 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1648, var1649 = protoModule.readFixed32(p81, var1612)
			local _ = var1648
			var1612 = var1649
		elseif var1613 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1650, var1651 = protoModule.readFixed64(p81, var1612)
			local _ = var1650
			var1612 = var1651
		else
			error("Unsupported wire type: " .. var2751)
		end
	end
	return var1611
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
	local var1652 = t_81.new()
	
	if self.subscription_id ~= nil then
		var1652.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscription_id)
	end
	if self.subscriptionId ~= nil then
		var1652.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscriptionId)
	end
	if self.universe_id ~= nil then
		var1652.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1652.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.creator_name ~= nil then
		var1652.creator_name = propTypesModule.StringProp.jsonDecode(self.creator_name)
	end
	if self.creatorName ~= nil then
		var1652.creator_name = propTypesModule.StringProp.jsonDecode(self.creatorName)
	end
	if self.creator_verified ~= nil then
		var1652.creator_verified = propTypesModule.BoolProp.jsonDecode(self.creator_verified)
	end
	if self.creatorVerified ~= nil then
		var1652.creator_verified = propTypesModule.BoolProp.jsonDecode(self.creatorVerified)
	end
	if self.name ~= nil then
		var1652.name = propTypesModule.StringProp.jsonDecode(self.name)
	end
	if self.description ~= nil then
		var1652.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.image_asset_id ~= nil then
		var1652.image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.image_asset_id)
	end
	if self.imageAssetId ~= nil then
		var1652.image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.imageAssetId)
	end
	if self.period_type ~= nil then
		var1652.period_type = propTypesModule.StringProp.jsonDecode(self.period_type)
	end
	if self.periodType ~= nil then
		var1652.period_type = propTypesModule.StringProp.jsonDecode(self.periodType)
	end
	if self.is_subscribed ~= nil then
		var1652.is_subscribed = propTypesModule.BoolProp.jsonDecode(self.is_subscribed)
	end
	if self.isSubscribed ~= nil then
		var1652.is_subscribed = propTypesModule.BoolProp.jsonDecode(self.isSubscribed)
	end
	if self.price_display ~= nil then
		var1652.price_display = propTypesModule.StringProp.jsonDecode(self.price_display)
	end
	if self.priceDisplay ~= nil then
		var1652.price_display = propTypesModule.StringProp.jsonDecode(self.priceDisplay)
	end
	if self.price_in_robux ~= nil then
		var1652.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.price_in_robux)
	end
	if self.priceInRobux ~= nil then
		var1652.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.priceInRobux)
	end
	if self.price_tier ~= nil then
		var1652.price_tier = propTypesModule.Int64Prop.jsonDecode(self.price_tier)
	end
	if self.priceTier ~= nil then
		var1652.price_tier = propTypesModule.Int64Prop.jsonDecode(self.priceTier)
	end
	if self.thumbnail_string ~= nil then
		var1652.thumbnail_string = propTypesModule.StringProp.jsonDecode(self.thumbnail_string)
	end
	if self.thumbnailString ~= nil then
		var1652.thumbnail_string = propTypesModule.StringProp.jsonDecode(self.thumbnailString)
	end
	return var1652
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
	local var1652 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1653, var1654 = protoModule.writeTag(buff, var1652, 1, protoModule.wireTypes.varint)
		var1653, var2795 = protoModule.writeVarInt(var1653, var1654, t.ActionType.toNumber(self.action_type))
		buff = var1653
		var1652 = var1654
	end
	if self.action_params ~= nil then
		local var1655 = self.action_params:encode()
		local var1656, var1657 = protoModule.writeTag(buff, var1652, 2, protoModule.wireTypes.lengthDelimited)
		var1656, var2798 = protoModule.writeBuffer(var1656, var1657, var1655, buffer.len(var1655))
		buff = var1656
		var1652 = var1657
	end
	local buff_1 = buffer.create(var1652)
	buffer.copy(buff_1, 0, buff, 0, var1652)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var1652 = t_82.new()
	local var1653 = 0
	while var1653 < buffer.len(p82) do
		local _ = nil
		local var1654 = nil
		local var1655, var1656, var1657 = protoModule.readTag(p82, var1653)
		local var1658 = var1655
		var1654 = var1656
		var1653 = var1657
		
		if var1654 == protoModule.wireTypes.varint then
			if var1658 == 1 then
				local _ = nil
				local var1659, var1660 = protoModule.readVarIntI32(p82, var1653)
				local var1661 = var1659
				var1653 = var1660
				var1652.action_type = t.ActionType.fromNumber(var1661) or var1661
			else
				local _ = nil
				local var1662, var1663 = protoModule.readVarInt(p82, var1653)
				local _ = var1662
				var1653 = var1663
			end
		end
		if var1654 == protoModule.wireTypes.lengthDelimited then
			if var1658 == 2 then
				local _ = nil
				local var1664, var1665 = protoModule.readBuffer(p82, var1653)
				var1653 = var1665
				var1652.action_params = t.RefreshGamePassesAction_Params.decode(var1664)
			else
				local _ = nil
				local var1666, var1667 = protoModule.readVarInt(p82, var1653)
				var1653 = var1667 + var1666
			end
		elseif var1654 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1668, var1669 = protoModule.readFixed32(p82, var1653)
			local _ = var1668
			var1653 = var1669
		elseif var1654 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1670, var1671 = protoModule.readFixed64(p82, var1653)
			local _ = var1670
			var1653 = var1671
		else
			error("Unsupported wire type: " .. var2802)
		end
	end
	return var1652
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
	local var1672 = t_82.new()
	
	if self.action_type ~= nil then
		var1672.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1672.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1672.action_params = t.RefreshGamePassesAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1672.action_params = t.RefreshGamePassesAction_Params.jsonDecode(self.actionParams)
	end
	return var1672
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
	local var1672 = 0
	
	if self.universe_id ~= nil then
		local var1673 = self.universe_id:encode()
		local var1674, var1675 = protoModule.writeTag(buff, var1672, 1, protoModule.wireTypes.lengthDelimited)
		var1674, var2826 = protoModule.writeBuffer(var1674, var1675, var1673, buffer.len(var1673))
		buff = var1674
		var1672 = var1675
	end
	local buff_1 = buffer.create(var1672)
	buffer.copy(buff_1, 0, buff, 0, var1672)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), propTypesModule (ref)
	local var1672 = t_83.new()
	local var1673 = 0
	while var1673 < buffer.len(p83) do
		local _ = nil
		local var1674 = nil
		local var1675, var1676, var1677 = protoModule.readTag(p83, var1673)
		local var1678 = var1675
		var1674 = var1676
		var1673 = var1677
		
		if var1674 == protoModule.wireTypes.varint then
			local _ = nil
			local var1679, var1680 = protoModule.readVarInt(p83, var1673)
			local _ = var1679
			var1673 = var1680
			continue
		end
		if var1674 == protoModule.wireTypes.lengthDelimited then
			if var1678 == 1 then
				local _ = nil
				local var1681, var1682 = protoModule.readBuffer(p83, var1673)
				var1673 = var1682
				var1672.universe_id = propTypesModule.StringProp.decode(var1681)
			else
				local _ = nil
				local var1683, var1684 = protoModule.readVarInt(p83, var1673)
				var1673 = var1684 + var1683
			end
		elseif var1674 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1685, var1686 = protoModule.readFixed32(p83, var1673)
			local _ = var1685
			var1673 = var1686
		elseif var1674 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1687, var1688 = protoModule.readFixed64(p83, var1673)
			local _ = var1687
			var1673 = var1688
		else
			error("Unsupported wire type: " .. var2830)
		end
	end
	return var1672
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
	local var1689 = t_83.new()
	
	if self.universe_id ~= nil then
		var1689.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1689.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1689
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
	local var1689 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1690, var1691 = protoModule.writeTag(buff, var1689, 1, protoModule.wireTypes.varint)
		var1690, var2850 = protoModule.writeVarInt(var1690, var1691, t.ActionType.toNumber(self.action_type))
		buff = var1690
		var1689 = var1691
	end
	if self.action_params ~= nil then
		local var1692 = self.action_params:encode()
		local var1693, var1694 = protoModule.writeTag(buff, var1689, 2, protoModule.wireTypes.lengthDelimited)
		var1693, var2853 = protoModule.writeBuffer(var1693, var1694, var1692, buffer.len(var1692))
		buff = var1693
		var1689 = var1694
	end
	local buff_1 = buffer.create(var1689)
	buffer.copy(buff_1, 0, buff, 0, var1689)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var1689 = t_84.new()
	local var1690 = 0
	while var1690 < buffer.len(p84) do
		local _ = nil
		local var1691 = nil
		local var1692, var1693, var1694 = protoModule.readTag(p84, var1690)
		local var1695 = var1692
		var1691 = var1693
		var1690 = var1694
		
		if var1691 == protoModule.wireTypes.varint then
			if var1695 == 1 then
				local _ = nil
				local var1696, var1697 = protoModule.readVarIntI32(p84, var1690)
				local var1698 = var1696
				var1690 = var1697
				var1689.action_type = t.ActionType.fromNumber(var1698) or var1698
			else
				local _ = nil
				local var1699, var1700 = protoModule.readVarInt(p84, var1690)
				local _ = var1699
				var1690 = var1700
			end
		end
		if var1691 == protoModule.wireTypes.lengthDelimited then
			if var1695 == 2 then
				local _ = nil
				local var1701, var1702 = protoModule.readBuffer(p84, var1690)
				var1690 = var1702
				var1689.action_params = t.RefreshPlayabilityAction_Params.decode(var1701)
			else
				local _ = nil
				local var1703, var1704 = protoModule.readVarInt(p84, var1690)
				var1690 = var1704 + var1703
			end
		elseif var1691 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1705, var1706 = protoModule.readFixed32(p84, var1690)
			local _ = var1705
			var1690 = var1706
		elseif var1691 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1707, var1708 = protoModule.readFixed64(p84, var1690)
			local _ = var1707
			var1690 = var1708
		else
			error("Unsupported wire type: " .. var2857)
		end
	end
	return var1689
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
	local var1709 = t_84.new()
	
	if self.action_type ~= nil then
		var1709.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1709.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1709.action_params = t.RefreshPlayabilityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1709.action_params = t.RefreshPlayabilityAction_Params.jsonDecode(self.actionParams)
	end
	return var1709
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
	local var1709 = 0
	
	if self.universe_id ~= nil then
		local var1710 = self.universe_id:encode()
		local var1711, var1712 = protoModule.writeTag(buff, var1709, 1, protoModule.wireTypes.lengthDelimited)
		var1711, var2881 = protoModule.writeBuffer(var1711, var1712, var1710, buffer.len(var1710))
		buff = var1711
		var1709 = var1712
	end
	local buff_1 = buffer.create(var1709)
	buffer.copy(buff_1, 0, buff, 0, var1709)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), propTypesModule (ref)
	local var1709 = t_85.new()
	local var1710 = 0
	while var1710 < buffer.len(p85) do
		local _ = nil
		local var1711 = nil
		local var1712, var1713, var1714 = protoModule.readTag(p85, var1710)
		local var1715 = var1712
		var1711 = var1713
		var1710 = var1714
		
		if var1711 == protoModule.wireTypes.varint then
			local _ = nil
			local var1716, var1717 = protoModule.readVarInt(p85, var1710)
			local _ = var1716
			var1710 = var1717
			continue
		end
		if var1711 == protoModule.wireTypes.lengthDelimited then
			if var1715 == 1 then
				local _ = nil
				local var1718, var1719 = protoModule.readBuffer(p85, var1710)
				var1710 = var1719
				var1709.universe_id = propTypesModule.StringProp.decode(var1718)
			else
				local _ = nil
				local var1720, var1721 = protoModule.readVarInt(p85, var1710)
				var1710 = var1721 + var1720
			end
		elseif var1711 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1722, var1723 = protoModule.readFixed32(p85, var1710)
			local _ = var1722
			var1710 = var1723
		elseif var1711 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1724, var1725 = protoModule.readFixed64(p85, var1710)
			local _ = var1724
			var1710 = var1725
		else
			error("Unsupported wire type: " .. var2885)
		end
	end
	return var1709
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
	local var1726 = t_85.new()
	
	if self.universe_id ~= nil then
		var1726.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var1726.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var1726
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
	local var1726 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1727, var1728 = protoModule.writeTag(buff, var1726, 1, protoModule.wireTypes.varint)
		var1727, var2905 = protoModule.writeVarInt(var1727, var1728, t.ActionType.toNumber(self.action_type))
		buff = var1727
		var1726 = var1728
	end
	if self.action_params ~= nil then
		local var1729 = self.action_params:encode()
		local var1730, var1731 = protoModule.writeTag(buff, var1726, 2, protoModule.wireTypes.lengthDelimited)
		var1730, var2908 = protoModule.writeBuffer(var1730, var1731, var1729, buffer.len(var1729))
		buff = var1730
		var1726 = var1731
	end
	local buff_1 = buffer.create(var1726)
	buffer.copy(buff_1, 0, buff, 0, var1726)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var1726 = t_86.new()
	local var1727 = 0
	while var1727 < buffer.len(p86) do
		local _ = nil
		local var1728 = nil
		local var1729, var1730, var1731 = protoModule.readTag(p86, var1727)
		local var1732 = var1729
		var1728 = var1730
		var1727 = var1731
		
		if var1728 == protoModule.wireTypes.varint then
			if var1732 == 1 then
				local _ = nil
				local var1733, var1734 = protoModule.readVarIntI32(p86, var1727)
				local var1735 = var1733
				var1727 = var1734
				var1726.action_type = t.ActionType.fromNumber(var1735) or var1735
			else
				local _ = nil
				local var1736, var1737 = protoModule.readVarInt(p86, var1727)
				local _ = var1736
				var1727 = var1737
			end
		end
		if var1728 == protoModule.wireTypes.lengthDelimited then
			if var1732 == 2 then
				local _ = nil
				local var1738, var1739 = protoModule.readBuffer(p86, var1727)
				var1727 = var1739
				var1726.action_params = t.RefreshDeveloperProductsAction_Params.decode(var1738)
			else
				local _ = nil
				local var1740, var1741 = protoModule.readVarInt(p86, var1727)
				var1727 = var1741 + var1740
			end
		elseif var1728 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1742, var1743 = protoModule.readFixed32(p86, var1727)
			local _ = var1742
			var1727 = var1743
		elseif var1728 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1744, var1745 = protoModule.readFixed64(p86, var1727)
			local _ = var1744
			var1727 = var1745
		else
			error("Unsupported wire type: " .. var2912)
		end
	end
	return var1726
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
	local var1746 = t_86.new()
	
	if self.action_type ~= nil then
		var1746.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1746.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1746.action_params = t.RefreshDeveloperProductsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1746.action_params = t.RefreshDeveloperProductsAction_Params.jsonDecode(self.actionParams)
	end
	return var1746
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
	local var1746 = 0
	
	if self.place_id ~= nil then
		local var1747 = self.place_id:encode()
		local var1748, var1749 = protoModule.writeTag(buff, var1746, 1, protoModule.wireTypes.lengthDelimited)
		var1748, var2936 = protoModule.writeBuffer(var1748, var1749, var1747, buffer.len(var1747))
		buff = var1748
		var1746 = var1749
	end
	local buff_1 = buffer.create(var1746)
	buffer.copy(buff_1, 0, buff, 0, var1746)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref), propTypesModule (ref)
	local var1746 = t_87.new()
	local var1747 = 0
	while var1747 < buffer.len(p87) do
		local _ = nil
		local var1748 = nil
		local var1749, var1750, var1751 = protoModule.readTag(p87, var1747)
		local var1752 = var1749
		var1748 = var1750
		var1747 = var1751
		
		if var1748 == protoModule.wireTypes.varint then
			local _ = nil
			local var1753, var1754 = protoModule.readVarInt(p87, var1747)
			local _ = var1753
			var1747 = var1754
			continue
		end
		if var1748 == protoModule.wireTypes.lengthDelimited then
			if var1752 == 1 then
				local _ = nil
				local var1755, var1756 = protoModule.readBuffer(p87, var1747)
				var1747 = var1756
				var1746.place_id = propTypesModule.StringProp.decode(var1755)
			else
				local _ = nil
				local var1757, var1758 = protoModule.readVarInt(p87, var1747)
				var1747 = var1758 + var1757
			end
		elseif var1748 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1759, var1760 = protoModule.readFixed32(p87, var1747)
			local _ = var1759
			var1747 = var1760
		elseif var1748 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1761, var1762 = protoModule.readFixed64(p87, var1747)
			local _ = var1761
			var1747 = var1762
		else
			error("Unsupported wire type: " .. var2940)
		end
	end
	return var1746
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
	local var1763 = t_87.new()
	
	if self.place_id ~= nil then
		var1763.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var1763.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	return var1763
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
	local var1763 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1764, var1765 = protoModule.writeTag(buff, var1763, 1, protoModule.wireTypes.varint)
		var1764, var2960 = protoModule.writeVarInt(var1764, var1765, t.ActionType.toNumber(self.action_type))
		buff = var1764
		var1763 = var1765
	end
	if self.action_params ~= nil then
		local var1766 = self.action_params:encode()
		local var1767, var1768 = protoModule.writeTag(buff, var1763, 2, protoModule.wireTypes.lengthDelimited)
		var1767, var2963 = protoModule.writeBuffer(var1767, var1768, var1766, buffer.len(var1766))
		buff = var1767
		var1763 = var1768
	end
	local buff_1 = buffer.create(var1763)
	buffer.copy(buff_1, 0, buff, 0, var1763)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var1763 = t_88.new()
	local var1764 = 0
	while var1764 < buffer.len(p88) do
		local _ = nil
		local var1765 = nil
		local var1766, var1767, var1768 = protoModule.readTag(p88, var1764)
		local var1769 = var1766
		var1765 = var1767
		var1764 = var1768
		
		if var1765 == protoModule.wireTypes.varint then
			if var1769 == 1 then
				local _ = nil
				local var1770, var1771 = protoModule.readVarIntI32(p88, var1764)
				local var1772 = var1770
				var1764 = var1771
				var1763.action_type = t.ActionType.fromNumber(var1772) or var1772
			else
				local _ = nil
				local var1773, var1774 = protoModule.readVarInt(p88, var1764)
				local _ = var1773
				var1764 = var1774
			end
		end
		if var1765 == protoModule.wireTypes.lengthDelimited then
			if var1769 == 2 then
				local _ = nil
				local var1775, var1776 = protoModule.readBuffer(p88, var1764)
				var1764 = var1776
				var1763.action_params = t.OpenFaeTrialUpsellAction_Params.decode(var1775)
			else
				local _ = nil
				local var1777, var1778 = protoModule.readVarInt(p88, var1764)
				var1764 = var1778 + var1777
			end
		elseif var1765 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1779, var1780 = protoModule.readFixed32(p88, var1764)
			local _ = var1779
			var1764 = var1780
		elseif var1765 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1781, var1782 = protoModule.readFixed64(p88, var1764)
			local _ = var1781
			var1764 = var1782
		else
			error("Unsupported wire type: " .. var2967)
		end
	end
	return var1763
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
	local var1783 = t_88.new()
	
	if self.action_type ~= nil then
		var1783.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1783.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1783.action_params = t.OpenFaeTrialUpsellAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1783.action_params = t.OpenFaeTrialUpsellAction_Params.jsonDecode(self.actionParams)
	end
	return var1783
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
	local var1783 = 0
	
	if self.source ~= nil then
		local var1784 = self.source:encode()
		local var1785, var1786 = protoModule.writeTag(buff, var1783, 1, protoModule.wireTypes.lengthDelimited)
		var1785, var2991 = protoModule.writeBuffer(var1785, var1786, var1784, buffer.len(var1784))
		buff = var1785
		var1783 = var1786
	end
	if self.config_key ~= nil then
		local var1787 = self.config_key:encode()
		local var1788, var1789 = protoModule.writeTag(buff, var1783, 2, protoModule.wireTypes.lengthDelimited)
		var1788, var2994 = protoModule.writeBuffer(var1788, var1789, var1787, buffer.len(var1787))
		buff = var1788
		var1783 = var1789
	end
	if self.surface_key ~= nil then
		local var1790 = self.surface_key:encode()
		local var1791, var1792 = protoModule.writeTag(buff, var1783, 3, protoModule.wireTypes.lengthDelimited)
		var1791, var2997 = protoModule.writeBuffer(var1791, var1792, var1790, buffer.len(var1790))
		buff = var1791
		var1783 = var1792
	end
	if self.prompt_type ~= nil then
		local var1793 = self.prompt_type:encode()
		local var1794, var1795 = protoModule.writeTag(buff, var1783, 4, protoModule.wireTypes.lengthDelimited)
		var1794, var3000 = protoModule.writeBuffer(var1794, var1795, var1793, buffer.len(var1793))
		buff = var1794
		var1783 = var1795
	end
	local buff_1 = buffer.create(var1783)
	buffer.copy(buff_1, 0, buff, 0, var1783)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref), propTypesModule (ref)
	local var1783 = t_89.new()
	local var1784 = 0
	while var1784 < buffer.len(p89) do
		local _ = nil
		local var1785 = nil
		local var1786, var1787, var1788 = protoModule.readTag(p89, var1784)
		local var1789 = var1786
		var1785 = var1787
		var1784 = var1788
		
		if var1785 == protoModule.wireTypes.varint then
			local _ = nil
			local var1790, var1791 = protoModule.readVarInt(p89, var1784)
			local _ = var1790
			var1784 = var1791
			continue
		end
		if var1785 == protoModule.wireTypes.lengthDelimited then
			if var1789 == 1 then
				local _ = nil
				local var1792, var1793 = protoModule.readBuffer(p89, var1784)
				var1784 = var1793
				var1783.source = propTypesModule.StringProp.decode(var1792)
			elseif var1789 == 2 then
				local _ = nil
				local var1794, var1795 = protoModule.readBuffer(p89, var1784)
				var1784 = var1795
				var1783.config_key = propTypesModule.StringProp.decode(var1794)
			elseif var1789 == 3 then
				local _ = nil
				local var1796, var1797 = protoModule.readBuffer(p89, var1784)
				var1784 = var1797
				var1783.surface_key = propTypesModule.StringProp.decode(var1796)
			elseif var1789 == 4 then
				local _ = nil
				local var1798, var1799 = protoModule.readBuffer(p89, var1784)
				var1784 = var1799
				var1783.prompt_type = propTypesModule.StringProp.decode(var1798)
			else
				local _ = nil
				local var1800, var1801 = protoModule.readVarInt(p89, var1784)
				var1784 = var1801 + var1800
			end
		elseif var1785 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1802, var1803 = protoModule.readFixed32(p89, var1784)
			local _ = var1802
			var1784 = var1803
		elseif var1785 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1804, var1805 = protoModule.readFixed64(p89, var1784)
			local _ = var1804
			var1784 = var1805
		else
			error("Unsupported wire type: " .. var3004)
		end
	end
	return var1783
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
	local var1806 = t_89.new()
	
	if self.source ~= nil then
		var1806.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.config_key ~= nil then
		var1806.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1806.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.surface_key ~= nil then
		var1806.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var1806.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.prompt_type ~= nil then
		var1806.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1806.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	return var1806
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
	local var1806 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1807, var1808 = protoModule.writeTag(buff, var1806, 1, protoModule.wireTypes.varint)
		var1807, var3030 = protoModule.writeVarInt(var1807, var1808, t.ActionType.toNumber(self.action_type))
		buff = var1807
		var1806 = var1808
	end
	if self.action_params ~= nil then
		local var1809 = self.action_params:encode()
		local var1810, var1811 = protoModule.writeTag(buff, var1806, 2, protoModule.wireTypes.lengthDelimited)
		var1810, var3033 = protoModule.writeBuffer(var1810, var1811, var1809, buffer.len(var1809))
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
				var1806.action_params = t.OpenIncomingTransferUpsellAction_Params.decode(var1818)
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
			error("Unsupported wire type: " .. var3037)
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
		var1826.action_params = t.OpenIncomingTransferUpsellAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1826.action_params = t.OpenIncomingTransferUpsellAction_Params.jsonDecode(self.actionParams)
	end
	return var1826
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
	local var1826 = 0
	
	if self.url ~= nil then
		local var1827 = self.url:encode()
		local var1828, var1829 = protoModule.writeTag(buff, var1826, 1, protoModule.wireTypes.lengthDelimited)
		var1828, var3061 = protoModule.writeBuffer(var1828, var1829, var1827, buffer.len(var1827))
		buff = var1828
		var1826 = var1829
	end
	if self.prompt_type ~= nil then
		local var1830 = self.prompt_type:encode()
		local var1831, var1832 = protoModule.writeTag(buff, var1826, 2, protoModule.wireTypes.lengthDelimited)
		var1831, var3064 = protoModule.writeBuffer(var1831, var1832, var1830, buffer.len(var1830))
		buff = var1831
		var1826 = var1832
	end
	if self.prompt_id ~= nil then
		local var1833 = self.prompt_id:encode()
		local var1834, var1835 = protoModule.writeTag(buff, var1826, 3, protoModule.wireTypes.lengthDelimited)
		var1834, var3067 = protoModule.writeBuffer(var1834, var1835, var1833, buffer.len(var1833))
		buff = var1834
		var1826 = var1835
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
				var1826.url = propTypesModule.StringProp.decode(var1835)
			elseif var1832 == 2 then
				local _ = nil
				local var1837, var1838 = protoModule.readBuffer(p91, var1827)
				var1827 = var1838
				var1826.prompt_type = propTypesModule.StringProp.decode(var1837)
			elseif var1832 == 3 then
				local _ = nil
				local var1839, var1840 = protoModule.readBuffer(p91, var1827)
				var1827 = var1840
				var1826.prompt_id = propTypesModule.StringProp.decode(var1839)
			else
				local _ = nil
				local var1841, var1842 = protoModule.readVarInt(p91, var1827)
				var1827 = var1842 + var1841
			end
		elseif var1828 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1843, var1844 = protoModule.readFixed32(p91, var1827)
			local _ = var1843
			var1827 = var1844
		elseif var1828 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1845, var1846 = protoModule.readFixed64(p91, var1827)
			local _ = var1845
			var1827 = var1846
		else
			error("Unsupported wire type: " .. var3071)
		end
	end
	return var1826
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
	local var1847 = t_91.new()
	
	if self.url ~= nil then
		var1847.url = propTypesModule.StringProp.jsonDecode(self.url)
	end
	if self.prompt_type ~= nil then
		var1847.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var1847.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var1847.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var1847.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	return var1847
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
	local var1847 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1848, var1849 = protoModule.writeTag(buff, var1847, 1, protoModule.wireTypes.varint)
		var1848, var3095 = protoModule.writeVarInt(var1848, var1849, t.ActionType.toNumber(self.action_type))
		buff = var1848
		var1847 = var1849
	end
	if self.action_params ~= nil then
		local var1850 = self.action_params:encode()
		local var1851, var1852 = protoModule.writeTag(buff, var1847, 2, protoModule.wireTypes.lengthDelimited)
		var1851, var3098 = protoModule.writeBuffer(var1851, var1852, var1850, buffer.len(var1850))
		buff = var1851
		var1847 = var1852
	end
	local buff_1 = buffer.create(var1847)
	buffer.copy(buff_1, 0, buff, 0, var1847)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var1847 = t_92.new()
	local var1848 = 0
	while var1848 < buffer.len(p92) do
		local _ = nil
		local var1849 = nil
		local var1850, var1851, var1852 = protoModule.readTag(p92, var1848)
		local var1853 = var1850
		var1849 = var1851
		var1848 = var1852
		
		if var1849 == protoModule.wireTypes.varint then
			if var1853 == 1 then
				local _ = nil
				local var1854, var1855 = protoModule.readVarIntI32(p92, var1848)
				local var1856 = var1854
				var1848 = var1855
				var1847.action_type = t.ActionType.fromNumber(var1856) or var1856
			else
				local _ = nil
				local var1857, var1858 = protoModule.readVarInt(p92, var1848)
				local _ = var1857
				var1848 = var1858
			end
		end
		if var1849 == protoModule.wireTypes.lengthDelimited then
			if var1853 == 2 then
				local _ = nil
				local var1859, var1860 = protoModule.readBuffer(p92, var1848)
				var1848 = var1860
				var1847.action_params = t.OpenSduiOverlayAction_Params.decode(var1859)
			else
				local _ = nil
				local var1861, var1862 = protoModule.readVarInt(p92, var1848)
				var1848 = var1862 + var1861
			end
		elseif var1849 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1863, var1864 = protoModule.readFixed32(p92, var1848)
			local _ = var1863
			var1848 = var1864
		elseif var1849 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1865, var1866 = protoModule.readFixed64(p92, var1848)
			local _ = var1865
			var1848 = var1866
		else
			error("Unsupported wire type: " .. var3102)
		end
	end
	return var1847
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
	local var1867 = t_92.new()
	
	if self.action_type ~= nil then
		var1867.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1867.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1867.action_params = t.OpenSduiOverlayAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1867.action_params = t.OpenSduiOverlayAction_Params.jsonDecode(self.actionParams)
	end
	return var1867
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
	local var1867 = 0
	
	if self.config_key ~= nil then
		local var1868 = self.config_key:encode()
		local var1869, var1870 = protoModule.writeTag(buff, var1867, 1, protoModule.wireTypes.lengthDelimited)
		var1869, var3126 = protoModule.writeBuffer(var1869, var1870, var1868, buffer.len(var1868))
		buff = var1869
		var1867 = var1870
	end
	if self.identifier ~= nil then
		local var1871 = self.identifier:encode()
		local var1872, var1873 = protoModule.writeTag(buff, var1867, 2, protoModule.wireTypes.lengthDelimited)
		var1872, var3129 = protoModule.writeBuffer(var1872, var1873, var1871, buffer.len(var1871))
		buff = var1872
		var1867 = var1873
	end
	local buff_1 = buffer.create(var1867)
	buffer.copy(buff_1, 0, buff, 0, var1867)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref), propTypesModule (ref)
	local var1867 = t_93.new()
	local var1868 = 0
	while var1868 < buffer.len(p93) do
		local _ = nil
		local var1869 = nil
		local var1870, var1871, var1872 = protoModule.readTag(p93, var1868)
		local var1873 = var1870
		var1869 = var1871
		var1868 = var1872
		
		if var1869 == protoModule.wireTypes.varint then
			local _ = nil
			local var1874, var1875 = protoModule.readVarInt(p93, var1868)
			local _ = var1874
			var1868 = var1875
			continue
		end
		if var1869 == protoModule.wireTypes.lengthDelimited then
			if var1873 == 1 then
				local _ = nil
				local var1876, var1877 = protoModule.readBuffer(p93, var1868)
				var1868 = var1877
				var1867.config_key = propTypesModule.StringProp.decode(var1876)
			elseif var1873 == 2 then
				local _ = nil
				local var1878, var1879 = protoModule.readBuffer(p93, var1868)
				var1868 = var1879
				var1867.identifier = propTypesModule.StringProp.decode(var1878)
			else
				local _ = nil
				local var1880, var1881 = protoModule.readVarInt(p93, var1868)
				var1868 = var1881 + var1880
			end
		elseif var1869 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1882, var1883 = protoModule.readFixed32(p93, var1868)
			local _ = var1882
			var1868 = var1883
		elseif var1869 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1884, var1885 = protoModule.readFixed64(p93, var1868)
			local _ = var1884
			var1868 = var1885
		else
			error("Unsupported wire type: " .. var3133)
		end
	end
	return var1867
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
	local var1886 = t_93.new()
	
	if self.config_key ~= nil then
		var1886.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1886.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.identifier ~= nil then
		var1886.identifier = propTypesModule.StringProp.jsonDecode(self.identifier)
	end
	return var1886
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
	local var1886 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1887, var1888 = protoModule.writeTag(buff, var1886, 1, protoModule.wireTypes.varint)
		var1887, var3155 = protoModule.writeVarInt(var1887, var1888, t.ActionType.toNumber(self.action_type))
		buff = var1887
		var1886 = var1888
	end
	if self.action_params ~= nil then
		local var1889 = self.action_params:encode()
		local var1890, var1891 = protoModule.writeTag(buff, var1886, 2, protoModule.wireTypes.lengthDelimited)
		var1890, var3158 = protoModule.writeBuffer(var1890, var1891, var1889, buffer.len(var1889))
		buff = var1890
		var1886 = var1891
	end
	local buff_1 = buffer.create(var1886)
	buffer.copy(buff_1, 0, buff, 0, var1886)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref), t (ref)
	local var1886 = t_94.new()
	local var1887 = 0
	while var1887 < buffer.len(p94) do
		local _ = nil
		local var1888 = nil
		local var1889, var1890, var1891 = protoModule.readTag(p94, var1887)
		local var1892 = var1889
		var1888 = var1890
		var1887 = var1891
		
		if var1888 == protoModule.wireTypes.varint then
			if var1892 == 1 then
				local _ = nil
				local var1893, var1894 = protoModule.readVarIntI32(p94, var1887)
				local var1895 = var1893
				var1887 = var1894
				var1886.action_type = t.ActionType.fromNumber(var1895) or var1895
			else
				local _ = nil
				local var1896, var1897 = protoModule.readVarInt(p94, var1887)
				local _ = var1896
				var1887 = var1897
			end
		end
		if var1888 == protoModule.wireTypes.lengthDelimited then
			if var1892 == 2 then
				local _ = nil
				local var1898, var1899 = protoModule.readBuffer(p94, var1887)
				var1887 = var1899
				var1886.action_params = t.ApplyChartsFilterAction_Params.decode(var1898)
			else
				local _ = nil
				local var1900, var1901 = protoModule.readVarInt(p94, var1887)
				var1887 = var1901 + var1900
			end
		elseif var1888 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1902, var1903 = protoModule.readFixed32(p94, var1887)
			local _ = var1902
			var1887 = var1903
		elseif var1888 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1904, var1905 = protoModule.readFixed64(p94, var1887)
			local _ = var1904
			var1887 = var1905
		else
			error("Unsupported wire type: " .. var3162)
		end
	end
	return var1886
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
	local var1906 = t_94.new()
	
	if self.action_type ~= nil then
		var1906.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1906.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1906.action_params = t.ApplyChartsFilterAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1906.action_params = t.ApplyChartsFilterAction_Params.jsonDecode(self.actionParams)
	end
	return var1906
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
	local var1906 = 0
	
	if self.session_id ~= nil then
		local var1907 = self.session_id:encode()
		local var1908, var1909 = protoModule.writeTag(buff, var1906, 1, protoModule.wireTypes.lengthDelimited)
		var1908, var3186 = protoModule.writeBuffer(var1908, var1909, var1907, buffer.len(var1907))
		buff = var1908
		var1906 = var1909
	end
	local buff_1 = buffer.create(var1906)
	buffer.copy(buff_1, 0, buff, 0, var1906)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref), propTypesModule (ref)
	local var1906 = t_95.new()
	local var1907 = 0
	while var1907 < buffer.len(p95) do
		local _ = nil
		local var1908 = nil
		local var1909, var1910, var1911 = protoModule.readTag(p95, var1907)
		local var1912 = var1909
		var1908 = var1910
		var1907 = var1911
		
		if var1908 == protoModule.wireTypes.varint then
			local _ = nil
			local var1913, var1914 = protoModule.readVarInt(p95, var1907)
			local _ = var1913
			var1907 = var1914
			continue
		end
		if var1908 == protoModule.wireTypes.lengthDelimited then
			if var1912 == 1 then
				local _ = nil
				local var1915, var1916 = protoModule.readBuffer(p95, var1907)
				var1907 = var1916
				var1906.session_id = propTypesModule.StringProp.decode(var1915)
			else
				local _ = nil
				local var1917, var1918 = protoModule.readVarInt(p95, var1907)
				var1907 = var1918 + var1917
			end
		elseif var1908 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1919, var1920 = protoModule.readFixed32(p95, var1907)
			local _ = var1919
			var1907 = var1920
		elseif var1908 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1921, var1922 = protoModule.readFixed64(p95, var1907)
			local _ = var1921
			var1907 = var1922
		else
			error("Unsupported wire type: " .. var3190)
		end
	end
	return var1906
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
	local var1923 = t_95.new()
	
	if self.session_id ~= nil then
		var1923.session_id = propTypesModule.StringProp.jsonDecode(self.session_id)
	end
	if self.sessionId ~= nil then
		var1923.session_id = propTypesModule.StringProp.jsonDecode(self.sessionId)
	end
	return var1923
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
	local var1923 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1924, var1925 = protoModule.writeTag(buff, var1923, 1, protoModule.wireTypes.varint)
		var1924, var3210 = protoModule.writeVarInt(var1924, var1925, t.ActionType.toNumber(self.action_type))
		buff = var1924
		var1923 = var1925
	end
	if self.action_params ~= nil then
		local var1926 = self.action_params:encode()
		local var1927, var1928 = protoModule.writeTag(buff, var1923, 2, protoModule.wireTypes.lengthDelimited)
		var1927, var3213 = protoModule.writeBuffer(var1927, var1928, var1926, buffer.len(var1926))
		buff = var1927
		var1923 = var1928
	end
	local buff_1 = buffer.create(var1923)
	buffer.copy(buff_1, 0, buff, 0, var1923)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var1923 = t_96.new()
	local var1924 = 0
	while var1924 < buffer.len(p96) do
		local _ = nil
		local var1925 = nil
		local var1926, var1927, var1928 = protoModule.readTag(p96, var1924)
		local var1929 = var1926
		var1925 = var1927
		var1924 = var1928
		
		if var1925 == protoModule.wireTypes.varint then
			if var1929 == 1 then
				local _ = nil
				local var1930, var1931 = protoModule.readVarIntI32(p96, var1924)
				local var1932 = var1930
				var1924 = var1931
				var1923.action_type = t.ActionType.fromNumber(var1932) or var1932
			else
				local _ = nil
				local var1933, var1934 = protoModule.readVarInt(p96, var1924)
				local _ = var1933
				var1924 = var1934
			end
		end
		if var1925 == protoModule.wireTypes.lengthDelimited then
			if var1929 == 2 then
				local _ = nil
				local var1935, var1936 = protoModule.readBuffer(p96, var1924)
				var1924 = var1936
				var1923.action_params = t.RefreshChartsSortDetailAction_Params.decode(var1935)
			else
				local _ = nil
				local var1937, var1938 = protoModule.readVarInt(p96, var1924)
				var1924 = var1938 + var1937
			end
		elseif var1925 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1939, var1940 = protoModule.readFixed32(p96, var1924)
			local _ = var1939
			var1924 = var1940
		elseif var1925 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1941, var1942 = protoModule.readFixed64(p96, var1924)
			local _ = var1941
			var1924 = var1942
		else
			error("Unsupported wire type: " .. var3217)
		end
	end
	return var1923
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
	local var1943 = t_96.new()
	
	if self.action_type ~= nil then
		var1943.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1943.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1943.action_params = t.RefreshChartsSortDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1943.action_params = t.RefreshChartsSortDetailAction_Params.jsonDecode(self.actionParams)
	end
	return var1943
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
	local var1943 = 0
	
	if self.config_key ~= nil then
		local var1944 = self.config_key:encode()
		local var1945, var1946 = protoModule.writeTag(buff, var1943, 1, protoModule.wireTypes.lengthDelimited)
		var1945, var3241 = protoModule.writeBuffer(var1945, var1946, var1944, buffer.len(var1944))
		buff = var1945
		var1943 = var1946
	end
	if self.selected_option ~= nil then
		local var1947 = self.selected_option:encode()
		local var1948, var1949 = protoModule.writeTag(buff, var1943, 2, protoModule.wireTypes.lengthDelimited)
		var1948, var3244 = protoModule.writeBuffer(var1948, var1949, var1947, buffer.len(var1947))
		buff = var1948
		var1943 = var1949
	end
	if self.surface_key ~= nil then
		local var1950 = self.surface_key:encode()
		local var1951, var1952 = protoModule.writeTag(buff, var1943, 3, protoModule.wireTypes.lengthDelimited)
		var1951, var3247 = protoModule.writeBuffer(var1951, var1952, var1950, buffer.len(var1950))
		buff = var1951
		var1943 = var1952
	end
	if self.sort_id ~= nil then
		local var1953 = self.sort_id:encode()
		local var1954, var1955 = protoModule.writeTag(buff, var1943, 4, protoModule.wireTypes.lengthDelimited)
		var1954, var3250 = protoModule.writeBuffer(var1954, var1955, var1953, buffer.len(var1953))
		buff = var1954
		var1943 = var1955
	end
	local buff_1 = buffer.create(var1943)
	buffer.copy(buff_1, 0, buff, 0, var1943)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref), propTypesModule (ref)
	local var1943 = t_97.new()
	local var1944 = 0
	while var1944 < buffer.len(p97) do
		local _ = nil
		local var1945 = nil
		local var1946, var1947, var1948 = protoModule.readTag(p97, var1944)
		local var1949 = var1946
		var1945 = var1947
		var1944 = var1948
		
		if var1945 == protoModule.wireTypes.varint then
			local _ = nil
			local var1950, var1951 = protoModule.readVarInt(p97, var1944)
			local _ = var1950
			var1944 = var1951
			continue
		end
		if var1945 == protoModule.wireTypes.lengthDelimited then
			if var1949 == 1 then
				local _ = nil
				local var1952, var1953 = protoModule.readBuffer(p97, var1944)
				var1944 = var1953
				var1943.config_key = propTypesModule.StringProp.decode(var1952)
			elseif var1949 == 2 then
				local _ = nil
				local var1954, var1955 = protoModule.readBuffer(p97, var1944)
				var1944 = var1955
				var1943.selected_option = propTypesModule.StringProp.decode(var1954)
			elseif var1949 == 3 then
				local _ = nil
				local var1956, var1957 = protoModule.readBuffer(p97, var1944)
				var1944 = var1957
				var1943.surface_key = propTypesModule.StringProp.decode(var1956)
			elseif var1949 == 4 then
				local _ = nil
				local var1958, var1959 = protoModule.readBuffer(p97, var1944)
				var1944 = var1959
				var1943.sort_id = propTypesModule.StringProp.decode(var1958)
			else
				local _ = nil
				local var1960, var1961 = protoModule.readVarInt(p97, var1944)
				var1944 = var1961 + var1960
			end
		elseif var1945 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1962, var1963 = protoModule.readFixed32(p97, var1944)
			local _ = var1962
			var1944 = var1963
		elseif var1945 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1964, var1965 = protoModule.readFixed64(p97, var1944)
			local _ = var1964
			var1944 = var1965
		else
			error("Unsupported wire type: " .. var3254)
		end
	end
	return var1943
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
	local var1966 = t_97.new()
	
	if self.config_key ~= nil then
		var1966.config_key = propTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		var1966.config_key = propTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.selected_option ~= nil then
		var1966.selected_option = propTypesModule.StringProp.jsonDecode(self.selected_option)
	end
	if self.selectedOption ~= nil then
		var1966.selected_option = propTypesModule.StringProp.jsonDecode(self.selectedOption)
	end
	if self.surface_key ~= nil then
		var1966.surface_key = propTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		var1966.surface_key = propTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.sort_id ~= nil then
		var1966.sort_id = propTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		var1966.sort_id = propTypesModule.StringProp.jsonDecode(self.sortId)
	end
	return var1966
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
	local var1966 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var1967, var1968 = protoModule.writeTag(buff, var1966, 1, protoModule.wireTypes.varint)
		var1967, var3280 = protoModule.writeVarInt(var1967, var1968, t.ActionType.toNumber(self.action_type))
		buff = var1967
		var1966 = var1968
	end
	if self.action_params ~= nil then
		local var1969 = self.action_params:encode()
		local var1970, var1971 = protoModule.writeTag(buff, var1966, 2, protoModule.wireTypes.lengthDelimited)
		var1970, var3283 = protoModule.writeBuffer(var1970, var1971, var1969, buffer.len(var1969))
		buff = var1970
		var1966 = var1971
	end
	local buff_1 = buffer.create(var1966)
	buffer.copy(buff_1, 0, buff, 0, var1966)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var1966 = t_98.new()
	local var1967 = 0
	while var1967 < buffer.len(p98) do
		local _ = nil
		local var1968 = nil
		local var1969, var1970, var1971 = protoModule.readTag(p98, var1967)
		local var1972 = var1969
		var1968 = var1970
		var1967 = var1971
		
		if var1968 == protoModule.wireTypes.varint then
			if var1972 == 1 then
				local _ = nil
				local var1973, var1974 = protoModule.readVarIntI32(p98, var1967)
				local var1975 = var1973
				var1967 = var1974
				var1966.action_type = t.ActionType.fromNumber(var1975) or var1975
			else
				local _ = nil
				local var1976, var1977 = protoModule.readVarInt(p98, var1967)
				local _ = var1976
				var1967 = var1977
			end
		end
		if var1968 == protoModule.wireTypes.lengthDelimited then
			if var1972 == 2 then
				local _ = nil
				local var1978, var1979 = protoModule.readBuffer(p98, var1967)
				var1967 = var1979
				var1966.action_params = t.JoinCommunityAction_Params.decode(var1978)
			else
				local _ = nil
				local var1980, var1981 = protoModule.readVarInt(p98, var1967)
				var1967 = var1981 + var1980
			end
		elseif var1968 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1982, var1983 = protoModule.readFixed32(p98, var1967)
			local _ = var1982
			var1967 = var1983
		elseif var1968 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1984, var1985 = protoModule.readFixed64(p98, var1967)
			local _ = var1984
			var1967 = var1985
		else
			error("Unsupported wire type: " .. var3287)
		end
	end
	return var1966
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
	local var1986 = t_98.new()
	
	if self.action_type ~= nil then
		var1986.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var1986.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var1986.action_params = t.JoinCommunityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var1986.action_params = t.JoinCommunityAction_Params.jsonDecode(self.actionParams)
	end
	return var1986
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
	local var1986 = 0
	
	if self.community_id ~= nil then
		local var1987 = self.community_id:encode()
		local var1988, var1989 = protoModule.writeTag(buff, var1986, 1, protoModule.wireTypes.lengthDelimited)
		var1988, var3311 = protoModule.writeBuffer(var1988, var1989, var1987, buffer.len(var1987))
		buff = var1988
		var1986 = var1989
	end
	local buff_1 = buffer.create(var1986)
	buffer.copy(buff_1, 0, buff, 0, var1986)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref), propTypesModule (ref)
	local var1986 = t_99.new()
	local var1987 = 0
	while var1987 < buffer.len(p99) do
		local _ = nil
		local var1988 = nil
		local var1989, var1990, var1991 = protoModule.readTag(p99, var1987)
		local var1992 = var1989
		var1988 = var1990
		var1987 = var1991
		
		if var1988 == protoModule.wireTypes.varint then
			local _ = nil
			local var1993, var1994 = protoModule.readVarInt(p99, var1987)
			local _ = var1993
			var1987 = var1994
			continue
		end
		if var1988 == protoModule.wireTypes.lengthDelimited then
			if var1992 == 1 then
				local _ = nil
				local var1995, var1996 = protoModule.readBuffer(p99, var1987)
				var1987 = var1996
				var1986.community_id = propTypesModule.StringProp.decode(var1995)
			else
				local _ = nil
				local var1997, var1998 = protoModule.readVarInt(p99, var1987)
				var1987 = var1998 + var1997
			end
		elseif var1988 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1999, var2000 = protoModule.readFixed32(p99, var1987)
			local _ = var1999
			var1987 = var2000
		elseif var1988 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2001, var2002 = protoModule.readFixed64(p99, var1987)
			local _ = var2001
			var1987 = var2002
		else
			error("Unsupported wire type: " .. var3315)
		end
	end
	return var1986
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
	local var2003 = t_99.new()
	
	if self.community_id ~= nil then
		var2003.community_id = propTypesModule.StringProp.jsonDecode(self.community_id)
	end
	if self.communityId ~= nil then
		var2003.community_id = propTypesModule.StringProp.jsonDecode(self.communityId)
	end
	return var2003
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
	local var2003 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2004, var2005 = protoModule.writeTag(buff, var2003, 1, protoModule.wireTypes.varint)
		var2004, var3335 = protoModule.writeVarInt(var2004, var2005, t.ActionType.toNumber(self.action_type))
		buff = var2004
		var2003 = var2005
	end
	if self.action_params ~= nil then
		local var2006 = self.action_params:encode()
		local var2007, var2008 = protoModule.writeTag(buff, var2003, 2, protoModule.wireTypes.lengthDelimited)
		var2007, var3338 = protoModule.writeBuffer(var2007, var2008, var2006, buffer.len(var2006))
		buff = var2007
		var2003 = var2008
	end
	local buff_1 = buffer.create(var2003)
	buffer.copy(buff_1, 0, buff, 0, var2003)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var2003 = t_100.new()
	local var2004 = 0
	while var2004 < buffer.len(p100) do
		local _ = nil
		local var2005 = nil
		local var2006, var2007, var2008 = protoModule.readTag(p100, var2004)
		local var2009 = var2006
		var2005 = var2007
		var2004 = var2008
		
		if var2005 == protoModule.wireTypes.varint then
			if var2009 == 1 then
				local _ = nil
				local var2010, var2011 = protoModule.readVarIntI32(p100, var2004)
				local var2012 = var2010
				var2004 = var2011
				var2003.action_type = t.ActionType.fromNumber(var2012) or var2012
			else
				local _ = nil
				local var2013, var2014 = protoModule.readVarInt(p100, var2004)
				local _ = var2013
				var2004 = var2014
			end
		end
		if var2005 == protoModule.wireTypes.lengthDelimited then
			if var2009 == 2 then
				local _ = nil
				local var2015, var2016 = protoModule.readBuffer(p100, var2004)
				var2004 = var2016
				var2003.action_params = t.ViewCommunityAction_Params.decode(var2015)
			else
				local _ = nil
				local var2017, var2018 = protoModule.readVarInt(p100, var2004)
				var2004 = var2018 + var2017
			end
		elseif var2005 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2019, var2020 = protoModule.readFixed32(p100, var2004)
			local _ = var2019
			var2004 = var2020
		elseif var2005 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2021, var2022 = protoModule.readFixed64(p100, var2004)
			local _ = var2021
			var2004 = var2022
		else
			error("Unsupported wire type: " .. var3342)
		end
	end
	return var2003
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
	local var2023 = t_100.new()
	
	if self.action_type ~= nil then
		var2023.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2023.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2023.action_params = t.ViewCommunityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2023.action_params = t.ViewCommunityAction_Params.jsonDecode(self.actionParams)
	end
	return var2023
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
	local var2023 = 0
	
	if self.community_id ~= nil then
		local var2024 = self.community_id:encode()
		local var2025, var2026 = protoModule.writeTag(buff, var2023, 1, protoModule.wireTypes.lengthDelimited)
		var2025, var3366 = protoModule.writeBuffer(var2025, var2026, var2024, buffer.len(var2024))
		buff = var2025
		var2023 = var2026
	end
	local buff_1 = buffer.create(var2023)
	buffer.copy(buff_1, 0, buff, 0, var2023)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref), propTypesModule (ref)
	local var2023 = t_101.new()
	local var2024 = 0
	while var2024 < buffer.len(p101) do
		local _ = nil
		local var2025 = nil
		local var2026, var2027, var2028 = protoModule.readTag(p101, var2024)
		local var2029 = var2026
		var2025 = var2027
		var2024 = var2028
		
		if var2025 == protoModule.wireTypes.varint then
			local _ = nil
			local var2030, var2031 = protoModule.readVarInt(p101, var2024)
			local _ = var2030
			var2024 = var2031
			continue
		end
		if var2025 == protoModule.wireTypes.lengthDelimited then
			if var2029 == 1 then
				local _ = nil
				local var2032, var2033 = protoModule.readBuffer(p101, var2024)
				var2024 = var2033
				var2023.community_id = propTypesModule.StringProp.decode(var2032)
			else
				local _ = nil
				local var2034, var2035 = protoModule.readVarInt(p101, var2024)
				var2024 = var2035 + var2034
			end
		elseif var2025 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2036, var2037 = protoModule.readFixed32(p101, var2024)
			local _ = var2036
			var2024 = var2037
		elseif var2025 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2038, var2039 = protoModule.readFixed64(p101, var2024)
			local _ = var2038
			var2024 = var2039
		else
			error("Unsupported wire type: " .. var3370)
		end
	end
	return var2023
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
	local var2040 = t_101.new()
	
	if self.community_id ~= nil then
		var2040.community_id = propTypesModule.StringProp.jsonDecode(self.community_id)
	end
	if self.communityId ~= nil then
		var2040.community_id = propTypesModule.StringProp.jsonDecode(self.communityId)
	end
	return var2040
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
	local var2040 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2041, var2042 = protoModule.writeTag(buff, var2040, 1, protoModule.wireTypes.varint)
		var2041, var3390 = protoModule.writeVarInt(var2041, var2042, t.ActionType.toNumber(self.action_type))
		buff = var2041
		var2040 = var2042
	end
	if self.action_params ~= nil then
		local var2043 = self.action_params:encode()
		local var2044, var2045 = protoModule.writeTag(buff, var2040, 2, protoModule.wireTypes.lengthDelimited)
		var2044, var3393 = protoModule.writeBuffer(var2044, var2045, var2043, buffer.len(var2043))
		buff = var2044
		var2040 = var2045
	end
	local buff_1 = buffer.create(var2040)
	buffer.copy(buff_1, 0, buff, 0, var2040)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref), t (ref)
	local var2040 = t_102.new()
	local var2041 = 0
	while var2041 < buffer.len(p102) do
		local _ = nil
		local var2042 = nil
		local var2043, var2044, var2045 = protoModule.readTag(p102, var2041)
		local var2046 = var2043
		var2042 = var2044
		var2041 = var2045
		
		if var2042 == protoModule.wireTypes.varint then
			if var2046 == 1 then
				local _ = nil
				local var2047, var2048 = protoModule.readVarIntI32(p102, var2041)
				local var2049 = var2047
				var2041 = var2048
				var2040.action_type = t.ActionType.fromNumber(var2049) or var2049
			else
				local _ = nil
				local var2050, var2051 = protoModule.readVarInt(p102, var2041)
				local _ = var2050
				var2041 = var2051
			end
		end
		if var2042 == protoModule.wireTypes.lengthDelimited then
			if var2046 == 2 then
				local _ = nil
				local var2052, var2053 = protoModule.readBuffer(p102, var2041)
				var2041 = var2053
				var2040.action_params = t.AnalyticsEventAction_Params.decode(var2052)
			else
				local _ = nil
				local var2054, var2055 = protoModule.readVarInt(p102, var2041)
				var2041 = var2055 + var2054
			end
		elseif var2042 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2056, var2057 = protoModule.readFixed32(p102, var2041)
			local _ = var2056
			var2041 = var2057
		elseif var2042 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2058, var2059 = protoModule.readFixed64(p102, var2041)
			local _ = var2058
			var2041 = var2059
		else
			error("Unsupported wire type: " .. var3397)
		end
	end
	return var2040
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
	local var2060 = t_102.new()
	
	if self.action_type ~= nil then
		var2060.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2060.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2060.action_params = t.AnalyticsEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2060.action_params = t.AnalyticsEventAction_Params.jsonDecode(self.actionParams)
	end
	return var2060
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
	local var2060 = 0
	
	if self.event_name ~= nil then
		local var2061 = self.event_name:encode()
		local var2062, var2063 = protoModule.writeTag(buff, var2060, 1, protoModule.wireTypes.lengthDelimited)
		var2062, var3421 = protoModule.writeBuffer(var2062, var2063, var2061, buffer.len(var2061))
		buff = var2062
		var2060 = var2063
	end
	if self.event_fields ~= nil then
		local var2064 = self.event_fields:encode()
		local var2065, var2066 = protoModule.writeTag(buff, var2060, 2, protoModule.wireTypes.lengthDelimited)
		var2065, var3424 = protoModule.writeBuffer(var2065, var2066, var2064, buffer.len(var2064))
		buff = var2065
		var2060 = var2066
	end
	local buff_1 = buffer.create(var2060)
	buffer.copy(buff_1, 0, buff, 0, var2060)
	
	return buff_1
end

function t_103.decode(p103)
	-- upvalues: t_103 (ref), protoModule (ref), propTypesModule (ref)
	local var2060 = t_103.new()
	local var2061 = 0
	while var2061 < buffer.len(p103) do
		local _ = nil
		local var2062 = nil
		local var2063, var2064, var2065 = protoModule.readTag(p103, var2061)
		local var2066 = var2063
		var2062 = var2064
		var2061 = var2065
		
		if var2062 == protoModule.wireTypes.varint then
			local _ = nil
			local var2067, var2068 = protoModule.readVarInt(p103, var2061)
			local _ = var2067
			var2061 = var2068
			continue
		end
		if var2062 == protoModule.wireTypes.lengthDelimited then
			if var2066 == 1 then
				local _ = nil
				local var2069, var2070 = protoModule.readBuffer(p103, var2061)
				var2061 = var2070
				var2060.event_name = propTypesModule.StringProp.decode(var2069)
			elseif var2066 == 2 then
				local _ = nil
				local var2071, var2072 = protoModule.readBuffer(p103, var2061)
				var2061 = var2072
				var2060.event_fields = propTypesModule.StructProp.decode(var2071)
			else
				local _ = nil
				local var2073, var2074 = protoModule.readVarInt(p103, var2061)
				var2061 = var2074 + var2073
			end
		elseif var2062 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2075, var2076 = protoModule.readFixed32(p103, var2061)
			local _ = var2075
			var2061 = var2076
		elseif var2062 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2077, var2078 = protoModule.readFixed64(p103, var2061)
			local _ = var2077
			var2061 = var2078
		else
			error("Unsupported wire type: " .. var3428)
		end
	end
	return var2060
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
	local var2079 = t_103.new()
	
	if self.event_name ~= nil then
		var2079.event_name = propTypesModule.StringProp.jsonDecode(self.event_name)
	end
	if self.eventName ~= nil then
		var2079.event_name = propTypesModule.StringProp.jsonDecode(self.eventName)
	end
	if self.event_fields ~= nil then
		var2079.event_fields = propTypesModule.StructProp.jsonDecode(self.event_fields)
	end
	if self.eventFields ~= nil then
		var2079.event_fields = propTypesModule.StructProp.jsonDecode(self.eventFields)
	end
	return var2079
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
	local var2079 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2080, var2081 = protoModule.writeTag(buff, var2079, 1, protoModule.wireTypes.varint)
		var2080, var3450 = protoModule.writeVarInt(var2080, var2081, t.ActionType.toNumber(self.action_type))
		buff = var2080
		var2079 = var2081
	end
	if self.action_params ~= nil then
		local var2082 = self.action_params:encode()
		local var2083, var2084 = protoModule.writeTag(buff, var2079, 2, protoModule.wireTypes.lengthDelimited)
		var2083, var3453 = protoModule.writeBuffer(var2083, var2084, var2082, buffer.len(var2082))
		buff = var2083
		var2079 = var2084
	end
	local buff_1 = buffer.create(var2079)
	buffer.copy(buff_1, 0, buff, 0, var2079)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref), t (ref)
	local var2079 = t_104.new()
	local var2080 = 0
	while var2080 < buffer.len(p104) do
		local _ = nil
		local var2081 = nil
		local var2082, var2083, var2084 = protoModule.readTag(p104, var2080)
		local var2085 = var2082
		var2081 = var2083
		var2080 = var2084
		
		if var2081 == protoModule.wireTypes.varint then
			if var2085 == 1 then
				local _ = nil
				local var2086, var2087 = protoModule.readVarIntI32(p104, var2080)
				local var2088 = var2086
				var2080 = var2087
				var2079.action_type = t.ActionType.fromNumber(var2088) or var2088
			else
				local _ = nil
				local var2089, var2090 = protoModule.readVarInt(p104, var2080)
				local _ = var2089
				var2080 = var2090
			end
		end
		if var2081 == protoModule.wireTypes.lengthDelimited then
			if var2085 == 2 then
				local _ = nil
				local var2091, var2092 = protoModule.readBuffer(p104, var2080)
				var2080 = var2092
				var2079.action_params = t.CustomAnalyticsEventAction_Params.decode(var2091)
			else
				local _ = nil
				local var2093, var2094 = protoModule.readVarInt(p104, var2080)
				var2080 = var2094 + var2093
			end
		elseif var2081 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2095, var2096 = protoModule.readFixed32(p104, var2080)
			local _ = var2095
			var2080 = var2096
		elseif var2081 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2097, var2098 = protoModule.readFixed64(p104, var2080)
			local _ = var2097
			var2080 = var2098
		else
			error("Unsupported wire type: " .. var3457)
		end
	end
	return var2079
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
	local var2099 = t_104.new()
	
	if self.action_type ~= nil then
		var2099.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2099.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2099.action_params = t.CustomAnalyticsEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2099.action_params = t.CustomAnalyticsEventAction_Params.jsonDecode(self.actionParams)
	end
	return var2099
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
	local var2099 = 0
	
	if self.event_name ~= nil then
		local var2100 = self.event_name:encode()
		local var2101, var2102 = protoModule.writeTag(buff, var2099, 1, protoModule.wireTypes.lengthDelimited)
		var2101, var3481 = protoModule.writeBuffer(var2101, var2102, var2100, buffer.len(var2100))
		buff = var2101
		var2099 = var2102
	end
	if self.event_fields ~= nil then
		local var2103 = self.event_fields:encode()
		local var2104, var2105 = protoModule.writeTag(buff, var2099, 2, protoModule.wireTypes.lengthDelimited)
		var2104, var3484 = protoModule.writeBuffer(var2104, var2105, var2103, buffer.len(var2103))
		buff = var2104
		var2099 = var2105
	end
	local buff_1 = buffer.create(var2099)
	buffer.copy(buff_1, 0, buff, 0, var2099)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref), propTypesModule (ref)
	local var2099 = t_105.new()
	local var2100 = 0
	while var2100 < buffer.len(p105) do
		local _ = nil
		local var2101 = nil
		local var2102, var2103, var2104 = protoModule.readTag(p105, var2100)
		local var2105 = var2102
		var2101 = var2103
		var2100 = var2104
		
		if var2101 == protoModule.wireTypes.varint then
			local _ = nil
			local var2106, var2107 = protoModule.readVarInt(p105, var2100)
			local _ = var2106
			var2100 = var2107
			continue
		end
		if var2101 == protoModule.wireTypes.lengthDelimited then
			if var2105 == 1 then
				local _ = nil
				local var2108, var2109 = protoModule.readBuffer(p105, var2100)
				var2100 = var2109
				var2099.event_name = propTypesModule.StringProp.decode(var2108)
			elseif var2105 == 2 then
				local _ = nil
				local var2110, var2111 = protoModule.readBuffer(p105, var2100)
				var2100 = var2111
				var2099.event_fields = propTypesModule.StructProp.decode(var2110)
			else
				local _ = nil
				local var2112, var2113 = protoModule.readVarInt(p105, var2100)
				var2100 = var2113 + var2112
			end
		elseif var2101 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2114, var2115 = protoModule.readFixed32(p105, var2100)
			local _ = var2114
			var2100 = var2115
		elseif var2101 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2116, var2117 = protoModule.readFixed64(p105, var2100)
			local _ = var2116
			var2100 = var2117
		else
			error("Unsupported wire type: " .. var3488)
		end
	end
	return var2099
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
	local var2118 = t_105.new()
	
	if self.event_name ~= nil then
		var2118.event_name = propTypesModule.StringProp.jsonDecode(self.event_name)
	end
	if self.eventName ~= nil then
		var2118.event_name = propTypesModule.StringProp.jsonDecode(self.eventName)
	end
	if self.event_fields ~= nil then
		var2118.event_fields = propTypesModule.StructProp.jsonDecode(self.event_fields)
	end
	if self.eventFields ~= nil then
		var2118.event_fields = propTypesModule.StructProp.jsonDecode(self.eventFields)
	end
	return var2118
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
	local var2118 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2119, var2120 = protoModule.writeTag(buff, var2118, 1, protoModule.wireTypes.varint)
		var2119, var3510 = protoModule.writeVarInt(var2119, var2120, t.ActionType.toNumber(self.action_type))
		buff = var2119
		var2118 = var2120
	end
	if self.action_params ~= nil then
		local var2121 = self.action_params:encode()
		local var2122, var2123 = protoModule.writeTag(buff, var2118, 2, protoModule.wireTypes.lengthDelimited)
		var2122, var3513 = protoModule.writeBuffer(var2122, var2123, var2121, buffer.len(var2121))
		buff = var2122
		var2118 = var2123
	end
	local buff_1 = buffer.create(var2118)
	buffer.copy(buff_1, 0, buff, 0, var2118)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref), t (ref)
	local var2118 = t_106.new()
	local var2119 = 0
	while var2119 < buffer.len(p106) do
		local _ = nil
		local var2120 = nil
		local var2121, var2122, var2123 = protoModule.readTag(p106, var2119)
		local var2124 = var2121
		var2120 = var2122
		var2119 = var2123
		
		if var2120 == protoModule.wireTypes.varint then
			if var2124 == 1 then
				local _ = nil
				local var2125, var2126 = protoModule.readVarIntI32(p106, var2119)
				local var2127 = var2125
				var2119 = var2126
				var2118.action_type = t.ActionType.fromNumber(var2127) or var2127
			else
				local _ = nil
				local var2128, var2129 = protoModule.readVarInt(p106, var2119)
				local _ = var2128
				var2119 = var2129
			end
		end
		if var2120 == protoModule.wireTypes.lengthDelimited then
			if var2124 == 2 then
				local _ = nil
				local var2130, var2131 = protoModule.readBuffer(p106, var2119)
				var2119 = var2131
				var2118.action_params = t.OpenGameInviteAction_Params.decode(var2130)
			else
				local _ = nil
				local var2132, var2133 = protoModule.readVarInt(p106, var2119)
				var2119 = var2133 + var2132
			end
		elseif var2120 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2134, var2135 = protoModule.readFixed32(p106, var2119)
			local _ = var2134
			var2119 = var2135
		elseif var2120 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2136, var2137 = protoModule.readFixed64(p106, var2119)
			local _ = var2136
			var2119 = var2137
		else
			error("Unsupported wire type: " .. var3517)
		end
	end
	return var2118
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
	local var2138 = t_106.new()
	
	if self.action_type ~= nil then
		var2138.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2138.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2138.action_params = t.OpenGameInviteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2138.action_params = t.OpenGameInviteAction_Params.jsonDecode(self.actionParams)
	end
	return var2138
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
	local var2138 = 0
	
	if self.universe_id ~= nil then
		local var2139 = self.universe_id:encode()
		local var2140, var2141 = protoModule.writeTag(buff, var2138, 1, protoModule.wireTypes.lengthDelimited)
		var2140, var3541 = protoModule.writeBuffer(var2140, var2141, var2139, buffer.len(var2139))
		buff = var2140
		var2138 = var2141
	end
	if self.root_place_id ~= nil then
		local var2142 = self.root_place_id:encode()
		local var2143, var2144 = protoModule.writeTag(buff, var2138, 2, protoModule.wireTypes.lengthDelimited)
		var2143, var3544 = protoModule.writeBuffer(var2143, var2144, var2142, buffer.len(var2142))
		buff = var2143
		var2138 = var2144
	end
	if self.trigger ~= nil then
		local var2145 = self.trigger:encode()
		local var2146, var2147 = protoModule.writeTag(buff, var2138, 3, protoModule.wireTypes.lengthDelimited)
		var2146, var3547 = protoModule.writeBuffer(var2146, var2147, var2145, buffer.len(var2145))
		buff = var2146
		var2138 = var2147
	end
	if self.button_name ~= nil then
		local var2148 = self.button_name:encode()
		local var2149, var2150 = protoModule.writeTag(buff, var2138, 4, protoModule.wireTypes.lengthDelimited)
		var2149, var3550 = protoModule.writeBuffer(var2149, var2150, var2148, buffer.len(var2148))
		buff = var2149
		var2138 = var2150
	end
	local buff_1 = buffer.create(var2138)
	buffer.copy(buff_1, 0, buff, 0, var2138)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref), propTypesModule (ref)
	local var2138 = t_107.new()
	local var2139 = 0
	while var2139 < buffer.len(p107) do
		local _ = nil
		local var2140 = nil
		local var2141, var2142, var2143 = protoModule.readTag(p107, var2139)
		local var2144 = var2141
		var2140 = var2142
		var2139 = var2143
		
		if var2140 == protoModule.wireTypes.varint then
			local _ = nil
			local var2145, var2146 = protoModule.readVarInt(p107, var2139)
			local _ = var2145
			var2139 = var2146
			continue
		end
		if var2140 == protoModule.wireTypes.lengthDelimited then
			if var2144 == 1 then
				local _ = nil
				local var2147, var2148 = protoModule.readBuffer(p107, var2139)
				var2139 = var2148
				var2138.universe_id = propTypesModule.StringProp.decode(var2147)
			elseif var2144 == 2 then
				local _ = nil
				local var2149, var2150 = protoModule.readBuffer(p107, var2139)
				var2139 = var2150
				var2138.root_place_id = propTypesModule.StringProp.decode(var2149)
			elseif var2144 == 3 then
				local _ = nil
				local var2151, var2152 = protoModule.readBuffer(p107, var2139)
				var2139 = var2152
				var2138.trigger = propTypesModule.StringProp.decode(var2151)
			elseif var2144 == 4 then
				local _ = nil
				local var2153, var2154 = protoModule.readBuffer(p107, var2139)
				var2139 = var2154
				var2138.button_name = propTypesModule.StringProp.decode(var2153)
			else
				local _ = nil
				local var2155, var2156 = protoModule.readVarInt(p107, var2139)
				var2139 = var2156 + var2155
			end
		elseif var2140 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2157, var2158 = protoModule.readFixed32(p107, var2139)
			local _ = var2157
			var2139 = var2158
		elseif var2140 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2159, var2160 = protoModule.readFixed64(p107, var2139)
			local _ = var2159
			var2139 = var2160
		else
			error("Unsupported wire type: " .. var3554)
		end
	end
	return var2138
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
	local var2161 = t_107.new()
	
	if self.universe_id ~= nil then
		var2161.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2161.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.root_place_id ~= nil then
		var2161.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var2161.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	if self.trigger ~= nil then
		var2161.trigger = propTypesModule.StringProp.jsonDecode(self.trigger)
	end
	if self.button_name ~= nil then
		var2161.button_name = propTypesModule.StringProp.jsonDecode(self.button_name)
	end
	if self.buttonName ~= nil then
		var2161.button_name = propTypesModule.StringProp.jsonDecode(self.buttonName)
	end
	return var2161
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
	local var2161 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2162, var2163 = protoModule.writeTag(buff, var2161, 1, protoModule.wireTypes.varint)
		var2162, var3580 = protoModule.writeVarInt(var2162, var2163, t.ActionType.toNumber(self.action_type))
		buff = var2162
		var2161 = var2163
	end
	if self.action_params ~= nil then
		local var2164 = self.action_params:encode()
		local var2165, var2166 = protoModule.writeTag(buff, var2161, 2, protoModule.wireTypes.lengthDelimited)
		var2165, var3583 = protoModule.writeBuffer(var2165, var2166, var2164, buffer.len(var2164))
		buff = var2165
		var2161 = var2166
	end
	local buff_1 = buffer.create(var2161)
	buffer.copy(buff_1, 0, buff, 0, var2161)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref), t (ref)
	local var2161 = t_108.new()
	local var2162 = 0
	while var2162 < buffer.len(p108) do
		local _ = nil
		local var2163 = nil
		local var2164, var2165, var2166 = protoModule.readTag(p108, var2162)
		local var2167 = var2164
		var2163 = var2165
		var2162 = var2166
		
		if var2163 == protoModule.wireTypes.varint then
			if var2167 == 1 then
				local _ = nil
				local var2168, var2169 = protoModule.readVarIntI32(p108, var2162)
				local var2170 = var2168
				var2162 = var2169
				var2161.action_type = t.ActionType.fromNumber(var2170) or var2170
			else
				local _ = nil
				local var2171, var2172 = protoModule.readVarInt(p108, var2162)
				local _ = var2171
				var2162 = var2172
			end
		end
		if var2163 == protoModule.wireTypes.lengthDelimited then
			if var2167 == 2 then
				local _ = nil
				local var2173, var2174 = protoModule.readBuffer(p108, var2162)
				var2162 = var2174
				var2161.action_params = t.LaunchExperienceAction_Params.decode(var2173)
			else
				local _ = nil
				local var2175, var2176 = protoModule.readVarInt(p108, var2162)
				var2162 = var2176 + var2175
			end
		elseif var2163 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2177, var2178 = protoModule.readFixed32(p108, var2162)
			local _ = var2177
			var2162 = var2178
		elseif var2163 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2179, var2180 = protoModule.readFixed64(p108, var2162)
			local _ = var2179
			var2162 = var2180
		else
			error("Unsupported wire type: " .. var3587)
		end
	end
	return var2161
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
	local var2181 = t_108.new()
	
	if self.action_type ~= nil then
		var2181.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2181.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2181.action_params = t.LaunchExperienceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2181.action_params = t.LaunchExperienceAction_Params.jsonDecode(self.actionParams)
	end
	return var2181
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
	local var2181 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2182 = self.kind.value:encode()
			local var2183, var2184 = protoModule.writeTag(buff, var2181, 1, protoModule.wireTypes.lengthDelimited)
			var2183, var3611 = protoModule.writeBuffer(var2183, var2184, var2182, buffer.len(var2182))
			buff = var2183
			var2181 = var2184
		elseif self.kind.type == "binding_path" then
			local var2185, var2186 = protoModule.writeTag(buff, var2181, 2, protoModule.wireTypes.lengthDelimited)
			var2185, var3613 = protoModule.writeString(var2185, var2186, self.kind.value)
			buff = var2185
			var2181 = var2186
		end
	end
	local buff_1 = buffer.create(var2181)
	buffer.copy(buff_1, 0, buff, 0, var2181)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref), t (ref)
	local var2181 = t_109.new()
	local var2182 = 0
	while var2182 < buffer.len(p109) do
		local _ = nil
		local var2183 = nil
		local var2184, var2185, var2186 = protoModule.readTag(p109, var2182)
		local var2187 = var2184
		var2183 = var2185
		var2182 = var2186
		
		if var2183 == protoModule.wireTypes.varint then
			local _ = nil
			local var2188, var2189 = protoModule.readVarInt(p109, var2182)
			local _ = var2188
			var2182 = var2189
			continue
		end
		if var2183 == protoModule.wireTypes.lengthDelimited then
			if var2187 == 1 then
				local _ = nil
				local var2190, var2191 = protoModule.readBuffer(p109, var2182)
				var2182 = var2191
				var2181.kind = {
					type = "literal",
					value = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral.decode(var2190)
				}
			elseif var2187 == 2 then
				local _ = nil
				local var2192, var2193 = protoModule.readBuffer(p109, var2182)
				var2182 = var2193
				var2181.kind = { type = "binding_path", value = buffer.tostring(var2192) }
			else
				local _ = nil
				local var2194, var2195 = protoModule.readVarInt(p109, var2182)
				var2182 = var2195 + var2194
			end
		elseif var2183 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2196, var2197 = protoModule.readFixed32(p109, var2182)
			local _ = var2196
			var2182 = var2197
		elseif var2183 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2198, var2199 = protoModule.readFixed64(p109, var2182)
			local _ = var2198
			var2182 = var2199
		else
			error("Unsupported wire type: " .. var3617)
		end
	end
	return var2181
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
	local var2200 = t_109.new()
	
	if self.literal ~= nil then
		var2200.kind = {
			type = "literal",
			value = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2200.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2200.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2200
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
	local var2200 = 0
	
	if self.launch_data ~= nil then
		local var2201 = self.launch_data:encode()
		local var2202, var2203 = protoModule.writeTag(buff, var2200, 1, protoModule.wireTypes.lengthDelimited)
		var2202, var3640 = protoModule.writeBuffer(var2202, var2203, var2201, buffer.len(var2201))
		buff = var2202
		var2200 = var2203
	end
	if self.event_id ~= nil then
		local var2204 = self.event_id:encode()
		local var2205, var2206 = protoModule.writeTag(buff, var2200, 2, protoModule.wireTypes.lengthDelimited)
		var2205, var3643 = protoModule.writeBuffer(var2205, var2206, var2204, buffer.len(var2204))
		buff = var2205
		var2200 = var2206
	end
	local buff_1 = buffer.create(var2200)
	buffer.copy(buff_1, 0, buff, 0, var2200)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref), propTypesModule (ref)
	local var2200 = t_110.new()
	local var2201 = 0
	while var2201 < buffer.len(p110) do
		local _ = nil
		local var2202 = nil
		local var2203, var2204, var2205 = protoModule.readTag(p110, var2201)
		local var2206 = var2203
		var2202 = var2204
		var2201 = var2205
		
		if var2202 == protoModule.wireTypes.varint then
			local _ = nil
			local var2207, var2208 = protoModule.readVarInt(p110, var2201)
			local _ = var2207
			var2201 = var2208
			continue
		end
		if var2202 == protoModule.wireTypes.lengthDelimited then
			if var2206 == 1 then
				local _ = nil
				local var2209, var2210 = protoModule.readBuffer(p110, var2201)
				var2201 = var2210
				var2200.launch_data = propTypesModule.StringProp.decode(var2209)
			elseif var2206 == 2 then
				local _ = nil
				local var2211, var2212 = protoModule.readBuffer(p110, var2201)
				var2201 = var2212
				var2200.event_id = propTypesModule.StringProp.decode(var2211)
			else
				local _ = nil
				local var2213, var2214 = protoModule.readVarInt(p110, var2201)
				var2201 = var2214 + var2213
			end
		elseif var2202 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2215, var2216 = protoModule.readFixed32(p110, var2201)
			local _ = var2215
			var2201 = var2216
		elseif var2202 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2217, var2218 = protoModule.readFixed64(p110, var2201)
			local _ = var2217
			var2201 = var2218
		else
			error("Unsupported wire type: " .. var3647)
		end
	end
	return var2200
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
	local var2219 = t_110.new()
	
	if self.launch_data ~= nil then
		var2219.launch_data = propTypesModule.StringProp.jsonDecode(self.launch_data)
	end
	if self.launchData ~= nil then
		var2219.launch_data = propTypesModule.StringProp.jsonDecode(self.launchData)
	end
	if self.event_id ~= nil then
		var2219.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var2219.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var2219
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
	local var2219 = 0
	
	if self.place_id ~= nil then
		local var2220 = self.place_id:encode()
		local var2221, var2222 = protoModule.writeTag(buff, var2219, 1, protoModule.wireTypes.lengthDelimited)
		var2221, var3670 = protoModule.writeBuffer(var2221, var2222, var2220, buffer.len(var2220))
		buff = var2221
		var2219 = var2222
	end
	if self.universe_id ~= nil then
		local var2223 = self.universe_id:encode()
		local var2224, var2225 = protoModule.writeTag(buff, var2219, 2, protoModule.wireTypes.lengthDelimited)
		var2224, var3673 = protoModule.writeBuffer(var2224, var2225, var2223, buffer.len(var2223))
		buff = var2224
		var2219 = var2225
	end
	if self.launch_source ~= nil then
		local var2226 = self.launch_source:encode()
		local var2227, var2228 = protoModule.writeTag(buff, var2219, 3, protoModule.wireTypes.lengthDelimited)
		var2227, var3676 = protoModule.writeBuffer(var2227, var2228, var2226, buffer.len(var2226))
		buff = var2227
		var2219 = var2228
	end
	if self.experience_join_data ~= nil then
		local var2229 = self.experience_join_data:encode()
		local var2230, var2231 = protoModule.writeTag(buff, var2219, 4, protoModule.wireTypes.lengthDelimited)
		var2230, var3679 = protoModule.writeBuffer(var2230, var2231, var2229, buffer.len(var2229))
		buff = var2230
		var2219 = var2231
	end
	local buff_1 = buffer.create(var2219)
	buffer.copy(buff_1, 0, buff, 0, var2219)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var2219 = t_111.new()
	local var2220 = 0
	while var2220 < buffer.len(p111) do
		local _ = nil
		local var2221 = nil
		local var2222, var2223, var2224 = protoModule.readTag(p111, var2220)
		local var2225 = var2222
		var2221 = var2223
		var2220 = var2224
		
		if var2221 == protoModule.wireTypes.varint then
			local _ = nil
			local var2226, var2227 = protoModule.readVarInt(p111, var2220)
			local _ = var2226
			var2220 = var2227
			continue
		end
		if var2221 == protoModule.wireTypes.lengthDelimited then
			if var2225 == 1 then
				local _ = nil
				local var2228, var2229 = protoModule.readBuffer(p111, var2220)
				var2220 = var2229
				var2219.place_id = propTypesModule.StringProp.decode(var2228)
			elseif var2225 == 2 then
				local _ = nil
				local var2230, var2231 = protoModule.readBuffer(p111, var2220)
				var2220 = var2231
				var2219.universe_id = propTypesModule.StringProp.decode(var2230)
			elseif var2225 == 3 then
				local _ = nil
				local var2232, var2233 = protoModule.readBuffer(p111, var2220)
				var2220 = var2233
				var2219.launch_source = propTypesModule.StringProp.decode(var2232)
			elseif var2225 == 4 then
				local _ = nil
				local var2234, var2235 = protoModule.readBuffer(p111, var2220)
				var2220 = var2235
				var2219.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.decode(var2234)
			else
				local _ = nil
				local var2236, var2237 = protoModule.readVarInt(p111, var2220)
				var2220 = var2237 + var2236
			end
		elseif var2221 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2238, var2239 = protoModule.readFixed32(p111, var2220)
			local _ = var2238
			var2220 = var2239
		elseif var2221 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2240, var2241 = protoModule.readFixed64(p111, var2220)
			local _ = var2240
			var2220 = var2241
		else
			error("Unsupported wire type: " .. var3683)
		end
	end
	return var2219
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
	local var2242 = t_111.new()
	
	if self.place_id ~= nil then
		var2242.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var2242.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var2242.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2242.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.launch_source ~= nil then
		var2242.launch_source = propTypesModule.StringProp.jsonDecode(self.launch_source)
	end
	if self.launchSource ~= nil then
		var2242.launch_source = propTypesModule.StringProp.jsonDecode(self.launchSource)
	end
	if self.experience_join_data ~= nil then
		var2242.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experience_join_data)
	end
	if self.experienceJoinData ~= nil then
		var2242.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experienceJoinData)
	end
	return var2242
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
	local var2242 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2243, var2244 = protoModule.writeTag(buff, var2242, 1, protoModule.wireTypes.varint)
		var2243, var3709 = protoModule.writeVarInt(var2243, var2244, t.ActionType.toNumber(self.action_type))
		buff = var2243
		var2242 = var2244
	end
	if self.action_params ~= nil then
		local var2245 = self.action_params:encode()
		local var2246, var2247 = protoModule.writeTag(buff, var2242, 2, protoModule.wireTypes.lengthDelimited)
		var2246, var3712 = protoModule.writeBuffer(var2246, var2247, var2245, buffer.len(var2245))
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
				var2242.action_params = t.ToggleExperienceFavoriteAction_Params.decode(var2254)
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
			error("Unsupported wire type: " .. var3716)
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
		var2262.action_params = t.ToggleExperienceFavoriteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2262.action_params = t.ToggleExperienceFavoriteAction_Params.jsonDecode(self.actionParams)
	end
	return var2262
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
	local var2262 = 0
	
	if self.universe_id ~= nil then
		local var2263 = self.universe_id:encode()
		local var2264, var2265 = protoModule.writeTag(buff, var2262, 1, protoModule.wireTypes.lengthDelimited)
		var2264, var3740 = protoModule.writeBuffer(var2264, var2265, var2263, buffer.len(var2263))
		buff = var2264
		var2262 = var2265
	end
	if self.place_id ~= nil then
		local var2266 = self.place_id:encode()
		local var2267, var2268 = protoModule.writeTag(buff, var2262, 2, protoModule.wireTypes.lengthDelimited)
		var2267, var3743 = protoModule.writeBuffer(var2267, var2268, var2266, buffer.len(var2266))
		buff = var2267
		var2262 = var2268
	end
	if self.ctx ~= nil then
		local var2269 = self.ctx:encode()
		local var2270, var2271 = protoModule.writeTag(buff, var2262, 3, protoModule.wireTypes.lengthDelimited)
		var2270, var3746 = protoModule.writeBuffer(var2270, var2271, var2269, buffer.len(var2269))
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
				var2262.place_id = propTypesModule.StringProp.decode(var2273)
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
			error("Unsupported wire type: " .. var3750)
		end
	end
	return var2262
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
	local var2283 = t_113.new()
	
	if self.universe_id ~= nil then
		var2283.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2283.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		var2283.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var2283.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.ctx ~= nil then
		var2283.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var2283
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
	local var2283 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2284, var2285 = protoModule.writeTag(buff, var2283, 1, protoModule.wireTypes.varint)
		var2284, var3774 = protoModule.writeVarInt(var2284, var2285, t.ActionType.toNumber(self.action_type))
		buff = var2284
		var2283 = var2285
	end
	if self.action_params ~= nil then
		local var2286 = self.action_params:encode()
		local var2287, var2288 = protoModule.writeTag(buff, var2283, 2, protoModule.wireTypes.lengthDelimited)
		var2287, var3777 = protoModule.writeBuffer(var2287, var2288, var2286, buffer.len(var2286))
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
				var2283.action_params = t.ToggleExperienceFollowAction_Params.decode(var2295)
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
			error("Unsupported wire type: " .. var3781)
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
		var2303.action_params = t.ToggleExperienceFollowAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2303.action_params = t.ToggleExperienceFollowAction_Params.jsonDecode(self.actionParams)
	end
	return var2303
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
	local var2303 = 0
	
	if self.universe_id ~= nil then
		local var2304 = self.universe_id:encode()
		local var2305, var2306 = protoModule.writeTag(buff, var2303, 1, protoModule.wireTypes.lengthDelimited)
		var2305, var3805 = protoModule.writeBuffer(var2305, var2306, var2304, buffer.len(var2304))
		buff = var2305
		var2303 = var2306
	end
	if self.game_name ~= nil then
		local var2307 = self.game_name:encode()
		local var2308, var2309 = protoModule.writeTag(buff, var2303, 2, protoModule.wireTypes.lengthDelimited)
		var2308, var3808 = protoModule.writeBuffer(var2308, var2309, var2307, buffer.len(var2307))
		buff = var2308
		var2303 = var2309
	end
	if self.ctx ~= nil then
		local var2310 = self.ctx:encode()
		local var2311, var2312 = protoModule.writeTag(buff, var2303, 3, protoModule.wireTypes.lengthDelimited)
		var2311, var3811 = protoModule.writeBuffer(var2311, var2312, var2310, buffer.len(var2310))
		buff = var2311
		var2303 = var2312
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
				var2303.game_name = propTypesModule.StringProp.decode(var2314)
			elseif var2309 == 3 then
				local _ = nil
				local var2316, var2317 = protoModule.readBuffer(p115, var2304)
				var2304 = var2317
				var2303.ctx = propTypesModule.StringProp.decode(var2316)
			else
				local _ = nil
				local var2318, var2319 = protoModule.readVarInt(p115, var2304)
				var2304 = var2319 + var2318
			end
		elseif var2305 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2320, var2321 = protoModule.readFixed32(p115, var2304)
			local _ = var2320
			var2304 = var2321
		elseif var2305 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2322, var2323 = protoModule.readFixed64(p115, var2304)
			local _ = var2322
			var2304 = var2323
		else
			error("Unsupported wire type: " .. var3815)
		end
	end
	return var2303
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
	local var2324 = t_115.new()
	
	if self.universe_id ~= nil then
		var2324.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2324.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.game_name ~= nil then
		var2324.game_name = propTypesModule.StringProp.jsonDecode(self.game_name)
	end
	if self.gameName ~= nil then
		var2324.game_name = propTypesModule.StringProp.jsonDecode(self.gameName)
	end
	if self.ctx ~= nil then
		var2324.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var2324
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
	local var2324 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2325, var2326 = protoModule.writeTag(buff, var2324, 1, protoModule.wireTypes.varint)
		var2325, var3839 = protoModule.writeVarInt(var2325, var2326, t.ActionType.toNumber(self.action_type))
		buff = var2325
		var2324 = var2326
	end
	if self.action_params ~= nil then
		local var2327 = self.action_params:encode()
		local var2328, var2329 = protoModule.writeTag(buff, var2324, 2, protoModule.wireTypes.lengthDelimited)
		var2328, var3842 = protoModule.writeBuffer(var2328, var2329, var2327, buffer.len(var2327))
		buff = var2328
		var2324 = var2329
	end
	local buff_1 = buffer.create(var2324)
	buffer.copy(buff_1, 0, buff, 0, var2324)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref), t (ref)
	local var2324 = t_116.new()
	local var2325 = 0
	while var2325 < buffer.len(p116) do
		local _ = nil
		local var2326 = nil
		local var2327, var2328, var2329 = protoModule.readTag(p116, var2325)
		local var2330 = var2327
		var2326 = var2328
		var2325 = var2329
		
		if var2326 == protoModule.wireTypes.varint then
			if var2330 == 1 then
				local _ = nil
				local var2331, var2332 = protoModule.readVarIntI32(p116, var2325)
				local var2333 = var2331
				var2325 = var2332
				var2324.action_type = t.ActionType.fromNumber(var2333) or var2333
			else
				local _ = nil
				local var2334, var2335 = protoModule.readVarInt(p116, var2325)
				local _ = var2334
				var2325 = var2335
			end
		end
		if var2326 == protoModule.wireTypes.lengthDelimited then
			if var2330 == 2 then
				local _ = nil
				local var2336, var2337 = protoModule.readBuffer(p116, var2325)
				var2325 = var2337
				var2324.action_params = t.ToggleExperienceVoteAction_Params.decode(var2336)
			else
				local _ = nil
				local var2338, var2339 = protoModule.readVarInt(p116, var2325)
				var2325 = var2339 + var2338
			end
		elseif var2326 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2340, var2341 = protoModule.readFixed32(p116, var2325)
			local _ = var2340
			var2325 = var2341
		elseif var2326 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2342, var2343 = protoModule.readFixed64(p116, var2325)
			local _ = var2342
			var2325 = var2343
		else
			error("Unsupported wire type: " .. var3846)
		end
	end
	return var2324
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
	local var2344 = t_116.new()
	
	if self.action_type ~= nil then
		var2344.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2344.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2344.action_params = t.ToggleExperienceVoteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2344.action_params = t.ToggleExperienceVoteAction_Params.jsonDecode(self.actionParams)
	end
	return var2344
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
	local var2344 = 0
	
	if self.universe_id ~= nil then
		local var2345 = self.universe_id:encode()
		local var2346, var2347 = protoModule.writeTag(buff, var2344, 1, protoModule.wireTypes.lengthDelimited)
		var2346, var3870 = protoModule.writeBuffer(var2346, var2347, var2345, buffer.len(var2345))
		buff = var2346
		var2344 = var2347
	end
	if self.vote_direction ~= nil then
		local var2348 = self.vote_direction:encode()
		local var2349, var2350 = protoModule.writeTag(buff, var2344, 2, protoModule.wireTypes.lengthDelimited)
		var2349, var3873 = protoModule.writeBuffer(var2349, var2350, var2348, buffer.len(var2348))
		buff = var2349
		var2344 = var2350
	end
	if self.place_id ~= nil then
		local var2351 = self.place_id:encode()
		local var2352, var2353 = protoModule.writeTag(buff, var2344, 3, protoModule.wireTypes.lengthDelimited)
		var2352, var3876 = protoModule.writeBuffer(var2352, var2353, var2351, buffer.len(var2351))
		buff = var2352
		var2344 = var2353
	end
	if self.ctx ~= nil then
		local var2354 = self.ctx:encode()
		local var2355, var2356 = protoModule.writeTag(buff, var2344, 4, protoModule.wireTypes.lengthDelimited)
		var2355, var3879 = protoModule.writeBuffer(var2355, var2356, var2354, buffer.len(var2354))
		buff = var2355
		var2344 = var2356
	end
	local buff_1 = buffer.create(var2344)
	buffer.copy(buff_1, 0, buff, 0, var2344)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref), propTypesModule (ref)
	local var2344 = t_117.new()
	local var2345 = 0
	while var2345 < buffer.len(p117) do
		local _ = nil
		local var2346 = nil
		local var2347, var2348, var2349 = protoModule.readTag(p117, var2345)
		local var2350 = var2347
		var2346 = var2348
		var2345 = var2349
		
		if var2346 == protoModule.wireTypes.varint then
			local _ = nil
			local var2351, var2352 = protoModule.readVarInt(p117, var2345)
			local _ = var2351
			var2345 = var2352
			continue
		end
		if var2346 == protoModule.wireTypes.lengthDelimited then
			if var2350 == 1 then
				local _ = nil
				local var2353, var2354 = protoModule.readBuffer(p117, var2345)
				var2345 = var2354
				var2344.universe_id = propTypesModule.StringProp.decode(var2353)
			elseif var2350 == 2 then
				local _ = nil
				local var2355, var2356 = protoModule.readBuffer(p117, var2345)
				var2345 = var2356
				var2344.vote_direction = propTypesModule.BoolProp.decode(var2355)
			elseif var2350 == 3 then
				local _ = nil
				local var2357, var2358 = protoModule.readBuffer(p117, var2345)
				var2345 = var2358
				var2344.place_id = propTypesModule.StringProp.decode(var2357)
			elseif var2350 == 4 then
				local _ = nil
				local var2359, var2360 = protoModule.readBuffer(p117, var2345)
				var2345 = var2360
				var2344.ctx = propTypesModule.StringProp.decode(var2359)
			else
				local _ = nil
				local var2361, var2362 = protoModule.readVarInt(p117, var2345)
				var2345 = var2362 + var2361
			end
		elseif var2346 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2363, var2364 = protoModule.readFixed32(p117, var2345)
			local _ = var2363
			var2345 = var2364
		elseif var2346 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2365, var2366 = protoModule.readFixed64(p117, var2345)
			local _ = var2365
			var2345 = var2366
		else
			error("Unsupported wire type: " .. var3883)
		end
	end
	return var2344
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
	local var2367 = t_117.new()
	
	if self.universe_id ~= nil then
		var2367.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2367.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.vote_direction ~= nil then
		var2367.vote_direction = propTypesModule.BoolProp.jsonDecode(self.vote_direction)
	end
	if self.voteDirection ~= nil then
		var2367.vote_direction = propTypesModule.BoolProp.jsonDecode(self.voteDirection)
	end
	if self.place_id ~= nil then
		var2367.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var2367.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.ctx ~= nil then
		var2367.ctx = propTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return var2367
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
	local var2367 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2368, var2369 = protoModule.writeTag(buff, var2367, 1, protoModule.wireTypes.varint)
		var2368, var3909 = protoModule.writeVarInt(var2368, var2369, t.ActionType.toNumber(self.action_type))
		buff = var2368
		var2367 = var2369
	end
	if self.action_params ~= nil then
		local var2370 = self.action_params:encode()
		local var2371, var2372 = protoModule.writeTag(buff, var2367, 2, protoModule.wireTypes.lengthDelimited)
		var2371, var3912 = protoModule.writeBuffer(var2371, var2372, var2370, buffer.len(var2370))
		buff = var2371
		var2367 = var2372
	end
	local buff_1 = buffer.create(var2367)
	buffer.copy(buff_1, 0, buff, 0, var2367)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref), t (ref)
	local var2367 = t_118.new()
	local var2368 = 0
	while var2368 < buffer.len(p118) do
		local _ = nil
		local var2369 = nil
		local var2370, var2371, var2372 = protoModule.readTag(p118, var2368)
		local var2373 = var2370
		var2369 = var2371
		var2368 = var2372
		
		if var2369 == protoModule.wireTypes.varint then
			if var2373 == 1 then
				local _ = nil
				local var2374, var2375 = protoModule.readVarIntI32(p118, var2368)
				local var2376 = var2374
				var2368 = var2375
				var2367.action_type = t.ActionType.fromNumber(var2376) or var2376
			else
				local _ = nil
				local var2377, var2378 = protoModule.readVarInt(p118, var2368)
				local _ = var2377
				var2368 = var2378
			end
		end
		if var2369 == protoModule.wireTypes.lengthDelimited then
			if var2373 == 2 then
				local _ = nil
				local var2379, var2380 = protoModule.readBuffer(p118, var2368)
				var2368 = var2380
				var2367.action_params = t.OpenPurchasePromptAction_Params.decode(var2379)
			else
				local _ = nil
				local var2381, var2382 = protoModule.readVarInt(p118, var2368)
				var2368 = var2382 + var2381
			end
		elseif var2369 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2383, var2384 = protoModule.readFixed32(p118, var2368)
			local _ = var2383
			var2368 = var2384
		elseif var2369 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2385, var2386 = protoModule.readFixed64(p118, var2368)
			local _ = var2385
			var2368 = var2386
		else
			error("Unsupported wire type: " .. var3916)
		end
	end
	return var2367
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
	local var2387 = t_118.new()
	
	if self.action_type ~= nil then
		var2387.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2387.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2387.action_params = t.OpenPurchasePromptAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2387.action_params = t.OpenPurchasePromptAction_Params.jsonDecode(self.actionParams)
	end
	return var2387
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
	local var2387 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2388 = self.kind.value:encode()
			local var2389, var2390 = protoModule.writeTag(buff, var2387, 1, protoModule.wireTypes.lengthDelimited)
			var2389, var3940 = protoModule.writeBuffer(var2389, var2390, var2388, buffer.len(var2388))
			buff = var2389
			var2387 = var2390
		elseif self.kind.type == "binding_path" then
			local var2391, var2392 = protoModule.writeTag(buff, var2387, 2, protoModule.wireTypes.lengthDelimited)
			var2391, var3942 = protoModule.writeString(var2391, var2392, self.kind.value)
			buff = var2391
			var2387 = var2392
		end
	end
	local buff_1 = buffer.create(var2387)
	buffer.copy(buff_1, 0, buff, 0, var2387)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref), t (ref)
	local var2387 = t_119.new()
	local var2388 = 0
	while var2388 < buffer.len(p119) do
		local _ = nil
		local var2389 = nil
		local var2390, var2391, var2392 = protoModule.readTag(p119, var2388)
		local var2393 = var2390
		var2389 = var2391
		var2388 = var2392
		
		if var2389 == protoModule.wireTypes.varint then
			local _ = nil
			local var2394, var2395 = protoModule.readVarInt(p119, var2388)
			local _ = var2394
			var2388 = var2395
			continue
		end
		if var2389 == protoModule.wireTypes.lengthDelimited then
			if var2393 == 1 then
				local _ = nil
				local var2396, var2397 = protoModule.readBuffer(p119, var2388)
				var2388 = var2397
				var2387.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral.decode(var2396)
				}
			elseif var2393 == 2 then
				local _ = nil
				local var2398, var2399 = protoModule.readBuffer(p119, var2388)
				var2388 = var2399
				var2387.kind = { type = "binding_path", value = buffer.tostring(var2398) }
			else
				local _ = nil
				local var2400, var2401 = protoModule.readVarInt(p119, var2388)
				var2388 = var2401 + var2400
			end
		elseif var2389 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2402, var2403 = protoModule.readFixed32(p119, var2388)
			local _ = var2402
			var2388 = var2403
		elseif var2389 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2404, var2405 = protoModule.readFixed64(p119, var2388)
			local _ = var2404
			var2388 = var2405
		else
			error("Unsupported wire type: " .. var3946)
		end
	end
	return var2387
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
	local var2406 = t_119.new()
	
	if self.literal ~= nil then
		var2406.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2406.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2406.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2406
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
	local var2406 = 0
	
	if self.kind ~= nil then
		local var2407 = self.kind:encode()
		local var2408, var2409 = protoModule.writeTag(buff, var2406, 1, protoModule.wireTypes.lengthDelimited)
		var2408, var3969 = protoModule.writeBuffer(var2408, var2409, var2407, buffer.len(var2407))
		buff = var2408
		var2406 = var2409
	end
	if self.id ~= nil then
		local var2410 = self.id:encode()
		local var2411, var2412 = protoModule.writeTag(buff, var2406, 2, protoModule.wireTypes.lengthDelimited)
		var2411, var3972 = protoModule.writeBuffer(var2411, var2412, var2410, buffer.len(var2410))
		buff = var2411
		var2406 = var2412
	end
	if self.subscription_id ~= nil then
		local var2413 = self.subscription_id:encode()
		local var2414, var2415 = protoModule.writeTag(buff, var2406, 3, protoModule.wireTypes.lengthDelimited)
		var2414, var3975 = protoModule.writeBuffer(var2414, var2415, var2413, buffer.len(var2413))
		buff = var2414
		var2406 = var2415
	end
	if self.universe_id ~= nil then
		local var2416 = self.universe_id:encode()
		local var2417, var2418 = protoModule.writeTag(buff, var2406, 4, protoModule.wireTypes.lengthDelimited)
		var2417, var3978 = protoModule.writeBuffer(var2417, var2418, var2416, buffer.len(var2416))
		buff = var2417
		var2406 = var2418
	end
	if self.equip_if_purchased ~= nil then
		local var2419 = self.equip_if_purchased:encode()
		local var2420, var2421 = protoModule.writeTag(buff, var2406, 5, protoModule.wireTypes.lengthDelimited)
		var2420, var3981 = protoModule.writeBuffer(var2420, var2421, var2419, buffer.len(var2419))
		buff = var2420
		var2406 = var2421
	end
	if self.name ~= nil then
		local var2422 = self.name:encode()
		local var2423, var2424 = protoModule.writeTag(buff, var2406, 6, protoModule.wireTypes.lengthDelimited)
		var2423, var3984 = protoModule.writeBuffer(var2423, var2424, var2422, buffer.len(var2422))
		buff = var2423
		var2406 = var2424
	end
	if self.expected_price ~= nil then
		local var2425 = self.expected_price:encode()
		local var2426, var2427 = protoModule.writeTag(buff, var2406, 7, protoModule.wireTypes.lengthDelimited)
		var2426, var3987 = protoModule.writeBuffer(var2426, var2427, var2425, buffer.len(var2425))
		buff = var2426
		var2406 = var2427
	end
	if self.icon_image_asset_id ~= nil then
		local var2428 = self.icon_image_asset_id:encode()
		local var2429, var2430 = protoModule.writeTag(buff, var2406, 8, protoModule.wireTypes.lengthDelimited)
		var2429, var3990 = protoModule.writeBuffer(var2429, var2430, var2428, buffer.len(var2428))
		buff = var2429
		var2406 = var2430
	end
	if self.is_subscription_in_robux ~= nil then
		local var2431 = self.is_subscription_in_robux:encode()
		local var2432, var2433 = protoModule.writeTag(buff, var2406, 9, protoModule.wireTypes.lengthDelimited)
		var2432, var3993 = protoModule.writeBuffer(var2432, var2433, var2431, buffer.len(var2431))
		buff = var2432
		var2406 = var2433
	end
	if self.display_price ~= nil then
		local var2434 = self.display_price:encode()
		local var2435, var2436 = protoModule.writeTag(buff, var2406, 10, protoModule.wireTypes.lengthDelimited)
		var2435, var3996 = protoModule.writeBuffer(var2435, var2436, var2434, buffer.len(var2434))
		buff = var2435
		var2406 = var2436
	end
	local buff_1 = buffer.create(var2406)
	buffer.copy(buff_1, 0, buff, 0, var2406)
	
	return buff_1
end

function t_120.decode(p120)
	-- upvalues: t_120 (ref), protoModule (ref), propTypesModule (ref)
	local var2406 = t_120.new()
	local var2407 = 0
	while var2407 < buffer.len(p120) do
		local _ = nil
		local var2408 = nil
		local var2409, var2410, var2411 = protoModule.readTag(p120, var2407)
		local var2412 = var2409
		var2408 = var2410
		var2407 = var2411
		
		if var2408 == protoModule.wireTypes.varint then
			local _ = nil
			local var2413, var2414 = protoModule.readVarInt(p120, var2407)
			local _ = var2413
			var2407 = var2414
			continue
		end
		if var2408 == protoModule.wireTypes.lengthDelimited then
			if var2412 == 1 then
				local _ = nil
				local var2415, var2416 = protoModule.readBuffer(p120, var2407)
				var2407 = var2416
				var2406.kind = propTypesModule.StringProp.decode(var2415)
			elseif var2412 == 2 then
				local _ = nil
				local var2417, var2418 = protoModule.readBuffer(p120, var2407)
				var2407 = var2418
				var2406.id = propTypesModule.StringProp.decode(var2417)
			elseif var2412 == 3 then
				local _ = nil
				local var2419, var2420 = protoModule.readBuffer(p120, var2407)
				var2407 = var2420
				var2406.subscription_id = propTypesModule.StringProp.decode(var2419)
			elseif var2412 == 4 then
				local _ = nil
				local var2421, var2422 = protoModule.readBuffer(p120, var2407)
				var2407 = var2422
				var2406.universe_id = propTypesModule.StringProp.decode(var2421)
			elseif var2412 == 5 then
				local _ = nil
				local var2423, var2424 = protoModule.readBuffer(p120, var2407)
				var2407 = var2424
				var2406.equip_if_purchased = propTypesModule.BoolProp.decode(var2423)
			elseif var2412 == 6 then
				local _ = nil
				local var2425, var2426 = protoModule.readBuffer(p120, var2407)
				var2407 = var2426
				var2406.name = propTypesModule.StringProp.decode(var2425)
			elseif var2412 == 7 then
				local _ = nil
				local var2427, var2428 = protoModule.readBuffer(p120, var2407)
				var2407 = var2428
				var2406.expected_price = propTypesModule.Int64Prop.decode(var2427)
			elseif var2412 == 8 then
				local _ = nil
				local var2429, var2430 = protoModule.readBuffer(p120, var2407)
				var2407 = var2430
				var2406.icon_image_asset_id = propTypesModule.Int64Prop.decode(var2429)
			elseif var2412 == 9 then
				local _ = nil
				local var2431, var2432 = protoModule.readBuffer(p120, var2407)
				var2407 = var2432
				var2406.is_subscription_in_robux = propTypesModule.BoolProp.decode(var2431)
			elseif var2412 == 10 then
				local _ = nil
				local var2433, var2434 = protoModule.readBuffer(p120, var2407)
				var2407 = var2434
				var2406.display_price = propTypesModule.StringProp.decode(var2433)
			else
				local _ = nil
				local var2435, var2436 = protoModule.readVarInt(p120, var2407)
				var2407 = var2436 + var2435
			end
		elseif var2408 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2437, var2438 = protoModule.readFixed32(p120, var2407)
			local _ = var2437
			var2407 = var2438
		elseif var2408 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2439, var2440 = protoModule.readFixed64(p120, var2407)
			local _ = var2439
			var2407 = var2440
		else
			error("Unsupported wire type: " .. var4000)
		end
	end
	return var2406
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
	local var2441 = t_120.new()
	
	if self.kind ~= nil then
		var2441.kind = propTypesModule.StringProp.jsonDecode(self.kind)
	end
	if self.id ~= nil then
		var2441.id = propTypesModule.StringProp.jsonDecode(self.id)
	end
	if self.subscription_id ~= nil then
		var2441.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscription_id)
	end
	if self.subscriptionId ~= nil then
		var2441.subscription_id = propTypesModule.StringProp.jsonDecode(self.subscriptionId)
	end
	if self.universe_id ~= nil then
		var2441.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2441.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.equip_if_purchased ~= nil then
		var2441.equip_if_purchased = propTypesModule.BoolProp.jsonDecode(self.equip_if_purchased)
	end
	if self.equipIfPurchased ~= nil then
		var2441.equip_if_purchased = propTypesModule.BoolProp.jsonDecode(self.equipIfPurchased)
	end
	if self.name ~= nil then
		var2441.name = propTypesModule.StringProp.jsonDecode(self.name)
	end
	if self.expected_price ~= nil then
		var2441.expected_price = propTypesModule.Int64Prop.jsonDecode(self.expected_price)
	end
	if self.expectedPrice ~= nil then
		var2441.expected_price = propTypesModule.Int64Prop.jsonDecode(self.expectedPrice)
	end
	if self.icon_image_asset_id ~= nil then
		var2441.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.icon_image_asset_id)
	end
	if self.iconImageAssetId ~= nil then
		var2441.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.iconImageAssetId)
	end
	if self.is_subscription_in_robux ~= nil then
		var2441.is_subscription_in_robux = propTypesModule.BoolProp.jsonDecode(self.is_subscription_in_robux)
	end
	if self.isSubscriptionInRobux ~= nil then
		var2441.is_subscription_in_robux = propTypesModule.BoolProp.jsonDecode(self.isSubscriptionInRobux)
	end
	if self.display_price ~= nil then
		var2441.display_price = propTypesModule.StringProp.jsonDecode(self.display_price)
	end
	if self.displayPrice ~= nil then
		var2441.display_price = propTypesModule.StringProp.jsonDecode(self.displayPrice)
	end
	return var2441
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
	local var2441 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2442 = self.kind.value:encode()
			local var2443, var2444 = protoModule.writeTag(buff, var2441, 1, protoModule.wireTypes.lengthDelimited)
			var2443, var4039 = protoModule.writeBuffer(var2443, var2444, var2442, buffer.len(var2442))
			buff = var2443
			var2441 = var2444
		elseif self.kind.type == "binding_path" then
			local var2445, var2446 = protoModule.writeTag(buff, var2441, 2, protoModule.wireTypes.lengthDelimited)
			var2445, var4041 = protoModule.writeString(var2445, var2446, self.kind.value)
			buff = var2445
			var2441 = var2446
		end
	end
	local buff_1 = buffer.create(var2441)
	buffer.copy(buff_1, 0, buff, 0, var2441)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var2441 = t_121.new()
	local var2442 = 0
	while var2442 < buffer.len(p121) do
		local _ = nil
		local var2443 = nil
		local var2444, var2445, var2446 = protoModule.readTag(p121, var2442)
		local var2447 = var2444
		var2443 = var2445
		var2442 = var2446
		
		if var2443 == protoModule.wireTypes.varint then
			local _ = nil
			local var2448, var2449 = protoModule.readVarInt(p121, var2442)
			local _ = var2448
			var2442 = var2449
			continue
		end
		if var2443 == protoModule.wireTypes.lengthDelimited then
			if var2447 == 1 then
				local _ = nil
				local var2450, var2451 = protoModule.readBuffer(p121, var2442)
				var2442 = var2451
				var2441.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral.decode(var2450)
				}
			elseif var2447 == 2 then
				local _ = nil
				local var2452, var2453 = protoModule.readBuffer(p121, var2442)
				var2442 = var2453
				var2441.kind = { type = "binding_path", value = buffer.tostring(var2452) }
			else
				local _ = nil
				local var2454, var2455 = protoModule.readVarInt(p121, var2442)
				var2442 = var2455 + var2454
			end
		elseif var2443 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2456, var2457 = protoModule.readFixed32(p121, var2442)
			local _ = var2456
			var2442 = var2457
		elseif var2443 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2458, var2459 = protoModule.readFixed64(p121, var2442)
			local _ = var2458
			var2442 = var2459
		else
			error("Unsupported wire type: " .. var4045)
		end
	end
	return var2441
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
	local var2460 = t_121.new()
	
	if self.literal ~= nil then
		var2460.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2460.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2460.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2460
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
	local var2460 = 0
	
	if self.product_name ~= nil then
		local var2461 = self.product_name:encode()
		local var2462, var2463 = protoModule.writeTag(buff, var2460, 1, protoModule.wireTypes.lengthDelimited)
		var2462, var4068 = protoModule.writeBuffer(var2462, var2463, var2461, buffer.len(var2461))
		buff = var2462
		var2460 = var2463
	end
	if self.description ~= nil then
		local var2464 = self.description:encode()
		local var2465, var2466 = protoModule.writeTag(buff, var2460, 2, protoModule.wireTypes.lengthDelimited)
		var2465, var4071 = protoModule.writeBuffer(var2465, var2466, var2464, buffer.len(var2464))
		buff = var2465
		var2460 = var2466
	end
	if self.image_url ~= nil then
		local var2467 = self.image_url:encode()
		local var2468, var2469 = protoModule.writeTag(buff, var2460, 3, protoModule.wireTypes.lengthDelimited)
		var2468, var4074 = protoModule.writeBuffer(var2468, var2469, var2467, buffer.len(var2467))
		buff = var2468
		var2460 = var2469
	end
	if self.price_in_robux ~= nil then
		local var2470 = self.price_in_robux:encode()
		local var2471, var2472 = protoModule.writeTag(buff, var2460, 4, protoModule.wireTypes.lengthDelimited)
		var2471, var4077 = protoModule.writeBuffer(var2471, var2472, var2470, buffer.len(var2470))
		buff = var2471
		var2460 = var2472
	end
	if self.display_price ~= nil then
		local var2473 = self.display_price:encode()
		local var2474, var2475 = protoModule.writeTag(buff, var2460, 5, protoModule.wireTypes.lengthDelimited)
		var2474, var4080 = protoModule.writeBuffer(var2474, var2475, var2473, buffer.len(var2473))
		buff = var2474
		var2460 = var2475
	end
	if self.icon_image_asset_id ~= nil then
		local var2476 = self.icon_image_asset_id:encode()
		local var2477, var2478 = protoModule.writeTag(buff, var2460, 6, protoModule.wireTypes.lengthDelimited)
		var2477, var4083 = protoModule.writeBuffer(var2477, var2478, var2476, buffer.len(var2476))
		buff = var2477
		var2460 = var2478
	end
	if self.product_id ~= nil then
		local var2479 = self.product_id:encode()
		local var2480, var2481 = protoModule.writeTag(buff, var2460, 7, protoModule.wireTypes.lengthDelimited)
		var2480, var4086 = protoModule.writeBuffer(var2480, var2481, var2479, buffer.len(var2479))
		buff = var2480
		var2460 = var2481
	end
	if self.target_id ~= nil then
		local var2482 = self.target_id:encode()
		local var2483, var2484 = protoModule.writeTag(buff, var2460, 8, protoModule.wireTypes.lengthDelimited)
		var2483, var4089 = protoModule.writeBuffer(var2483, var2484, var2482, buffer.len(var2482))
		buff = var2483
		var2460 = var2484
	end
	if self.is_for_sale ~= nil then
		local var2485 = self.is_for_sale:encode()
		local var2486, var2487 = protoModule.writeTag(buff, var2460, 9, protoModule.wireTypes.lengthDelimited)
		var2486, var4092 = protoModule.writeBuffer(var2486, var2487, var2485, buffer.len(var2485))
		buff = var2486
		var2460 = var2487
	end
	if self.product_type ~= nil then
		local var2488 = self.product_type:encode()
		local var2489, var2490 = protoModule.writeTag(buff, var2460, 10, protoModule.wireTypes.lengthDelimited)
		var2489, var4095 = protoModule.writeBuffer(var2489, var2490, var2488, buffer.len(var2488))
		buff = var2489
		var2460 = var2490
	end
	if self.base_price_in_robux ~= nil then
		local var2491 = self.base_price_in_robux:encode()
		local var2492, var2493 = protoModule.writeTag(buff, var2460, 11, protoModule.wireTypes.lengthDelimited)
		var2492, var4098 = protoModule.writeBuffer(var2492, var2493, var2491, buffer.len(var2491))
		buff = var2492
		var2460 = var2493
	end
	if self.price_discount_details ~= nil then
		local var2494 = self.price_discount_details:encode()
		local var2495, var2496 = protoModule.writeTag(buff, var2460, 12, protoModule.wireTypes.lengthDelimited)
		var2495, var4101 = protoModule.writeBuffer(var2495, var2496, var2494, buffer.len(var2494))
		buff = var2495
		var2460 = var2496
	end
	local buff_1 = buffer.create(var2460)
	buffer.copy(buff_1, 0, buff, 0, var2460)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref), propTypesModule (ref)
	local var2460 = t_122.new()
	local var2461 = 0
	while var2461 < buffer.len(p122) do
		local _ = nil
		local var2462 = nil
		local var2463, var2464, var2465 = protoModule.readTag(p122, var2461)
		local var2466 = var2463
		var2462 = var2464
		var2461 = var2465
		
		if var2462 == protoModule.wireTypes.varint then
			local _ = nil
			local var2467, var2468 = protoModule.readVarInt(p122, var2461)
			local _ = var2467
			var2461 = var2468
			continue
		end
		if var2462 == protoModule.wireTypes.lengthDelimited then
			if var2466 == 1 then
				local _ = nil
				local var2469, var2470 = protoModule.readBuffer(p122, var2461)
				var2461 = var2470
				var2460.product_name = propTypesModule.StringProp.decode(var2469)
			elseif var2466 == 2 then
				local _ = nil
				local var2471, var2472 = protoModule.readBuffer(p122, var2461)
				var2461 = var2472
				var2460.description = propTypesModule.StringProp.decode(var2471)
			elseif var2466 == 3 then
				local _ = nil
				local var2473, var2474 = protoModule.readBuffer(p122, var2461)
				var2461 = var2474
				var2460.image_url = propTypesModule.StringProp.decode(var2473)
			elseif var2466 == 4 then
				local _ = nil
				local var2475, var2476 = protoModule.readBuffer(p122, var2461)
				var2461 = var2476
				var2460.price_in_robux = propTypesModule.Int64Prop.decode(var2475)
			elseif var2466 == 5 then
				local _ = nil
				local var2477, var2478 = protoModule.readBuffer(p122, var2461)
				var2461 = var2478
				var2460.display_price = propTypesModule.StringProp.decode(var2477)
			elseif var2466 == 6 then
				local _ = nil
				local var2479, var2480 = protoModule.readBuffer(p122, var2461)
				var2461 = var2480
				var2460.icon_image_asset_id = propTypesModule.Int64Prop.decode(var2479)
			elseif var2466 == 7 then
				local _ = nil
				local var2481, var2482 = protoModule.readBuffer(p122, var2461)
				var2461 = var2482
				var2460.product_id = propTypesModule.Int64Prop.decode(var2481)
			elseif var2466 == 8 then
				local _ = nil
				local var2483, var2484 = protoModule.readBuffer(p122, var2461)
				var2461 = var2484
				var2460.target_id = propTypesModule.StringProp.decode(var2483)
			elseif var2466 == 9 then
				local _ = nil
				local var2485, var2486 = protoModule.readBuffer(p122, var2461)
				var2461 = var2486
				var2460.is_for_sale = propTypesModule.BoolProp.decode(var2485)
			elseif var2466 == 10 then
				local _ = nil
				local var2487, var2488 = protoModule.readBuffer(p122, var2461)
				var2461 = var2488
				var2460.product_type = propTypesModule.StringProp.decode(var2487)
			elseif var2466 == 11 then
				local _ = nil
				local var2489, var2490 = protoModule.readBuffer(p122, var2461)
				var2461 = var2490
				var2460.base_price_in_robux = propTypesModule.Int64Prop.decode(var2489)
			elseif var2466 == 12 then
				local _ = nil
				local var2491, var2492 = protoModule.readBuffer(p122, var2461)
				var2461 = var2492
				var2460.price_discount_details = propTypesModule.ArrayOfStructProp.decode(var2491)
			else
				local _ = nil
				local var2493, var2494 = protoModule.readVarInt(p122, var2461)
				var2461 = var2494 + var2493
			end
		elseif var2462 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2495, var2496 = protoModule.readFixed32(p122, var2461)
			local _ = var2495
			var2461 = var2496
		elseif var2462 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2497, var2498 = protoModule.readFixed64(p122, var2461)
			local _ = var2497
			var2461 = var2498
		else
			error("Unsupported wire type: " .. var4105)
		end
	end
	return var2460
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
	local var2499 = t_122.new()
	
	if self.product_name ~= nil then
		var2499.product_name = propTypesModule.StringProp.jsonDecode(self.product_name)
	end
	if self.productName ~= nil then
		var2499.product_name = propTypesModule.StringProp.jsonDecode(self.productName)
	end
	if self.description ~= nil then
		var2499.description = propTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.image_url ~= nil then
		var2499.image_url = propTypesModule.StringProp.jsonDecode(self.image_url)
	end
	if self.imageUrl ~= nil then
		var2499.image_url = propTypesModule.StringProp.jsonDecode(self.imageUrl)
	end
	if self.price_in_robux ~= nil then
		var2499.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.price_in_robux)
	end
	if self.priceInRobux ~= nil then
		var2499.price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.priceInRobux)
	end
	if self.display_price ~= nil then
		var2499.display_price = propTypesModule.StringProp.jsonDecode(self.display_price)
	end
	if self.displayPrice ~= nil then
		var2499.display_price = propTypesModule.StringProp.jsonDecode(self.displayPrice)
	end
	if self.icon_image_asset_id ~= nil then
		var2499.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.icon_image_asset_id)
	end
	if self.iconImageAssetId ~= nil then
		var2499.icon_image_asset_id = propTypesModule.Int64Prop.jsonDecode(self.iconImageAssetId)
	end
	if self.product_id ~= nil then
		var2499.product_id = propTypesModule.Int64Prop.jsonDecode(self.product_id)
	end
	if self.productId ~= nil then
		var2499.product_id = propTypesModule.Int64Prop.jsonDecode(self.productId)
	end
	if self.target_id ~= nil then
		var2499.target_id = propTypesModule.StringProp.jsonDecode(self.target_id)
	end
	if self.targetId ~= nil then
		var2499.target_id = propTypesModule.StringProp.jsonDecode(self.targetId)
	end
	if self.is_for_sale ~= nil then
		var2499.is_for_sale = propTypesModule.BoolProp.jsonDecode(self.is_for_sale)
	end
	if self.isForSale ~= nil then
		var2499.is_for_sale = propTypesModule.BoolProp.jsonDecode(self.isForSale)
	end
	if self.product_type ~= nil then
		var2499.product_type = propTypesModule.StringProp.jsonDecode(self.product_type)
	end
	if self.productType ~= nil then
		var2499.product_type = propTypesModule.StringProp.jsonDecode(self.productType)
	end
	if self.base_price_in_robux ~= nil then
		var2499.base_price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.base_price_in_robux)
	end
	if self.basePriceInRobux ~= nil then
		var2499.base_price_in_robux = propTypesModule.Int64Prop.jsonDecode(self.basePriceInRobux)
	end
	if self.price_discount_details ~= nil then
		var2499.price_discount_details = propTypesModule.ArrayOfStructProp.jsonDecode(self.price_discount_details)
	end
	if self.priceDiscountDetails ~= nil then
		var2499.price_discount_details = propTypesModule.ArrayOfStructProp.jsonDecode(self.priceDiscountDetails)
	end
	return var2499
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
	local var2499 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2500 = self.kind.value:encode()
			local var2501, var2502 = protoModule.writeTag(buff, var2499, 1, protoModule.wireTypes.lengthDelimited)
			var2501, var4148 = protoModule.writeBuffer(var2501, var2502, var2500, buffer.len(var2500))
			buff = var2501
			var2499 = var2502
		elseif self.kind.type == "binding_path" then
			local var2503, var2504 = protoModule.writeTag(buff, var2499, 2, protoModule.wireTypes.lengthDelimited)
			var2503, var4150 = protoModule.writeString(var2503, var2504, self.kind.value)
			buff = var2503
			var2499 = var2504
		end
	end
	local buff_1 = buffer.create(var2499)
	buffer.copy(buff_1, 0, buff, 0, var2499)
	
	return buff_1
end

function t_123.decode(p123)
	-- upvalues: t_123 (ref), protoModule (ref), t (ref)
	local var2499 = t_123.new()
	local var2500 = 0
	while var2500 < buffer.len(p123) do
		local _ = nil
		local var2501 = nil
		local var2502, var2503, var2504 = protoModule.readTag(p123, var2500)
		local var2505 = var2502
		var2501 = var2503
		var2500 = var2504
		
		if var2501 == protoModule.wireTypes.varint then
			local _ = nil
			local var2506, var2507 = protoModule.readVarInt(p123, var2500)
			local _ = var2506
			var2500 = var2507
			continue
		end
		if var2501 == protoModule.wireTypes.lengthDelimited then
			if var2505 == 1 then
				local _ = nil
				local var2508, var2509 = protoModule.readBuffer(p123, var2500)
				var2500 = var2509
				var2499.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral.decode(var2508)
				}
			elseif var2505 == 2 then
				local _ = nil
				local var2510, var2511 = protoModule.readBuffer(p123, var2500)
				var2500 = var2511
				var2499.kind = { type = "binding_path", value = buffer.tostring(var2510) }
			else
				local _ = nil
				local var2512, var2513 = protoModule.readVarInt(p123, var2500)
				var2500 = var2513 + var2512
			end
		elseif var2501 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2514, var2515 = protoModule.readFixed32(p123, var2500)
			local _ = var2514
			var2500 = var2515
		elseif var2501 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2516, var2517 = protoModule.readFixed64(p123, var2500)
			local _ = var2516
			var2500 = var2517
		else
			error("Unsupported wire type: " .. var4154)
		end
	end
	return var2499
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
	local var2518 = t_123.new()
	
	if self.literal ~= nil then
		var2518.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2518.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2518.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2518
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
	local var2518 = 0
	
	if self.should_skip_ownership_check ~= nil then
		local var2519 = self.should_skip_ownership_check:encode()
		local var2520, var2521 = protoModule.writeTag(buff, var2518, 1, protoModule.wireTypes.lengthDelimited)
		var2520, var4177 = protoModule.writeBuffer(var2520, var2521, var2519, buffer.len(var2519))
		buff = var2520
		var2518 = var2521
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		local var2522 = self.enable_preloaded_purchase_ui:encode()
		local var2523, var2524 = protoModule.writeTag(buff, var2518, 2, protoModule.wireTypes.lengthDelimited)
		var2523, var4180 = protoModule.writeBuffer(var2523, var2524, var2522, buffer.len(var2522))
		buff = var2523
		var2518 = var2524
	end
	if self.completion_message ~= nil then
		local var2525 = self.completion_message:encode()
		local var2526, var2527 = protoModule.writeTag(buff, var2518, 3, protoModule.wireTypes.lengthDelimited)
		var2526, var4183 = protoModule.writeBuffer(var2526, var2527, var2525, buffer.len(var2525))
		buff = var2526
		var2518 = var2527
	end
	if self.completion_button_text ~= nil then
		local var2528 = self.completion_button_text:encode()
		local var2529, var2530 = protoModule.writeTag(buff, var2518, 4, protoModule.wireTypes.lengthDelimited)
		var2529, var4186 = protoModule.writeBuffer(var2529, var2530, var2528, buffer.len(var2528))
		buff = var2529
		var2518 = var2530
	end
	if self.prevent_double_confirm ~= nil then
		local var2531 = self.prevent_double_confirm:encode()
		local var2532, var2533 = protoModule.writeTag(buff, var2518, 5, protoModule.wireTypes.lengthDelimited)
		var2532, var4189 = protoModule.writeBuffer(var2532, var2533, var2531, buffer.len(var2531))
		buff = var2532
		var2518 = var2533
	end
	if self.provided_robux_balance ~= nil then
		local var2534 = self.provided_robux_balance:encode()
		local var2535, var2536 = protoModule.writeTag(buff, var2518, 6, protoModule.wireTypes.lengthDelimited)
		var2535, var4192 = protoModule.writeBuffer(var2535, var2536, var2534, buffer.len(var2534))
		buff = var2535
		var2518 = var2536
	end
	if self.launch_after_purchase_root_place_id ~= nil then
		local var2537 = self.launch_after_purchase_root_place_id:encode()
		local var2538, var2539 = protoModule.writeTag(buff, var2518, 7, protoModule.wireTypes.lengthDelimited)
		var2538, var4195 = protoModule.writeBuffer(var2538, var2539, var2537, buffer.len(var2537))
		buff = var2538
		var2518 = var2539
	end
	local buff_1 = buffer.create(var2518)
	buffer.copy(buff_1, 0, buff, 0, var2518)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref), propTypesModule (ref)
	local var2518 = t_124.new()
	local var2519 = 0
	while var2519 < buffer.len(p124) do
		local _ = nil
		local var2520 = nil
		local var2521, var2522, var2523 = protoModule.readTag(p124, var2519)
		local var2524 = var2521
		var2520 = var2522
		var2519 = var2523
		
		if var2520 == protoModule.wireTypes.varint then
			local _ = nil
			local var2525, var2526 = protoModule.readVarInt(p124, var2519)
			local _ = var2525
			var2519 = var2526
			continue
		end
		if var2520 == protoModule.wireTypes.lengthDelimited then
			if var2524 == 1 then
				local _ = nil
				local var2527, var2528 = protoModule.readBuffer(p124, var2519)
				var2519 = var2528
				var2518.should_skip_ownership_check = propTypesModule.BoolProp.decode(var2527)
			elseif var2524 == 2 then
				local _ = nil
				local var2529, var2530 = protoModule.readBuffer(p124, var2519)
				var2519 = var2530
				var2518.enable_preloaded_purchase_ui = propTypesModule.BoolProp.decode(var2529)
			elseif var2524 == 3 then
				local _ = nil
				local var2531, var2532 = protoModule.readBuffer(p124, var2519)
				var2519 = var2532
				var2518.completion_message = propTypesModule.StringProp.decode(var2531)
			elseif var2524 == 4 then
				local _ = nil
				local var2533, var2534 = protoModule.readBuffer(p124, var2519)
				var2519 = var2534
				var2518.completion_button_text = propTypesModule.StringProp.decode(var2533)
			elseif var2524 == 5 then
				local _ = nil
				local var2535, var2536 = protoModule.readBuffer(p124, var2519)
				var2519 = var2536
				var2518.prevent_double_confirm = propTypesModule.BoolProp.decode(var2535)
			elseif var2524 == 6 then
				local _ = nil
				local var2537, var2538 = protoModule.readBuffer(p124, var2519)
				var2519 = var2538
				var2518.provided_robux_balance = propTypesModule.Int64Prop.decode(var2537)
			elseif var2524 == 7 then
				local _ = nil
				local var2539, var2540 = protoModule.readBuffer(p124, var2519)
				var2519 = var2540
				var2518.launch_after_purchase_root_place_id = propTypesModule.StringProp.decode(var2539)
			else
				local _ = nil
				local var2541, var2542 = protoModule.readVarInt(p124, var2519)
				var2519 = var2542 + var2541
			end
		elseif var2520 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2543, var2544 = protoModule.readFixed32(p124, var2519)
			local _ = var2543
			var2519 = var2544
		elseif var2520 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2545, var2546 = protoModule.readFixed64(p124, var2519)
			local _ = var2545
			var2519 = var2546
		else
			error("Unsupported wire type: " .. var4199)
		end
	end
	return var2518
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
	local var2547 = t_124.new()
	
	if self.should_skip_ownership_check ~= nil then
		var2547.should_skip_ownership_check = propTypesModule.BoolProp.jsonDecode(self.should_skip_ownership_check)
	end
	if self.shouldSkipOwnershipCheck ~= nil then
		var2547.should_skip_ownership_check = propTypesModule.BoolProp.jsonDecode(self.shouldSkipOwnershipCheck)
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		var2547.enable_preloaded_purchase_ui = propTypesModule.BoolProp.jsonDecode(self.enable_preloaded_purchase_ui)
	end
	if self.enablePreloadedPurchaseUi ~= nil then
		var2547.enable_preloaded_purchase_ui = propTypesModule.BoolProp.jsonDecode(self.enablePreloadedPurchaseUi)
	end
	if self.completion_message ~= nil then
		var2547.completion_message = propTypesModule.StringProp.jsonDecode(self.completion_message)
	end
	if self.completionMessage ~= nil then
		var2547.completion_message = propTypesModule.StringProp.jsonDecode(self.completionMessage)
	end
	if self.completion_button_text ~= nil then
		var2547.completion_button_text = propTypesModule.StringProp.jsonDecode(self.completion_button_text)
	end
	if self.completionButtonText ~= nil then
		var2547.completion_button_text = propTypesModule.StringProp.jsonDecode(self.completionButtonText)
	end
	if self.prevent_double_confirm ~= nil then
		var2547.prevent_double_confirm = propTypesModule.BoolProp.jsonDecode(self.prevent_double_confirm)
	end
	if self.preventDoubleConfirm ~= nil then
		var2547.prevent_double_confirm = propTypesModule.BoolProp.jsonDecode(self.preventDoubleConfirm)
	end
	if self.provided_robux_balance ~= nil then
		var2547.provided_robux_balance = propTypesModule.Int64Prop.jsonDecode(self.provided_robux_balance)
	end
	if self.providedRobuxBalance ~= nil then
		var2547.provided_robux_balance = propTypesModule.Int64Prop.jsonDecode(self.providedRobuxBalance)
	end
	if self.launch_after_purchase_root_place_id ~= nil then
		var2547.launch_after_purchase_root_place_id = propTypesModule.StringProp.jsonDecode(self.launch_after_purchase_root_place_id)
	end
	if self.launchAfterPurchaseRootPlaceId ~= nil then
		var2547.launch_after_purchase_root_place_id = propTypesModule.StringProp.jsonDecode(self.launchAfterPurchaseRootPlaceId)
	end
	return var2547
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
	local var2547 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2548 = self.kind.value:encode()
			local var2549, var2550 = protoModule.writeTag(buff, var2547, 1, protoModule.wireTypes.lengthDelimited)
			var2549, var4232 = protoModule.writeBuffer(var2549, var2550, var2548, buffer.len(var2548))
			buff = var2549
			var2547 = var2550
		elseif self.kind.type == "binding_path" then
			local var2551, var2552 = protoModule.writeTag(buff, var2547, 2, protoModule.wireTypes.lengthDelimited)
			var2551, var4234 = protoModule.writeString(var2551, var2552, self.kind.value)
			buff = var2551
			var2547 = var2552
		end
	end
	local buff_1 = buffer.create(var2547)
	buffer.copy(buff_1, 0, buff, 0, var2547)
	
	return buff_1
end

function t_125.decode(p125)
	-- upvalues: t_125 (ref), protoModule (ref), t (ref)
	local var2547 = t_125.new()
	local var2548 = 0
	while var2548 < buffer.len(p125) do
		local _ = nil
		local var2549 = nil
		local var2550, var2551, var2552 = protoModule.readTag(p125, var2548)
		local var2553 = var2550
		var2549 = var2551
		var2548 = var2552
		
		if var2549 == protoModule.wireTypes.varint then
			local _ = nil
			local var2554, var2555 = protoModule.readVarInt(p125, var2548)
			local _ = var2554
			var2548 = var2555
			continue
		end
		if var2549 == protoModule.wireTypes.lengthDelimited then
			if var2553 == 1 then
				local _ = nil
				local var2556, var2557 = protoModule.readBuffer(p125, var2548)
				var2548 = var2557
				var2547.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral.decode(var2556)
				}
			elseif var2553 == 2 then
				local _ = nil
				local var2558, var2559 = protoModule.readBuffer(p125, var2548)
				var2548 = var2559
				var2547.kind = { type = "binding_path", value = buffer.tostring(var2558) }
			else
				local _ = nil
				local var2560, var2561 = protoModule.readVarInt(p125, var2548)
				var2548 = var2561 + var2560
			end
		elseif var2549 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2562, var2563 = protoModule.readFixed32(p125, var2548)
			local _ = var2562
			var2548 = var2563
		elseif var2549 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2564, var2565 = protoModule.readFixed64(p125, var2548)
			local _ = var2564
			var2548 = var2565
		else
			error("Unsupported wire type: " .. var4238)
		end
	end
	return var2547
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
	local var2566 = t_125.new()
	
	if self.literal ~= nil then
		var2566.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2566.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2566.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2566
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
	local var2566 = 0
	
	if self.surface ~= nil then
		local var2567 = self.surface:encode()
		local var2568, var2569 = protoModule.writeTag(buff, var2566, 1, protoModule.wireTypes.lengthDelimited)
		var2568, var4261 = protoModule.writeBuffer(var2568, var2569, var2567, buffer.len(var2567))
		buff = var2568
		var2566 = var2569
	end
	if self.product_universe_id ~= nil then
		local var2570 = self.product_universe_id:encode()
		local var2571, var2572 = protoModule.writeTag(buff, var2566, 2, protoModule.wireTypes.lengthDelimited)
		var2571, var4264 = protoModule.writeBuffer(var2571, var2572, var2570, buffer.len(var2570))
		buff = var2571
		var2566 = var2572
	end
	local buff_1 = buffer.create(var2566)
	buffer.copy(buff_1, 0, buff, 0, var2566)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref), propTypesModule (ref)
	local var2566 = t_126.new()
	local var2567 = 0
	while var2567 < buffer.len(p126) do
		local _ = nil
		local var2568 = nil
		local var2569, var2570, var2571 = protoModule.readTag(p126, var2567)
		local var2572 = var2569
		var2568 = var2570
		var2567 = var2571
		
		if var2568 == protoModule.wireTypes.varint then
			local _ = nil
			local var2573, var2574 = protoModule.readVarInt(p126, var2567)
			local _ = var2573
			var2567 = var2574
			continue
		end
		if var2568 == protoModule.wireTypes.lengthDelimited then
			if var2572 == 1 then
				local _ = nil
				local var2575, var2576 = protoModule.readBuffer(p126, var2567)
				var2567 = var2576
				var2566.surface = propTypesModule.StringProp.decode(var2575)
			elseif var2572 == 2 then
				local _ = nil
				local var2577, var2578 = protoModule.readBuffer(p126, var2567)
				var2567 = var2578
				var2566.product_universe_id = propTypesModule.StringProp.decode(var2577)
			else
				local _ = nil
				local var2579, var2580 = protoModule.readVarInt(p126, var2567)
				var2567 = var2580 + var2579
			end
		elseif var2568 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2581, var2582 = protoModule.readFixed32(p126, var2567)
			local _ = var2581
			var2567 = var2582
		elseif var2568 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2583, var2584 = protoModule.readFixed64(p126, var2567)
			local _ = var2583
			var2567 = var2584
		else
			error("Unsupported wire type: " .. var4268)
		end
	end
	return var2566
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
	local var2585 = t_126.new()
	
	if self.surface ~= nil then
		var2585.surface = propTypesModule.StringProp.jsonDecode(self.surface)
	end
	if self.product_universe_id ~= nil then
		var2585.product_universe_id = propTypesModule.StringProp.jsonDecode(self.product_universe_id)
	end
	if self.productUniverseId ~= nil then
		var2585.product_universe_id = propTypesModule.StringProp.jsonDecode(self.productUniverseId)
	end
	return var2585
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
	local var2585 = 0
	
	if self.product_payload ~= nil then
		local var2586 = self.product_payload:encode()
		local var2587, var2588 = protoModule.writeTag(buff, var2585, 1, protoModule.wireTypes.lengthDelimited)
		var2587, var4291 = protoModule.writeBuffer(var2587, var2588, var2586, buffer.len(var2586))
		buff = var2587
		var2585 = var2588
	end
	if self.display_info ~= nil then
		local var2589 = self.display_info:encode()
		local var2590, var2591 = protoModule.writeTag(buff, var2585, 2, protoModule.wireTypes.lengthDelimited)
		var2590, var4294 = protoModule.writeBuffer(var2590, var2591, var2589, buffer.len(var2589))
		buff = var2590
		var2585 = var2591
	end
	if self.purchase_options ~= nil then
		local var2592 = self.purchase_options:encode()
		local var2593, var2594 = protoModule.writeTag(buff, var2585, 3, protoModule.wireTypes.lengthDelimited)
		var2593, var4297 = protoModule.writeBuffer(var2593, var2594, var2592, buffer.len(var2592))
		buff = var2593
		var2585 = var2594
	end
	if self.purchase_analytics_metadata ~= nil then
		local var2595 = self.purchase_analytics_metadata:encode()
		local var2596, var2597 = protoModule.writeTag(buff, var2585, 4, protoModule.wireTypes.lengthDelimited)
		var2596, var4300 = protoModule.writeBuffer(var2596, var2597, var2595, buffer.len(var2595))
		buff = var2596
		var2585 = var2597
	end
	if self.root_place_id ~= nil then
		local var2598 = self.root_place_id:encode()
		local var2599, var2600 = protoModule.writeTag(buff, var2585, 5, protoModule.wireTypes.lengthDelimited)
		var2599, var4303 = protoModule.writeBuffer(var2599, var2600, var2598, buffer.len(var2598))
		buff = var2599
		var2585 = var2600
	end
	local buff_1 = buffer.create(var2585)
	buffer.copy(buff_1, 0, buff, 0, var2585)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref), t (ref), propTypesModule (ref)
	local var2585 = t_127.new()
	local var2586 = 0
	while var2586 < buffer.len(p127) do
		local _ = nil
		local var2587 = nil
		local var2588, var2589, var2590 = protoModule.readTag(p127, var2586)
		local var2591 = var2588
		var2587 = var2589
		var2586 = var2590
		
		if var2587 == protoModule.wireTypes.varint then
			local _ = nil
			local var2592, var2593 = protoModule.readVarInt(p127, var2586)
			local _ = var2592
			var2586 = var2593
			continue
		end
		if var2587 == protoModule.wireTypes.lengthDelimited then
			if var2591 == 1 then
				local _ = nil
				local var2594, var2595 = protoModule.readBuffer(p127, var2586)
				var2586 = var2595
				var2585.product_payload = t.OpenPurchasePromptAction_ProductPayload.decode(var2594)
			elseif var2591 == 2 then
				local _ = nil
				local var2596, var2597 = protoModule.readBuffer(p127, var2586)
				var2586 = var2597
				var2585.display_info = t.OpenPurchasePromptAction_DisplayInfo.decode(var2596)
			elseif var2591 == 3 then
				local _ = nil
				local var2598, var2599 = protoModule.readBuffer(p127, var2586)
				var2586 = var2599
				var2585.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.decode(var2598)
			elseif var2591 == 4 then
				local _ = nil
				local var2600, var2601 = protoModule.readBuffer(p127, var2586)
				var2586 = var2601
				var2585.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.decode(var2600)
			elseif var2591 == 5 then
				local _ = nil
				local var2602, var2603 = protoModule.readBuffer(p127, var2586)
				var2586 = var2603
				var2585.root_place_id = propTypesModule.StringProp.decode(var2602)
			else
				local _ = nil
				local var2604, var2605 = protoModule.readVarInt(p127, var2586)
				var2586 = var2605 + var2604
			end
		elseif var2587 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2606, var2607 = protoModule.readFixed32(p127, var2586)
			local _ = var2606
			var2586 = var2607
		elseif var2587 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2608, var2609 = protoModule.readFixed64(p127, var2586)
			local _ = var2608
			var2586 = var2609
		else
			error("Unsupported wire type: " .. var4307)
		end
	end
	return var2585
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
	local var2610 = t_127.new()
	
	if self.product_payload ~= nil then
		var2610.product_payload = t.OpenPurchasePromptAction_ProductPayload.jsonDecode(self.product_payload)
	end
	if self.productPayload ~= nil then
		var2610.product_payload = t.OpenPurchasePromptAction_ProductPayload.jsonDecode(self.productPayload)
	end
	if self.display_info ~= nil then
		var2610.display_info = t.OpenPurchasePromptAction_DisplayInfo.jsonDecode(self.display_info)
	end
	if self.displayInfo ~= nil then
		var2610.display_info = t.OpenPurchasePromptAction_DisplayInfo.jsonDecode(self.displayInfo)
	end
	if self.purchase_options ~= nil then
		var2610.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.jsonDecode(self.purchase_options)
	end
	if self.purchaseOptions ~= nil then
		var2610.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.jsonDecode(self.purchaseOptions)
	end
	if self.purchase_analytics_metadata ~= nil then
		var2610.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.jsonDecode(self.purchase_analytics_metadata)
	end
	if self.purchaseAnalyticsMetadata ~= nil then
		var2610.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.jsonDecode(self.purchaseAnalyticsMetadata)
	end
	if self.root_place_id ~= nil then
		var2610.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var2610.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var2610
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
	local var2610 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2611, var2612 = protoModule.writeTag(buff, var2610, 1, protoModule.wireTypes.varint)
		var2611, var4335 = protoModule.writeVarInt(var2611, var2612, t.ActionType.toNumber(self.action_type))
		buff = var2611
		var2610 = var2612
	end
	if self.action_params ~= nil then
		local var2613 = self.action_params:encode()
		local var2614, var2615 = protoModule.writeTag(buff, var2610, 2, protoModule.wireTypes.lengthDelimited)
		var2614, var4338 = protoModule.writeBuffer(var2614, var2615, var2613, buffer.len(var2613))
		buff = var2614
		var2610 = var2615
	end
	local buff_1 = buffer.create(var2610)
	buffer.copy(buff_1, 0, buff, 0, var2610)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var2610 = t_128.new()
	local var2611 = 0
	while var2611 < buffer.len(p128) do
		local _ = nil
		local var2612 = nil
		local var2613, var2614, var2615 = protoModule.readTag(p128, var2611)
		local var2616 = var2613
		var2612 = var2614
		var2611 = var2615
		
		if var2612 == protoModule.wireTypes.varint then
			if var2616 == 1 then
				local _ = nil
				local var2617, var2618 = protoModule.readVarIntI32(p128, var2611)
				local var2619 = var2617
				var2611 = var2618
				var2610.action_type = t.ActionType.fromNumber(var2619) or var2619
			else
				local _ = nil
				local var2620, var2621 = protoModule.readVarInt(p128, var2611)
				local _ = var2620
				var2611 = var2621
			end
		end
		if var2612 == protoModule.wireTypes.lengthDelimited then
			if var2616 == 2 then
				local _ = nil
				local var2622, var2623 = protoModule.readBuffer(p128, var2611)
				var2611 = var2623
				var2610.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.decode(var2622)
			else
				local _ = nil
				local var2624, var2625 = protoModule.readVarInt(p128, var2611)
				var2611 = var2625 + var2624
			end
		elseif var2612 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2626, var2627 = protoModule.readFixed32(p128, var2611)
			local _ = var2626
			var2611 = var2627
		elseif var2612 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2628, var2629 = protoModule.readFixed64(p128, var2611)
			local _ = var2628
			var2611 = var2629
		else
			error("Unsupported wire type: " .. var4342)
		end
	end
	return var2610
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
	local var2630 = t_128.new()
	
	if self.action_type ~= nil then
		var2630.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2630.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2630.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2630.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.jsonDecode(self.actionParams)
	end
	return var2630
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
	local var2630 = 0
	
	if self.milestone ~= nil then
		local var2631 = self.milestone:encode()
		local var2632, var2633 = protoModule.writeTag(buff, var2630, 1, protoModule.wireTypes.lengthDelimited)
		var2632, var4366 = protoModule.writeBuffer(var2632, var2633, var2631, buffer.len(var2631))
		buff = var2632
		var2630 = var2633
	end
	if self.metadata ~= nil then
		local var2634 = self.metadata:encode()
		local var2635, var2636 = protoModule.writeTag(buff, var2630, 3, protoModule.wireTypes.lengthDelimited)
		var2635, var4369 = protoModule.writeBuffer(var2635, var2636, var2634, buffer.len(var2634))
		buff = var2635
		var2630 = var2636
	end
	local buff_1 = buffer.create(var2630)
	buffer.copy(buff_1, 0, buff, 0, var2630)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref), propTypesModule (ref)
	local var2630 = t_129.new()
	local var2631 = 0
	while var2631 < buffer.len(p129) do
		local _ = nil
		local var2632 = nil
		local var2633, var2634, var2635 = protoModule.readTag(p129, var2631)
		local var2636 = var2633
		var2632 = var2634
		var2631 = var2635
		
		if var2632 == protoModule.wireTypes.varint then
			local _ = nil
			local var2637, var2638 = protoModule.readVarInt(p129, var2631)
			local _ = var2637
			var2631 = var2638
			continue
		end
		if var2632 == protoModule.wireTypes.lengthDelimited then
			if var2636 == 1 then
				local _ = nil
				local var2639, var2640 = protoModule.readBuffer(p129, var2631)
				var2631 = var2640
				var2630.milestone = propTypesModule.StringProp.decode(var2639)
			elseif var2636 == 3 then
				local _ = nil
				local var2641, var2642 = protoModule.readBuffer(p129, var2631)
				var2631 = var2642
				var2630.metadata = propTypesModule.StructProp.decode(var2641)
			else
				local _ = nil
				local var2643, var2644 = protoModule.readVarInt(p129, var2631)
				var2631 = var2644 + var2643
			end
		elseif var2632 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2645, var2646 = protoModule.readFixed32(p129, var2631)
			local _ = var2645
			var2631 = var2646
		elseif var2632 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2647, var2648 = protoModule.readFixed64(p129, var2631)
			local _ = var2647
			var2631 = var2648
		else
			error("Unsupported wire type: " .. var4373)
		end
	end
	return var2630
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
	local var2649 = t_129.new()
	
	if self.milestone ~= nil then
		var2649.milestone = propTypesModule.StringProp.jsonDecode(self.milestone)
	end
	if self.metadata ~= nil then
		var2649.metadata = propTypesModule.StructProp.jsonDecode(self.metadata)
	end
	return var2649
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
	local var2649 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2650, var2651 = protoModule.writeTag(buff, var2649, 1, protoModule.wireTypes.varint)
		var2650, var4395 = protoModule.writeVarInt(var2650, var2651, t.ActionType.toNumber(self.action_type))
		buff = var2650
		var2649 = var2651
	end
	if self.action_params ~= nil then
		local var2652 = self.action_params:encode()
		local var2653, var2654 = protoModule.writeTag(buff, var2649, 2, protoModule.wireTypes.lengthDelimited)
		var2653, var4398 = protoModule.writeBuffer(var2653, var2654, var2652, buffer.len(var2652))
		buff = var2653
		var2649 = var2654
	end
	local buff_1 = buffer.create(var2649)
	buffer.copy(buff_1, 0, buff, 0, var2649)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref), t (ref)
	local var2649 = t_130.new()
	local var2650 = 0
	while var2650 < buffer.len(p130) do
		local _ = nil
		local var2651 = nil
		local var2652, var2653, var2654 = protoModule.readTag(p130, var2650)
		local var2655 = var2652
		var2651 = var2653
		var2650 = var2654
		
		if var2651 == protoModule.wireTypes.varint then
			if var2655 == 1 then
				local _ = nil
				local var2656, var2657 = protoModule.readVarIntI32(p130, var2650)
				local var2658 = var2656
				var2650 = var2657
				var2649.action_type = t.ActionType.fromNumber(var2658) or var2658
			else
				local _ = nil
				local var2659, var2660 = protoModule.readVarInt(p130, var2650)
				local _ = var2659
				var2650 = var2660
			end
		end
		if var2651 == protoModule.wireTypes.lengthDelimited then
			if var2655 == 2 then
				local _ = nil
				local var2661, var2662 = protoModule.readBuffer(p130, var2650)
				var2650 = var2662
				var2649.action_params = t.DismissGameFeedbackAction_Params.decode(var2661)
			else
				local _ = nil
				local var2663, var2664 = protoModule.readVarInt(p130, var2650)
				var2650 = var2664 + var2663
			end
		elseif var2651 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2665, var2666 = protoModule.readFixed32(p130, var2650)
			local _ = var2665
			var2650 = var2666
		elseif var2651 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2667, var2668 = protoModule.readFixed64(p130, var2650)
			local _ = var2667
			var2650 = var2668
		else
			error("Unsupported wire type: " .. var4402)
		end
	end
	return var2649
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
	local var2669 = t_130.new()
	
	if self.action_type ~= nil then
		var2669.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2669.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2669.action_params = t.DismissGameFeedbackAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2669.action_params = t.DismissGameFeedbackAction_Params.jsonDecode(self.actionParams)
	end
	return var2669
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
	local var2669 = 0
	
	if self.root_place_id ~= nil then
		local var2670 = self.root_place_id:encode()
		local var2671, var2672 = protoModule.writeTag(buff, var2669, 1, protoModule.wireTypes.lengthDelimited)
		var2671, var4426 = protoModule.writeBuffer(var2671, var2672, var2670, buffer.len(var2670))
		buff = var2671
		var2669 = var2672
	end
	local buff_1 = buffer.create(var2669)
	buffer.copy(buff_1, 0, buff, 0, var2669)
	
	return buff_1
end

function t_131.decode(p131)
	-- upvalues: t_131 (ref), protoModule (ref), propTypesModule (ref)
	local var2669 = t_131.new()
	local var2670 = 0
	while var2670 < buffer.len(p131) do
		local _ = nil
		local var2671 = nil
		local var2672, var2673, var2674 = protoModule.readTag(p131, var2670)
		local var2675 = var2672
		var2671 = var2673
		var2670 = var2674
		
		if var2671 == protoModule.wireTypes.varint then
			local _ = nil
			local var2676, var2677 = protoModule.readVarInt(p131, var2670)
			local _ = var2676
			var2670 = var2677
			continue
		end
		if var2671 == protoModule.wireTypes.lengthDelimited then
			if var2675 == 1 then
				local _ = nil
				local var2678, var2679 = protoModule.readBuffer(p131, var2670)
				var2670 = var2679
				var2669.root_place_id = propTypesModule.StringProp.decode(var2678)
			else
				local _ = nil
				local var2680, var2681 = protoModule.readVarInt(p131, var2670)
				var2670 = var2681 + var2680
			end
		elseif var2671 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2682, var2683 = protoModule.readFixed32(p131, var2670)
			local _ = var2682
			var2670 = var2683
		elseif var2671 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2684, var2685 = protoModule.readFixed64(p131, var2670)
			local _ = var2684
			var2670 = var2685
		else
			error("Unsupported wire type: " .. var4430)
		end
	end
	return var2669
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
	local var2686 = t_131.new()
	
	if self.root_place_id ~= nil then
		var2686.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var2686.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var2686
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
	local var2686 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2687, var2688 = protoModule.writeTag(buff, var2686, 1, protoModule.wireTypes.varint)
		var2687, var4450 = protoModule.writeVarInt(var2687, var2688, t.ActionType.toNumber(self.action_type))
		buff = var2687
		var2686 = var2688
	end
	if self.action_params ~= nil then
		local var2689 = self.action_params:encode()
		local var2690, var2691 = protoModule.writeTag(buff, var2686, 2, protoModule.wireTypes.lengthDelimited)
		var2690, var4453 = protoModule.writeBuffer(var2690, var2691, var2689, buffer.len(var2689))
		buff = var2690
		var2686 = var2691
	end
	local buff_1 = buffer.create(var2686)
	buffer.copy(buff_1, 0, buff, 0, var2686)
	
	return buff_1
end

function t_132.decode(p132)
	-- upvalues: t_132 (ref), protoModule (ref), t (ref)
	local var2686 = t_132.new()
	local var2687 = 0
	while var2687 < buffer.len(p132) do
		local _ = nil
		local var2688 = nil
		local var2689, var2690, var2691 = protoModule.readTag(p132, var2687)
		local var2692 = var2689
		var2688 = var2690
		var2687 = var2691
		
		if var2688 == protoModule.wireTypes.varint then
			if var2692 == 1 then
				local _ = nil
				local var2693, var2694 = protoModule.readVarIntI32(p132, var2687)
				local var2695 = var2693
				var2687 = var2694
				var2686.action_type = t.ActionType.fromNumber(var2695) or var2695
			else
				local _ = nil
				local var2696, var2697 = protoModule.readVarInt(p132, var2687)
				local _ = var2696
				var2687 = var2697
			end
		end
		if var2688 == protoModule.wireTypes.lengthDelimited then
			if var2692 == 2 then
				local _ = nil
				local var2698, var2699 = protoModule.readBuffer(p132, var2687)
				var2687 = var2699
				var2686.action_params = t.OpenGameFeedbackFormAction_Params.decode(var2698)
			else
				local _ = nil
				local var2700, var2701 = protoModule.readVarInt(p132, var2687)
				var2687 = var2701 + var2700
			end
		elseif var2688 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2702, var2703 = protoModule.readFixed32(p132, var2687)
			local _ = var2702
			var2687 = var2703
		elseif var2688 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2704, var2705 = protoModule.readFixed64(p132, var2687)
			local _ = var2704
			var2687 = var2705
		else
			error("Unsupported wire type: " .. var4457)
		end
	end
	return var2686
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
	local var2706 = t_132.new()
	
	if self.action_type ~= nil then
		var2706.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2706.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2706.action_params = t.OpenGameFeedbackFormAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2706.action_params = t.OpenGameFeedbackFormAction_Params.jsonDecode(self.actionParams)
	end
	return var2706
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
	local var2706 = 0
	
	if self.universe_id ~= nil then
		local var2707 = self.universe_id:encode()
		local var2708, var2709 = protoModule.writeTag(buff, var2706, 1, protoModule.wireTypes.lengthDelimited)
		var2708, var4481 = protoModule.writeBuffer(var2708, var2709, var2707, buffer.len(var2707))
		buff = var2708
		var2706 = var2709
	end
	if self.root_place_id ~= nil then
		local var2710 = self.root_place_id:encode()
		local var2711, var2712 = protoModule.writeTag(buff, var2706, 2, protoModule.wireTypes.lengthDelimited)
		var2711, var4484 = protoModule.writeBuffer(var2711, var2712, var2710, buffer.len(var2710))
		buff = var2711
		var2706 = var2712
	end
	local buff_1 = buffer.create(var2706)
	buffer.copy(buff_1, 0, buff, 0, var2706)
	
	return buff_1
end

function t_133.decode(p133)
	-- upvalues: t_133 (ref), protoModule (ref), propTypesModule (ref)
	local var2706 = t_133.new()
	local var2707 = 0
	while var2707 < buffer.len(p133) do
		local _ = nil
		local var2708 = nil
		local var2709, var2710, var2711 = protoModule.readTag(p133, var2707)
		local var2712 = var2709
		var2708 = var2710
		var2707 = var2711
		
		if var2708 == protoModule.wireTypes.varint then
			local _ = nil
			local var2713, var2714 = protoModule.readVarInt(p133, var2707)
			local _ = var2713
			var2707 = var2714
			continue
		end
		if var2708 == protoModule.wireTypes.lengthDelimited then
			if var2712 == 1 then
				local _ = nil
				local var2715, var2716 = protoModule.readBuffer(p133, var2707)
				var2707 = var2716
				var2706.universe_id = propTypesModule.StringProp.decode(var2715)
			elseif var2712 == 2 then
				local _ = nil
				local var2717, var2718 = protoModule.readBuffer(p133, var2707)
				var2707 = var2718
				var2706.root_place_id = propTypesModule.StringProp.decode(var2717)
			else
				local _ = nil
				local var2719, var2720 = protoModule.readVarInt(p133, var2707)
				var2707 = var2720 + var2719
			end
		elseif var2708 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2721, var2722 = protoModule.readFixed32(p133, var2707)
			local _ = var2721
			var2707 = var2722
		elseif var2708 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2723, var2724 = protoModule.readFixed64(p133, var2707)
			local _ = var2723
			var2707 = var2724
		else
			error("Unsupported wire type: " .. var4488)
		end
	end
	return var2706
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
	local var2725 = t_133.new()
	
	if self.universe_id ~= nil then
		var2725.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2725.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.root_place_id ~= nil then
		var2725.root_place_id = propTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		var2725.root_place_id = propTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return var2725
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
	local var2725 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2726, var2727 = protoModule.writeTag(buff, var2725, 1, protoModule.wireTypes.varint)
		var2726, var4510 = protoModule.writeVarInt(var2726, var2727, t.ActionType.toNumber(self.action_type))
		buff = var2726
		var2725 = var2727
	end
	if self.action_params ~= nil then
		local var2728 = self.action_params:encode()
		local var2729, var2730 = protoModule.writeTag(buff, var2725, 2, protoModule.wireTypes.lengthDelimited)
		var2729, var4513 = protoModule.writeBuffer(var2729, var2730, var2728, buffer.len(var2728))
		buff = var2729
		var2725 = var2730
	end
	local buff_1 = buffer.create(var2725)
	buffer.copy(buff_1, 0, buff, 0, var2725)
	
	return buff_1
end

function t_134.decode(p134)
	-- upvalues: t_134 (ref), protoModule (ref), t (ref)
	local var2725 = t_134.new()
	local var2726 = 0
	while var2726 < buffer.len(p134) do
		local _ = nil
		local var2727 = nil
		local var2728, var2729, var2730 = protoModule.readTag(p134, var2726)
		local var2731 = var2728
		var2727 = var2729
		var2726 = var2730
		
		if var2727 == protoModule.wireTypes.varint then
			if var2731 == 1 then
				local _ = nil
				local var2732, var2733 = protoModule.readVarIntI32(p134, var2726)
				local var2734 = var2732
				var2726 = var2733
				var2725.action_type = t.ActionType.fromNumber(var2734) or var2734
			else
				local _ = nil
				local var2735, var2736 = protoModule.readVarInt(p134, var2726)
				local _ = var2735
				var2726 = var2736
			end
		end
		if var2727 == protoModule.wireTypes.lengthDelimited then
			if var2731 == 2 then
				local _ = nil
				local var2737, var2738 = protoModule.readBuffer(p134, var2726)
				var2726 = var2738
				var2725.action_params = t.AiOverviewFeedbackAction_Params.decode(var2737)
			else
				local _ = nil
				local var2739, var2740 = protoModule.readVarInt(p134, var2726)
				var2726 = var2740 + var2739
			end
		elseif var2727 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2741, var2742 = protoModule.readFixed32(p134, var2726)
			local _ = var2741
			var2726 = var2742
		elseif var2727 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2743, var2744 = protoModule.readFixed64(p134, var2726)
			local _ = var2743
			var2726 = var2744
		else
			error("Unsupported wire type: " .. var4517)
		end
	end
	return var2725
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
	local var2745 = t_134.new()
	
	if self.action_type ~= nil then
		var2745.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2745.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2745.action_params = t.AiOverviewFeedbackAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2745.action_params = t.AiOverviewFeedbackAction_Params.jsonDecode(self.actionParams)
	end
	return var2745
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
	local var2745 = 0
	
	if self.sentiment ~= nil then
		local var2746 = self.sentiment:encode()
		local var2747, var2748 = protoModule.writeTag(buff, var2745, 1, protoModule.wireTypes.lengthDelimited)
		var2747, var4541 = protoModule.writeBuffer(var2747, var2748, var2746, buffer.len(var2746))
		buff = var2747
		var2745 = var2748
	end
	if self.dialog_title ~= nil then
		local var2749 = self.dialog_title:encode()
		local var2750, var2751 = protoModule.writeTag(buff, var2745, 2, protoModule.wireTypes.lengthDelimited)
		var2750, var4544 = protoModule.writeBuffer(var2750, var2751, var2749, buffer.len(var2749))
		buff = var2750
		var2745 = var2751
	end
	if self.dialog_text ~= nil then
		local var2752 = self.dialog_text:encode()
		local var2753, var2754 = protoModule.writeTag(buff, var2745, 3, protoModule.wireTypes.lengthDelimited)
		var2753, var4547 = protoModule.writeBuffer(var2753, var2754, var2752, buffer.len(var2752))
		buff = var2753
		var2745 = var2754
	end
	if self.placeholder_text ~= nil then
		local var2755 = self.placeholder_text:encode()
		local var2756, var2757 = protoModule.writeTag(buff, var2745, 4, protoModule.wireTypes.lengthDelimited)
		var2756, var4550 = protoModule.writeBuffer(var2756, var2757, var2755, buffer.len(var2755))
		buff = var2756
		var2745 = var2757
	end
	local buff_1 = buffer.create(var2745)
	buffer.copy(buff_1, 0, buff, 0, var2745)
	
	return buff_1
end

function t_135.decode(p135)
	-- upvalues: t_135 (ref), protoModule (ref), propTypesModule (ref)
	local var2745 = t_135.new()
	local var2746 = 0
	while var2746 < buffer.len(p135) do
		local _ = nil
		local var2747 = nil
		local var2748, var2749, var2750 = protoModule.readTag(p135, var2746)
		local var2751 = var2748
		var2747 = var2749
		var2746 = var2750
		
		if var2747 == protoModule.wireTypes.varint then
			local _ = nil
			local var2752, var2753 = protoModule.readVarInt(p135, var2746)
			local _ = var2752
			var2746 = var2753
			continue
		end
		if var2747 == protoModule.wireTypes.lengthDelimited then
			if var2751 == 1 then
				local _ = nil
				local var2754, var2755 = protoModule.readBuffer(p135, var2746)
				var2746 = var2755
				var2745.sentiment = propTypesModule.StringProp.decode(var2754)
			elseif var2751 == 2 then
				local _ = nil
				local var2756, var2757 = protoModule.readBuffer(p135, var2746)
				var2746 = var2757
				var2745.dialog_title = propTypesModule.StringProp.decode(var2756)
			elseif var2751 == 3 then
				local _ = nil
				local var2758, var2759 = protoModule.readBuffer(p135, var2746)
				var2746 = var2759
				var2745.dialog_text = propTypesModule.StringProp.decode(var2758)
			elseif var2751 == 4 then
				local _ = nil
				local var2760, var2761 = protoModule.readBuffer(p135, var2746)
				var2746 = var2761
				var2745.placeholder_text = propTypesModule.StringProp.decode(var2760)
			else
				local _ = nil
				local var2762, var2763 = protoModule.readVarInt(p135, var2746)
				var2746 = var2763 + var2762
			end
		elseif var2747 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2764, var2765 = protoModule.readFixed32(p135, var2746)
			local _ = var2764
			var2746 = var2765
		elseif var2747 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2766, var2767 = protoModule.readFixed64(p135, var2746)
			local _ = var2766
			var2746 = var2767
		else
			error("Unsupported wire type: " .. var4554)
		end
	end
	return var2745
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
	local var2768 = t_135.new()
	
	if self.sentiment ~= nil then
		var2768.sentiment = propTypesModule.StringProp.jsonDecode(self.sentiment)
	end
	if self.dialog_title ~= nil then
		var2768.dialog_title = propTypesModule.StringProp.jsonDecode(self.dialog_title)
	end
	if self.dialogTitle ~= nil then
		var2768.dialog_title = propTypesModule.StringProp.jsonDecode(self.dialogTitle)
	end
	if self.dialog_text ~= nil then
		var2768.dialog_text = propTypesModule.StringProp.jsonDecode(self.dialog_text)
	end
	if self.dialogText ~= nil then
		var2768.dialog_text = propTypesModule.StringProp.jsonDecode(self.dialogText)
	end
	if self.placeholder_text ~= nil then
		var2768.placeholder_text = propTypesModule.StringProp.jsonDecode(self.placeholder_text)
	end
	if self.placeholderText ~= nil then
		var2768.placeholder_text = propTypesModule.StringProp.jsonDecode(self.placeholderText)
	end
	return var2768
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
	local var2768 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2769, var2770 = protoModule.writeTag(buff, var2768, 1, protoModule.wireTypes.varint)
		var2769, var4580 = protoModule.writeVarInt(var2769, var2770, t.ActionType.toNumber(self.action_type))
		buff = var2769
		var2768 = var2770
	end
	if self.action_params ~= nil then
		local var2771 = self.action_params:encode()
		local var2772, var2773 = protoModule.writeTag(buff, var2768, 2, protoModule.wireTypes.lengthDelimited)
		var2772, var4583 = protoModule.writeBuffer(var2772, var2773, var2771, buffer.len(var2771))
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
				var2768.action_params = t.EnableEventNotificationsAction_Params.decode(var2780)
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
			error("Unsupported wire type: " .. var4587)
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
		var2788.action_params = t.EnableEventNotificationsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2788.action_params = t.EnableEventNotificationsAction_Params.jsonDecode(self.actionParams)
	end
	return var2788
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
	local var2788 = 0
	
	if self.event_id ~= nil then
		local var2789 = self.event_id:encode()
		local var2790, var2791 = protoModule.writeTag(buff, var2788, 1, protoModule.wireTypes.lengthDelimited)
		var2790, var4611 = protoModule.writeBuffer(var2790, var2791, var2789, buffer.len(var2789))
		buff = var2790
		var2788 = var2791
	end
	if self.universe_id ~= nil then
		local var2792 = self.universe_id:encode()
		local var2793, var2794 = protoModule.writeTag(buff, var2788, 2, protoModule.wireTypes.lengthDelimited)
		var2793, var4614 = protoModule.writeBuffer(var2793, var2794, var2792, buffer.len(var2792))
		buff = var2793
		var2788 = var2794
	end
	if self.channel ~= nil then
		local var2795 = self.channel:encode()
		local var2796, var2797 = protoModule.writeTag(buff, var2788, 3, protoModule.wireTypes.lengthDelimited)
		var2796, var4617 = protoModule.writeBuffer(var2796, var2797, var2795, buffer.len(var2795))
		buff = var2796
		var2788 = var2797
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
			elseif var2794 == 2 then
				local _ = nil
				local var2799, var2800 = protoModule.readBuffer(p137, var2789)
				var2789 = var2800
				var2788.universe_id = propTypesModule.StringProp.decode(var2799)
			elseif var2794 == 3 then
				local _ = nil
				local var2801, var2802 = protoModule.readBuffer(p137, var2789)
				var2789 = var2802
				var2788.channel = propTypesModule.StringProp.decode(var2801)
			else
				local _ = nil
				local var2803, var2804 = protoModule.readVarInt(p137, var2789)
				var2789 = var2804 + var2803
			end
		elseif var2790 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2805, var2806 = protoModule.readFixed32(p137, var2789)
			local _ = var2805
			var2789 = var2806
		elseif var2790 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2807, var2808 = protoModule.readFixed64(p137, var2789)
			local _ = var2807
			var2789 = var2808
		else
			error("Unsupported wire type: " .. var4621)
		end
	end
	return var2788
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
	local var2809 = t_137.new()
	
	if self.event_id ~= nil then
		var2809.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var2809.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	if self.universe_id ~= nil then
		var2809.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2809.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.channel ~= nil then
		var2809.channel = propTypesModule.StringProp.jsonDecode(self.channel)
	end
	return var2809
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
	local var2809 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2810, var2811 = protoModule.writeTag(buff, var2809, 1, protoModule.wireTypes.varint)
		var2810, var4645 = protoModule.writeVarInt(var2810, var2811, t.ActionType.toNumber(self.action_type))
		buff = var2810
		var2809 = var2811
	end
	if self.action_params ~= nil then
		local var2812 = self.action_params:encode()
		local var2813, var2814 = protoModule.writeTag(buff, var2809, 2, protoModule.wireTypes.lengthDelimited)
		var2813, var4648 = protoModule.writeBuffer(var2813, var2814, var2812, buffer.len(var2812))
		buff = var2813
		var2809 = var2814
	end
	local buff_1 = buffer.create(var2809)
	buffer.copy(buff_1, 0, buff, 0, var2809)
	
	return buff_1
end

function t_138.decode(p138)
	-- upvalues: t_138 (ref), protoModule (ref), t (ref)
	local var2809 = t_138.new()
	local var2810 = 0
	while var2810 < buffer.len(p138) do
		local _ = nil
		local var2811 = nil
		local var2812, var2813, var2814 = protoModule.readTag(p138, var2810)
		local var2815 = var2812
		var2811 = var2813
		var2810 = var2814
		
		if var2811 == protoModule.wireTypes.varint then
			if var2815 == 1 then
				local _ = nil
				local var2816, var2817 = protoModule.readVarIntI32(p138, var2810)
				local var2818 = var2816
				var2810 = var2817
				var2809.action_type = t.ActionType.fromNumber(var2818) or var2818
			else
				local _ = nil
				local var2819, var2820 = protoModule.readVarInt(p138, var2810)
				local _ = var2819
				var2810 = var2820
			end
		end
		if var2811 == protoModule.wireTypes.lengthDelimited then
			if var2815 == 2 then
				local _ = nil
				local var2821, var2822 = protoModule.readBuffer(p138, var2810)
				var2810 = var2822
				var2809.action_params = t.DismissEventNotificationsModalAction_Params.decode(var2821)
			else
				local _ = nil
				local var2823, var2824 = protoModule.readVarInt(p138, var2810)
				var2810 = var2824 + var2823
			end
		elseif var2811 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2825, var2826 = protoModule.readFixed32(p138, var2810)
			local _ = var2825
			var2810 = var2826
		elseif var2811 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2827, var2828 = protoModule.readFixed64(p138, var2810)
			local _ = var2827
			var2810 = var2828
		else
			error("Unsupported wire type: " .. var4652)
		end
	end
	return var2809
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
	local var2829 = t_138.new()
	
	if self.action_type ~= nil then
		var2829.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2829.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2829.action_params = t.DismissEventNotificationsModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2829.action_params = t.DismissEventNotificationsModalAction_Params.jsonDecode(self.actionParams)
	end
	return var2829
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
	local var2829 = 0
	
	if self.event_id ~= nil then
		local var2830 = self.event_id:encode()
		local var2831, var2832 = protoModule.writeTag(buff, var2829, 1, protoModule.wireTypes.lengthDelimited)
		var2831, var4676 = protoModule.writeBuffer(var2831, var2832, var2830, buffer.len(var2830))
		buff = var2831
		var2829 = var2832
	end
	local buff_1 = buffer.create(var2829)
	buffer.copy(buff_1, 0, buff, 0, var2829)
	
	return buff_1
end

function t_139.decode(p139)
	-- upvalues: t_139 (ref), protoModule (ref), propTypesModule (ref)
	local var2829 = t_139.new()
	local var2830 = 0
	while var2830 < buffer.len(p139) do
		local _ = nil
		local var2831 = nil
		local var2832, var2833, var2834 = protoModule.readTag(p139, var2830)
		local var2835 = var2832
		var2831 = var2833
		var2830 = var2834
		
		if var2831 == protoModule.wireTypes.varint then
			local _ = nil
			local var2836, var2837 = protoModule.readVarInt(p139, var2830)
			local _ = var2836
			var2830 = var2837
			continue
		end
		if var2831 == protoModule.wireTypes.lengthDelimited then
			if var2835 == 1 then
				local _ = nil
				local var2838, var2839 = protoModule.readBuffer(p139, var2830)
				var2830 = var2839
				var2829.event_id = propTypesModule.StringProp.decode(var2838)
			else
				local _ = nil
				local var2840, var2841 = protoModule.readVarInt(p139, var2830)
				var2830 = var2841 + var2840
			end
		elseif var2831 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2842, var2843 = protoModule.readFixed32(p139, var2830)
			local _ = var2842
			var2830 = var2843
		elseif var2831 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2844, var2845 = protoModule.readFixed64(p139, var2830)
			local _ = var2844
			var2830 = var2845
		else
			error("Unsupported wire type: " .. var4680)
		end
	end
	return var2829
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
	local var2846 = t_139.new()
	
	if self.event_id ~= nil then
		var2846.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var2846.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var2846
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
	local var2846 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2847, var2848 = protoModule.writeTag(buff, var2846, 1, protoModule.wireTypes.varint)
		var2847, var4700 = protoModule.writeVarInt(var2847, var2848, t.ActionType.toNumber(self.action_type))
		buff = var2847
		var2846 = var2848
	end
	if self.action_params ~= nil then
		local var2849 = self.action_params:encode()
		local var2850, var2851 = protoModule.writeTag(buff, var2846, 2, protoModule.wireTypes.lengthDelimited)
		var2850, var4703 = protoModule.writeBuffer(var2850, var2851, var2849, buffer.len(var2849))
		buff = var2850
		var2846 = var2851
	end
	local buff_1 = buffer.create(var2846)
	buffer.copy(buff_1, 0, buff, 0, var2846)
	
	return buff_1
end

function t_140.decode(p140)
	-- upvalues: t_140 (ref), protoModule (ref), t (ref)
	local var2846 = t_140.new()
	local var2847 = 0
	while var2847 < buffer.len(p140) do
		local _ = nil
		local var2848 = nil
		local var2849, var2850, var2851 = protoModule.readTag(p140, var2847)
		local var2852 = var2849
		var2848 = var2850
		var2847 = var2851
		
		if var2848 == protoModule.wireTypes.varint then
			if var2852 == 1 then
				local _ = nil
				local var2853, var2854 = protoModule.readVarIntI32(p140, var2847)
				local var2855 = var2853
				var2847 = var2854
				var2846.action_type = t.ActionType.fromNumber(var2855) or var2855
			else
				local _ = nil
				local var2856, var2857 = protoModule.readVarInt(p140, var2847)
				local _ = var2856
				var2847 = var2857
			end
		end
		if var2848 == protoModule.wireTypes.lengthDelimited then
			if var2852 == 2 then
				local _ = nil
				local var2858, var2859 = protoModule.readBuffer(p140, var2847)
				var2847 = var2859
				var2846.action_params = t.OpenAmpWizardAction_Params.decode(var2858)
			else
				local _ = nil
				local var2860, var2861 = protoModule.readVarInt(p140, var2847)
				var2847 = var2861 + var2860
			end
		elseif var2848 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2862, var2863 = protoModule.readFixed32(p140, var2847)
			local _ = var2862
			var2847 = var2863
		elseif var2848 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2864, var2865 = protoModule.readFixed64(p140, var2847)
			local _ = var2864
			var2847 = var2865
		else
			error("Unsupported wire type: " .. var4707)
		end
	end
	return var2846
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
	local var2866 = t_140.new()
	
	if self.action_type ~= nil then
		var2866.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2866.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2866.action_params = t.OpenAmpWizardAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2866.action_params = t.OpenAmpWizardAction_Params.jsonDecode(self.actionParams)
	end
	return var2866
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
	local var2866 = 0
	
	if self.feature_name ~= nil then
		local var2867 = self.feature_name:encode()
		local var2868, var2869 = protoModule.writeTag(buff, var2866, 1, protoModule.wireTypes.lengthDelimited)
		var2868, var4731 = protoModule.writeBuffer(var2868, var2869, var2867, buffer.len(var2867))
		buff = var2868
		var2866 = var2869
	end
	if self.name_space ~= nil then
		local var2870 = self.name_space:encode()
		local var2871, var2872 = protoModule.writeTag(buff, var2866, 2, protoModule.wireTypes.lengthDelimited)
		var2871, var4734 = protoModule.writeBuffer(var2871, var2872, var2870, buffer.len(var2870))
		buff = var2871
		var2866 = var2872
	end
	if self.entry_point_event_ctx ~= nil then
		local var2873 = self.entry_point_event_ctx:encode()
		local var2874, var2875 = protoModule.writeTag(buff, var2866, 3, protoModule.wireTypes.lengthDelimited)
		var2874, var4737 = protoModule.writeBuffer(var2874, var2875, var2873, buffer.len(var2873))
		buff = var2874
		var2866 = var2875
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		local var2876 = self.skip_facial_age_estimation_web_link_modal:encode()
		local var2877, var2878 = protoModule.writeTag(buff, var2866, 4, protoModule.wireTypes.lengthDelimited)
		var2877, var4740 = protoModule.writeBuffer(var2877, var2878, var2876, buffer.len(var2876))
		buff = var2877
		var2866 = var2878
	end
	local buff_1 = buffer.create(var2866)
	buffer.copy(buff_1, 0, buff, 0, var2866)
	
	return buff_1
end

function t_141.decode(p141)
	-- upvalues: t_141 (ref), protoModule (ref), propTypesModule (ref)
	local var2866 = t_141.new()
	local var2867 = 0
	while var2867 < buffer.len(p141) do
		local _ = nil
		local var2868 = nil
		local var2869, var2870, var2871 = protoModule.readTag(p141, var2867)
		local var2872 = var2869
		var2868 = var2870
		var2867 = var2871
		
		if var2868 == protoModule.wireTypes.varint then
			local _ = nil
			local var2873, var2874 = protoModule.readVarInt(p141, var2867)
			local _ = var2873
			var2867 = var2874
			continue
		end
		if var2868 == protoModule.wireTypes.lengthDelimited then
			if var2872 == 1 then
				local _ = nil
				local var2875, var2876 = protoModule.readBuffer(p141, var2867)
				var2867 = var2876
				var2866.feature_name = propTypesModule.StringProp.decode(var2875)
			elseif var2872 == 2 then
				local _ = nil
				local var2877, var2878 = protoModule.readBuffer(p141, var2867)
				var2867 = var2878
				var2866.name_space = propTypesModule.StringProp.decode(var2877)
			elseif var2872 == 3 then
				local _ = nil
				local var2879, var2880 = protoModule.readBuffer(p141, var2867)
				var2867 = var2880
				var2866.entry_point_event_ctx = propTypesModule.StringProp.decode(var2879)
			elseif var2872 == 4 then
				local _ = nil
				local var2881, var2882 = protoModule.readBuffer(p141, var2867)
				var2867 = var2882
				var2866.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.decode(var2881)
			else
				local _ = nil
				local var2883, var2884 = protoModule.readVarInt(p141, var2867)
				var2867 = var2884 + var2883
			end
		elseif var2868 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2885, var2886 = protoModule.readFixed32(p141, var2867)
			local _ = var2885
			var2867 = var2886
		elseif var2868 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2887, var2888 = protoModule.readFixed64(p141, var2867)
			local _ = var2887
			var2867 = var2888
		else
			error("Unsupported wire type: " .. var4744)
		end
	end
	return var2866
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
	local var2889 = t_141.new()
	
	if self.feature_name ~= nil then
		var2889.feature_name = propTypesModule.StringProp.jsonDecode(self.feature_name)
	end
	if self.featureName ~= nil then
		var2889.feature_name = propTypesModule.StringProp.jsonDecode(self.featureName)
	end
	if self.name_space ~= nil then
		var2889.name_space = propTypesModule.StringProp.jsonDecode(self.name_space)
	end
	if self.nameSpace ~= nil then
		var2889.name_space = propTypesModule.StringProp.jsonDecode(self.nameSpace)
	end
	if self.entry_point_event_ctx ~= nil then
		var2889.entry_point_event_ctx = propTypesModule.StringProp.jsonDecode(self.entry_point_event_ctx)
	end
	if self.entryPointEventCtx ~= nil then
		var2889.entry_point_event_ctx = propTypesModule.StringProp.jsonDecode(self.entryPointEventCtx)
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		var2889.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.jsonDecode(self.skip_facial_age_estimation_web_link_modal)
	end
	if self.skipFacialAgeEstimationWebLinkModal ~= nil then
		var2889.skip_facial_age_estimation_web_link_modal = propTypesModule.BoolProp.jsonDecode(self.skipFacialAgeEstimationWebLinkModal)
	end
	return var2889
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
	local var2889 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2890, var2891 = protoModule.writeTag(buff, var2889, 1, protoModule.wireTypes.varint)
		var2890, var4770 = protoModule.writeVarInt(var2890, var2891, t.ActionType.toNumber(self.action_type))
		buff = var2890
		var2889 = var2891
	end
	if self.action_params ~= nil then
		local var2892 = self.action_params:encode()
		local var2893, var2894 = protoModule.writeTag(buff, var2889, 2, protoModule.wireTypes.lengthDelimited)
		var2893, var4773 = protoModule.writeBuffer(var2893, var2894, var2892, buffer.len(var2892))
		buff = var2893
		var2889 = var2894
	end
	local buff_1 = buffer.create(var2889)
	buffer.copy(buff_1, 0, buff, 0, var2889)
	
	return buff_1
end

function t_142.decode(p142)
	-- upvalues: t_142 (ref), protoModule (ref), t (ref)
	local var2889 = t_142.new()
	local var2890 = 0
	while var2890 < buffer.len(p142) do
		local _ = nil
		local var2891 = nil
		local var2892, var2893, var2894 = protoModule.readTag(p142, var2890)
		local var2895 = var2892
		var2891 = var2893
		var2890 = var2894
		
		if var2891 == protoModule.wireTypes.varint then
			if var2895 == 1 then
				local _ = nil
				local var2896, var2897 = protoModule.readVarIntI32(p142, var2890)
				local var2898 = var2896
				var2890 = var2897
				var2889.action_type = t.ActionType.fromNumber(var2898) or var2898
			else
				local _ = nil
				local var2899, var2900 = protoModule.readVarInt(p142, var2890)
				local _ = var2899
				var2890 = var2900
			end
		end
		if var2891 == protoModule.wireTypes.lengthDelimited then
			if var2895 == 2 then
				local _ = nil
				local var2901, var2902 = protoModule.readBuffer(p142, var2890)
				var2890 = var2902
				var2889.action_params = t.OpenSocialProofUserListSheetAction_Params.decode(var2901)
			else
				local _ = nil
				local var2903, var2904 = protoModule.readVarInt(p142, var2890)
				var2890 = var2904 + var2903
			end
		elseif var2891 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2905, var2906 = protoModule.readFixed32(p142, var2890)
			local _ = var2905
			var2890 = var2906
		elseif var2891 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2907, var2908 = protoModule.readFixed64(p142, var2890)
			local _ = var2907
			var2890 = var2908
		else
			error("Unsupported wire type: " .. var4777)
		end
	end
	return var2889
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
	local var2909 = t_142.new()
	
	if self.action_type ~= nil then
		var2909.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2909.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2909.action_params = t.OpenSocialProofUserListSheetAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2909.action_params = t.OpenSocialProofUserListSheetAction_Params.jsonDecode(self.actionParams)
	end
	return var2909
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
	local var2909 = 0
	
	if self.universe_id ~= nil then
		local var2910 = self.universe_id:encode()
		local var2911, var2912 = protoModule.writeTag(buff, var2909, 1, protoModule.wireTypes.lengthDelimited)
		var2911, var4801 = protoModule.writeBuffer(var2911, var2912, var2910, buffer.len(var2910))
		buff = var2911
		var2909 = var2912
	end
	if self.place_id ~= nil then
		local var2913 = self.place_id:encode()
		local var2914, var2915 = protoModule.writeTag(buff, var2909, 2, protoModule.wireTypes.lengthDelimited)
		var2914, var4804 = protoModule.writeBuffer(var2914, var2915, var2913, buffer.len(var2913))
		buff = var2914
		var2909 = var2915
	end
	if self.total_connections ~= nil then
		local var2916 = self.total_connections:encode()
		local var2917, var2918 = protoModule.writeTag(buff, var2909, 3, protoModule.wireTypes.lengthDelimited)
		var2917, var4807 = protoModule.writeBuffer(var2917, var2918, var2916, buffer.len(var2916))
		buff = var2917
		var2909 = var2918
	end
	if self.user_ids ~= nil then
		local var2919 = self.user_ids:encode()
		local var2920, var2921 = protoModule.writeTag(buff, var2909, 4, protoModule.wireTypes.lengthDelimited)
		var2920, var4810 = protoModule.writeBuffer(var2920, var2921, var2919, buffer.len(var2919))
		buff = var2920
		var2909 = var2921
	end
	if self.sheet_title ~= nil then
		local var2922 = self.sheet_title:encode()
		local var2923, var2924 = protoModule.writeTag(buff, var2909, 5, protoModule.wireTypes.lengthDelimited)
		var2923, var4813 = protoModule.writeBuffer(var2923, var2924, var2922, buffer.len(var2922))
		buff = var2923
		var2909 = var2924
	end
	local buff_1 = buffer.create(var2909)
	buffer.copy(buff_1, 0, buff, 0, var2909)
	
	return buff_1
end

function t_143.decode(p143)
	-- upvalues: t_143 (ref), protoModule (ref), propTypesModule (ref)
	local var2909 = t_143.new()
	local var2910 = 0
	while var2910 < buffer.len(p143) do
		local _ = nil
		local var2911 = nil
		local var2912, var2913, var2914 = protoModule.readTag(p143, var2910)
		local var2915 = var2912
		var2911 = var2913
		var2910 = var2914
		
		if var2911 == protoModule.wireTypes.varint then
			local _ = nil
			local var2916, var2917 = protoModule.readVarInt(p143, var2910)
			local _ = var2916
			var2910 = var2917
			continue
		end
		if var2911 == protoModule.wireTypes.lengthDelimited then
			if var2915 == 1 then
				local _ = nil
				local var2918, var2919 = protoModule.readBuffer(p143, var2910)
				var2910 = var2919
				var2909.universe_id = propTypesModule.StringProp.decode(var2918)
			elseif var2915 == 2 then
				local _ = nil
				local var2920, var2921 = protoModule.readBuffer(p143, var2910)
				var2910 = var2921
				var2909.place_id = propTypesModule.StringProp.decode(var2920)
			elseif var2915 == 3 then
				local _ = nil
				local var2922, var2923 = protoModule.readBuffer(p143, var2910)
				var2910 = var2923
				var2909.total_connections = propTypesModule.Int32Prop.decode(var2922)
			elseif var2915 == 4 then
				local _ = nil
				local var2924, var2925 = protoModule.readBuffer(p143, var2910)
				var2910 = var2925
				var2909.user_ids = propTypesModule.ArrayOfAvatarProp.decode(var2924)
			elseif var2915 == 5 then
				local _ = nil
				local var2926, var2927 = protoModule.readBuffer(p143, var2910)
				var2910 = var2927
				var2909.sheet_title = propTypesModule.StringProp.decode(var2926)
			else
				local _ = nil
				local var2928, var2929 = protoModule.readVarInt(p143, var2910)
				var2910 = var2929 + var2928
			end
		elseif var2911 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2930, var2931 = protoModule.readFixed32(p143, var2910)
			local _ = var2930
			var2910 = var2931
		elseif var2911 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2932, var2933 = protoModule.readFixed64(p143, var2910)
			local _ = var2932
			var2910 = var2933
		else
			error("Unsupported wire type: " .. var4817)
		end
	end
	return var2909
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
	local var2934 = t_143.new()
	
	if self.universe_id ~= nil then
		var2934.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var2934.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		var2934.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var2934.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.total_connections ~= nil then
		var2934.total_connections = propTypesModule.Int32Prop.jsonDecode(self.total_connections)
	end
	if self.totalConnections ~= nil then
		var2934.total_connections = propTypesModule.Int32Prop.jsonDecode(self.totalConnections)
	end
	if self.user_ids ~= nil then
		var2934.user_ids = propTypesModule.ArrayOfAvatarProp.jsonDecode(self.user_ids)
	end
	if self.userIds ~= nil then
		var2934.user_ids = propTypesModule.ArrayOfAvatarProp.jsonDecode(self.userIds)
	end
	if self.sheet_title ~= nil then
		var2934.sheet_title = propTypesModule.StringProp.jsonDecode(self.sheet_title)
	end
	if self.sheetTitle ~= nil then
		var2934.sheet_title = propTypesModule.StringProp.jsonDecode(self.sheetTitle)
	end
	return var2934
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
	local var2934 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2935, var2936 = protoModule.writeTag(buff, var2934, 1, protoModule.wireTypes.varint)
		var2935, var4845 = protoModule.writeVarInt(var2935, var2936, t.ActionType.toNumber(self.action_type))
		buff = var2935
		var2934 = var2936
	end
	if self.action_params ~= nil then
		local var2937 = self.action_params:encode()
		local var2938, var2939 = protoModule.writeTag(buff, var2934, 2, protoModule.wireTypes.lengthDelimited)
		var2938, var4848 = protoModule.writeBuffer(var2938, var2939, var2937, buffer.len(var2937))
		buff = var2938
		var2934 = var2939
	end
	local buff_1 = buffer.create(var2934)
	buffer.copy(buff_1, 0, buff, 0, var2934)
	
	return buff_1
end

function t_144.decode(p144)
	-- upvalues: t_144 (ref), protoModule (ref), t (ref)
	local var2934 = t_144.new()
	local var2935 = 0
	while var2935 < buffer.len(p144) do
		local _ = nil
		local var2936 = nil
		local var2937, var2938, var2939 = protoModule.readTag(p144, var2935)
		local var2940 = var2937
		var2936 = var2938
		var2935 = var2939
		
		if var2936 == protoModule.wireTypes.varint then
			if var2940 == 1 then
				local _ = nil
				local var2941, var2942 = protoModule.readVarIntI32(p144, var2935)
				local var2943 = var2941
				var2935 = var2942
				var2934.action_type = t.ActionType.fromNumber(var2943) or var2943
			else
				local _ = nil
				local var2944, var2945 = protoModule.readVarInt(p144, var2935)
				local _ = var2944
				var2935 = var2945
			end
		end
		if var2936 == protoModule.wireTypes.lengthDelimited then
			if var2940 == 2 then
				local _ = nil
				local var2946, var2947 = protoModule.readBuffer(p144, var2935)
				var2935 = var2947
				var2934.action_params = t.OpenSearchResultsTabAction_Params.decode(var2946)
			else
				local _ = nil
				local var2948, var2949 = protoModule.readVarInt(p144, var2935)
				var2935 = var2949 + var2948
			end
		elseif var2936 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2950, var2951 = protoModule.readFixed32(p144, var2935)
			local _ = var2950
			var2935 = var2951
		elseif var2936 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2952, var2953 = protoModule.readFixed64(p144, var2935)
			local _ = var2952
			var2935 = var2953
		else
			error("Unsupported wire type: " .. var4852)
		end
	end
	return var2934
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
	local var2954 = t_144.new()
	
	if self.action_type ~= nil then
		var2954.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2954.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2954.action_params = t.OpenSearchResultsTabAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2954.action_params = t.OpenSearchResultsTabAction_Params.jsonDecode(self.actionParams)
	end
	return var2954
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
	local var2954 = 0
	
	if self.search_type ~= nil then
		local var2955 = self.search_type:encode()
		local var2956, var2957 = protoModule.writeTag(buff, var2954, 1, protoModule.wireTypes.lengthDelimited)
		var2956, var4876 = protoModule.writeBuffer(var2956, var2957, var2955, buffer.len(var2955))
		buff = var2956
		var2954 = var2957
	end
	local buff_1 = buffer.create(var2954)
	buffer.copy(buff_1, 0, buff, 0, var2954)
	
	return buff_1
end

function t_145.decode(p145)
	-- upvalues: t_145 (ref), protoModule (ref), propTypesModule (ref)
	local var2954 = t_145.new()
	local var2955 = 0
	while var2955 < buffer.len(p145) do
		local _ = nil
		local var2956 = nil
		local var2957, var2958, var2959 = protoModule.readTag(p145, var2955)
		local var2960 = var2957
		var2956 = var2958
		var2955 = var2959
		
		if var2956 == protoModule.wireTypes.varint then
			local _ = nil
			local var2961, var2962 = protoModule.readVarInt(p145, var2955)
			local _ = var2961
			var2955 = var2962
			continue
		end
		if var2956 == protoModule.wireTypes.lengthDelimited then
			if var2960 == 1 then
				local _ = nil
				local var2963, var2964 = protoModule.readBuffer(p145, var2955)
				var2955 = var2964
				var2954.search_type = propTypesModule.StringProp.decode(var2963)
			else
				local _ = nil
				local var2965, var2966 = protoModule.readVarInt(p145, var2955)
				var2955 = var2966 + var2965
			end
		elseif var2956 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2967, var2968 = protoModule.readFixed32(p145, var2955)
			local _ = var2967
			var2955 = var2968
		elseif var2956 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2969, var2970 = protoModule.readFixed64(p145, var2955)
			local _ = var2969
			var2955 = var2970
		else
			error("Unsupported wire type: " .. var4880)
		end
	end
	return var2954
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
	local var2971 = t_145.new()
	
	if self.search_type ~= nil then
		var2971.search_type = propTypesModule.StringProp.jsonDecode(self.search_type)
	end
	if self.searchType ~= nil then
		var2971.search_type = propTypesModule.StringProp.jsonDecode(self.searchType)
	end
	return var2971
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
	local var2971 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var2972, var2973 = protoModule.writeTag(buff, var2971, 1, protoModule.wireTypes.varint)
		var2972, var4900 = protoModule.writeVarInt(var2972, var2973, t.ActionType.toNumber(self.action_type))
		buff = var2972
		var2971 = var2973
	end
	if self.action_params ~= nil then
		local var2974 = self.action_params:encode()
		local var2975, var2976 = protoModule.writeTag(buff, var2971, 2, protoModule.wireTypes.lengthDelimited)
		var2975, var4903 = protoModule.writeBuffer(var2975, var2976, var2974, buffer.len(var2974))
		buff = var2975
		var2971 = var2976
	end
	local buff_1 = buffer.create(var2971)
	buffer.copy(buff_1, 0, buff, 0, var2971)
	
	return buff_1
end

function t_146.decode(p146)
	-- upvalues: t_146 (ref), protoModule (ref), t (ref)
	local var2971 = t_146.new()
	local var2972 = 0
	while var2972 < buffer.len(p146) do
		local _ = nil
		local var2973 = nil
		local var2974, var2975, var2976 = protoModule.readTag(p146, var2972)
		local var2977 = var2974
		var2973 = var2975
		var2972 = var2976
		
		if var2973 == protoModule.wireTypes.varint then
			if var2977 == 1 then
				local _ = nil
				local var2978, var2979 = protoModule.readVarIntI32(p146, var2972)
				local var2980 = var2978
				var2972 = var2979
				var2971.action_type = t.ActionType.fromNumber(var2980) or var2980
			else
				local _ = nil
				local var2981, var2982 = protoModule.readVarInt(p146, var2972)
				local _ = var2981
				var2972 = var2982
			end
		end
		if var2973 == protoModule.wireTypes.lengthDelimited then
			if var2977 == 2 then
				local _ = nil
				local var2983, var2984 = protoModule.readBuffer(p146, var2972)
				var2972 = var2984
				var2971.action_params = t.DismissPromptAction_Params.decode(var2983)
			else
				local _ = nil
				local var2985, var2986 = protoModule.readVarInt(p146, var2972)
				var2972 = var2986 + var2985
			end
		elseif var2973 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2987, var2988 = protoModule.readFixed32(p146, var2972)
			local _ = var2987
			var2972 = var2988
		elseif var2973 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2989, var2990 = protoModule.readFixed64(p146, var2972)
			local _ = var2989
			var2972 = var2990
		else
			error("Unsupported wire type: " .. var4907)
		end
	end
	return var2971
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
	local var2991 = t_146.new()
	
	if self.action_type ~= nil then
		var2991.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var2991.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var2991.action_params = t.DismissPromptAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var2991.action_params = t.DismissPromptAction_Params.jsonDecode(self.actionParams)
	end
	return var2991
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
	local var2991 = 0
	
	if self.prompt_type ~= nil then
		local var2992 = self.prompt_type:encode()
		local var2993, var2994 = protoModule.writeTag(buff, var2991, 1, protoModule.wireTypes.lengthDelimited)
		var2993, var4931 = protoModule.writeBuffer(var2993, var2994, var2992, buffer.len(var2992))
		buff = var2993
		var2991 = var2994
	end
	if self.prompt_id ~= nil then
		local var2995 = self.prompt_id:encode()
		local var2996, var2997 = protoModule.writeTag(buff, var2991, 2, protoModule.wireTypes.lengthDelimited)
		var2996, var4934 = protoModule.writeBuffer(var2996, var2997, var2995, buffer.len(var2995))
		buff = var2996
		var2991 = var2997
	end
	if self.entity_type ~= nil then
		local var2998 = self.entity_type:encode()
		local var2999, var3000 = protoModule.writeTag(buff, var2991, 3, protoModule.wireTypes.lengthDelimited)
		var2999, var4937 = protoModule.writeBuffer(var2999, var3000, var2998, buffer.len(var2998))
		buff = var2999
		var2991 = var3000
	end
	if self.entity_id ~= nil then
		local var3001 = self.entity_id:encode()
		local var3002, var3003 = protoModule.writeTag(buff, var2991, 4, protoModule.wireTypes.lengthDelimited)
		var3002, var4940 = protoModule.writeBuffer(var3002, var3003, var3001, buffer.len(var3001))
		buff = var3002
		var2991 = var3003
	end
	local buff_1 = buffer.create(var2991)
	buffer.copy(buff_1, 0, buff, 0, var2991)
	
	return buff_1
end

function t_147.decode(p147)
	-- upvalues: t_147 (ref), protoModule (ref), propTypesModule (ref)
	local var2991 = t_147.new()
	local var2992 = 0
	while var2992 < buffer.len(p147) do
		local _ = nil
		local var2993 = nil
		local var2994, var2995, var2996 = protoModule.readTag(p147, var2992)
		local var2997 = var2994
		var2993 = var2995
		var2992 = var2996
		
		if var2993 == protoModule.wireTypes.varint then
			local _ = nil
			local var2998, var2999 = protoModule.readVarInt(p147, var2992)
			local _ = var2998
			var2992 = var2999
			continue
		end
		if var2993 == protoModule.wireTypes.lengthDelimited then
			if var2997 == 1 then
				local _ = nil
				local var3000, var3001 = protoModule.readBuffer(p147, var2992)
				var2992 = var3001
				var2991.prompt_type = propTypesModule.StringProp.decode(var3000)
			elseif var2997 == 2 then
				local _ = nil
				local var3002, var3003 = protoModule.readBuffer(p147, var2992)
				var2992 = var3003
				var2991.prompt_id = propTypesModule.StringProp.decode(var3002)
			elseif var2997 == 3 then
				local _ = nil
				local var3004, var3005 = protoModule.readBuffer(p147, var2992)
				var2992 = var3005
				var2991.entity_type = propTypesModule.StringProp.decode(var3004)
			elseif var2997 == 4 then
				local _ = nil
				local var3006, var3007 = protoModule.readBuffer(p147, var2992)
				var2992 = var3007
				var2991.entity_id = propTypesModule.StringProp.decode(var3006)
			else
				local _ = nil
				local var3008, var3009 = protoModule.readVarInt(p147, var2992)
				var2992 = var3009 + var3008
			end
		elseif var2993 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3010, var3011 = protoModule.readFixed32(p147, var2992)
			local _ = var3010
			var2992 = var3011
		elseif var2993 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3012, var3013 = protoModule.readFixed64(p147, var2992)
			local _ = var3012
			var2992 = var3013
		else
			error("Unsupported wire type: " .. var4944)
		end
	end
	return var2991
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
	local var3014 = t_147.new()
	
	if self.prompt_type ~= nil then
		var3014.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var3014.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		var3014.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var3014.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.entity_type ~= nil then
		var3014.entity_type = propTypesModule.StringProp.jsonDecode(self.entity_type)
	end
	if self.entityType ~= nil then
		var3014.entity_type = propTypesModule.StringProp.jsonDecode(self.entityType)
	end
	if self.entity_id ~= nil then
		var3014.entity_id = propTypesModule.StringProp.jsonDecode(self.entity_id)
	end
	if self.entityId ~= nil then
		var3014.entity_id = propTypesModule.StringProp.jsonDecode(self.entityId)
	end
	return var3014
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
	local var3014 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3015, var3016 = protoModule.writeTag(buff, var3014, 1, protoModule.wireTypes.varint)
		var3015, var4970 = protoModule.writeVarInt(var3015, var3016, t.ActionType.toNumber(self.action_type))
		buff = var3015
		var3014 = var3016
	end
	if self.action_params ~= nil then
		local var3017 = self.action_params:encode()
		local var3018, var3019 = protoModule.writeTag(buff, var3014, 2, protoModule.wireTypes.lengthDelimited)
		var3018, var4973 = protoModule.writeBuffer(var3018, var3019, var3017, buffer.len(var3017))
		buff = var3018
		var3014 = var3019
	end
	local buff_1 = buffer.create(var3014)
	buffer.copy(buff_1, 0, buff, 0, var3014)
	
	return buff_1
end

function t_148.decode(p148)
	-- upvalues: t_148 (ref), protoModule (ref), t (ref)
	local var3014 = t_148.new()
	local var3015 = 0
	while var3015 < buffer.len(p148) do
		local _ = nil
		local var3016 = nil
		local var3017, var3018, var3019 = protoModule.readTag(p148, var3015)
		local var3020 = var3017
		var3016 = var3018
		var3015 = var3019
		
		if var3016 == protoModule.wireTypes.varint then
			if var3020 == 1 then
				local _ = nil
				local var3021, var3022 = protoModule.readVarIntI32(p148, var3015)
				local var3023 = var3021
				var3015 = var3022
				var3014.action_type = t.ActionType.fromNumber(var3023) or var3023
			else
				local _ = nil
				local var3024, var3025 = protoModule.readVarInt(p148, var3015)
				local _ = var3024
				var3015 = var3025
			end
		end
		if var3016 == protoModule.wireTypes.lengthDelimited then
			if var3020 == 2 then
				local _ = nil
				local var3026, var3027 = protoModule.readBuffer(p148, var3015)
				var3015 = var3027
				var3014.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.decode(var3026)
			else
				local _ = nil
				local var3028, var3029 = protoModule.readVarInt(p148, var3015)
				var3015 = var3029 + var3028
			end
		elseif var3016 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3030, var3031 = protoModule.readFixed32(p148, var3015)
			local _ = var3030
			var3015 = var3031
		elseif var3016 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3032, var3033 = protoModule.readFixed64(p148, var3015)
			local _ = var3032
			var3015 = var3033
		else
			error("Unsupported wire type: " .. var4977)
		end
	end
	return var3014
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
	local var3034 = t_148.new()
	
	if self.action_type ~= nil then
		var3034.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3034.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3034.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3034.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.jsonDecode(self.actionParams)
	end
	return var3034
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
	local var3034 = 0
	
	if self.modal_action ~= nil then
		local var3035 = self.modal_action:encode()
		local var3036, var3037 = protoModule.writeTag(buff, var3034, 1, protoModule.wireTypes.lengthDelimited)
		var3036, var5001 = protoModule.writeBuffer(var3036, var3037, var3035, buffer.len(var3035))
		buff = var3036
		var3034 = var3037
	end
	if self.modal_variant ~= nil then
		local var3038 = self.modal_variant:encode()
		local var3039, var3040 = protoModule.writeTag(buff, var3034, 2, protoModule.wireTypes.lengthDelimited)
		var3039, var5004 = protoModule.writeBuffer(var3039, var3040, var3038, buffer.len(var3038))
		buff = var3039
		var3034 = var3040
	end
	if self.modal_sequence ~= nil then
		local var3041 = self.modal_sequence:encode()
		local var3042, var3043 = protoModule.writeTag(buff, var3034, 3, protoModule.wireTypes.lengthDelimited)
		var3042, var5007 = protoModule.writeBuffer(var3042, var3043, var3041, buffer.len(var3041))
		buff = var3042
		var3034 = var3043
	end
	if self.conversation_id ~= nil then
		local var3044 = self.conversation_id:encode()
		local var3045, var3046 = protoModule.writeTag(buff, var3034, 4, protoModule.wireTypes.lengthDelimited)
		var3045, var5010 = protoModule.writeBuffer(var3045, var3046, var3044, buffer.len(var3044))
		buff = var3045
		var3034 = var3046
	end
	if self.friend_id ~= nil then
		local var3047 = self.friend_id:encode()
		local var3048, var3049 = protoModule.writeTag(buff, var3034, 5, protoModule.wireTypes.lengthDelimited)
		var3048, var5013 = protoModule.writeBuffer(var3048, var3049, var3047, buffer.len(var3047))
		buff = var3048
		var3034 = var3049
	end
	local buff_1 = buffer.create(var3034)
	buffer.copy(buff_1, 0, buff, 0, var3034)
	
	return buff_1
end

function t_149.decode(p149)
	-- upvalues: t_149 (ref), protoModule (ref), propTypesModule (ref)
	local var3034 = t_149.new()
	local var3035 = 0
	while var3035 < buffer.len(p149) do
		local _ = nil
		local var3036 = nil
		local var3037, var3038, var3039 = protoModule.readTag(p149, var3035)
		local var3040 = var3037
		var3036 = var3038
		var3035 = var3039
		
		if var3036 == protoModule.wireTypes.varint then
			local _ = nil
			local var3041, var3042 = protoModule.readVarInt(p149, var3035)
			local _ = var3041
			var3035 = var3042
			continue
		end
		if var3036 == protoModule.wireTypes.lengthDelimited then
			if var3040 == 1 then
				local _ = nil
				local var3043, var3044 = protoModule.readBuffer(p149, var3035)
				var3035 = var3044
				var3034.modal_action = propTypesModule.StringProp.decode(var3043)
			elseif var3040 == 2 then
				local _ = nil
				local var3045, var3046 = protoModule.readBuffer(p149, var3035)
				var3035 = var3046
				var3034.modal_variant = propTypesModule.StringProp.decode(var3045)
			elseif var3040 == 3 then
				local _ = nil
				local var3047, var3048 = protoModule.readBuffer(p149, var3035)
				var3035 = var3048
				var3034.modal_sequence = propTypesModule.StringProp.decode(var3047)
			elseif var3040 == 4 then
				local _ = nil
				local var3049, var3050 = protoModule.readBuffer(p149, var3035)
				var3035 = var3050
				var3034.conversation_id = propTypesModule.StringProp.decode(var3049)
			elseif var3040 == 5 then
				local _ = nil
				local var3051, var3052 = protoModule.readBuffer(p149, var3035)
				var3035 = var3052
				var3034.friend_id = propTypesModule.StringProp.decode(var3051)
			else
				local _ = nil
				local var3053, var3054 = protoModule.readVarInt(p149, var3035)
				var3035 = var3054 + var3053
			end
		elseif var3036 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3055, var3056 = protoModule.readFixed32(p149, var3035)
			local _ = var3055
			var3035 = var3056
		elseif var3036 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3057, var3058 = protoModule.readFixed64(p149, var3035)
			local _ = var3057
			var3035 = var3058
		else
			error("Unsupported wire type: " .. var5017)
		end
	end
	return var3034
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
	local var3059 = t_149.new()
	
	if self.modal_action ~= nil then
		var3059.modal_action = propTypesModule.StringProp.jsonDecode(self.modal_action)
	end
	if self.modalAction ~= nil then
		var3059.modal_action = propTypesModule.StringProp.jsonDecode(self.modalAction)
	end
	if self.modal_variant ~= nil then
		var3059.modal_variant = propTypesModule.StringProp.jsonDecode(self.modal_variant)
	end
	if self.modalVariant ~= nil then
		var3059.modal_variant = propTypesModule.StringProp.jsonDecode(self.modalVariant)
	end
	if self.modal_sequence ~= nil then
		var3059.modal_sequence = propTypesModule.StringProp.jsonDecode(self.modal_sequence)
	end
	if self.modalSequence ~= nil then
		var3059.modal_sequence = propTypesModule.StringProp.jsonDecode(self.modalSequence)
	end
	if self.conversation_id ~= nil then
		var3059.conversation_id = propTypesModule.StringProp.jsonDecode(self.conversation_id)
	end
	if self.conversationId ~= nil then
		var3059.conversation_id = propTypesModule.StringProp.jsonDecode(self.conversationId)
	end
	if self.friend_id ~= nil then
		var3059.friend_id = propTypesModule.StringProp.jsonDecode(self.friend_id)
	end
	if self.friendId ~= nil then
		var3059.friend_id = propTypesModule.StringProp.jsonDecode(self.friendId)
	end
	return var3059
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
	local var3059 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3060, var3061 = protoModule.writeTag(buff, var3059, 1, protoModule.wireTypes.varint)
		var3060, var5045 = protoModule.writeVarInt(var3060, var3061, t.ActionType.toNumber(self.action_type))
		buff = var3060
		var3059 = var3061
	end
	if self.action_params ~= nil then
		local var3062 = self.action_params:encode()
		local var3063, var3064 = protoModule.writeTag(buff, var3059, 2, protoModule.wireTypes.lengthDelimited)
		var3063, var5048 = protoModule.writeBuffer(var3063, var3064, var3062, buffer.len(var3062))
		buff = var3063
		var3059 = var3064
	end
	local buff_1 = buffer.create(var3059)
	buffer.copy(buff_1, 0, buff, 0, var3059)
	
	return buff_1
end

function t_150.decode(p150)
	-- upvalues: t_150 (ref), protoModule (ref), t (ref)
	local var3059 = t_150.new()
	local var3060 = 0
	while var3060 < buffer.len(p150) do
		local _ = nil
		local var3061 = nil
		local var3062, var3063, var3064 = protoModule.readTag(p150, var3060)
		local var3065 = var3062
		var3061 = var3063
		var3060 = var3064
		
		if var3061 == protoModule.wireTypes.varint then
			if var3065 == 1 then
				local _ = nil
				local var3066, var3067 = protoModule.readVarIntI32(p150, var3060)
				local var3068 = var3066
				var3060 = var3067
				var3059.action_type = t.ActionType.fromNumber(var3068) or var3068
			else
				local _ = nil
				local var3069, var3070 = protoModule.readVarInt(p150, var3060)
				local _ = var3069
				var3060 = var3070
			end
		end
		if var3061 == protoModule.wireTypes.lengthDelimited then
			if var3065 == 2 then
				local _ = nil
				local var3071, var3072 = protoModule.readBuffer(p150, var3060)
				var3060 = var3072
				var3059.action_params = t.RequestFriendshipAction_Params.decode(var3071)
			else
				local _ = nil
				local var3073, var3074 = protoModule.readVarInt(p150, var3060)
				var3060 = var3074 + var3073
			end
		elseif var3061 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3075, var3076 = protoModule.readFixed32(p150, var3060)
			local _ = var3075
			var3060 = var3076
		elseif var3061 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3077, var3078 = protoModule.readFixed64(p150, var3060)
			local _ = var3077
			var3060 = var3078
		else
			error("Unsupported wire type: " .. var5052)
		end
	end
	return var3059
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
	local var3079 = t_150.new()
	
	if self.action_type ~= nil then
		var3079.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3079.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3079.action_params = t.RequestFriendshipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3079.action_params = t.RequestFriendshipAction_Params.jsonDecode(self.actionParams)
	end
	return var3079
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
	local var3079 = 0
	
	if self.target_user_id ~= nil then
		local var3080 = self.target_user_id:encode()
		local var3081, var3082 = protoModule.writeTag(buff, var3079, 1, protoModule.wireTypes.lengthDelimited)
		var3081, var5076 = protoModule.writeBuffer(var3081, var3082, var3080, buffer.len(var3080))
		buff = var3081
		var3079 = var3082
	end
	if self.source ~= nil then
		local var3083 = self.source:encode()
		local var3084, var3085 = protoModule.writeTag(buff, var3079, 2, protoModule.wireTypes.lengthDelimited)
		var3084, var5079 = protoModule.writeBuffer(var3084, var3085, var3083, buffer.len(var3083))
		buff = var3084
		var3079 = var3085
	end
	local buff_1 = buffer.create(var3079)
	buffer.copy(buff_1, 0, buff, 0, var3079)
	
	return buff_1
end

function t_151.decode(p151)
	-- upvalues: t_151 (ref), protoModule (ref), propTypesModule (ref)
	local var3079 = t_151.new()
	local var3080 = 0
	while var3080 < buffer.len(p151) do
		local _ = nil
		local var3081 = nil
		local var3082, var3083, var3084 = protoModule.readTag(p151, var3080)
		local var3085 = var3082
		var3081 = var3083
		var3080 = var3084
		
		if var3081 == protoModule.wireTypes.varint then
			local _ = nil
			local var3086, var3087 = protoModule.readVarInt(p151, var3080)
			local _ = var3086
			var3080 = var3087
			continue
		end
		if var3081 == protoModule.wireTypes.lengthDelimited then
			if var3085 == 1 then
				local _ = nil
				local var3088, var3089 = protoModule.readBuffer(p151, var3080)
				var3080 = var3089
				var3079.target_user_id = propTypesModule.StringProp.decode(var3088)
			elseif var3085 == 2 then
				local _ = nil
				local var3090, var3091 = protoModule.readBuffer(p151, var3080)
				var3080 = var3091
				var3079.source = propTypesModule.StringProp.decode(var3090)
			else
				local _ = nil
				local var3092, var3093 = protoModule.readVarInt(p151, var3080)
				var3080 = var3093 + var3092
			end
		elseif var3081 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3094, var3095 = protoModule.readFixed32(p151, var3080)
			local _ = var3094
			var3080 = var3095
		elseif var3081 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3096, var3097 = protoModule.readFixed64(p151, var3080)
			local _ = var3096
			var3080 = var3097
		else
			error("Unsupported wire type: " .. var5083)
		end
	end
	return var3079
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
	local var3098 = t_151.new()
	
	if self.target_user_id ~= nil then
		var3098.target_user_id = propTypesModule.StringProp.jsonDecode(self.target_user_id)
	end
	if self.targetUserId ~= nil then
		var3098.target_user_id = propTypesModule.StringProp.jsonDecode(self.targetUserId)
	end
	if self.source ~= nil then
		var3098.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var3098
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
	local var3098 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3099, var3100 = protoModule.writeTag(buff, var3098, 1, protoModule.wireTypes.varint)
		var3099, var5105 = protoModule.writeVarInt(var3099, var3100, t.ActionType.toNumber(self.action_type))
		buff = var3099
		var3098 = var3100
	end
	if self.action_params ~= nil then
		local var3101 = self.action_params:encode()
		local var3102, var3103 = protoModule.writeTag(buff, var3098, 2, protoModule.wireTypes.lengthDelimited)
		var3102, var5108 = protoModule.writeBuffer(var3102, var3103, var3101, buffer.len(var3101))
		buff = var3102
		var3098 = var3103
	end
	local buff_1 = buffer.create(var3098)
	buffer.copy(buff_1, 0, buff, 0, var3098)
	
	return buff_1
end

function t_152.decode(p152)
	-- upvalues: t_152 (ref), protoModule (ref), t (ref)
	local var3098 = t_152.new()
	local var3099 = 0
	while var3099 < buffer.len(p152) do
		local _ = nil
		local var3100 = nil
		local var3101, var3102, var3103 = protoModule.readTag(p152, var3099)
		local var3104 = var3101
		var3100 = var3102
		var3099 = var3103
		
		if var3100 == protoModule.wireTypes.varint then
			if var3104 == 1 then
				local _ = nil
				local var3105, var3106 = protoModule.readVarIntI32(p152, var3099)
				local var3107 = var3105
				var3099 = var3106
				var3098.action_type = t.ActionType.fromNumber(var3107) or var3107
			else
				local _ = nil
				local var3108, var3109 = protoModule.readVarInt(p152, var3099)
				local _ = var3108
				var3099 = var3109
			end
		end
		if var3100 == protoModule.wireTypes.lengthDelimited then
			if var3104 == 2 then
				local _ = nil
				local var3110, var3111 = protoModule.readBuffer(p152, var3099)
				var3099 = var3111
				var3098.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.decode(var3110)
			else
				local _ = nil
				local var3112, var3113 = protoModule.readVarInt(p152, var3099)
				var3099 = var3113 + var3112
			end
		elseif var3100 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3114, var3115 = protoModule.readFixed32(p152, var3099)
			local _ = var3114
			var3099 = var3115
		elseif var3100 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3116, var3117 = protoModule.readFixed64(p152, var3099)
			local _ = var3116
			var3099 = var3117
		else
			error("Unsupported wire type: " .. var5112)
		end
	end
	return var3098
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
	local var3118 = t_152.new()
	
	if self.action_type ~= nil then
		var3118.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3118.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3118.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3118.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return var3118
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
	local var3118 = 0
	
	if self.target_user_id ~= nil then
		local var3119 = self.target_user_id:encode()
		local var3120, var3121 = protoModule.writeTag(buff, var3118, 1, protoModule.wireTypes.lengthDelimited)
		var3120, var5136 = protoModule.writeBuffer(var3120, var3121, var3119, buffer.len(var3119))
		buff = var3120
		var3118 = var3121
	end
	local buff_1 = buffer.create(var3118)
	buffer.copy(buff_1, 0, buff, 0, var3118)
	
	return buff_1
end

function t_153.decode(p153)
	-- upvalues: t_153 (ref), protoModule (ref), propTypesModule (ref)
	local var3118 = t_153.new()
	local var3119 = 0
	while var3119 < buffer.len(p153) do
		local _ = nil
		local var3120 = nil
		local var3121, var3122, var3123 = protoModule.readTag(p153, var3119)
		local var3124 = var3121
		var3120 = var3122
		var3119 = var3123
		
		if var3120 == protoModule.wireTypes.varint then
			local _ = nil
			local var3125, var3126 = protoModule.readVarInt(p153, var3119)
			local _ = var3125
			var3119 = var3126
			continue
		end
		if var3120 == protoModule.wireTypes.lengthDelimited then
			if var3124 == 1 then
				local _ = nil
				local var3127, var3128 = protoModule.readBuffer(p153, var3119)
				var3119 = var3128
				var3118.target_user_id = propTypesModule.StringProp.decode(var3127)
			else
				local _ = nil
				local var3129, var3130 = protoModule.readVarInt(p153, var3119)
				var3119 = var3130 + var3129
			end
		elseif var3120 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3131, var3132 = protoModule.readFixed32(p153, var3119)
			local _ = var3131
			var3119 = var3132
		elseif var3120 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3133, var3134 = protoModule.readFixed64(p153, var3119)
			local _ = var3133
			var3119 = var3134
		else
			error("Unsupported wire type: " .. var5140)
		end
	end
	return var3118
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
	local var3135 = t_153.new()
	
	if self.target_user_id ~= nil then
		var3135.target_user_id = propTypesModule.StringProp.jsonDecode(self.target_user_id)
	end
	if self.targetUserId ~= nil then
		var3135.target_user_id = propTypesModule.StringProp.jsonDecode(self.targetUserId)
	end
	return var3135
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
	local var3135 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3136, var3137 = protoModule.writeTag(buff, var3135, 1, protoModule.wireTypes.varint)
		var3136, var5160 = protoModule.writeVarInt(var3136, var3137, t.ActionType.toNumber(self.action_type))
		buff = var3136
		var3135 = var3137
	end
	if self.action_params ~= nil then
		local var3138 = self.action_params:encode()
		local var3139, var3140 = protoModule.writeTag(buff, var3135, 2, protoModule.wireTypes.lengthDelimited)
		var3139, var5163 = protoModule.writeBuffer(var3139, var3140, var3138, buffer.len(var3138))
		buff = var3139
		var3135 = var3140
	end
	local buff_1 = buffer.create(var3135)
	buffer.copy(buff_1, 0, buff, 0, var3135)
	
	return buff_1
end

function t_154.decode(p154)
	-- upvalues: t_154 (ref), protoModule (ref), t (ref)
	local var3135 = t_154.new()
	local var3136 = 0
	while var3136 < buffer.len(p154) do
		local _ = nil
		local var3137 = nil
		local var3138, var3139, var3140 = protoModule.readTag(p154, var3136)
		local var3141 = var3138
		var3137 = var3139
		var3136 = var3140
		
		if var3137 == protoModule.wireTypes.varint then
			if var3141 == 1 then
				local _ = nil
				local var3142, var3143 = protoModule.readVarIntI32(p154, var3136)
				local var3144 = var3142
				var3136 = var3143
				var3135.action_type = t.ActionType.fromNumber(var3144) or var3144
			else
				local _ = nil
				local var3145, var3146 = protoModule.readVarInt(p154, var3136)
				local _ = var3145
				var3136 = var3146
			end
		end
		if var3137 == protoModule.wireTypes.lengthDelimited then
			if var3141 == 2 then
				local _ = nil
				local var3147, var3148 = protoModule.readBuffer(p154, var3136)
				var3136 = var3148
				var3135.action_params = t.OpenSearchResultsWithQueryAction_Params.decode(var3147)
			else
				local _ = nil
				local var3149, var3150 = protoModule.readVarInt(p154, var3136)
				var3136 = var3150 + var3149
			end
		elseif var3137 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3151, var3152 = protoModule.readFixed32(p154, var3136)
			local _ = var3151
			var3136 = var3152
		elseif var3137 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3153, var3154 = protoModule.readFixed64(p154, var3136)
			local _ = var3153
			var3136 = var3154
		else
			error("Unsupported wire type: " .. var5167)
		end
	end
	return var3135
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
	local var3155 = t_154.new()
	
	if self.action_type ~= nil then
		var3155.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3155.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3155.action_params = t.OpenSearchResultsWithQueryAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3155.action_params = t.OpenSearchResultsWithQueryAction_Params.jsonDecode(self.actionParams)
	end
	return var3155
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
	local var3155 = 0
	
	if self.search_query ~= nil then
		local var3156 = self.search_query:encode()
		local var3157, var3158 = protoModule.writeTag(buff, var3155, 1, protoModule.wireTypes.lengthDelimited)
		var3157, var5191 = protoModule.writeBuffer(var3157, var3158, var3156, buffer.len(var3156))
		buff = var3157
		var3155 = var3158
	end
	if self.search_type ~= nil then
		local var3159 = self.search_type:encode()
		local var3160, var3161 = protoModule.writeTag(buff, var3155, 2, protoModule.wireTypes.lengthDelimited)
		var3160, var5194 = protoModule.writeBuffer(var3160, var3161, var3159, buffer.len(var3159))
		buff = var3160
		var3155 = var3161
	end
	local buff_1 = buffer.create(var3155)
	buffer.copy(buff_1, 0, buff, 0, var3155)
	
	return buff_1
end

function t_155.decode(p155)
	-- upvalues: t_155 (ref), protoModule (ref), propTypesModule (ref)
	local var3155 = t_155.new()
	local var3156 = 0
	while var3156 < buffer.len(p155) do
		local _ = nil
		local var3157 = nil
		local var3158, var3159, var3160 = protoModule.readTag(p155, var3156)
		local var3161 = var3158
		var3157 = var3159
		var3156 = var3160
		
		if var3157 == protoModule.wireTypes.varint then
			local _ = nil
			local var3162, var3163 = protoModule.readVarInt(p155, var3156)
			local _ = var3162
			var3156 = var3163
			continue
		end
		if var3157 == protoModule.wireTypes.lengthDelimited then
			if var3161 == 1 then
				local _ = nil
				local var3164, var3165 = protoModule.readBuffer(p155, var3156)
				var3156 = var3165
				var3155.search_query = propTypesModule.StringProp.decode(var3164)
			elseif var3161 == 2 then
				local _ = nil
				local var3166, var3167 = protoModule.readBuffer(p155, var3156)
				var3156 = var3167
				var3155.search_type = propTypesModule.StringProp.decode(var3166)
			else
				local _ = nil
				local var3168, var3169 = protoModule.readVarInt(p155, var3156)
				var3156 = var3169 + var3168
			end
		elseif var3157 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3170, var3171 = protoModule.readFixed32(p155, var3156)
			local _ = var3170
			var3156 = var3171
		elseif var3157 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3172, var3173 = protoModule.readFixed64(p155, var3156)
			local _ = var3172
			var3156 = var3173
		else
			error("Unsupported wire type: " .. var5198)
		end
	end
	return var3155
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
	local var3174 = t_155.new()
	
	if self.search_query ~= nil then
		var3174.search_query = propTypesModule.StringProp.jsonDecode(self.search_query)
	end
	if self.searchQuery ~= nil then
		var3174.search_query = propTypesModule.StringProp.jsonDecode(self.searchQuery)
	end
	if self.search_type ~= nil then
		var3174.search_type = propTypesModule.StringProp.jsonDecode(self.search_type)
	end
	if self.searchType ~= nil then
		var3174.search_type = propTypesModule.StringProp.jsonDecode(self.searchType)
	end
	return var3174
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
	local var3174 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3175, var3176 = protoModule.writeTag(buff, var3174, 1, protoModule.wireTypes.varint)
		var3175, var5220 = protoModule.writeVarInt(var3175, var3176, t.ActionType.toNumber(self.action_type))
		buff = var3175
		var3174 = var3176
	end
	if self.action_params ~= nil then
		local var3177 = self.action_params:encode()
		local var3178, var3179 = protoModule.writeTag(buff, var3174, 2, protoModule.wireTypes.lengthDelimited)
		var3178, var5223 = protoModule.writeBuffer(var3178, var3179, var3177, buffer.len(var3177))
		buff = var3178
		var3174 = var3179
	end
	local buff_1 = buffer.create(var3174)
	buffer.copy(buff_1, 0, buff, 0, var3174)
	
	return buff_1
end

function t_156.decode(p156)
	-- upvalues: t_156 (ref), protoModule (ref), t (ref)
	local var3174 = t_156.new()
	local var3175 = 0
	while var3175 < buffer.len(p156) do
		local _ = nil
		local var3176 = nil
		local var3177, var3178, var3179 = protoModule.readTag(p156, var3175)
		local var3180 = var3177
		var3176 = var3178
		var3175 = var3179
		
		if var3176 == protoModule.wireTypes.varint then
			if var3180 == 1 then
				local _ = nil
				local var3181, var3182 = protoModule.readVarIntI32(p156, var3175)
				local var3183 = var3181
				var3175 = var3182
				var3174.action_type = t.ActionType.fromNumber(var3183) or var3183
			else
				local _ = nil
				local var3184, var3185 = protoModule.readVarInt(p156, var3175)
				local _ = var3184
				var3175 = var3185
			end
		end
		if var3176 == protoModule.wireTypes.lengthDelimited then
			if var3180 == 2 then
				local _ = nil
				local var3186, var3187 = protoModule.readBuffer(p156, var3175)
				var3175 = var3187
				var3174.action_params = t.SelectMarketplaceFavoritesCategory_Params.decode(var3186)
			else
				local _ = nil
				local var3188, var3189 = protoModule.readVarInt(p156, var3175)
				var3175 = var3189 + var3188
			end
		elseif var3176 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3190, var3191 = protoModule.readFixed32(p156, var3175)
			local _ = var3190
			var3175 = var3191
		elseif var3176 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3192, var3193 = protoModule.readFixed64(p156, var3175)
			local _ = var3192
			var3175 = var3193
		else
			error("Unsupported wire type: " .. var5227)
		end
	end
	return var3174
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
	local var3194 = t_156.new()
	
	if self.action_type ~= nil then
		var3194.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3194.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3194.action_params = t.SelectMarketplaceFavoritesCategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3194.action_params = t.SelectMarketplaceFavoritesCategory_Params.jsonDecode(self.actionParams)
	end
	return var3194
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
	local var3194 = 0
	
	if self.category_id ~= nil then
		local var3195 = self.category_id:encode()
		local var3196, var3197 = protoModule.writeTag(buff, var3194, 1, protoModule.wireTypes.lengthDelimited)
		var3196, var5251 = protoModule.writeBuffer(var3196, var3197, var3195, buffer.len(var3195))
		buff = var3196
		var3194 = var3197
	end
	local buff_1 = buffer.create(var3194)
	buffer.copy(buff_1, 0, buff, 0, var3194)
	
	return buff_1
end

function t_157.decode(p157)
	-- upvalues: t_157 (ref), protoModule (ref), propTypesModule (ref)
	local var3194 = t_157.new()
	local var3195 = 0
	while var3195 < buffer.len(p157) do
		local _ = nil
		local var3196 = nil
		local var3197, var3198, var3199 = protoModule.readTag(p157, var3195)
		local var3200 = var3197
		var3196 = var3198
		var3195 = var3199
		
		if var3196 == protoModule.wireTypes.varint then
			local _ = nil
			local var3201, var3202 = protoModule.readVarInt(p157, var3195)
			local _ = var3201
			var3195 = var3202
			continue
		end
		if var3196 == protoModule.wireTypes.lengthDelimited then
			if var3200 == 1 then
				local _ = nil
				local var3203, var3204 = protoModule.readBuffer(p157, var3195)
				var3195 = var3204
				var3194.category_id = propTypesModule.StringProp.decode(var3203)
			else
				local _ = nil
				local var3205, var3206 = protoModule.readVarInt(p157, var3195)
				var3195 = var3206 + var3205
			end
		elseif var3196 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3207, var3208 = protoModule.readFixed32(p157, var3195)
			local _ = var3207
			var3195 = var3208
		elseif var3196 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3209, var3210 = protoModule.readFixed64(p157, var3195)
			local _ = var3209
			var3195 = var3210
		else
			error("Unsupported wire type: " .. var5255)
		end
	end
	return var3194
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
	local var3211 = t_157.new()
	
	if self.category_id ~= nil then
		var3211.category_id = propTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		var3211.category_id = propTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	return var3211
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
	local var3211 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3212, var3213 = protoModule.writeTag(buff, var3211, 1, protoModule.wireTypes.varint)
		var3212, var5275 = protoModule.writeVarInt(var3212, var3213, t.ActionType.toNumber(self.action_type))
		buff = var3212
		var3211 = var3213
	end
	if self.action_params ~= nil then
		local var3214 = self.action_params:encode()
		local var3215, var3216 = protoModule.writeTag(buff, var3211, 2, protoModule.wireTypes.lengthDelimited)
		var3215, var5278 = protoModule.writeBuffer(var3215, var3216, var3214, buffer.len(var3214))
		buff = var3215
		var3211 = var3216
	end
	local buff_1 = buffer.create(var3211)
	buffer.copy(buff_1, 0, buff, 0, var3211)
	
	return buff_1
end

function t_158.decode(p158)
	-- upvalues: t_158 (ref), protoModule (ref), t (ref)
	local var3211 = t_158.new()
	local var3212 = 0
	while var3212 < buffer.len(p158) do
		local _ = nil
		local var3213 = nil
		local var3214, var3215, var3216 = protoModule.readTag(p158, var3212)
		local var3217 = var3214
		var3213 = var3215
		var3212 = var3216
		
		if var3213 == protoModule.wireTypes.varint then
			if var3217 == 1 then
				local _ = nil
				local var3218, var3219 = protoModule.readVarIntI32(p158, var3212)
				local var3220 = var3218
				var3212 = var3219
				var3211.action_type = t.ActionType.fromNumber(var3220) or var3220
			else
				local _ = nil
				local var3221, var3222 = protoModule.readVarInt(p158, var3212)
				local _ = var3221
				var3212 = var3222
			end
		end
		if var3213 == protoModule.wireTypes.lengthDelimited then
			if var3217 == 2 then
				local _ = nil
				local var3223, var3224 = protoModule.readBuffer(p158, var3212)
				var3212 = var3224
				var3211.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.decode(var3223)
			else
				local _ = nil
				local var3225, var3226 = protoModule.readVarInt(p158, var3212)
				var3212 = var3226 + var3225
			end
		elseif var3213 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3227, var3228 = protoModule.readFixed32(p158, var3212)
			local _ = var3227
			var3212 = var3228
		elseif var3213 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3229, var3230 = protoModule.readFixed64(p158, var3212)
			local _ = var3229
			var3212 = var3230
		else
			error("Unsupported wire type: " .. var5282)
		end
	end
	return var3211
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
	local var3231 = t_158.new()
	
	if self.action_type ~= nil then
		var3231.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3231.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3231.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3231.action_params = t.SelectMarketplaceFavoritesSubcategory_Params.jsonDecode(self.actionParams)
	end
	return var3231
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
	local var3231 = 0
	
	if self.subcategory_id ~= nil then
		local var3232 = self.subcategory_id:encode()
		local var3233, var3234 = protoModule.writeTag(buff, var3231, 1, protoModule.wireTypes.lengthDelimited)
		var3233, var5306 = protoModule.writeBuffer(var3233, var3234, var3232, buffer.len(var3232))
		buff = var3233
		var3231 = var3234
	end
	local buff_1 = buffer.create(var3231)
	buffer.copy(buff_1, 0, buff, 0, var3231)
	
	return buff_1
end

function t_159.decode(p159)
	-- upvalues: t_159 (ref), protoModule (ref), propTypesModule (ref)
	local var3231 = t_159.new()
	local var3232 = 0
	while var3232 < buffer.len(p159) do
		local _ = nil
		local var3233 = nil
		local var3234, var3235, var3236 = protoModule.readTag(p159, var3232)
		local var3237 = var3234
		var3233 = var3235
		var3232 = var3236
		
		if var3233 == protoModule.wireTypes.varint then
			local _ = nil
			local var3238, var3239 = protoModule.readVarInt(p159, var3232)
			local _ = var3238
			var3232 = var3239
			continue
		end
		if var3233 == protoModule.wireTypes.lengthDelimited then
			if var3237 == 1 then
				local _ = nil
				local var3240, var3241 = protoModule.readBuffer(p159, var3232)
				var3232 = var3241
				var3231.subcategory_id = propTypesModule.StringProp.decode(var3240)
			else
				local _ = nil
				local var3242, var3243 = protoModule.readVarInt(p159, var3232)
				var3232 = var3243 + var3242
			end
		elseif var3233 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3244, var3245 = protoModule.readFixed32(p159, var3232)
			local _ = var3244
			var3232 = var3245
		elseif var3233 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3246, var3247 = protoModule.readFixed64(p159, var3232)
			local _ = var3246
			var3232 = var3247
		else
			error("Unsupported wire type: " .. var5310)
		end
	end
	return var3231
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
	local var3248 = t_159.new()
	
	if self.subcategory_id ~= nil then
		var3248.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		var3248.subcategory_id = propTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	return var3248
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
	local var3248 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3249, var3250 = protoModule.writeTag(buff, var3248, 1, protoModule.wireTypes.varint)
		var3249, var5330 = protoModule.writeVarInt(var3249, var3250, t.ActionType.toNumber(self.action_type))
		buff = var3249
		var3248 = var3250
	end
	if self.action_params ~= nil then
		local var3251 = self.action_params:encode()
		local var3252, var3253 = protoModule.writeTag(buff, var3248, 2, protoModule.wireTypes.lengthDelimited)
		var3252, var5333 = protoModule.writeBuffer(var3252, var3253, var3251, buffer.len(var3251))
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
				var3248.action_params = t.PinExperienceShortcutAction_Params.decode(var3260)
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
			error("Unsupported wire type: " .. var5337)
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
		var3268.action_params = t.PinExperienceShortcutAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3268.action_params = t.PinExperienceShortcutAction_Params.jsonDecode(self.actionParams)
	end
	return var3268
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
	local var3268 = 0
	
	if self.place_id ~= nil then
		local var3269 = self.place_id:encode()
		local var3270, var3271 = protoModule.writeTag(buff, var3268, 1, protoModule.wireTypes.lengthDelimited)
		var3270, var5361 = protoModule.writeBuffer(var3270, var3271, var3269, buffer.len(var3269))
		buff = var3270
		var3268 = var3271
	end
	if self.universe_id ~= nil then
		local var3272 = self.universe_id:encode()
		local var3273, var3274 = protoModule.writeTag(buff, var3268, 2, protoModule.wireTypes.lengthDelimited)
		var3273, var5364 = protoModule.writeBuffer(var3273, var3274, var3272, buffer.len(var3272))
		buff = var3273
		var3268 = var3274
	end
	if self.game_name ~= nil then
		local var3275 = self.game_name:encode()
		local var3276, var3277 = protoModule.writeTag(buff, var3268, 3, protoModule.wireTypes.lengthDelimited)
		var3276, var5367 = protoModule.writeBuffer(var3276, var3277, var3275, buffer.len(var3275))
		buff = var3276
		var3268 = var3277
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
				var3268.place_id = propTypesModule.StringProp.decode(var3277)
			elseif var3274 == 2 then
				local _ = nil
				local var3279, var3280 = protoModule.readBuffer(p161, var3269)
				var3269 = var3280
				var3268.universe_id = propTypesModule.StringProp.decode(var3279)
			elseif var3274 == 3 then
				local _ = nil
				local var3281, var3282 = protoModule.readBuffer(p161, var3269)
				var3269 = var3282
				var3268.game_name = propTypesModule.StringProp.decode(var3281)
			else
				local _ = nil
				local var3283, var3284 = protoModule.readVarInt(p161, var3269)
				var3269 = var3284 + var3283
			end
		elseif var3270 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3285, var3286 = protoModule.readFixed32(p161, var3269)
			local _ = var3285
			var3269 = var3286
		elseif var3270 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3287, var3288 = protoModule.readFixed64(p161, var3269)
			local _ = var3287
			var3269 = var3288
		else
			error("Unsupported wire type: " .. var5371)
		end
	end
	return var3268
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
	local var3289 = t_161.new()
	
	if self.place_id ~= nil then
		var3289.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var3289.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		var3289.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3289.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.game_name ~= nil then
		var3289.game_name = propTypesModule.StringProp.jsonDecode(self.game_name)
	end
	if self.gameName ~= nil then
		var3289.game_name = propTypesModule.StringProp.jsonDecode(self.gameName)
	end
	return var3289
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
	local var3289 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3290, var3291 = protoModule.writeTag(buff, var3289, 1, protoModule.wireTypes.varint)
		var3290, var5395 = protoModule.writeVarInt(var3290, var3291, t.ActionType.toNumber(self.action_type))
		buff = var3290
		var3289 = var3291
	end
	if self.action_params ~= nil then
		local var3292 = self.action_params:encode()
		local var3293, var3294 = protoModule.writeTag(buff, var3289, 2, protoModule.wireTypes.lengthDelimited)
		var3293, var5398 = protoModule.writeBuffer(var3293, var3294, var3292, buffer.len(var3292))
		buff = var3293
		var3289 = var3294
	end
	local buff_1 = buffer.create(var3289)
	buffer.copy(buff_1, 0, buff, 0, var3289)
	
	return buff_1
end

function t_162.decode(p162)
	-- upvalues: t_162 (ref), protoModule (ref), t (ref)
	local var3289 = t_162.new()
	local var3290 = 0
	while var3290 < buffer.len(p162) do
		local _ = nil
		local var3291 = nil
		local var3292, var3293, var3294 = protoModule.readTag(p162, var3290)
		local var3295 = var3292
		var3291 = var3293
		var3290 = var3294
		
		if var3291 == protoModule.wireTypes.varint then
			if var3295 == 1 then
				local _ = nil
				local var3296, var3297 = protoModule.readVarIntI32(p162, var3290)
				local var3298 = var3296
				var3290 = var3297
				var3289.action_type = t.ActionType.fromNumber(var3298) or var3298
			else
				local _ = nil
				local var3299, var3300 = protoModule.readVarInt(p162, var3290)
				local _ = var3299
				var3290 = var3300
			end
		end
		if var3291 == protoModule.wireTypes.lengthDelimited then
			if var3295 == 2 then
				local _ = nil
				local var3301, var3302 = protoModule.readBuffer(p162, var3290)
				var3290 = var3302
				var3289.action_params = t.NavigateAction_Params.decode(var3301)
			else
				local _ = nil
				local var3303, var3304 = protoModule.readVarInt(p162, var3290)
				var3290 = var3304 + var3303
			end
		elseif var3291 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3305, var3306 = protoModule.readFixed32(p162, var3290)
			local _ = var3305
			var3290 = var3306
		elseif var3291 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3307, var3308 = protoModule.readFixed64(p162, var3290)
			local _ = var3307
			var3290 = var3308
		else
			error("Unsupported wire type: " .. var5402)
		end
	end
	return var3289
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
	local var3309 = t_162.new()
	
	if self.action_type ~= nil then
		var3309.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3309.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3309.action_params = t.NavigateAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3309.action_params = t.NavigateAction_Params.jsonDecode(self.actionParams)
	end
	return var3309
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
	local var3309 = 0
	
	if self.destination ~= nil then
		local var3310 = self.destination:encode()
		local var3311, var3312 = protoModule.writeTag(buff, var3309, 1, protoModule.wireTypes.lengthDelimited)
		var3311, var5426 = protoModule.writeBuffer(var3311, var3312, var3310, buffer.len(var3310))
		buff = var3311
		var3309 = var3312
	end
	if self.source ~= nil then
		local var3313 = self.source:encode()
		local var3314, var3315 = protoModule.writeTag(buff, var3309, 2, protoModule.wireTypes.lengthDelimited)
		var3314, var5429 = protoModule.writeBuffer(var3314, var3315, var3313, buffer.len(var3313))
		buff = var3314
		var3309 = var3315
	end
	local buff_1 = buffer.create(var3309)
	buffer.copy(buff_1, 0, buff, 0, var3309)
	
	return buff_1
end

function t_163.decode(p163)
	-- upvalues: t_163 (ref), protoModule (ref), propTypesModule (ref)
	local var3309 = t_163.new()
	local var3310 = 0
	while var3310 < buffer.len(p163) do
		local _ = nil
		local var3311 = nil
		local var3312, var3313, var3314 = protoModule.readTag(p163, var3310)
		local var3315 = var3312
		var3311 = var3313
		var3310 = var3314
		
		if var3311 == protoModule.wireTypes.varint then
			local _ = nil
			local var3316, var3317 = protoModule.readVarInt(p163, var3310)
			local _ = var3316
			var3310 = var3317
			continue
		end
		if var3311 == protoModule.wireTypes.lengthDelimited then
			if var3315 == 1 then
				local _ = nil
				local var3318, var3319 = protoModule.readBuffer(p163, var3310)
				var3310 = var3319
				var3309.destination = propTypesModule.StringProp.decode(var3318)
			elseif var3315 == 2 then
				local _ = nil
				local var3320, var3321 = protoModule.readBuffer(p163, var3310)
				var3310 = var3321
				var3309.source = propTypesModule.StringProp.decode(var3320)
			else
				local _ = nil
				local var3322, var3323 = protoModule.readVarInt(p163, var3310)
				var3310 = var3323 + var3322
			end
		elseif var3311 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3324, var3325 = protoModule.readFixed32(p163, var3310)
			local _ = var3324
			var3310 = var3325
		elseif var3311 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3326, var3327 = protoModule.readFixed64(p163, var3310)
			local _ = var3326
			var3310 = var3327
		else
			error("Unsupported wire type: " .. var5433)
		end
	end
	return var3309
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
	local var3328 = t_163.new()
	
	if self.destination ~= nil then
		var3328.destination = propTypesModule.StringProp.jsonDecode(self.destination)
	end
	if self.source ~= nil then
		var3328.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var3328
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
	local var3328 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3329, var3330 = protoModule.writeTag(buff, var3328, 1, protoModule.wireTypes.varint)
		var3329, var5455 = protoModule.writeVarInt(var3329, var3330, t.ActionType.toNumber(self.action_type))
		buff = var3329
		var3328 = var3330
	end
	if self.action_params ~= nil then
		local var3331 = self.action_params:encode()
		local var3332, var3333 = protoModule.writeTag(buff, var3328, 2, protoModule.wireTypes.lengthDelimited)
		var3332, var5458 = protoModule.writeBuffer(var3332, var3333, var3331, buffer.len(var3331))
		buff = var3332
		var3328 = var3333
	end
	local buff_1 = buffer.create(var3328)
	buffer.copy(buff_1, 0, buff, 0, var3328)
	
	return buff_1
end

function t_164.decode(p164)
	-- upvalues: t_164 (ref), protoModule (ref), t (ref)
	local var3328 = t_164.new()
	local var3329 = 0
	while var3329 < buffer.len(p164) do
		local _ = nil
		local var3330 = nil
		local var3331, var3332, var3333 = protoModule.readTag(p164, var3329)
		local var3334 = var3331
		var3330 = var3332
		var3329 = var3333
		
		if var3330 == protoModule.wireTypes.varint then
			if var3334 == 1 then
				local _ = nil
				local var3335, var3336 = protoModule.readVarIntI32(p164, var3329)
				local var3337 = var3335
				var3329 = var3336
				var3328.action_type = t.ActionType.fromNumber(var3337) or var3337
			else
				local _ = nil
				local var3338, var3339 = protoModule.readVarInt(p164, var3329)
				local _ = var3338
				var3329 = var3339
			end
		end
		if var3330 == protoModule.wireTypes.lengthDelimited then
			if var3334 == 2 then
				local _ = nil
				local var3340, var3341 = protoModule.readBuffer(p164, var3329)
				var3329 = var3341
				var3328.action_params = t.DownloadAppAction_Params.decode(var3340)
			else
				local _ = nil
				local var3342, var3343 = protoModule.readVarInt(p164, var3329)
				var3329 = var3343 + var3342
			end
		elseif var3330 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3344, var3345 = protoModule.readFixed32(p164, var3329)
			local _ = var3344
			var3329 = var3345
		elseif var3330 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3346, var3347 = protoModule.readFixed64(p164, var3329)
			local _ = var3346
			var3329 = var3347
		else
			error("Unsupported wire type: " .. var5462)
		end
	end
	return var3328
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
	local var3348 = t_164.new()
	
	if self.action_type ~= nil then
		var3348.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3348.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3348.action_params = t.DownloadAppAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3348.action_params = t.DownloadAppAction_Params.jsonDecode(self.actionParams)
	end
	return var3348
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
	local var3348 = 0
	
	if self.source ~= nil then
		local var3349 = self.source:encode()
		local var3350, var3351 = protoModule.writeTag(buff, var3348, 1, protoModule.wireTypes.lengthDelimited)
		var3350, var5486 = protoModule.writeBuffer(var3350, var3351, var3349, buffer.len(var3349))
		buff = var3350
		var3348 = var3351
	end
	if self.download_type ~= nil then
		local var3352 = self.download_type:encode()
		local var3353, var3354 = protoModule.writeTag(buff, var3348, 2, protoModule.wireTypes.lengthDelimited)
		var3353, var5489 = protoModule.writeBuffer(var3353, var3354, var3352, buffer.len(var3352))
		buff = var3353
		var3348 = var3354
	end
	local buff_1 = buffer.create(var3348)
	buffer.copy(buff_1, 0, buff, 0, var3348)
	
	return buff_1
end

function t_165.decode(p165)
	-- upvalues: t_165 (ref), protoModule (ref), propTypesModule (ref)
	local var3348 = t_165.new()
	local var3349 = 0
	while var3349 < buffer.len(p165) do
		local _ = nil
		local var3350 = nil
		local var3351, var3352, var3353 = protoModule.readTag(p165, var3349)
		local var3354 = var3351
		var3350 = var3352
		var3349 = var3353
		
		if var3350 == protoModule.wireTypes.varint then
			local _ = nil
			local var3355, var3356 = protoModule.readVarInt(p165, var3349)
			local _ = var3355
			var3349 = var3356
			continue
		end
		if var3350 == protoModule.wireTypes.lengthDelimited then
			if var3354 == 1 then
				local _ = nil
				local var3357, var3358 = protoModule.readBuffer(p165, var3349)
				var3349 = var3358
				var3348.source = propTypesModule.StringProp.decode(var3357)
			elseif var3354 == 2 then
				local _ = nil
				local var3359, var3360 = protoModule.readBuffer(p165, var3349)
				var3349 = var3360
				var3348.download_type = propTypesModule.StringProp.decode(var3359)
			else
				local _ = nil
				local var3361, var3362 = protoModule.readVarInt(p165, var3349)
				var3349 = var3362 + var3361
			end
		elseif var3350 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3363, var3364 = protoModule.readFixed32(p165, var3349)
			local _ = var3363
			var3349 = var3364
		elseif var3350 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3365, var3366 = protoModule.readFixed64(p165, var3349)
			local _ = var3365
			var3349 = var3366
		else
			error("Unsupported wire type: " .. var5493)
		end
	end
	return var3348
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
	local var3367 = t_165.new()
	
	if self.source ~= nil then
		var3367.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.download_type ~= nil then
		var3367.download_type = propTypesModule.StringProp.jsonDecode(self.download_type)
	end
	if self.downloadType ~= nil then
		var3367.download_type = propTypesModule.StringProp.jsonDecode(self.downloadType)
	end
	return var3367
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
	local var3367 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3368, var3369 = protoModule.writeTag(buff, var3367, 1, protoModule.wireTypes.varint)
		var3368, var5515 = protoModule.writeVarInt(var3368, var3369, t.ActionType.toNumber(self.action_type))
		buff = var3368
		var3367 = var3369
	end
	if self.action_params ~= nil then
		local var3370 = self.action_params:encode()
		local var3371, var3372 = protoModule.writeTag(buff, var3367, 2, protoModule.wireTypes.lengthDelimited)
		var3371, var5518 = protoModule.writeBuffer(var3371, var3372, var3370, buffer.len(var3370))
		buff = var3371
		var3367 = var3372
	end
	local buff_1 = buffer.create(var3367)
	buffer.copy(buff_1, 0, buff, 0, var3367)
	
	return buff_1
end

function t_166.decode(p166)
	-- upvalues: t_166 (ref), protoModule (ref), t (ref)
	local var3367 = t_166.new()
	local var3368 = 0
	while var3368 < buffer.len(p166) do
		local _ = nil
		local var3369 = nil
		local var3370, var3371, var3372 = protoModule.readTag(p166, var3368)
		local var3373 = var3370
		var3369 = var3371
		var3368 = var3372
		
		if var3369 == protoModule.wireTypes.varint then
			if var3373 == 1 then
				local _ = nil
				local var3374, var3375 = protoModule.readVarIntI32(p166, var3368)
				local var3376 = var3374
				var3368 = var3375
				var3367.action_type = t.ActionType.fromNumber(var3376) or var3376
			else
				local _ = nil
				local var3377, var3378 = protoModule.readVarInt(p166, var3368)
				local _ = var3377
				var3368 = var3378
			end
		end
		if var3369 == protoModule.wireTypes.lengthDelimited then
			if var3373 == 2 then
				local _ = nil
				local var3379, var3380 = protoModule.readBuffer(p166, var3368)
				var3368 = var3380
				var3367.action_params = t.ActionSequenceAction_Params.decode(var3379)
			else
				local _ = nil
				local var3381, var3382 = protoModule.readVarInt(p166, var3368)
				var3368 = var3382 + var3381
			end
		elseif var3369 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3383, var3384 = protoModule.readFixed32(p166, var3368)
			local _ = var3383
			var3368 = var3384
		elseif var3369 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3385, var3386 = protoModule.readFixed64(p166, var3368)
			local _ = var3385
			var3368 = var3386
		else
			error("Unsupported wire type: " .. var5522)
		end
	end
	return var3367
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
	local var3387 = t_166.new()
	
	if self.action_type ~= nil then
		var3387.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3387.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3387.action_params = t.ActionSequenceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3387.action_params = t.ActionSequenceAction_Params.jsonDecode(self.actionParams)
	end
	return var3387
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
	local var3387 = 0
	
	if self.actions ~= nil and #self.actions > 0 then
		for i, v in self.actions do
			local var3388 = v:encode()
			local var3389, var3390 = protoModule.writeTag(buff, var3387, 1, protoModule.wireTypes.lengthDelimited)
			var3389, var5546 = protoModule.writeBuffer(var3389, var3390, var3388, buffer.len(var3388))
			buff = var3389
			var3387 = var3390
		end
	end
	local buff_1 = buffer.create(var3387)
	buffer.copy(buff_1, 0, buff, 0, var3387)
	
	return buff_1
end

function t_167.decode(p167)
	-- upvalues: t_167 (ref), protoModule (ref), t (ref)
	local var3391 = t_167.new()
	local var3392 = 0
	while var3392 < buffer.len(p167) do
		local _ = nil
		local var3393 = nil
		local var3394, var3395, var3396 = protoModule.readTag(p167, var3392)
		local var3397 = var3394
		var3393 = var3395
		var3392 = var3396
		
		if var3393 == protoModule.wireTypes.varint then
			local _ = nil
			local var3398, var3399 = protoModule.readVarInt(p167, var3392)
			local _ = var3398
			var3392 = var3399
			continue
		end
		if var3393 == protoModule.wireTypes.lengthDelimited then
			if var3397 == 1 then
				local _ = nil
				local var3400, var3401 = protoModule.readBuffer(p167, var3392)
				var3392 = var3401
				table.insert(var3391.actions, t.ActionProp.decode(var3400))
			else
				local _ = nil
				local var3402, var3403 = protoModule.readVarInt(p167, var3392)
				var3392 = var3403 + var3402
			end
		elseif var3393 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3404, var3405 = protoModule.readFixed32(p167, var3392)
			local _ = var3404
			var3392 = var3405
		elseif var3393 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3406, var3407 = protoModule.readFixed64(p167, var3392)
			local _ = var3406
			var3392 = var3407
		else
			error("Unsupported wire type: " .. var5550)
		end
	end
	return var3391
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
	local var3408 = t_167.new()
	
	if self.actions ~= nil then
		local t_1 = {}
		
		for i, v in self.actions do
			table.insert(t_1, t.ActionProp.jsonDecode(v))
		end
		var3408.actions = t_1
	end
	return var3408
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
	local var3409 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3410, var3411 = protoModule.writeTag(buff, var3409, 1, protoModule.wireTypes.varint)
		var3410, var5572 = protoModule.writeVarInt(var3410, var3411, t.ActionType.toNumber(self.action_type))
		buff = var3410
		var3409 = var3411
	end
	if self.action_params ~= nil then
		local var3412 = self.action_params:encode()
		local var3413, var3414 = protoModule.writeTag(buff, var3409, 2, protoModule.wireTypes.lengthDelimited)
		var3413, var5575 = protoModule.writeBuffer(var3413, var3414, var3412, buffer.len(var3412))
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
				var3409.action_params = t.RefreshFeedEntryFromApiAction_Params.decode(var3421)
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
			error("Unsupported wire type: " .. var5579)
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
		var3429.action_params = t.RefreshFeedEntryFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3429.action_params = t.RefreshFeedEntryFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return var3429
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
	local var3429 = 0
	
	if self.page_entry_identifier ~= nil then
		local var3430 = self.page_entry_identifier:encode()
		local var3431, var3432 = protoModule.writeTag(buff, var3429, 1, protoModule.wireTypes.lengthDelimited)
		var3431, var5603 = protoModule.writeBuffer(var3431, var3432, var3430, buffer.len(var3430))
		buff = var3431
		var3429 = var3432
	end
	if self.feed_entry_identifier ~= nil then
		local var3433 = self.feed_entry_identifier:encode()
		local var3434, var3435 = protoModule.writeTag(buff, var3429, 2, protoModule.wireTypes.lengthDelimited)
		var3434, var5606 = protoModule.writeBuffer(var3434, var3435, var3433, buffer.len(var3433))
		buff = var3434
		var3429 = var3435
	end
	if self.selected_option_ids ~= nil then
		local var3436 = self.selected_option_ids:encode()
		local var3437, var3438 = protoModule.writeTag(buff, var3429, 3, protoModule.wireTypes.lengthDelimited)
		var3437, var5609 = protoModule.writeBuffer(var3437, var3438, var3436, buffer.len(var3436))
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
				var3429.page_entry_identifier = propTypesModule.StringProp.decode(var3438)
			elseif var3435 == 2 then
				local _ = nil
				local var3440, var3441 = protoModule.readBuffer(p169, var3430)
				var3430 = var3441
				var3429.feed_entry_identifier = propTypesModule.StringProp.decode(var3440)
			elseif var3435 == 3 then
				local _ = nil
				local var3442, var3443 = protoModule.readBuffer(p169, var3430)
				var3430 = var3443
				var3429.selected_option_ids = propTypesModule.StringArrayProp.decode(var3442)
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
			error("Unsupported wire type: " .. var5613)
		end
	end
	return var3429
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
	local var3450 = t_169.new()
	
	if self.page_entry_identifier ~= nil then
		var3450.page_entry_identifier = propTypesModule.StringProp.jsonDecode(self.page_entry_identifier)
	end
	if self.pageEntryIdentifier ~= nil then
		var3450.page_entry_identifier = propTypesModule.StringProp.jsonDecode(self.pageEntryIdentifier)
	end
	if self.feed_entry_identifier ~= nil then
		var3450.feed_entry_identifier = propTypesModule.StringProp.jsonDecode(self.feed_entry_identifier)
	end
	if self.feedEntryIdentifier ~= nil then
		var3450.feed_entry_identifier = propTypesModule.StringProp.jsonDecode(self.feedEntryIdentifier)
	end
	if self.selected_option_ids ~= nil then
		var3450.selected_option_ids = propTypesModule.StringArrayProp.jsonDecode(self.selected_option_ids)
	end
	if self.selectedOptionIds ~= nil then
		var3450.selected_option_ids = propTypesModule.StringArrayProp.jsonDecode(self.selectedOptionIds)
	end
	return var3450
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
	local var3450 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3451, var3452 = protoModule.writeTag(buff, var3450, 1, protoModule.wireTypes.varint)
		var3451, var5637 = protoModule.writeVarInt(var3451, var3452, t.ActionType.toNumber(self.action_type))
		buff = var3451
		var3450 = var3452
	end
	if self.action_params ~= nil then
		local var3453 = self.action_params:encode()
		local var3454, var3455 = protoModule.writeTag(buff, var3450, 2, protoModule.wireTypes.lengthDelimited)
		var3454, var5640 = protoModule.writeBuffer(var3454, var3455, var3453, buffer.len(var3453))
		buff = var3454
		var3450 = var3455
	end
	local buff_1 = buffer.create(var3450)
	buffer.copy(buff_1, 0, buff, 0, var3450)
	
	return buff_1
end

function t_170.decode(p170)
	-- upvalues: t_170 (ref), protoModule (ref), t (ref)
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
			if var3456 == 1 then
				local _ = nil
				local var3457, var3458 = protoModule.readVarIntI32(p170, var3451)
				local var3459 = var3457
				var3451 = var3458
				var3450.action_type = t.ActionType.fromNumber(var3459) or var3459
			else
				local _ = nil
				local var3460, var3461 = protoModule.readVarInt(p170, var3451)
				local _ = var3460
				var3451 = var3461
			end
		end
		if var3452 == protoModule.wireTypes.lengthDelimited then
			if var3456 == 2 then
				local _ = nil
				local var3462, var3463 = protoModule.readBuffer(p170, var3451)
				var3451 = var3463
				var3450.action_params = t.OpenProfileFramesEditorAction_Params.decode(var3462)
			else
				local _ = nil
				local var3464, var3465 = protoModule.readVarInt(p170, var3451)
				var3451 = var3465 + var3464
			end
		elseif var3452 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3466, var3467 = protoModule.readFixed32(p170, var3451)
			local _ = var3466
			var3451 = var3467
		elseif var3452 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3468, var3469 = protoModule.readFixed64(p170, var3451)
			local _ = var3468
			var3451 = var3469
		else
			error("Unsupported wire type: " .. var5644)
		end
	end
	return var3450
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
	local var3470 = t_170.new()
	
	if self.action_type ~= nil then
		var3470.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3470.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3470.action_params = t.OpenProfileFramesEditorAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3470.action_params = t.OpenProfileFramesEditorAction_Params.jsonDecode(self.actionParams)
	end
	return var3470
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
	local var3470 = 0
	
	if self.prompt_id ~= nil then
		local var3471 = self.prompt_id:encode()
		local var3472, var3473 = protoModule.writeTag(buff, var3470, 1, protoModule.wireTypes.lengthDelimited)
		var3472, var5668 = protoModule.writeBuffer(var3472, var3473, var3471, buffer.len(var3471))
		buff = var3472
		var3470 = var3473
	end
	if self.prompt_type ~= nil then
		local var3474 = self.prompt_type:encode()
		local var3475, var3476 = protoModule.writeTag(buff, var3470, 2, protoModule.wireTypes.lengthDelimited)
		var3475, var5671 = protoModule.writeBuffer(var3475, var3476, var3474, buffer.len(var3474))
		buff = var3475
		var3470 = var3476
	end
	if self.source ~= nil then
		local var3477 = self.source:encode()
		local var3478, var3479 = protoModule.writeTag(buff, var3470, 3, protoModule.wireTypes.lengthDelimited)
		var3478, var5674 = protoModule.writeBuffer(var3478, var3479, var3477, buffer.len(var3477))
		buff = var3478
		var3470 = var3479
	end
	local buff_1 = buffer.create(var3470)
	buffer.copy(buff_1, 0, buff, 0, var3470)
	
	return buff_1
end

function t_171.decode(p171)
	-- upvalues: t_171 (ref), protoModule (ref), propTypesModule (ref)
	local var3470 = t_171.new()
	local var3471 = 0
	while var3471 < buffer.len(p171) do
		local _ = nil
		local var3472 = nil
		local var3473, var3474, var3475 = protoModule.readTag(p171, var3471)
		local var3476 = var3473
		var3472 = var3474
		var3471 = var3475
		
		if var3472 == protoModule.wireTypes.varint then
			local _ = nil
			local var3477, var3478 = protoModule.readVarInt(p171, var3471)
			local _ = var3477
			var3471 = var3478
			continue
		end
		if var3472 == protoModule.wireTypes.lengthDelimited then
			if var3476 == 1 then
				local _ = nil
				local var3479, var3480 = protoModule.readBuffer(p171, var3471)
				var3471 = var3480
				var3470.prompt_id = propTypesModule.StringProp.decode(var3479)
			elseif var3476 == 2 then
				local _ = nil
				local var3481, var3482 = protoModule.readBuffer(p171, var3471)
				var3471 = var3482
				var3470.prompt_type = propTypesModule.StringProp.decode(var3481)
			elseif var3476 == 3 then
				local _ = nil
				local var3483, var3484 = protoModule.readBuffer(p171, var3471)
				var3471 = var3484
				var3470.source = propTypesModule.StringProp.decode(var3483)
			else
				local _ = nil
				local var3485, var3486 = protoModule.readVarInt(p171, var3471)
				var3471 = var3486 + var3485
			end
		elseif var3472 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3487, var3488 = protoModule.readFixed32(p171, var3471)
			local _ = var3487
			var3471 = var3488
		elseif var3472 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3489, var3490 = protoModule.readFixed64(p171, var3471)
			local _ = var3489
			var3471 = var3490
		else
			error("Unsupported wire type: " .. var5678)
		end
	end
	return var3470
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
	local var3491 = t_171.new()
	
	if self.prompt_id ~= nil then
		var3491.prompt_id = propTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		var3491.prompt_id = propTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.prompt_type ~= nil then
		var3491.prompt_type = propTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		var3491.prompt_type = propTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.source ~= nil then
		var3491.source = propTypesModule.StringProp.jsonDecode(self.source)
	end
	return var3491
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
	local var3491 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3492, var3493 = protoModule.writeTag(buff, var3491, 1, protoModule.wireTypes.varint)
		var3492, var5702 = protoModule.writeVarInt(var3492, var3493, t.ActionType.toNumber(self.action_type))
		buff = var3492
		var3491 = var3493
	end
	if self.action_params ~= nil then
		local var3494 = self.action_params:encode()
		local var3495, var3496 = protoModule.writeTag(buff, var3491, 2, protoModule.wireTypes.lengthDelimited)
		var3495, var5705 = protoModule.writeBuffer(var3495, var3496, var3494, buffer.len(var3494))
		buff = var3495
		var3491 = var3496
	end
	local buff_1 = buffer.create(var3491)
	buffer.copy(buff_1, 0, buff, 0, var3491)
	
	return buff_1
end

function t_172.decode(p172)
	-- upvalues: t_172 (ref), protoModule (ref), t (ref)
	local var3491 = t_172.new()
	local var3492 = 0
	while var3492 < buffer.len(p172) do
		local _ = nil
		local var3493 = nil
		local var3494, var3495, var3496 = protoModule.readTag(p172, var3492)
		local var3497 = var3494
		var3493 = var3495
		var3492 = var3496
		
		if var3493 == protoModule.wireTypes.varint then
			if var3497 == 1 then
				local _ = nil
				local var3498, var3499 = protoModule.readVarIntI32(p172, var3492)
				local var3500 = var3498
				var3492 = var3499
				var3491.action_type = t.ActionType.fromNumber(var3500) or var3500
			else
				local _ = nil
				local var3501, var3502 = protoModule.readVarInt(p172, var3492)
				local _ = var3501
				var3492 = var3502
			end
		end
		if var3493 == protoModule.wireTypes.lengthDelimited then
			if var3497 == 2 then
				local _ = nil
				local var3503, var3504 = protoModule.readBuffer(p172, var3492)
				var3492 = var3504
				var3491.action_params = t.ApplyDevStoreSeeAllCategoryFilterAction_Params.decode(var3503)
			else
				local _ = nil
				local var3505, var3506 = protoModule.readVarInt(p172, var3492)
				var3492 = var3506 + var3505
			end
		elseif var3493 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3507, var3508 = protoModule.readFixed32(p172, var3492)
			local _ = var3507
			var3492 = var3508
		elseif var3493 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3509, var3510 = protoModule.readFixed64(p172, var3492)
			local _ = var3509
			var3492 = var3510
		else
			error("Unsupported wire type: " .. var5709)
		end
	end
	return var3491
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
	local var3511 = t_172.new()
	
	if self.action_type ~= nil then
		var3511.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3511.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3511.action_params = t.ApplyDevStoreSeeAllCategoryFilterAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3511.action_params = t.ApplyDevStoreSeeAllCategoryFilterAction_Params.jsonDecode(self.actionParams)
	end
	return var3511
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
	local var3511 = 0
	
	if self.selected_category_id ~= nil then
		local var3512 = self.selected_category_id:encode()
		local var3513, var3514 = protoModule.writeTag(buff, var3511, 1, protoModule.wireTypes.lengthDelimited)
		var3513, var5733 = protoModule.writeBuffer(var3513, var3514, var3512, buffer.len(var3512))
		buff = var3513
		var3511 = var3514
	end
	local buff_1 = buffer.create(var3511)
	buffer.copy(buff_1, 0, buff, 0, var3511)
	
	return buff_1
end

function t_173.decode(p173)
	-- upvalues: t_173 (ref), protoModule (ref), propTypesModule (ref)
	local var3511 = t_173.new()
	local var3512 = 0
	while var3512 < buffer.len(p173) do
		local _ = nil
		local var3513 = nil
		local var3514, var3515, var3516 = protoModule.readTag(p173, var3512)
		local var3517 = var3514
		var3513 = var3515
		var3512 = var3516
		
		if var3513 == protoModule.wireTypes.varint then
			local _ = nil
			local var3518, var3519 = protoModule.readVarInt(p173, var3512)
			local _ = var3518
			var3512 = var3519
			continue
		end
		if var3513 == protoModule.wireTypes.lengthDelimited then
			if var3517 == 1 then
				local _ = nil
				local var3520, var3521 = protoModule.readBuffer(p173, var3512)
				var3512 = var3521
				var3511.selected_category_id = propTypesModule.StringProp.decode(var3520)
			else
				local _ = nil
				local var3522, var3523 = protoModule.readVarInt(p173, var3512)
				var3512 = var3523 + var3522
			end
		elseif var3513 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3524, var3525 = protoModule.readFixed32(p173, var3512)
			local _ = var3524
			var3512 = var3525
		elseif var3513 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3526, var3527 = protoModule.readFixed64(p173, var3512)
			local _ = var3526
			var3512 = var3527
		else
			error("Unsupported wire type: " .. var5737)
		end
	end
	return var3511
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
	local var3528 = t_173.new()
	
	if self.selected_category_id ~= nil then
		var3528.selected_category_id = propTypesModule.StringProp.jsonDecode(self.selected_category_id)
	end
	if self.selectedCategoryId ~= nil then
		var3528.selected_category_id = propTypesModule.StringProp.jsonDecode(self.selectedCategoryId)
	end
	return var3528
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
	local var3528 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3529, var3530 = protoModule.writeTag(buff, var3528, 1, protoModule.wireTypes.varint)
		var3529, var5757 = protoModule.writeVarInt(var3529, var3530, t.ActionType.toNumber(self.action_type))
		buff = var3529
		var3528 = var3530
	end
	if self.action_params ~= nil then
		local var3531 = self.action_params:encode()
		local var3532, var3533 = protoModule.writeTag(buff, var3528, 2, protoModule.wireTypes.lengthDelimited)
		var3532, var5760 = protoModule.writeBuffer(var3532, var3533, var3531, buffer.len(var3531))
		buff = var3532
		var3528 = var3533
	end
	local buff_1 = buffer.create(var3528)
	buffer.copy(buff_1, 0, buff, 0, var3528)
	
	return buff_1
end

function t_174.decode(p174)
	-- upvalues: t_174 (ref), protoModule (ref), t (ref)
	local var3528 = t_174.new()
	local var3529 = 0
	while var3529 < buffer.len(p174) do
		local _ = nil
		local var3530 = nil
		local var3531, var3532, var3533 = protoModule.readTag(p174, var3529)
		local var3534 = var3531
		var3530 = var3532
		var3529 = var3533
		
		if var3530 == protoModule.wireTypes.varint then
			if var3534 == 1 then
				local _ = nil
				local var3535, var3536 = protoModule.readVarIntI32(p174, var3529)
				local var3537 = var3535
				var3529 = var3536
				var3528.action_type = t.ActionType.fromNumber(var3537) or var3537
			else
				local _ = nil
				local var3538, var3539 = protoModule.readVarInt(p174, var3529)
				local _ = var3538
				var3529 = var3539
			end
		end
		if var3530 == protoModule.wireTypes.lengthDelimited then
			if var3534 == 2 then
				local _ = nil
				local var3540, var3541 = protoModule.readBuffer(p174, var3529)
				var3529 = var3541
				var3528.action_params = t.SetGameTileNotInterestedAction_Params.decode(var3540)
			else
				local _ = nil
				local var3542, var3543 = protoModule.readVarInt(p174, var3529)
				var3529 = var3543 + var3542
			end
		elseif var3530 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3544, var3545 = protoModule.readFixed32(p174, var3529)
			local _ = var3544
			var3529 = var3545
		elseif var3530 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3546, var3547 = protoModule.readFixed64(p174, var3529)
			local _ = var3546
			var3529 = var3547
		else
			error("Unsupported wire type: " .. var5764)
		end
	end
	return var3528
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
	local var3548 = t_174.new()
	
	if self.action_type ~= nil then
		var3548.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3548.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3548.action_params = t.SetGameTileNotInterestedAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3548.action_params = t.SetGameTileNotInterestedAction_Params.jsonDecode(self.actionParams)
	end
	return var3548
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
		collection_id = if p175 == nil or p175.collection_id == nil then nil else p175.collection_id
	}, t_175)
end

function t_175:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3548 = 0
	
	if self.universe_id ~= nil then
		local var3549 = self.universe_id:encode()
		local var3550, var3551 = protoModule.writeTag(buff, var3548, 1, protoModule.wireTypes.lengthDelimited)
		var3550, var5788 = protoModule.writeBuffer(var3550, var3551, var3549, buffer.len(var3549))
		buff = var3550
		var3548 = var3551
	end
	if self.place_id ~= nil then
		local var3552 = self.place_id:encode()
		local var3553, var3554 = protoModule.writeTag(buff, var3548, 2, protoModule.wireTypes.lengthDelimited)
		var3553, var5791 = protoModule.writeBuffer(var3553, var3554, var3552, buffer.len(var3552))
		buff = var3553
		var3548 = var3554
	end
	if self.collection_id ~= nil then
		local var3555 = self.collection_id:encode()
		local var3556, var3557 = protoModule.writeTag(buff, var3548, 3, protoModule.wireTypes.lengthDelimited)
		var3556, var5794 = protoModule.writeBuffer(var3556, var3557, var3555, buffer.len(var3555))
		buff = var3556
		var3548 = var3557
	end
	local buff_1 = buffer.create(var3548)
	buffer.copy(buff_1, 0, buff, 0, var3548)
	
	return buff_1
end

function t_175.decode(p175)
	-- upvalues: t_175 (ref), protoModule (ref), propTypesModule (ref)
	local var3548 = t_175.new()
	local var3549 = 0
	while var3549 < buffer.len(p175) do
		local _ = nil
		local var3550 = nil
		local var3551, var3552, var3553 = protoModule.readTag(p175, var3549)
		local var3554 = var3551
		var3550 = var3552
		var3549 = var3553
		
		if var3550 == protoModule.wireTypes.varint then
			local _ = nil
			local var3555, var3556 = protoModule.readVarInt(p175, var3549)
			local _ = var3555
			var3549 = var3556
			continue
		end
		if var3550 == protoModule.wireTypes.lengthDelimited then
			if var3554 == 1 then
				local _ = nil
				local var3557, var3558 = protoModule.readBuffer(p175, var3549)
				var3549 = var3558
				var3548.universe_id = propTypesModule.StringProp.decode(var3557)
			elseif var3554 == 2 then
				local _ = nil
				local var3559, var3560 = protoModule.readBuffer(p175, var3549)
				var3549 = var3560
				var3548.place_id = propTypesModule.StringProp.decode(var3559)
			elseif var3554 == 3 then
				local _ = nil
				local var3561, var3562 = protoModule.readBuffer(p175, var3549)
				var3549 = var3562
				var3548.collection_id = propTypesModule.StringProp.decode(var3561)
			else
				local _ = nil
				local var3563, var3564 = protoModule.readVarInt(p175, var3549)
				var3549 = var3564 + var3563
			end
		elseif var3550 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3565, var3566 = protoModule.readFixed32(p175, var3549)
			local _ = var3565
			var3549 = var3566
		elseif var3550 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3567, var3568 = protoModule.readFixed64(p175, var3549)
			local _ = var3567
			var3549 = var3568
		else
			error("Unsupported wire type: " .. var5798)
		end
	end
	return var3548
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
	return t
end

function t_175:jsonDecode()
	-- upvalues: t_175 (ref), propTypesModule (ref)
	local var3569 = t_175.new()
	
	if self.universe_id ~= nil then
		var3569.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3569.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		var3569.place_id = propTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		var3569.place_id = propTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.collection_id ~= nil then
		var3569.collection_id = propTypesModule.StringProp.jsonDecode(self.collection_id)
	end
	if self.collectionId ~= nil then
		var3569.collection_id = propTypesModule.StringProp.jsonDecode(self.collectionId)
	end
	return var3569
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
	local var3569 = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local var3570, var3571 = protoModule.writeTag(buff, var3569, 1, protoModule.wireTypes.varint)
		var3570, var5822 = protoModule.writeVarInt(var3570, var3571, t.ActionType.toNumber(self.action_type))
		buff = var3570
		var3569 = var3571
	end
	if self.action_params ~= nil then
		local var3572 = self.action_params:encode()
		local var3573, var3574 = protoModule.writeTag(buff, var3569, 2, protoModule.wireTypes.lengthDelimited)
		var3573, var5825 = protoModule.writeBuffer(var3573, var3574, var3572, buffer.len(var3572))
		buff = var3573
		var3569 = var3574
	end
	local buff_1 = buffer.create(var3569)
	buffer.copy(buff_1, 0, buff, 0, var3569)
	
	return buff_1
end

function t_176.decode(p176)
	-- upvalues: t_176 (ref), protoModule (ref), t (ref)
	local var3569 = t_176.new()
	local var3570 = 0
	while var3570 < buffer.len(p176) do
		local _ = nil
		local var3571 = nil
		local var3572, var3573, var3574 = protoModule.readTag(p176, var3570)
		local var3575 = var3572
		var3571 = var3573
		var3570 = var3574
		
		if var3571 == protoModule.wireTypes.varint then
			if var3575 == 1 then
				local _ = nil
				local var3576, var3577 = protoModule.readVarIntI32(p176, var3570)
				local var3578 = var3576
				var3570 = var3577
				var3569.action_type = t.ActionType.fromNumber(var3578) or var3578
			else
				local _ = nil
				local var3579, var3580 = protoModule.readVarInt(p176, var3570)
				local _ = var3579
				var3570 = var3580
			end
		end
		if var3571 == protoModule.wireTypes.lengthDelimited then
			if var3575 == 2 then
				local _ = nil
				local var3581, var3582 = protoModule.readBuffer(p176, var3570)
				var3570 = var3582
				var3569.action_params = t.UndoGameTileNotInterestedAction_Params.decode(var3581)
			else
				local _ = nil
				local var3583, var3584 = protoModule.readVarInt(p176, var3570)
				var3570 = var3584 + var3583
			end
		elseif var3571 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3585, var3586 = protoModule.readFixed32(p176, var3570)
			local _ = var3585
			var3570 = var3586
		elseif var3571 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3587, var3588 = protoModule.readFixed64(p176, var3570)
			local _ = var3587
			var3570 = var3588
		else
			error("Unsupported wire type: " .. var5829)
		end
	end
	return var3569
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
	local var3589 = t_176.new()
	
	if self.action_type ~= nil then
		var3589.action_type = if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) or self.action_type else t.ActionType.fromName(self.action_type) or self.action_type
	end
	if self.actionType ~= nil then
		var3589.action_type = if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) or self.actionType else t.ActionType.fromName(self.actionType) or self.actionType
	end
	if self.action_params ~= nil then
		var3589.action_params = t.UndoGameTileNotInterestedAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		var3589.action_params = t.UndoGameTileNotInterestedAction_Params.jsonDecode(self.actionParams)
	end
	return var3589
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
	local var3589 = 0
	
	if self.universe_id ~= nil then
		local var3590 = self.universe_id:encode()
		local var3591, var3592 = protoModule.writeTag(buff, var3589, 1, protoModule.wireTypes.lengthDelimited)
		var3591, var5853 = protoModule.writeBuffer(var3591, var3592, var3590, buffer.len(var3590))
		buff = var3591
		var3589 = var3592
	end
	if self.collection_id ~= nil then
		local var3593 = self.collection_id:encode()
		local var3594, var3595 = protoModule.writeTag(buff, var3589, 2, protoModule.wireTypes.lengthDelimited)
		var3594, var5856 = protoModule.writeBuffer(var3594, var3595, var3593, buffer.len(var3593))
		buff = var3594
		var3589 = var3595
	end
	local buff_1 = buffer.create(var3589)
	buffer.copy(buff_1, 0, buff, 0, var3589)
	
	return buff_1
end

function t_177.decode(p177)
	-- upvalues: t_177 (ref), protoModule (ref), propTypesModule (ref)
	local var3589 = t_177.new()
	local var3590 = 0
	while var3590 < buffer.len(p177) do
		local _ = nil
		local var3591 = nil
		local var3592, var3593, var3594 = protoModule.readTag(p177, var3590)
		local var3595 = var3592
		var3591 = var3593
		var3590 = var3594
		
		if var3591 == protoModule.wireTypes.varint then
			local _ = nil
			local var3596, var3597 = protoModule.readVarInt(p177, var3590)
			local _ = var3596
			var3590 = var3597
			continue
		end
		if var3591 == protoModule.wireTypes.lengthDelimited then
			if var3595 == 1 then
				local _ = nil
				local var3598, var3599 = protoModule.readBuffer(p177, var3590)
				var3590 = var3599
				var3589.universe_id = propTypesModule.StringProp.decode(var3598)
			elseif var3595 == 2 then
				local _ = nil
				local var3600, var3601 = protoModule.readBuffer(p177, var3590)
				var3590 = var3601
				var3589.collection_id = propTypesModule.StringProp.decode(var3600)
			else
				local _ = nil
				local var3602, var3603 = protoModule.readVarInt(p177, var3590)
				var3590 = var3603 + var3602
			end
		elseif var3591 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3604, var3605 = protoModule.readFixed32(p177, var3590)
			local _ = var3604
			var3590 = var3605
		elseif var3591 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3606, var3607 = protoModule.readFixed64(p177, var3590)
			local _ = var3606
			var3590 = var3607
		else
			error("Unsupported wire type: " .. var5860)
		end
	end
	return var3589
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
	local var3608 = t_177.new()
	
	if self.universe_id ~= nil then
		var3608.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var3608.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.collection_id ~= nil then
		var3608.collection_id = propTypesModule.StringProp.jsonDecode(self.collection_id)
	end
	if self.collectionId ~= nil then
		var3608.collection_id = propTypesModule.StringProp.jsonDecode(self.collectionId)
	end
	return var3608
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
	-- upvalues: t_178 (ref)
	return setmetatable({
		kind = if p178 == nil or p178.kind == nil then nil else p178.kind,
		telemetry_handler = if p178 == nil or p178.telemetry_handler == nil then nil else p178.telemetry_handler,
		accessibility_label = if p178 == nil or p178.accessibility_label == nil then nil else p178.accessibility_label,
		skip_unified_logging = if p178 == nil or p178.skip_unified_logging == nil then nil else p178.skip_unified_logging,
		action_event_name = if p178 == nil or p178.action_event_name == nil then nil else p178.action_event_name
	}, t_178)
end

function t_178:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3608 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "dismiss_dialog_action" then
			local var3609 = self.kind.value:encode()
			local var3610, var3611 = protoModule.writeTag(buff, var3608, 1, protoModule.wireTypes.lengthDelimited)
			var3610, var5883 = protoModule.writeBuffer(var3610, var3611, var3609, buffer.len(var3609))
			buff = var3610
			var3608 = var3611
		elseif self.kind.type == "link_action" then
			local var3612 = self.kind.value:encode()
			local var3613, var3614 = protoModule.writeTag(buff, var3608, 2, protoModule.wireTypes.lengthDelimited)
			var3613, var5886 = protoModule.writeBuffer(var3613, var3614, var3612, buffer.len(var3612))
			buff = var3613
			var3608 = var3614
		elseif self.kind.type == "open_game_details_action" then
			local var3615 = self.kind.value:encode()
			local var3616, var3617 = protoModule.writeTag(buff, var3608, 3, protoModule.wireTypes.lengthDelimited)
			var3616, var5889 = protoModule.writeBuffer(var3616, var3617, var3615, buffer.len(var3615))
			buff = var3616
			var3608 = var3617
		elseif self.kind.type == "open_join_friends_action" then
			local var3618 = self.kind.value:encode()
			local var3619, var3620 = protoModule.writeTag(buff, var3608, 4, protoModule.wireTypes.lengthDelimited)
			var3619, var5892 = protoModule.writeBuffer(var3619, var3620, var3618, buffer.len(var3618))
			buff = var3619
			var3608 = var3620
		elseif self.kind.type == "open_marketplace_try_on_action" then
			local var3621 = self.kind.value:encode()
			local var3622, var3623 = protoModule.writeTag(buff, var3608, 5, protoModule.wireTypes.lengthDelimited)
			var3622, var5895 = protoModule.writeBuffer(var3622, var3623, var3621, buffer.len(var3621))
			buff = var3622
			var3608 = var3623
		elseif self.kind.type == "open_see_all_action" then
			local var3624 = self.kind.value:encode()
			local var3625, var3626 = protoModule.writeTag(buff, var3608, 6, protoModule.wireTypes.lengthDelimited)
			var3625, var5898 = protoModule.writeBuffer(var3625, var3626, var3624, buffer.len(var3624))
			buff = var3625
			var3608 = var3626
		elseif self.kind.type == "open_sponsored_tooltip_action" then
			local var3627 = self.kind.value:encode()
			local var3628, var3629 = protoModule.writeTag(buff, var3608, 7, protoModule.wireTypes.lengthDelimited)
			var3628, var5901 = protoModule.writeBuffer(var3628, var3629, var3627, buffer.len(var3627))
			buff = var3628
			var3608 = var3629
		elseif self.kind.type == "play_button_click_action" then
			local var3630 = self.kind.value:encode()
			local var3631, var3632 = protoModule.writeTag(buff, var3608, 8, protoModule.wireTypes.lengthDelimited)
			var3631, var5904 = protoModule.writeBuffer(var3631, var3632, var3630, buffer.len(var3630))
			buff = var3631
			var3608 = var3632
		elseif self.kind.type == "update_user_settings_action" then
			local var3633 = self.kind.value:encode()
			local var3634, var3635 = protoModule.writeTag(buff, var3608, 9, protoModule.wireTypes.lengthDelimited)
			var3634, var5907 = protoModule.writeBuffer(var3634, var3635, var3633, buffer.len(var3633))
			buff = var3634
			var3608 = var3635
		elseif self.kind.type == "open_tooltip_action" then
			local var3636 = self.kind.value:encode()
			local var3637, var3638 = protoModule.writeTag(buff, var3608, 10, protoModule.wireTypes.lengthDelimited)
			var3637, var5910 = protoModule.writeBuffer(var3637, var3638, var3636, buffer.len(var3636))
			buff = var3637
			var3608 = var3638
		elseif self.kind.type == "open_badge_details_action" then
			local var3639 = self.kind.value:encode()
			local var3640, var3641 = protoModule.writeTag(buff, var3608, 11, protoModule.wireTypes.lengthDelimited)
			var3640, var5913 = protoModule.writeBuffer(var3640, var3641, var3639, buffer.len(var3639))
			buff = var3640
			var3608 = var3641
		elseif self.kind.type == "load_more_from_api_action" then
			local var3642 = self.kind.value:encode()
			local var3643, var3644 = protoModule.writeTag(buff, var3608, 12, protoModule.wireTypes.lengthDelimited)
			var3643, var5916 = protoModule.writeBuffer(var3643, var3644, var3642, buffer.len(var3642))
			buff = var3643
			var3608 = var3644
		elseif self.kind.type == "share_action" then
			local var3645 = self.kind.value:encode()
			local var3646, var3647 = protoModule.writeTag(buff, var3608, 13, protoModule.wireTypes.lengthDelimited)
			var3646, var5919 = protoModule.writeBuffer(var3646, var3647, var3645, buffer.len(var3645))
			buff = var3646
			var3608 = var3647
		elseif self.kind.type == "open_abuse_report_action" then
			local var3648 = self.kind.value:encode()
			local var3649, var3650 = protoModule.writeTag(buff, var3608, 14, protoModule.wireTypes.lengthDelimited)
			var3649, var5922 = protoModule.writeBuffer(var3649, var3650, var3648, buffer.len(var3648))
			buff = var3649
			var3608 = var3650
		elseif self.kind.type == "remove_badge_from_inventory_action" then
			local var3651 = self.kind.value:encode()
			local var3652, var3653 = protoModule.writeTag(buff, var3608, 15, protoModule.wireTypes.lengthDelimited)
			var3652, var5925 = protoModule.writeBuffer(var3652, var3653, var3651, buffer.len(var3651))
			buff = var3652
			var3608 = var3653
		elseif self.kind.type == "open_profile_action" then
			local var3654 = self.kind.value:encode()
			local var3655, var3656 = protoModule.writeTag(buff, var3608, 16, protoModule.wireTypes.lengthDelimited)
			var3655, var5928 = protoModule.writeBuffer(var3655, var3656, var3654, buffer.len(var3654))
			buff = var3655
			var3608 = var3656
		elseif self.kind.type == "open_facial_age_estimation_action" then
			local var3657 = self.kind.value:encode()
			local var3658, var3659 = protoModule.writeTag(buff, var3608, 17, protoModule.wireTypes.lengthDelimited)
			var3658, var5931 = protoModule.writeBuffer(var3658, var3659, var3657, buffer.len(var3657))
			buff = var3658
			var3608 = var3659
		elseif self.kind.type == "open_add_connections_page_action" then
			local var3660 = self.kind.value:encode()
			local var3661, var3662 = protoModule.writeTag(buff, var3608, 18, protoModule.wireTypes.lengthDelimited)
			var3661, var5934 = protoModule.writeBuffer(var3661, var3662, var3660, buffer.len(var3660))
			buff = var3661
			var3608 = var3662
		elseif self.kind.type == "open_marketplace_action" then
			local var3663 = self.kind.value:encode()
			local var3664, var3665 = protoModule.writeTag(buff, var3608, 19, protoModule.wireTypes.lengthDelimited)
			var3664, var5937 = protoModule.writeBuffer(var3664, var3665, var3663, buffer.len(var3663))
			buff = var3664
			var3608 = var3665
		elseif self.kind.type == "hide_profile_completion_action" then
			local var3666 = self.kind.value:encode()
			local var3667, var3668 = protoModule.writeTag(buff, var3608, 20, protoModule.wireTypes.lengthDelimited)
			var3667, var5940 = protoModule.writeBuffer(var3667, var3668, var3666, buffer.len(var3666))
			buff = var3667
			var3608 = var3668
		elseif self.kind.type == "select_marketplace_catalog_category" then
			local var3669 = self.kind.value:encode()
			local var3670, var3671 = protoModule.writeTag(buff, var3608, 21, protoModule.wireTypes.lengthDelimited)
			var3670, var5943 = protoModule.writeBuffer(var3670, var3671, var3669, buffer.len(var3669))
			buff = var3670
			var3608 = var3671
		elseif self.kind.type == "select_marketplace_catalog_subcategory" then
			local var3672 = self.kind.value:encode()
			local var3673, var3674 = protoModule.writeTag(buff, var3608, 22, protoModule.wireTypes.lengthDelimited)
			var3673, var5946 = protoModule.writeBuffer(var3673, var3674, var3672, buffer.len(var3672))
			buff = var3673
			var3608 = var3674
		elseif self.kind.type == "open_marketplace_catalog_see_all" then
			local var3675 = self.kind.value:encode()
			local var3676, var3677 = protoModule.writeTag(buff, var3608, 23, protoModule.wireTypes.lengthDelimited)
			var3676, var5949 = protoModule.writeBuffer(var3676, var3677, var3675, buffer.len(var3675))
			buff = var3676
			var3608 = var3677
		elseif self.kind.type == "close_marketplace_category_tooltip" then
			local var3678 = self.kind.value:encode()
			local var3679, var3680 = protoModule.writeTag(buff, var3608, 24, protoModule.wireTypes.lengthDelimited)
			var3679, var5952 = protoModule.writeBuffer(var3679, var3680, var3678, buffer.len(var3678))
			buff = var3679
			var3608 = var3680
		elseif self.kind.type == "resize_marketplace_catalog" then
			local var3681 = self.kind.value:encode()
			local var3682, var3683 = protoModule.writeTag(buff, var3608, 25, protoModule.wireTypes.lengthDelimited)
			var3682, var5955 = protoModule.writeBuffer(var3682, var3683, var3681, buffer.len(var3681))
			buff = var3682
			var3608 = var3683
		elseif self.kind.type == "open_marketplace_catalog_filters" then
			local var3684 = self.kind.value:encode()
			local var3685, var3686 = protoModule.writeTag(buff, var3608, 26, protoModule.wireTypes.lengthDelimited)
			var3685, var5958 = protoModule.writeBuffer(var3685, var3686, var3684, buffer.len(var3684))
			buff = var3685
			var3608 = var3686
		elseif self.kind.type == "open_social_link_action" then
			local var3687 = self.kind.value:encode()
			local var3688, var3689 = protoModule.writeTag(buff, var3608, 27, protoModule.wireTypes.lengthDelimited)
			var3688, var5961 = protoModule.writeBuffer(var3688, var3689, var3687, buffer.len(var3687))
			buff = var3688
			var3608 = var3689
		elseif self.kind.type == "open_charts_sort_detail_action" then
			local var3690 = self.kind.value:encode()
			local var3691, var3692 = protoModule.writeTag(buff, var3608, 28, protoModule.wireTypes.lengthDelimited)
			var3691, var5964 = protoModule.writeBuffer(var3691, var3692, var3690, buffer.len(var3690))
			buff = var3691
			var3608 = var3692
		elseif self.kind.type == "open_song_detail_action" then
			local var3693 = self.kind.value:encode()
			local var3694, var3695 = protoModule.writeTag(buff, var3608, 29, protoModule.wireTypes.lengthDelimited)
			var3694, var5967 = protoModule.writeBuffer(var3694, var3695, var3693, buffer.len(var3693))
			buff = var3694
			var3608 = var3695
		elseif self.kind.type == "refresh_from_api_action" then
			local var3696 = self.kind.value:encode()
			local var3697, var3698 = protoModule.writeTag(buff, var3608, 30, protoModule.wireTypes.lengthDelimited)
			var3697, var5970 = protoModule.writeBuffer(var3697, var3698, var3696, buffer.len(var3696))
			buff = var3697
			var3608 = var3698
		elseif self.kind.type == "rsvp_to_event_action" then
			local var3699 = self.kind.value:encode()
			local var3700, var3701 = protoModule.writeTag(buff, var3608, 31, protoModule.wireTypes.lengthDelimited)
			var3700, var5973 = protoModule.writeBuffer(var3700, var3701, var3699, buffer.len(var3699))
			buff = var3700
			var3608 = var3701
		elseif self.kind.type == "apply_charts_filter_action" then
			local var3702 = self.kind.value:encode()
			local var3703, var3704 = protoModule.writeTag(buff, var3608, 32, protoModule.wireTypes.lengthDelimited)
			var3703, var5976 = protoModule.writeBuffer(var3703, var3704, var3702, buffer.len(var3702))
			buff = var3703
			var3608 = var3704
		elseif self.kind.type == "analytics_event_action" then
			local var3705 = self.kind.value:encode()
			local var3706, var3707 = protoModule.writeTag(buff, var3608, 33, protoModule.wireTypes.lengthDelimited)
			var3706, var5979 = protoModule.writeBuffer(var3706, var3707, var3705, buffer.len(var3705))
			buff = var3706
			var3608 = var3707
		elseif self.kind.type == "custom_analytics_event_action" then
			local var3708 = self.kind.value:encode()
			local var3709, var3710 = protoModule.writeTag(buff, var3608, 34, protoModule.wireTypes.lengthDelimited)
			var3709, var5982 = protoModule.writeBuffer(var3709, var3710, var3708, buffer.len(var3708))
			buff = var3709
			var3608 = var3710
		elseif self.kind.type == "open_game_invite_action" then
			local var3711 = self.kind.value:encode()
			local var3712, var3713 = protoModule.writeTag(buff, var3608, 35, protoModule.wireTypes.lengthDelimited)
			var3712, var5985 = protoModule.writeBuffer(var3712, var3713, var3711, buffer.len(var3711))
			buff = var3712
			var3608 = var3713
		elseif self.kind.type == "open_event_details_action" then
			local var3714 = self.kind.value:encode()
			local var3715, var3716 = protoModule.writeTag(buff, var3608, 36, protoModule.wireTypes.lengthDelimited)
			var3715, var5988 = protoModule.writeBuffer(var3715, var3716, var3714, buffer.len(var3714))
			buff = var3715
			var3608 = var3716
		elseif self.kind.type == "launch_experience_action" then
			local var3717 = self.kind.value:encode()
			local var3718, var3719 = protoModule.writeTag(buff, var3608, 37, protoModule.wireTypes.lengthDelimited)
			var3718, var5991 = protoModule.writeBuffer(var3718, var3719, var3717, buffer.len(var3717))
			buff = var3718
			var3608 = var3719
		elseif self.kind.type == "toggle_experience_favorite_action" then
			local var3720 = self.kind.value:encode()
			local var3721, var3722 = protoModule.writeTag(buff, var3608, 38, protoModule.wireTypes.lengthDelimited)
			var3721, var5994 = protoModule.writeBuffer(var3721, var3722, var3720, buffer.len(var3720))
			buff = var3721
			var3608 = var3722
		elseif self.kind.type == "toggle_experience_follow_action" then
			local var3723 = self.kind.value:encode()
			local var3724, var3725 = protoModule.writeTag(buff, var3608, 39, protoModule.wireTypes.lengthDelimited)
			var3724, var5997 = protoModule.writeBuffer(var3724, var3725, var3723, buffer.len(var3723))
			buff = var3724
			var3608 = var3725
		elseif self.kind.type == "toggle_experience_vote_action" then
			local var3726 = self.kind.value:encode()
			local var3727, var3728 = protoModule.writeTag(buff, var3608, 40, protoModule.wireTypes.lengthDelimited)
			var3727, var6000 = protoModule.writeBuffer(var3727, var3728, var3726, buffer.len(var3726))
			buff = var3727
			var3608 = var3728
		elseif self.kind.type == "open_purchase_prompt_action" then
			local var3729 = self.kind.value:encode()
			local var3730, var3731 = protoModule.writeTag(buff, var3608, 41, protoModule.wireTypes.lengthDelimited)
			var3730, var6003 = protoModule.writeBuffer(var3730, var3731, var3729, buffer.len(var3729))
			buff = var3730
			var3608 = var3731
		elseif self.kind.type == "open_sdui_overlay_action" then
			local var3732 = self.kind.value:encode()
			local var3733, var3734 = protoModule.writeTag(buff, var3608, 42, protoModule.wireTypes.lengthDelimited)
			var3733, var6006 = protoModule.writeBuffer(var3733, var3734, var3732, buffer.len(var3732))
			buff = var3733
			var3608 = var3734
		elseif self.kind.type == "open_badges_see_all_action" then
			local var3735 = self.kind.value:encode()
			local var3736, var3737 = protoModule.writeTag(buff, var3608, 43, protoModule.wireTypes.lengthDelimited)
			var3736, var6009 = protoModule.writeBuffer(var3736, var3737, var3735, buffer.len(var3735))
			buff = var3736
			var3608 = var3737
		elseif self.kind.type == "open_experience_store_see_all_action" then
			local var3738 = self.kind.value:encode()
			local var3739, var3740 = protoModule.writeTag(buff, var3608, 44, protoModule.wireTypes.lengthDelimited)
			var3739, var6012 = protoModule.writeBuffer(var3739, var3740, var3738, buffer.len(var3738))
			buff = var3739
			var3608 = var3740
		elseif self.kind.type == "dismiss_game_feedback_action" then
			local var3741 = self.kind.value:encode()
			local var3742, var3743 = protoModule.writeTag(buff, var3608, 45, protoModule.wireTypes.lengthDelimited)
			var3742, var6015 = protoModule.writeBuffer(var3742, var3743, var3741, buffer.len(var3741))
			buff = var3742
			var3608 = var3743
		elseif self.kind.type == "open_game_feedback_form_action" then
			local var3744 = self.kind.value:encode()
			local var3745, var3746 = protoModule.writeTag(buff, var3608, 46, protoModule.wireTypes.lengthDelimited)
			var3745, var6018 = protoModule.writeBuffer(var3745, var3746, var3744, buffer.len(var3744))
			buff = var3745
			var3608 = var3746
		elseif self.kind.type == "enable_event_notifications_action" then
			local var3747 = self.kind.value:encode()
			local var3748, var3749 = protoModule.writeTag(buff, var3608, 47, protoModule.wireTypes.lengthDelimited)
			var3748, var6021 = protoModule.writeBuffer(var3748, var3749, var3747, buffer.len(var3747))
			buff = var3748
			var3608 = var3749
		elseif self.kind.type == "dismiss_event_notifications_modal_action" then
			local var3750 = self.kind.value:encode()
			local var3751, var3752 = protoModule.writeTag(buff, var3608, 48, protoModule.wireTypes.lengthDelimited)
			var3751, var6024 = protoModule.writeBuffer(var3751, var3752, var3750, buffer.len(var3750))
			buff = var3751
			var3608 = var3752
		elseif self.kind.type == "open_amp_wizard_action" then
			local var3753 = self.kind.value:encode()
			local var3754, var3755 = protoModule.writeTag(buff, var3608, 49, protoModule.wireTypes.lengthDelimited)
			var3754, var6027 = protoModule.writeBuffer(var3754, var3755, var3753, buffer.len(var3753))
			buff = var3754
			var3608 = var3755
		elseif self.kind.type == "open_subscription_purchase_page_action" then
			local var3756 = self.kind.value:encode()
			local var3757, var3758 = protoModule.writeTag(buff, var3608, 50, protoModule.wireTypes.lengthDelimited)
			var3757, var6030 = protoModule.writeBuffer(var3757, var3758, var3756, buffer.len(var3756))
			buff = var3757
			var3608 = var3758
		elseif self.kind.type == "refresh_game_passes_action" then
			local var3759 = self.kind.value:encode()
			local var3760, var3761 = protoModule.writeTag(buff, var3608, 51, protoModule.wireTypes.lengthDelimited)
			var3760, var6033 = protoModule.writeBuffer(var3760, var3761, var3759, buffer.len(var3759))
			buff = var3760
			var3608 = var3761
		elseif self.kind.type == "refresh_playability_action" then
			local var3762 = self.kind.value:encode()
			local var3763, var3764 = protoModule.writeTag(buff, var3608, 52, protoModule.wireTypes.lengthDelimited)
			var3763, var6036 = protoModule.writeBuffer(var3763, var3764, var3762, buffer.len(var3762))
			buff = var3763
			var3608 = var3764
		elseif self.kind.type == "open_social_proof_user_list_sheet_action" then
			local var3765 = self.kind.value:encode()
			local var3766, var3767 = protoModule.writeTag(buff, var3608, 53, protoModule.wireTypes.lengthDelimited)
			var3766, var6039 = protoModule.writeBuffer(var3766, var3767, var3765, buffer.len(var3765))
			buff = var3766
			var3608 = var3767
		elseif self.kind.type == "report_surface_load_time_milestone_action" then
			local var3768 = self.kind.value:encode()
			local var3769, var3770 = protoModule.writeTag(buff, var3608, 54, protoModule.wireTypes.lengthDelimited)
			var3769, var6042 = protoModule.writeBuffer(var3769, var3770, var3768, buffer.len(var3768))
			buff = var3769
			var3608 = var3770
		elseif self.kind.type == "open_search_results_tab_action" then
			local var3771 = self.kind.value:encode()
			local var3772, var3773 = protoModule.writeTag(buff, var3608, 55, protoModule.wireTypes.lengthDelimited)
			var3772, var6045 = protoModule.writeBuffer(var3772, var3773, var3771, buffer.len(var3771))
			buff = var3772
			var3608 = var3773
		elseif self.kind.type == "open_phone_upsell_modal_action" then
			local var3774 = self.kind.value:encode()
			local var3775, var3776 = protoModule.writeTag(buff, var3608, 56, protoModule.wireTypes.lengthDelimited)
			var3775, var6048 = protoModule.writeBuffer(var3775, var3776, var3774, buffer.len(var3774))
			buff = var3775
			var3608 = var3776
		elseif self.kind.type == "open_email_upsell_modal_action" then
			local var3777 = self.kind.value:encode()
			local var3778, var3779 = protoModule.writeTag(buff, var3608, 57, protoModule.wireTypes.lengthDelimited)
			var3778, var6051 = protoModule.writeBuffer(var3778, var3779, var3777, buffer.len(var3777))
			buff = var3778
			var3608 = var3779
		elseif self.kind.type == "dismiss_prompt_action" then
			local var3780 = self.kind.value:encode()
			local var3781, var3782 = protoModule.writeTag(buff, var3608, 58, protoModule.wireTypes.lengthDelimited)
			var3781, var6054 = protoModule.writeBuffer(var3781, var3782, var3780, buffer.len(var3780))
			buff = var3781
			var3608 = var3782
		elseif self.kind.type == "request_friendship_action" then
			local var3783 = self.kind.value:encode()
			local var3784, var3785 = protoModule.writeTag(buff, var3608, 59, protoModule.wireTypes.lengthDelimited)
			var3784, var6057 = protoModule.writeBuffer(var3784, var3785, var3783, buffer.len(var3783))
			buff = var3784
			var3608 = var3785
		elseif self.kind.type == "refresh_developer_products_action" then
			local var3786 = self.kind.value:encode()
			local var3787, var3788 = protoModule.writeTag(buff, var3608, 60, protoModule.wireTypes.lengthDelimited)
			var3787, var6060 = protoModule.writeBuffer(var3787, var3788, var3786, buffer.len(var3786))
			buff = var3787
			var3608 = var3788
		elseif self.kind.type == "open_fae_trial_upsell_action" then
			local var3789 = self.kind.value:encode()
			local var3790, var3791 = protoModule.writeTag(buff, var3608, 61, protoModule.wireTypes.lengthDelimited)
			var3790, var6063 = protoModule.writeBuffer(var3790, var3791, var3789, buffer.len(var3789))
			buff = var3790
			var3608 = var3791
		elseif self.kind.type == "refresh_omni_recommendation_feed_item_action" then
			local var3792 = self.kind.value:encode()
			local var3793, var3794 = protoModule.writeTag(buff, var3608, 62, protoModule.wireTypes.lengthDelimited)
			var3793, var6066 = protoModule.writeBuffer(var3793, var3794, var3792, buffer.len(var3792))
			buff = var3793
			var3608 = var3794
		elseif self.kind.type == "ai_overview_feedback_action" then
			local var3795 = self.kind.value:encode()
			local var3796, var3797 = protoModule.writeTag(buff, var3608, 63, protoModule.wireTypes.lengthDelimited)
			var3796, var6069 = protoModule.writeBuffer(var3796, var3797, var3795, buffer.len(var3795))
			buff = var3796
			var3608 = var3797
		elseif self.kind.type == "open_trusted_friends_upsell_modal_action" then
			local var3798 = self.kind.value:encode()
			local var3799, var3800 = protoModule.writeTag(buff, var3608, 64, protoModule.wireTypes.lengthDelimited)
			var3799, var6072 = protoModule.writeBuffer(var3799, var3800, var3798, buffer.len(var3798))
			buff = var3799
			var3608 = var3800
		elseif self.kind.type == "record_party_chat_conversation_upsell_acknowledgement_action" then
			local var3801 = self.kind.value:encode()
			local var3802, var3803 = protoModule.writeTag(buff, var3608, 65, protoModule.wireTypes.lengthDelimited)
			var3802, var6075 = protoModule.writeBuffer(var3802, var3803, var3801, buffer.len(var3801))
			buff = var3802
			var3608 = var3803
		elseif self.kind.type == "open_search_results_with_query_action" then
			local var3804 = self.kind.value:encode()
			local var3805, var3806 = protoModule.writeTag(buff, var3608, 66, protoModule.wireTypes.lengthDelimited)
			var3805, var6078 = protoModule.writeBuffer(var3805, var3806, var3804, buffer.len(var3804))
			buff = var3805
			var3608 = var3806
		elseif self.kind.type == "select_marketplace_favorites_category" then
			local var3807 = self.kind.value:encode()
			local var3808, var3809 = protoModule.writeTag(buff, var3608, 67, protoModule.wireTypes.lengthDelimited)
			var3808, var6081 = protoModule.writeBuffer(var3808, var3809, var3807, buffer.len(var3807))
			buff = var3808
			var3608 = var3809
		elseif self.kind.type == "download_app_action" then
			local var3810 = self.kind.value:encode()
			local var3811, var3812 = protoModule.writeTag(buff, var3608, 68, protoModule.wireTypes.lengthDelimited)
			var3811, var6084 = protoModule.writeBuffer(var3811, var3812, var3810, buffer.len(var3810))
			buff = var3811
			var3608 = var3812
		elseif self.kind.type == "refresh_charts_sort_detail_action" then
			local var3813 = self.kind.value:encode()
			local var3814, var3815 = protoModule.writeTag(buff, var3608, 69, protoModule.wireTypes.lengthDelimited)
			var3814, var6087 = protoModule.writeBuffer(var3814, var3815, var3813, buffer.len(var3813))
			buff = var3814
			var3608 = var3815
		elseif self.kind.type == "join_community_action" then
			local var3816 = self.kind.value:encode()
			local var3817, var3818 = protoModule.writeTag(buff, var3608, 70, protoModule.wireTypes.lengthDelimited)
			var3817, var6090 = protoModule.writeBuffer(var3817, var3818, var3816, buffer.len(var3816))
			buff = var3817
			var3608 = var3818
		elseif self.kind.type == "view_community_action" then
			local var3819 = self.kind.value:encode()
			local var3820, var3821 = protoModule.writeTag(buff, var3608, 71, protoModule.wireTypes.lengthDelimited)
			var3820, var6093 = protoModule.writeBuffer(var3820, var3821, var3819, buffer.len(var3819))
			buff = var3820
			var3608 = var3821
		elseif self.kind.type == "pin_experience_shortcut_action" then
			local var3822 = self.kind.value:encode()
			local var3823, var3824 = protoModule.writeTag(buff, var3608, 72, protoModule.wireTypes.lengthDelimited)
			var3823, var6096 = protoModule.writeBuffer(var3823, var3824, var3822, buffer.len(var3822))
			buff = var3823
			var3608 = var3824
		elseif self.kind.type == "select_marketplace_favorites_subcategory" then
			local var3825 = self.kind.value:encode()
			local var3826, var3827 = protoModule.writeTag(buff, var3608, 73, protoModule.wireTypes.lengthDelimited)
			var3826, var6099 = protoModule.writeBuffer(var3826, var3827, var3825, buffer.len(var3825))
			buff = var3826
			var3608 = var3827
		elseif self.kind.type == "show_toast_action" then
			local var3828 = self.kind.value:encode()
			local var3829, var3830 = protoModule.writeTag(buff, var3608, 74, protoModule.wireTypes.lengthDelimited)
			var3829, var6102 = protoModule.writeBuffer(var3829, var3830, var3828, buffer.len(var3828))
			buff = var3829
			var3608 = var3830
		elseif self.kind.type == "open_incoming_transfer_upsell_action" then
			local var3831 = self.kind.value:encode()
			local var3832, var3833 = protoModule.writeTag(buff, var3608, 75, protoModule.wireTypes.lengthDelimited)
			var3832, var6105 = protoModule.writeBuffer(var3832, var3833, var3831, buffer.len(var3831))
			buff = var3832
			var3608 = var3833
		elseif self.kind.type == "action_sequence_action" then
			local var3834 = self.kind.value:encode()
			local var3835, var3836 = protoModule.writeTag(buff, var3608, 76, protoModule.wireTypes.lengthDelimited)
			var3835, var6108 = protoModule.writeBuffer(var3835, var3836, var3834, buffer.len(var3834))
			buff = var3835
			var3608 = var3836
		elseif self.kind.type == "refresh_feed_entry_from_api_action" then
			local var3837 = self.kind.value:encode()
			local var3838, var3839 = protoModule.writeTag(buff, var3608, 77, protoModule.wireTypes.lengthDelimited)
			var3838, var6111 = protoModule.writeBuffer(var3838, var3839, var3837, buffer.len(var3837))
			buff = var3838
			var3608 = var3839
		elseif self.kind.type == "open_profile_frames_editor_action" then
			local var3840 = self.kind.value:encode()
			local var3841, var3842 = protoModule.writeTag(buff, var3608, 78, protoModule.wireTypes.lengthDelimited)
			var3841, var6114 = protoModule.writeBuffer(var3841, var3842, var3840, buffer.len(var3840))
			buff = var3841
			var3608 = var3842
		elseif self.kind.type == "navigate_action" then
			local var3843 = self.kind.value:encode()
			local var3844, var3845 = protoModule.writeTag(buff, var3608, 79, protoModule.wireTypes.lengthDelimited)
			var3844, var6117 = protoModule.writeBuffer(var3844, var3845, var3843, buffer.len(var3843))
			buff = var3844
			var3608 = var3845
		elseif self.kind.type == "set_game_tile_not_interested_action" then
			local var3846 = self.kind.value:encode()
			local var3847, var3848 = protoModule.writeTag(buff, var3608, 80, protoModule.wireTypes.lengthDelimited)
			var3847, var6120 = protoModule.writeBuffer(var3847, var3848, var3846, buffer.len(var3846))
			buff = var3847
			var3608 = var3848
		elseif self.kind.type == "refresh_home_action" then
			local var3849 = self.kind.value:encode()
			local var3850, var3851 = protoModule.writeTag(buff, var3608, 81, protoModule.wireTypes.lengthDelimited)
			var3850, var6123 = protoModule.writeBuffer(var3850, var3851, var3849, buffer.len(var3849))
			buff = var3850
			var3608 = var3851
		elseif self.kind.type == "undo_game_tile_not_interested_action" then
			local var3852 = self.kind.value:encode()
			local var3853, var3854 = protoModule.writeTag(buff, var3608, 82, protoModule.wireTypes.lengthDelimited)
			var3853, var6126 = protoModule.writeBuffer(var3853, var3854, var3852, buffer.len(var3852))
			buff = var3853
			var3608 = var3854
		elseif self.kind.type == "apply_dev_store_see_all_category_filter_action" then
			local var3855 = self.kind.value:encode()
			local var3856, var3857 = protoModule.writeTag(buff, var3608, 83, protoModule.wireTypes.lengthDelimited)
			var3856, var6129 = protoModule.writeBuffer(var3856, var3857, var3855, buffer.len(var3855))
			buff = var3856
			var3608 = var3857
		end
	end
	if self.telemetry_handler ~= nil then
		local var3858 = self.telemetry_handler:encode()
		local var3859, var3860 = protoModule.writeTag(buff, var3608, 1000, protoModule.wireTypes.lengthDelimited)
		var3859, var6132 = protoModule.writeBuffer(var3859, var3860, var3858, buffer.len(var3858))
		buff = var3859
		var3608 = var3860
	end
	if self.accessibility_label ~= nil then
		local var3861 = self.accessibility_label:encode()
		local var3862, var3863 = protoModule.writeTag(buff, var3608, 1001, protoModule.wireTypes.lengthDelimited)
		var3862, var6135 = protoModule.writeBuffer(var3862, var3863, var3861, buffer.len(var3861))
		buff = var3862
		var3608 = var3863
	end
	if self.skip_unified_logging ~= nil then
		local var3864 = self.skip_unified_logging:encode()
		local var3865, var3866 = protoModule.writeTag(buff, var3608, 1002, protoModule.wireTypes.lengthDelimited)
		var3865, var6138 = protoModule.writeBuffer(var3865, var3866, var3864, buffer.len(var3864))
		buff = var3865
		var3608 = var3866
	end
	if self.action_event_name ~= nil then
		local var3867 = self.action_event_name:encode()
		local var3868, var3869 = protoModule.writeTag(buff, var3608, 1003, protoModule.wireTypes.lengthDelimited)
		var3868, var6141 = protoModule.writeBuffer(var3868, var3869, var3867, buffer.len(var3867))
		buff = var3868
		var3608 = var3869
	end
	local buff_1 = buffer.create(var3608)
	buffer.copy(buff_1, 0, buff, 0, var3608)
	
	return buff_1
end

function t_178.decode(p178)
	-- upvalues: t_178 (ref), protoModule (ref), t (ref), propTypesModule (ref)
	local var3608 = t_178.new()
	local var3609 = 0
	while var3609 < buffer.len(p178) do
		local _ = nil
		local var3610 = nil
		local var3611, var3612, var3613 = protoModule.readTag(p178, var3609)
		local var3614 = var3611
		var3610 = var3612
		var3609 = var3613
		
		if var3610 == protoModule.wireTypes.varint then
			local _ = nil
			local var3615, var3616 = protoModule.readVarInt(p178, var3609)
			local _ = var3615
			var3609 = var3616
			continue
		end
		if var3610 == protoModule.wireTypes.lengthDelimited then
			if var3614 == 1 then
				local _ = nil
				local var3617, var3618 = protoModule.readBuffer(p178, var3609)
				var3609 = var3618
				var3608.kind = {
					type = "dismiss_dialog_action",
					value = t.DismissDialogAction.decode(var3617)
				}
			elseif var3614 == 2 then
				local _ = nil
				local var3619, var3620 = protoModule.readBuffer(p178, var3609)
				var3609 = var3620
				var3608.kind = {
					type = "link_action",
					value = t.LinkAction.decode(var3619)
				}
			elseif var3614 == 3 then
				local _ = nil
				local var3621, var3622 = protoModule.readBuffer(p178, var3609)
				var3609 = var3622
				var3608.kind = {
					type = "open_game_details_action",
					value = t.OpenGameDetailsAction.decode(var3621)
				}
			elseif var3614 == 4 then
				local _ = nil
				local var3623, var3624 = protoModule.readBuffer(p178, var3609)
				var3609 = var3624
				var3608.kind = {
					type = "open_join_friends_action",
					value = t.OpenJoinFriendsAction.decode(var3623)
				}
			elseif var3614 == 5 then
				local _ = nil
				local var3625, var3626 = protoModule.readBuffer(p178, var3609)
				var3609 = var3626
				var3608.kind = {
					type = "open_marketplace_try_on_action",
					value = t.OpenMarketplaceTryOnAction.decode(var3625)
				}
			elseif var3614 == 6 then
				local _ = nil
				local var3627, var3628 = protoModule.readBuffer(p178, var3609)
				var3609 = var3628
				var3608.kind = {
					type = "open_see_all_action",
					value = t.OpenSeeAllAction.decode(var3627)
				}
			elseif var3614 == 7 then
				local _ = nil
				local var3629, var3630 = protoModule.readBuffer(p178, var3609)
				var3609 = var3630
				var3608.kind = {
					type = "open_sponsored_tooltip_action",
					value = t.OpenSponsoredTooltipAction.decode(var3629)
				}
			elseif var3614 == 8 then
				local _ = nil
				local var3631, var3632 = protoModule.readBuffer(p178, var3609)
				var3609 = var3632
				var3608.kind = {
					type = "play_button_click_action",
					value = t.PlayButtonClickAction.decode(var3631)
				}
			elseif var3614 == 9 then
				local _ = nil
				local var3633, var3634 = protoModule.readBuffer(p178, var3609)
				var3609 = var3634
				var3608.kind = {
					type = "update_user_settings_action",
					value = t.UpdateUserSettingsAction.decode(var3633)
				}
			elseif var3614 == 10 then
				local _ = nil
				local var3635, var3636 = protoModule.readBuffer(p178, var3609)
				var3609 = var3636
				var3608.kind = {
					type = "open_tooltip_action",
					value = t.OpenTooltipAction.decode(var3635)
				}
			elseif var3614 == 11 then
				local _ = nil
				local var3637, var3638 = protoModule.readBuffer(p178, var3609)
				var3609 = var3638
				var3608.kind = {
					type = "open_badge_details_action",
					value = t.OpenBadgeDetailsAction.decode(var3637)
				}
			elseif var3614 == 12 then
				local _ = nil
				local var3639, var3640 = protoModule.readBuffer(p178, var3609)
				var3609 = var3640
				var3608.kind = {
					type = "load_more_from_api_action",
					value = t.LoadMoreFromApiAction.decode(var3639)
				}
			elseif var3614 == 13 then
				local _ = nil
				local var3641, var3642 = protoModule.readBuffer(p178, var3609)
				var3609 = var3642
				var3608.kind = {
					type = "share_action",
					value = t.ShareAction.decode(var3641)
				}
			elseif var3614 == 14 then
				local _ = nil
				local var3643, var3644 = protoModule.readBuffer(p178, var3609)
				var3609 = var3644
				var3608.kind = {
					type = "open_abuse_report_action",
					value = t.OpenAbuseReportAction.decode(var3643)
				}
			elseif var3614 == 15 then
				local _ = nil
				local var3645, var3646 = protoModule.readBuffer(p178, var3609)
				var3609 = var3646
				var3608.kind = {
					type = "remove_badge_from_inventory_action",
					value = t.RemoveBadgeFromInventoryAction.decode(var3645)
				}
			elseif var3614 == 16 then
				local _ = nil
				local var3647, var3648 = protoModule.readBuffer(p178, var3609)
				var3609 = var3648
				var3608.kind = {
					type = "open_profile_action",
					value = t.OpenProfileAction.decode(var3647)
				}
			elseif var3614 == 17 then
				local _ = nil
				local var3649, var3650 = protoModule.readBuffer(p178, var3609)
				var3609 = var3650
				var3608.kind = {
					type = "open_facial_age_estimation_action",
					value = t.OpenFacialAgeEstimationAction.decode(var3649)
				}
			elseif var3614 == 18 then
				local _ = nil
				local var3651, var3652 = protoModule.readBuffer(p178, var3609)
				var3609 = var3652
				var3608.kind = {
					type = "open_add_connections_page_action",
					value = t.OpenAddConnectionsPageAction.decode(var3651)
				}
			elseif var3614 == 19 then
				local _ = nil
				local var3653, var3654 = protoModule.readBuffer(p178, var3609)
				var3609 = var3654
				var3608.kind = {
					type = "open_marketplace_action",
					value = t.OpenMarketplaceAction.decode(var3653)
				}
			elseif var3614 == 20 then
				local _ = nil
				local var3655, var3656 = protoModule.readBuffer(p178, var3609)
				var3609 = var3656
				var3608.kind = {
					type = "hide_profile_completion_action",
					value = t.HideProfileCompletionAction.decode(var3655)
				}
			elseif var3614 == 21 then
				local _ = nil
				local var3657, var3658 = protoModule.readBuffer(p178, var3609)
				var3609 = var3658
				var3608.kind = {
					type = "select_marketplace_catalog_category",
					value = t.SelectMarketplaceCatalogCategory.decode(var3657)
				}
			elseif var3614 == 22 then
				local _ = nil
				local var3659, var3660 = protoModule.readBuffer(p178, var3609)
				var3609 = var3660
				var3608.kind = {
					type = "select_marketplace_catalog_subcategory",
					value = t.SelectMarketplaceCatalogSubcategory.decode(var3659)
				}
			elseif var3614 == 23 then
				local _ = nil
				local var3661, var3662 = protoModule.readBuffer(p178, var3609)
				var3609 = var3662
				var3608.kind = {
					type = "open_marketplace_catalog_see_all",
					value = t.OpenMarketplaceCatalogSeeAll.decode(var3661)
				}
			elseif var3614 == 24 then
				local _ = nil
				local var3663, var3664 = protoModule.readBuffer(p178, var3609)
				var3609 = var3664
				var3608.kind = {
					type = "close_marketplace_category_tooltip",
					value = t.CloseMarketplaceCategoryTooltip.decode(var3663)
				}
			elseif var3614 == 25 then
				local _ = nil
				local var3665, var3666 = protoModule.readBuffer(p178, var3609)
				var3609 = var3666
				var3608.kind = {
					type = "resize_marketplace_catalog",
					value = t.ResizeMarketplaceCatalog.decode(var3665)
				}
			elseif var3614 == 26 then
				local _ = nil
				local var3667, var3668 = protoModule.readBuffer(p178, var3609)
				var3609 = var3668
				var3608.kind = {
					type = "open_marketplace_catalog_filters",
					value = t.OpenMarketplaceCatalogFilters.decode(var3667)
				}
			elseif var3614 == 27 then
				local _ = nil
				local var3669, var3670 = protoModule.readBuffer(p178, var3609)
				var3609 = var3670
				var3608.kind = {
					type = "open_social_link_action",
					value = t.OpenSocialLinkAction.decode(var3669)
				}
			elseif var3614 == 28 then
				local _ = nil
				local var3671, var3672 = protoModule.readBuffer(p178, var3609)
				var3609 = var3672
				var3608.kind = {
					type = "open_charts_sort_detail_action",
					value = t.OpenChartsSortDetailAction.decode(var3671)
				}
			elseif var3614 == 29 then
				local _ = nil
				local var3673, var3674 = protoModule.readBuffer(p178, var3609)
				var3609 = var3674
				var3608.kind = {
					type = "open_song_detail_action",
					value = t.OpenSongDetailAction.decode(var3673)
				}
			elseif var3614 == 30 then
				local _ = nil
				local var3675, var3676 = protoModule.readBuffer(p178, var3609)
				var3609 = var3676
				var3608.kind = {
					type = "refresh_from_api_action",
					value = t.RefreshFromApiAction.decode(var3675)
				}
			elseif var3614 == 31 then
				local _ = nil
				local var3677, var3678 = protoModule.readBuffer(p178, var3609)
				var3609 = var3678
				var3608.kind = {
					type = "rsvp_to_event_action",
					value = t.RsvpToEventAction.decode(var3677)
				}
			elseif var3614 == 32 then
				local _ = nil
				local var3679, var3680 = protoModule.readBuffer(p178, var3609)
				var3609 = var3680
				var3608.kind = {
					type = "apply_charts_filter_action",
					value = t.ApplyChartsFilterAction.decode(var3679)
				}
			elseif var3614 == 33 then
				local _ = nil
				local var3681, var3682 = protoModule.readBuffer(p178, var3609)
				var3609 = var3682
				var3608.kind = {
					type = "analytics_event_action",
					value = t.AnalyticsEventAction.decode(var3681)
				}
			elseif var3614 == 34 then
				local _ = nil
				local var3683, var3684 = protoModule.readBuffer(p178, var3609)
				var3609 = var3684
				var3608.kind = {
					type = "custom_analytics_event_action",
					value = t.CustomAnalyticsEventAction.decode(var3683)
				}
			elseif var3614 == 35 then
				local _ = nil
				local var3685, var3686 = protoModule.readBuffer(p178, var3609)
				var3609 = var3686
				var3608.kind = {
					type = "open_game_invite_action",
					value = t.OpenGameInviteAction.decode(var3685)
				}
			elseif var3614 == 36 then
				local _ = nil
				local var3687, var3688 = protoModule.readBuffer(p178, var3609)
				var3609 = var3688
				var3608.kind = {
					type = "open_event_details_action",
					value = t.OpenEventDetailsAction.decode(var3687)
				}
			elseif var3614 == 37 then
				local _ = nil
				local var3689, var3690 = protoModule.readBuffer(p178, var3609)
				var3609 = var3690
				var3608.kind = {
					type = "launch_experience_action",
					value = t.LaunchExperienceAction.decode(var3689)
				}
			elseif var3614 == 38 then
				local _ = nil
				local var3691, var3692 = protoModule.readBuffer(p178, var3609)
				var3609 = var3692
				var3608.kind = {
					type = "toggle_experience_favorite_action",
					value = t.ToggleExperienceFavoriteAction.decode(var3691)
				}
			elseif var3614 == 39 then
				local _ = nil
				local var3693, var3694 = protoModule.readBuffer(p178, var3609)
				var3609 = var3694
				var3608.kind = {
					type = "toggle_experience_follow_action",
					value = t.ToggleExperienceFollowAction.decode(var3693)
				}
			elseif var3614 == 40 then
				local _ = nil
				local var3695, var3696 = protoModule.readBuffer(p178, var3609)
				var3609 = var3696
				var3608.kind = {
					type = "toggle_experience_vote_action",
					value = t.ToggleExperienceVoteAction.decode(var3695)
				}
			elseif var3614 == 41 then
				local _ = nil
				local var3697, var3698 = protoModule.readBuffer(p178, var3609)
				var3609 = var3698
				var3608.kind = {
					type = "open_purchase_prompt_action",
					value = t.OpenPurchasePromptAction.decode(var3697)
				}
			elseif var3614 == 42 then
				local _ = nil
				local var3699, var3700 = protoModule.readBuffer(p178, var3609)
				var3609 = var3700
				var3608.kind = {
					type = "open_sdui_overlay_action",
					value = t.OpenSduiOverlayAction.decode(var3699)
				}
			elseif var3614 == 43 then
				local _ = nil
				local var3701, var3702 = protoModule.readBuffer(p178, var3609)
				var3609 = var3702
				var3608.kind = {
					type = "open_badges_see_all_action",
					value = t.OpenBadgesSeeAllAction.decode(var3701)
				}
			elseif var3614 == 44 then
				local _ = nil
				local var3703, var3704 = protoModule.readBuffer(p178, var3609)
				var3609 = var3704
				var3608.kind = {
					type = "open_experience_store_see_all_action",
					value = t.OpenExperienceStoreSeeAllAction.decode(var3703)
				}
			elseif var3614 == 45 then
				local _ = nil
				local var3705, var3706 = protoModule.readBuffer(p178, var3609)
				var3609 = var3706
				var3608.kind = {
					type = "dismiss_game_feedback_action",
					value = t.DismissGameFeedbackAction.decode(var3705)
				}
			elseif var3614 == 46 then
				local _ = nil
				local var3707, var3708 = protoModule.readBuffer(p178, var3609)
				var3609 = var3708
				var3608.kind = {
					type = "open_game_feedback_form_action",
					value = t.OpenGameFeedbackFormAction.decode(var3707)
				}
			elseif var3614 == 47 then
				local _ = nil
				local var3709, var3710 = protoModule.readBuffer(p178, var3609)
				var3609 = var3710
				var3608.kind = {
					type = "enable_event_notifications_action",
					value = t.EnableEventNotificationsAction.decode(var3709)
				}
			elseif var3614 == 48 then
				local _ = nil
				local var3711, var3712 = protoModule.readBuffer(p178, var3609)
				var3609 = var3712
				var3608.kind = {
					type = "dismiss_event_notifications_modal_action",
					value = t.DismissEventNotificationsModalAction.decode(var3711)
				}
			elseif var3614 == 49 then
				local _ = nil
				local var3713, var3714 = protoModule.readBuffer(p178, var3609)
				var3609 = var3714
				var3608.kind = {
					type = "open_amp_wizard_action",
					value = t.OpenAmpWizardAction.decode(var3713)
				}
			elseif var3614 == 50 then
				local _ = nil
				local var3715, var3716 = protoModule.readBuffer(p178, var3609)
				var3609 = var3716
				var3608.kind = {
					type = "open_subscription_purchase_page_action",
					value = t.OpenSubscriptionPurchasePageAction.decode(var3715)
				}
			elseif var3614 == 51 then
				local _ = nil
				local var3717, var3718 = protoModule.readBuffer(p178, var3609)
				var3609 = var3718
				var3608.kind = {
					type = "refresh_game_passes_action",
					value = t.RefreshGamePassesAction.decode(var3717)
				}
			elseif var3614 == 52 then
				local _ = nil
				local var3719, var3720 = protoModule.readBuffer(p178, var3609)
				var3609 = var3720
				var3608.kind = {
					type = "refresh_playability_action",
					value = t.RefreshPlayabilityAction.decode(var3719)
				}
			elseif var3614 == 53 then
				local _ = nil
				local var3721, var3722 = protoModule.readBuffer(p178, var3609)
				var3609 = var3722
				var3608.kind = {
					type = "open_social_proof_user_list_sheet_action",
					value = t.OpenSocialProofUserListSheetAction.decode(var3721)
				}
			elseif var3614 == 54 then
				local _ = nil
				local var3723, var3724 = protoModule.readBuffer(p178, var3609)
				var3609 = var3724
				var3608.kind = {
					type = "report_surface_load_time_milestone_action",
					value = t.ReportSurfaceLoadTimeMilestoneAction.decode(var3723)
				}
			elseif var3614 == 55 then
				local _ = nil
				local var3725, var3726 = protoModule.readBuffer(p178, var3609)
				var3609 = var3726
				var3608.kind = {
					type = "open_search_results_tab_action",
					value = t.OpenSearchResultsTabAction.decode(var3725)
				}
			elseif var3614 == 56 then
				local _ = nil
				local var3727, var3728 = protoModule.readBuffer(p178, var3609)
				var3609 = var3728
				var3608.kind = {
					type = "open_phone_upsell_modal_action",
					value = t.OpenPhoneUpsellModalAction.decode(var3727)
				}
			elseif var3614 == 57 then
				local _ = nil
				local var3729, var3730 = protoModule.readBuffer(p178, var3609)
				var3609 = var3730
				var3608.kind = {
					type = "open_email_upsell_modal_action",
					value = t.OpenEmailUpsellModalAction.decode(var3729)
				}
			elseif var3614 == 58 then
				local _ = nil
				local var3731, var3732 = protoModule.readBuffer(p178, var3609)
				var3609 = var3732
				var3608.kind = {
					type = "dismiss_prompt_action",
					value = t.DismissPromptAction.decode(var3731)
				}
			elseif var3614 == 59 then
				local _ = nil
				local var3733, var3734 = protoModule.readBuffer(p178, var3609)
				var3609 = var3734
				var3608.kind = {
					type = "request_friendship_action",
					value = t.RequestFriendshipAction.decode(var3733)
				}
			elseif var3614 == 60 then
				local _ = nil
				local var3735, var3736 = protoModule.readBuffer(p178, var3609)
				var3609 = var3736
				var3608.kind = {
					type = "refresh_developer_products_action",
					value = t.RefreshDeveloperProductsAction.decode(var3735)
				}
			elseif var3614 == 61 then
				local _ = nil
				local var3737, var3738 = protoModule.readBuffer(p178, var3609)
				var3609 = var3738
				var3608.kind = {
					type = "open_fae_trial_upsell_action",
					value = t.OpenFaeTrialUpsellAction.decode(var3737)
				}
			elseif var3614 == 62 then
				local _ = nil
				local var3739, var3740 = protoModule.readBuffer(p178, var3609)
				var3609 = var3740
				var3608.kind = {
					type = "refresh_omni_recommendation_feed_item_action",
					value = t.RefreshOmniRecommendationFeedItemAction.decode(var3739)
				}
			elseif var3614 == 63 then
				local _ = nil
				local var3741, var3742 = protoModule.readBuffer(p178, var3609)
				var3609 = var3742
				var3608.kind = {
					type = "ai_overview_feedback_action",
					value = t.AiOverviewFeedbackAction.decode(var3741)
				}
			elseif var3614 == 64 then
				local _ = nil
				local var3743, var3744 = protoModule.readBuffer(p178, var3609)
				var3609 = var3744
				var3608.kind = {
					type = "open_trusted_friends_upsell_modal_action",
					value = t.OpenTrustedFriendsUpsellModalAction.decode(var3743)
				}
			elseif var3614 == 65 then
				local _ = nil
				local var3745, var3746 = protoModule.readBuffer(p178, var3609)
				var3609 = var3746
				var3608.kind = {
					type = "record_party_chat_conversation_upsell_acknowledgement_action",
					value = t.RecordPartyChatConversationUpsellAcknowledgementAction.decode(var3745)
				}
			elseif var3614 == 66 then
				local _ = nil
				local var3747, var3748 = protoModule.readBuffer(p178, var3609)
				var3609 = var3748
				var3608.kind = {
					type = "open_search_results_with_query_action",
					value = t.OpenSearchResultsWithQueryAction.decode(var3747)
				}
			elseif var3614 == 67 then
				local _ = nil
				local var3749, var3750 = protoModule.readBuffer(p178, var3609)
				var3609 = var3750
				var3608.kind = {
					type = "select_marketplace_favorites_category",
					value = t.SelectMarketplaceFavoritesCategory.decode(var3749)
				}
			elseif var3614 == 68 then
				local _ = nil
				local var3751, var3752 = protoModule.readBuffer(p178, var3609)
				var3609 = var3752
				var3608.kind = {
					type = "download_app_action",
					value = t.DownloadAppAction.decode(var3751)
				}
			elseif var3614 == 69 then
				local _ = nil
				local var3753, var3754 = protoModule.readBuffer(p178, var3609)
				var3609 = var3754
				var3608.kind = {
					type = "refresh_charts_sort_detail_action",
					value = t.RefreshChartsSortDetailAction.decode(var3753)
				}
			elseif var3614 == 70 then
				local _ = nil
				local var3755, var3756 = protoModule.readBuffer(p178, var3609)
				var3609 = var3756
				var3608.kind = {
					type = "join_community_action",
					value = t.JoinCommunityAction.decode(var3755)
				}
			elseif var3614 == 71 then
				local _ = nil
				local var3757, var3758 = protoModule.readBuffer(p178, var3609)
				var3609 = var3758
				var3608.kind = {
					type = "view_community_action",
					value = t.ViewCommunityAction.decode(var3757)
				}
			elseif var3614 == 72 then
				local _ = nil
				local var3759, var3760 = protoModule.readBuffer(p178, var3609)
				var3609 = var3760
				var3608.kind = {
					type = "pin_experience_shortcut_action",
					value = t.PinExperienceShortcutAction.decode(var3759)
				}
			elseif var3614 == 73 then
				local _ = nil
				local var3761, var3762 = protoModule.readBuffer(p178, var3609)
				var3609 = var3762
				var3608.kind = {
					type = "select_marketplace_favorites_subcategory",
					value = t.SelectMarketplaceFavoritesSubcategory.decode(var3761)
				}
			elseif var3614 == 74 then
				local _ = nil
				local var3763, var3764 = protoModule.readBuffer(p178, var3609)
				var3609 = var3764
				var3608.kind = {
					type = "show_toast_action",
					value = t.ShowToastAction.decode(var3763)
				}
			elseif var3614 == 75 then
				local _ = nil
				local var3765, var3766 = protoModule.readBuffer(p178, var3609)
				var3609 = var3766
				var3608.kind = {
					type = "open_incoming_transfer_upsell_action",
					value = t.OpenIncomingTransferUpsellAction.decode(var3765)
				}
			elseif var3614 == 76 then
				local _ = nil
				local var3767, var3768 = protoModule.readBuffer(p178, var3609)
				var3609 = var3768
				var3608.kind = {
					type = "action_sequence_action",
					value = t.ActionSequenceAction.decode(var3767)
				}
			elseif var3614 == 77 then
				local _ = nil
				local var3769, var3770 = protoModule.readBuffer(p178, var3609)
				var3609 = var3770
				var3608.kind = {
					type = "refresh_feed_entry_from_api_action",
					value = t.RefreshFeedEntryFromApiAction.decode(var3769)
				}
			elseif var3614 == 78 then
				local _ = nil
				local var3771, var3772 = protoModule.readBuffer(p178, var3609)
				var3609 = var3772
				var3608.kind = {
					type = "open_profile_frames_editor_action",
					value = t.OpenProfileFramesEditorAction.decode(var3771)
				}
			elseif var3614 == 79 then
				local _ = nil
				local var3773, var3774 = protoModule.readBuffer(p178, var3609)
				var3609 = var3774
				var3608.kind = {
					type = "navigate_action",
					value = t.NavigateAction.decode(var3773)
				}
			elseif var3614 == 80 then
				local _ = nil
				local var3775, var3776 = protoModule.readBuffer(p178, var3609)
				var3609 = var3776
				var3608.kind = {
					type = "set_game_tile_not_interested_action",
					value = t.SetGameTileNotInterestedAction.decode(var3775)
				}
			elseif var3614 == 81 then
				local _ = nil
				local var3777, var3778 = protoModule.readBuffer(p178, var3609)
				var3609 = var3778
				var3608.kind = {
					type = "refresh_home_action",
					value = t.RefreshHomeAction.decode(var3777)
				}
			elseif var3614 == 82 then
				local _ = nil
				local var3779, var3780 = protoModule.readBuffer(p178, var3609)
				var3609 = var3780
				var3608.kind = {
					type = "undo_game_tile_not_interested_action",
					value = t.UndoGameTileNotInterestedAction.decode(var3779)
				}
			elseif var3614 == 83 then
				local _ = nil
				local var3781, var3782 = protoModule.readBuffer(p178, var3609)
				var3609 = var3782
				var3608.kind = {
					type = "apply_dev_store_see_all_category_filter_action",
					value = t.ApplyDevStoreSeeAllCategoryFilterAction.decode(var3781)
				}
			elseif var3614 == 1000 then
				local _ = nil
				local var3783, var3784 = protoModule.readBuffer(p178, var3609)
				var3609 = var3784
				var3608.telemetry_handler = propTypesModule.StringProp.decode(var3783)
			elseif var3614 == 1001 then
				local _ = nil
				local var3785, var3786 = protoModule.readBuffer(p178, var3609)
				var3609 = var3786
				var3608.accessibility_label = propTypesModule.StringFormat.decode(var3785)
			elseif var3614 == 1002 then
				local _ = nil
				local var3787, var3788 = protoModule.readBuffer(p178, var3609)
				var3609 = var3788
				var3608.skip_unified_logging = propTypesModule.BoolProp.decode(var3787)
			elseif var3614 == 1003 then
				local _ = nil
				local var3789, var3790 = protoModule.readBuffer(p178, var3609)
				var3609 = var3790
				var3608.action_event_name = propTypesModule.StringProp.decode(var3789)
			else
				local _ = nil
				local var3791, var3792 = protoModule.readVarInt(p178, var3609)
				var3609 = var3792 + var3791
			end
		elseif var3610 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3793, var3794 = protoModule.readFixed32(p178, var3609)
			local _ = var3793
			var3609 = var3794
		elseif var3610 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3795, var3796 = protoModule.readFixed64(p178, var3609)
			local _ = var3795
			var3609 = var3796
		else
			error("Unsupported wire type: " .. var6145)
		end
	end
	return var3608
end

function t_178:jsonEncode()
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

function t_178:jsonDecode()
	-- upvalues: t_178 (ref), t (ref), propTypesModule (ref)
	local var3797 = t_178.new()
	
	if self.dismiss_dialog_action ~= nil then
		var3797.kind = {
			type = "dismiss_dialog_action",
			value = t.DismissDialogAction.jsonDecode(self.dismiss_dialog_action)
		}
	end
	if self.dismissDialogAction ~= nil then
		var3797.kind = {
			type = "dismiss_dialog_action",
			value = t.DismissDialogAction.jsonDecode(self.dismissDialogAction)
		}
	end
	if self.link_action ~= nil then
		var3797.kind = {
			type = "link_action",
			value = t.LinkAction.jsonDecode(self.link_action)
		}
	end
	if self.linkAction ~= nil then
		var3797.kind = {
			type = "link_action",
			value = t.LinkAction.jsonDecode(self.linkAction)
		}
	end
	if self.open_game_details_action ~= nil then
		var3797.kind = {
			type = "open_game_details_action",
			value = t.OpenGameDetailsAction.jsonDecode(self.open_game_details_action)
		}
	end
	if self.openGameDetailsAction ~= nil then
		var3797.kind = {
			type = "open_game_details_action",
			value = t.OpenGameDetailsAction.jsonDecode(self.openGameDetailsAction)
		}
	end
	if self.open_join_friends_action ~= nil then
		var3797.kind = {
			type = "open_join_friends_action",
			value = t.OpenJoinFriendsAction.jsonDecode(self.open_join_friends_action)
		}
	end
	if self.openJoinFriendsAction ~= nil then
		var3797.kind = {
			type = "open_join_friends_action",
			value = t.OpenJoinFriendsAction.jsonDecode(self.openJoinFriendsAction)
		}
	end
	if self.open_marketplace_try_on_action ~= nil then
		var3797.kind = {
			type = "open_marketplace_try_on_action",
			value = t.OpenMarketplaceTryOnAction.jsonDecode(self.open_marketplace_try_on_action)
		}
	end
	if self.openMarketplaceTryOnAction ~= nil then
		var3797.kind = {
			type = "open_marketplace_try_on_action",
			value = t.OpenMarketplaceTryOnAction.jsonDecode(self.openMarketplaceTryOnAction)
		}
	end
	if self.open_see_all_action ~= nil then
		var3797.kind = {
			type = "open_see_all_action",
			value = t.OpenSeeAllAction.jsonDecode(self.open_see_all_action)
		}
	end
	if self.openSeeAllAction ~= nil then
		var3797.kind = {
			type = "open_see_all_action",
			value = t.OpenSeeAllAction.jsonDecode(self.openSeeAllAction)
		}
	end
	if self.open_sponsored_tooltip_action ~= nil then
		var3797.kind = {
			type = "open_sponsored_tooltip_action",
			value = t.OpenSponsoredTooltipAction.jsonDecode(self.open_sponsored_tooltip_action)
		}
	end
	if self.openSponsoredTooltipAction ~= nil then
		var3797.kind = {
			type = "open_sponsored_tooltip_action",
			value = t.OpenSponsoredTooltipAction.jsonDecode(self.openSponsoredTooltipAction)
		}
	end
	if self.play_button_click_action ~= nil then
		var3797.kind = {
			type = "play_button_click_action",
			value = t.PlayButtonClickAction.jsonDecode(self.play_button_click_action)
		}
	end
	if self.playButtonClickAction ~= nil then
		var3797.kind = {
			type = "play_button_click_action",
			value = t.PlayButtonClickAction.jsonDecode(self.playButtonClickAction)
		}
	end
	if self.update_user_settings_action ~= nil then
		var3797.kind = {
			type = "update_user_settings_action",
			value = t.UpdateUserSettingsAction.jsonDecode(self.update_user_settings_action)
		}
	end
	if self.updateUserSettingsAction ~= nil then
		var3797.kind = {
			type = "update_user_settings_action",
			value = t.UpdateUserSettingsAction.jsonDecode(self.updateUserSettingsAction)
		}
	end
	if self.open_tooltip_action ~= nil then
		var3797.kind = {
			type = "open_tooltip_action",
			value = t.OpenTooltipAction.jsonDecode(self.open_tooltip_action)
		}
	end
	if self.openTooltipAction ~= nil then
		var3797.kind = {
			type = "open_tooltip_action",
			value = t.OpenTooltipAction.jsonDecode(self.openTooltipAction)
		}
	end
	if self.open_badge_details_action ~= nil then
		var3797.kind = {
			type = "open_badge_details_action",
			value = t.OpenBadgeDetailsAction.jsonDecode(self.open_badge_details_action)
		}
	end
	if self.openBadgeDetailsAction ~= nil then
		var3797.kind = {
			type = "open_badge_details_action",
			value = t.OpenBadgeDetailsAction.jsonDecode(self.openBadgeDetailsAction)
		}
	end
	if self.load_more_from_api_action ~= nil then
		var3797.kind = {
			type = "load_more_from_api_action",
			value = t.LoadMoreFromApiAction.jsonDecode(self.load_more_from_api_action)
		}
	end
	if self.loadMoreFromApiAction ~= nil then
		var3797.kind = {
			type = "load_more_from_api_action",
			value = t.LoadMoreFromApiAction.jsonDecode(self.loadMoreFromApiAction)
		}
	end
	if self.share_action ~= nil then
		var3797.kind = {
			type = "share_action",
			value = t.ShareAction.jsonDecode(self.share_action)
		}
	end
	if self.shareAction ~= nil then
		var3797.kind = {
			type = "share_action",
			value = t.ShareAction.jsonDecode(self.shareAction)
		}
	end
	if self.open_abuse_report_action ~= nil then
		var3797.kind = {
			type = "open_abuse_report_action",
			value = t.OpenAbuseReportAction.jsonDecode(self.open_abuse_report_action)
		}
	end
	if self.openAbuseReportAction ~= nil then
		var3797.kind = {
			type = "open_abuse_report_action",
			value = t.OpenAbuseReportAction.jsonDecode(self.openAbuseReportAction)
		}
	end
	if self.remove_badge_from_inventory_action ~= nil then
		var3797.kind = {
			type = "remove_badge_from_inventory_action",
			value = t.RemoveBadgeFromInventoryAction.jsonDecode(self.remove_badge_from_inventory_action)
		}
	end
	if self.removeBadgeFromInventoryAction ~= nil then
		var3797.kind = {
			type = "remove_badge_from_inventory_action",
			value = t.RemoveBadgeFromInventoryAction.jsonDecode(self.removeBadgeFromInventoryAction)
		}
	end
	if self.open_profile_action ~= nil then
		var3797.kind = {
			type = "open_profile_action",
			value = t.OpenProfileAction.jsonDecode(self.open_profile_action)
		}
	end
	if self.openProfileAction ~= nil then
		var3797.kind = {
			type = "open_profile_action",
			value = t.OpenProfileAction.jsonDecode(self.openProfileAction)
		}
	end
	if self.open_facial_age_estimation_action ~= nil then
		var3797.kind = {
			type = "open_facial_age_estimation_action",
			value = t.OpenFacialAgeEstimationAction.jsonDecode(self.open_facial_age_estimation_action)
		}
	end
	if self.openFacialAgeEstimationAction ~= nil then
		var3797.kind = {
			type = "open_facial_age_estimation_action",
			value = t.OpenFacialAgeEstimationAction.jsonDecode(self.openFacialAgeEstimationAction)
		}
	end
	if self.open_add_connections_page_action ~= nil then
		var3797.kind = {
			type = "open_add_connections_page_action",
			value = t.OpenAddConnectionsPageAction.jsonDecode(self.open_add_connections_page_action)
		}
	end
	if self.openAddConnectionsPageAction ~= nil then
		var3797.kind = {
			type = "open_add_connections_page_action",
			value = t.OpenAddConnectionsPageAction.jsonDecode(self.openAddConnectionsPageAction)
		}
	end
	if self.open_marketplace_action ~= nil then
		var3797.kind = {
			type = "open_marketplace_action",
			value = t.OpenMarketplaceAction.jsonDecode(self.open_marketplace_action)
		}
	end
	if self.openMarketplaceAction ~= nil then
		var3797.kind = {
			type = "open_marketplace_action",
			value = t.OpenMarketplaceAction.jsonDecode(self.openMarketplaceAction)
		}
	end
	if self.hide_profile_completion_action ~= nil then
		var3797.kind = {
			type = "hide_profile_completion_action",
			value = t.HideProfileCompletionAction.jsonDecode(self.hide_profile_completion_action)
		}
	end
	if self.hideProfileCompletionAction ~= nil then
		var3797.kind = {
			type = "hide_profile_completion_action",
			value = t.HideProfileCompletionAction.jsonDecode(self.hideProfileCompletionAction)
		}
	end
	if self.select_marketplace_catalog_category ~= nil then
		var3797.kind = {
			type = "select_marketplace_catalog_category",
			value = t.SelectMarketplaceCatalogCategory.jsonDecode(self.select_marketplace_catalog_category)
		}
	end
	if self.selectMarketplaceCatalogCategory ~= nil then
		var3797.kind = {
			type = "select_marketplace_catalog_category",
			value = t.SelectMarketplaceCatalogCategory.jsonDecode(self.selectMarketplaceCatalogCategory)
		}
	end
	if self.select_marketplace_catalog_subcategory ~= nil then
		var3797.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t.SelectMarketplaceCatalogSubcategory.jsonDecode(self.select_marketplace_catalog_subcategory)
		}
	end
	if self.selectMarketplaceCatalogSubcategory ~= nil then
		var3797.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t.SelectMarketplaceCatalogSubcategory.jsonDecode(self.selectMarketplaceCatalogSubcategory)
		}
	end
	if self.open_marketplace_catalog_see_all ~= nil then
		var3797.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t.OpenMarketplaceCatalogSeeAll.jsonDecode(self.open_marketplace_catalog_see_all)
		}
	end
	if self.openMarketplaceCatalogSeeAll ~= nil then
		var3797.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t.OpenMarketplaceCatalogSeeAll.jsonDecode(self.openMarketplaceCatalogSeeAll)
		}
	end
	if self.close_marketplace_category_tooltip ~= nil then
		var3797.kind = {
			type = "close_marketplace_category_tooltip",
			value = t.CloseMarketplaceCategoryTooltip.jsonDecode(self.close_marketplace_category_tooltip)
		}
	end
	if self.closeMarketplaceCategoryTooltip ~= nil then
		var3797.kind = {
			type = "close_marketplace_category_tooltip",
			value = t.CloseMarketplaceCategoryTooltip.jsonDecode(self.closeMarketplaceCategoryTooltip)
		}
	end
	if self.resize_marketplace_catalog ~= nil then
		var3797.kind = {
			type = "resize_marketplace_catalog",
			value = t.ResizeMarketplaceCatalog.jsonDecode(self.resize_marketplace_catalog)
		}
	end
	if self.resizeMarketplaceCatalog ~= nil then
		var3797.kind = {
			type = "resize_marketplace_catalog",
			value = t.ResizeMarketplaceCatalog.jsonDecode(self.resizeMarketplaceCatalog)
		}
	end
	if self.open_marketplace_catalog_filters ~= nil then
		var3797.kind = {
			type = "open_marketplace_catalog_filters",
			value = t.OpenMarketplaceCatalogFilters.jsonDecode(self.open_marketplace_catalog_filters)
		}
	end
	if self.openMarketplaceCatalogFilters ~= nil then
		var3797.kind = {
			type = "open_marketplace_catalog_filters",
			value = t.OpenMarketplaceCatalogFilters.jsonDecode(self.openMarketplaceCatalogFilters)
		}
	end
	if self.open_social_link_action ~= nil then
		var3797.kind = {
			type = "open_social_link_action",
			value = t.OpenSocialLinkAction.jsonDecode(self.open_social_link_action)
		}
	end
	if self.openSocialLinkAction ~= nil then
		var3797.kind = {
			type = "open_social_link_action",
			value = t.OpenSocialLinkAction.jsonDecode(self.openSocialLinkAction)
		}
	end
	if self.open_charts_sort_detail_action ~= nil then
		var3797.kind = {
			type = "open_charts_sort_detail_action",
			value = t.OpenChartsSortDetailAction.jsonDecode(self.open_charts_sort_detail_action)
		}
	end
	if self.openChartsSortDetailAction ~= nil then
		var3797.kind = {
			type = "open_charts_sort_detail_action",
			value = t.OpenChartsSortDetailAction.jsonDecode(self.openChartsSortDetailAction)
		}
	end
	if self.open_song_detail_action ~= nil then
		var3797.kind = {
			type = "open_song_detail_action",
			value = t.OpenSongDetailAction.jsonDecode(self.open_song_detail_action)
		}
	end
	if self.openSongDetailAction ~= nil then
		var3797.kind = {
			type = "open_song_detail_action",
			value = t.OpenSongDetailAction.jsonDecode(self.openSongDetailAction)
		}
	end
	if self.refresh_from_api_action ~= nil then
		var3797.kind = {
			type = "refresh_from_api_action",
			value = t.RefreshFromApiAction.jsonDecode(self.refresh_from_api_action)
		}
	end
	if self.refreshFromApiAction ~= nil then
		var3797.kind = {
			type = "refresh_from_api_action",
			value = t.RefreshFromApiAction.jsonDecode(self.refreshFromApiAction)
		}
	end
	if self.rsvp_to_event_action ~= nil then
		var3797.kind = {
			type = "rsvp_to_event_action",
			value = t.RsvpToEventAction.jsonDecode(self.rsvp_to_event_action)
		}
	end
	if self.rsvpToEventAction ~= nil then
		var3797.kind = {
			type = "rsvp_to_event_action",
			value = t.RsvpToEventAction.jsonDecode(self.rsvpToEventAction)
		}
	end
	if self.apply_charts_filter_action ~= nil then
		var3797.kind = {
			type = "apply_charts_filter_action",
			value = t.ApplyChartsFilterAction.jsonDecode(self.apply_charts_filter_action)
		}
	end
	if self.applyChartsFilterAction ~= nil then
		var3797.kind = {
			type = "apply_charts_filter_action",
			value = t.ApplyChartsFilterAction.jsonDecode(self.applyChartsFilterAction)
		}
	end
	if self.analytics_event_action ~= nil then
		var3797.kind = {
			type = "analytics_event_action",
			value = t.AnalyticsEventAction.jsonDecode(self.analytics_event_action)
		}
	end
	if self.analyticsEventAction ~= nil then
		var3797.kind = {
			type = "analytics_event_action",
			value = t.AnalyticsEventAction.jsonDecode(self.analyticsEventAction)
		}
	end
	if self.custom_analytics_event_action ~= nil then
		var3797.kind = {
			type = "custom_analytics_event_action",
			value = t.CustomAnalyticsEventAction.jsonDecode(self.custom_analytics_event_action)
		}
	end
	if self.customAnalyticsEventAction ~= nil then
		var3797.kind = {
			type = "custom_analytics_event_action",
			value = t.CustomAnalyticsEventAction.jsonDecode(self.customAnalyticsEventAction)
		}
	end
	if self.open_game_invite_action ~= nil then
		var3797.kind = {
			type = "open_game_invite_action",
			value = t.OpenGameInviteAction.jsonDecode(self.open_game_invite_action)
		}
	end
	if self.openGameInviteAction ~= nil then
		var3797.kind = {
			type = "open_game_invite_action",
			value = t.OpenGameInviteAction.jsonDecode(self.openGameInviteAction)
		}
	end
	if self.open_event_details_action ~= nil then
		var3797.kind = {
			type = "open_event_details_action",
			value = t.OpenEventDetailsAction.jsonDecode(self.open_event_details_action)
		}
	end
	if self.openEventDetailsAction ~= nil then
		var3797.kind = {
			type = "open_event_details_action",
			value = t.OpenEventDetailsAction.jsonDecode(self.openEventDetailsAction)
		}
	end
	if self.launch_experience_action ~= nil then
		var3797.kind = {
			type = "launch_experience_action",
			value = t.LaunchExperienceAction.jsonDecode(self.launch_experience_action)
		}
	end
	if self.launchExperienceAction ~= nil then
		var3797.kind = {
			type = "launch_experience_action",
			value = t.LaunchExperienceAction.jsonDecode(self.launchExperienceAction)
		}
	end
	if self.toggle_experience_favorite_action ~= nil then
		var3797.kind = {
			type = "toggle_experience_favorite_action",
			value = t.ToggleExperienceFavoriteAction.jsonDecode(self.toggle_experience_favorite_action)
		}
	end
	if self.toggleExperienceFavoriteAction ~= nil then
		var3797.kind = {
			type = "toggle_experience_favorite_action",
			value = t.ToggleExperienceFavoriteAction.jsonDecode(self.toggleExperienceFavoriteAction)
		}
	end
	if self.toggle_experience_follow_action ~= nil then
		var3797.kind = {
			type = "toggle_experience_follow_action",
			value = t.ToggleExperienceFollowAction.jsonDecode(self.toggle_experience_follow_action)
		}
	end
	if self.toggleExperienceFollowAction ~= nil then
		var3797.kind = {
			type = "toggle_experience_follow_action",
			value = t.ToggleExperienceFollowAction.jsonDecode(self.toggleExperienceFollowAction)
		}
	end
	if self.toggle_experience_vote_action ~= nil then
		var3797.kind = {
			type = "toggle_experience_vote_action",
			value = t.ToggleExperienceVoteAction.jsonDecode(self.toggle_experience_vote_action)
		}
	end
	if self.toggleExperienceVoteAction ~= nil then
		var3797.kind = {
			type = "toggle_experience_vote_action",
			value = t.ToggleExperienceVoteAction.jsonDecode(self.toggleExperienceVoteAction)
		}
	end
	if self.open_purchase_prompt_action ~= nil then
		var3797.kind = {
			type = "open_purchase_prompt_action",
			value = t.OpenPurchasePromptAction.jsonDecode(self.open_purchase_prompt_action)
		}
	end
	if self.openPurchasePromptAction ~= nil then
		var3797.kind = {
			type = "open_purchase_prompt_action",
			value = t.OpenPurchasePromptAction.jsonDecode(self.openPurchasePromptAction)
		}
	end
	if self.open_sdui_overlay_action ~= nil then
		var3797.kind = {
			type = "open_sdui_overlay_action",
			value = t.OpenSduiOverlayAction.jsonDecode(self.open_sdui_overlay_action)
		}
	end
	if self.openSduiOverlayAction ~= nil then
		var3797.kind = {
			type = "open_sdui_overlay_action",
			value = t.OpenSduiOverlayAction.jsonDecode(self.openSduiOverlayAction)
		}
	end
	if self.open_badges_see_all_action ~= nil then
		var3797.kind = {
			type = "open_badges_see_all_action",
			value = t.OpenBadgesSeeAllAction.jsonDecode(self.open_badges_see_all_action)
		}
	end
	if self.openBadgesSeeAllAction ~= nil then
		var3797.kind = {
			type = "open_badges_see_all_action",
			value = t.OpenBadgesSeeAllAction.jsonDecode(self.openBadgesSeeAllAction)
		}
	end
	if self.open_experience_store_see_all_action ~= nil then
		var3797.kind = {
			type = "open_experience_store_see_all_action",
			value = t.OpenExperienceStoreSeeAllAction.jsonDecode(self.open_experience_store_see_all_action)
		}
	end
	if self.openExperienceStoreSeeAllAction ~= nil then
		var3797.kind = {
			type = "open_experience_store_see_all_action",
			value = t.OpenExperienceStoreSeeAllAction.jsonDecode(self.openExperienceStoreSeeAllAction)
		}
	end
	if self.dismiss_game_feedback_action ~= nil then
		var3797.kind = {
			type = "dismiss_game_feedback_action",
			value = t.DismissGameFeedbackAction.jsonDecode(self.dismiss_game_feedback_action)
		}
	end
	if self.dismissGameFeedbackAction ~= nil then
		var3797.kind = {
			type = "dismiss_game_feedback_action",
			value = t.DismissGameFeedbackAction.jsonDecode(self.dismissGameFeedbackAction)
		}
	end
	if self.open_game_feedback_form_action ~= nil then
		var3797.kind = {
			type = "open_game_feedback_form_action",
			value = t.OpenGameFeedbackFormAction.jsonDecode(self.open_game_feedback_form_action)
		}
	end
	if self.openGameFeedbackFormAction ~= nil then
		var3797.kind = {
			type = "open_game_feedback_form_action",
			value = t.OpenGameFeedbackFormAction.jsonDecode(self.openGameFeedbackFormAction)
		}
	end
	if self.enable_event_notifications_action ~= nil then
		var3797.kind = {
			type = "enable_event_notifications_action",
			value = t.EnableEventNotificationsAction.jsonDecode(self.enable_event_notifications_action)
		}
	end
	if self.enableEventNotificationsAction ~= nil then
		var3797.kind = {
			type = "enable_event_notifications_action",
			value = t.EnableEventNotificationsAction.jsonDecode(self.enableEventNotificationsAction)
		}
	end
	if self.dismiss_event_notifications_modal_action ~= nil then
		var3797.kind = {
			type = "dismiss_event_notifications_modal_action",
			value = t.DismissEventNotificationsModalAction.jsonDecode(self.dismiss_event_notifications_modal_action)
		}
	end
	if self.dismissEventNotificationsModalAction ~= nil then
		var3797.kind = {
			type = "dismiss_event_notifications_modal_action",
			value = t.DismissEventNotificationsModalAction.jsonDecode(self.dismissEventNotificationsModalAction)
		}
	end
	if self.open_amp_wizard_action ~= nil then
		var3797.kind = {
			type = "open_amp_wizard_action",
			value = t.OpenAmpWizardAction.jsonDecode(self.open_amp_wizard_action)
		}
	end
	if self.openAmpWizardAction ~= nil then
		var3797.kind = {
			type = "open_amp_wizard_action",
			value = t.OpenAmpWizardAction.jsonDecode(self.openAmpWizardAction)
		}
	end
	if self.open_subscription_purchase_page_action ~= nil then
		var3797.kind = {
			type = "open_subscription_purchase_page_action",
			value = t.OpenSubscriptionPurchasePageAction.jsonDecode(self.open_subscription_purchase_page_action)
		}
	end
	if self.openSubscriptionPurchasePageAction ~= nil then
		var3797.kind = {
			type = "open_subscription_purchase_page_action",
			value = t.OpenSubscriptionPurchasePageAction.jsonDecode(self.openSubscriptionPurchasePageAction)
		}
	end
	if self.refresh_game_passes_action ~= nil then
		var3797.kind = {
			type = "refresh_game_passes_action",
			value = t.RefreshGamePassesAction.jsonDecode(self.refresh_game_passes_action)
		}
	end
	if self.refreshGamePassesAction ~= nil then
		var3797.kind = {
			type = "refresh_game_passes_action",
			value = t.RefreshGamePassesAction.jsonDecode(self.refreshGamePassesAction)
		}
	end
	if self.refresh_playability_action ~= nil then
		var3797.kind = {
			type = "refresh_playability_action",
			value = t.RefreshPlayabilityAction.jsonDecode(self.refresh_playability_action)
		}
	end
	if self.refreshPlayabilityAction ~= nil then
		var3797.kind = {
			type = "refresh_playability_action",
			value = t.RefreshPlayabilityAction.jsonDecode(self.refreshPlayabilityAction)
		}
	end
	if self.open_social_proof_user_list_sheet_action ~= nil then
		var3797.kind = {
			type = "open_social_proof_user_list_sheet_action",
			value = t.OpenSocialProofUserListSheetAction.jsonDecode(self.open_social_proof_user_list_sheet_action)
		}
	end
	if self.openSocialProofUserListSheetAction ~= nil then
		var3797.kind = {
			type = "open_social_proof_user_list_sheet_action",
			value = t.OpenSocialProofUserListSheetAction.jsonDecode(self.openSocialProofUserListSheetAction)
		}
	end
	if self.report_surface_load_time_milestone_action ~= nil then
		var3797.kind = {
			type = "report_surface_load_time_milestone_action",
			value = t.ReportSurfaceLoadTimeMilestoneAction.jsonDecode(self.report_surface_load_time_milestone_action)
		}
	end
	if self.reportSurfaceLoadTimeMilestoneAction ~= nil then
		var3797.kind = {
			type = "report_surface_load_time_milestone_action",
			value = t.ReportSurfaceLoadTimeMilestoneAction.jsonDecode(self.reportSurfaceLoadTimeMilestoneAction)
		}
	end
	if self.open_search_results_tab_action ~= nil then
		var3797.kind = {
			type = "open_search_results_tab_action",
			value = t.OpenSearchResultsTabAction.jsonDecode(self.open_search_results_tab_action)
		}
	end
	if self.openSearchResultsTabAction ~= nil then
		var3797.kind = {
			type = "open_search_results_tab_action",
			value = t.OpenSearchResultsTabAction.jsonDecode(self.openSearchResultsTabAction)
		}
	end
	if self.open_phone_upsell_modal_action ~= nil then
		var3797.kind = {
			type = "open_phone_upsell_modal_action",
			value = t.OpenPhoneUpsellModalAction.jsonDecode(self.open_phone_upsell_modal_action)
		}
	end
	if self.openPhoneUpsellModalAction ~= nil then
		var3797.kind = {
			type = "open_phone_upsell_modal_action",
			value = t.OpenPhoneUpsellModalAction.jsonDecode(self.openPhoneUpsellModalAction)
		}
	end
	if self.open_email_upsell_modal_action ~= nil then
		var3797.kind = {
			type = "open_email_upsell_modal_action",
			value = t.OpenEmailUpsellModalAction.jsonDecode(self.open_email_upsell_modal_action)
		}
	end
	if self.openEmailUpsellModalAction ~= nil then
		var3797.kind = {
			type = "open_email_upsell_modal_action",
			value = t.OpenEmailUpsellModalAction.jsonDecode(self.openEmailUpsellModalAction)
		}
	end
	if self.dismiss_prompt_action ~= nil then
		var3797.kind = {
			type = "dismiss_prompt_action",
			value = t.DismissPromptAction.jsonDecode(self.dismiss_prompt_action)
		}
	end
	if self.dismissPromptAction ~= nil then
		var3797.kind = {
			type = "dismiss_prompt_action",
			value = t.DismissPromptAction.jsonDecode(self.dismissPromptAction)
		}
	end
	if self.request_friendship_action ~= nil then
		var3797.kind = {
			type = "request_friendship_action",
			value = t.RequestFriendshipAction.jsonDecode(self.request_friendship_action)
		}
	end
	if self.requestFriendshipAction ~= nil then
		var3797.kind = {
			type = "request_friendship_action",
			value = t.RequestFriendshipAction.jsonDecode(self.requestFriendshipAction)
		}
	end
	if self.refresh_developer_products_action ~= nil then
		var3797.kind = {
			type = "refresh_developer_products_action",
			value = t.RefreshDeveloperProductsAction.jsonDecode(self.refresh_developer_products_action)
		}
	end
	if self.refreshDeveloperProductsAction ~= nil then
		var3797.kind = {
			type = "refresh_developer_products_action",
			value = t.RefreshDeveloperProductsAction.jsonDecode(self.refreshDeveloperProductsAction)
		}
	end
	if self.open_fae_trial_upsell_action ~= nil then
		var3797.kind = {
			type = "open_fae_trial_upsell_action",
			value = t.OpenFaeTrialUpsellAction.jsonDecode(self.open_fae_trial_upsell_action)
		}
	end
	if self.openFaeTrialUpsellAction ~= nil then
		var3797.kind = {
			type = "open_fae_trial_upsell_action",
			value = t.OpenFaeTrialUpsellAction.jsonDecode(self.openFaeTrialUpsellAction)
		}
	end
	if self.refresh_omni_recommendation_feed_item_action ~= nil then
		var3797.kind = {
			type = "refresh_omni_recommendation_feed_item_action",
			value = t.RefreshOmniRecommendationFeedItemAction.jsonDecode(self.refresh_omni_recommendation_feed_item_action)
		}
	end
	if self.refreshOmniRecommendationFeedItemAction ~= nil then
		var3797.kind = {
			type = "refresh_omni_recommendation_feed_item_action",
			value = t.RefreshOmniRecommendationFeedItemAction.jsonDecode(self.refreshOmniRecommendationFeedItemAction)
		}
	end
	if self.ai_overview_feedback_action ~= nil then
		var3797.kind = {
			type = "ai_overview_feedback_action",
			value = t.AiOverviewFeedbackAction.jsonDecode(self.ai_overview_feedback_action)
		}
	end
	if self.aiOverviewFeedbackAction ~= nil then
		var3797.kind = {
			type = "ai_overview_feedback_action",
			value = t.AiOverviewFeedbackAction.jsonDecode(self.aiOverviewFeedbackAction)
		}
	end
	if self.open_trusted_friends_upsell_modal_action ~= nil then
		var3797.kind = {
			type = "open_trusted_friends_upsell_modal_action",
			value = t.OpenTrustedFriendsUpsellModalAction.jsonDecode(self.open_trusted_friends_upsell_modal_action)
		}
	end
	if self.openTrustedFriendsUpsellModalAction ~= nil then
		var3797.kind = {
			type = "open_trusted_friends_upsell_modal_action",
			value = t.OpenTrustedFriendsUpsellModalAction.jsonDecode(self.openTrustedFriendsUpsellModalAction)
		}
	end
	if self.record_party_chat_conversation_upsell_acknowledgement_action ~= nil then
		var3797.kind = {
			type = "record_party_chat_conversation_upsell_acknowledgement_action",
			value = t.RecordPartyChatConversationUpsellAcknowledgementAction.jsonDecode(self.record_party_chat_conversation_upsell_acknowledgement_action)
		}
	end
	if self.recordPartyChatConversationUpsellAcknowledgementAction ~= nil then
		var3797.kind = {
			type = "record_party_chat_conversation_upsell_acknowledgement_action",
			value = t.RecordPartyChatConversationUpsellAcknowledgementAction.jsonDecode(self.recordPartyChatConversationUpsellAcknowledgementAction)
		}
	end
	if self.open_search_results_with_query_action ~= nil then
		var3797.kind = {
			type = "open_search_results_with_query_action",
			value = t.OpenSearchResultsWithQueryAction.jsonDecode(self.open_search_results_with_query_action)
		}
	end
	if self.openSearchResultsWithQueryAction ~= nil then
		var3797.kind = {
			type = "open_search_results_with_query_action",
			value = t.OpenSearchResultsWithQueryAction.jsonDecode(self.openSearchResultsWithQueryAction)
		}
	end
	if self.select_marketplace_favorites_category ~= nil then
		var3797.kind = {
			type = "select_marketplace_favorites_category",
			value = t.SelectMarketplaceFavoritesCategory.jsonDecode(self.select_marketplace_favorites_category)
		}
	end
	if self.selectMarketplaceFavoritesCategory ~= nil then
		var3797.kind = {
			type = "select_marketplace_favorites_category",
			value = t.SelectMarketplaceFavoritesCategory.jsonDecode(self.selectMarketplaceFavoritesCategory)
		}
	end
	if self.download_app_action ~= nil then
		var3797.kind = {
			type = "download_app_action",
			value = t.DownloadAppAction.jsonDecode(self.download_app_action)
		}
	end
	if self.downloadAppAction ~= nil then
		var3797.kind = {
			type = "download_app_action",
			value = t.DownloadAppAction.jsonDecode(self.downloadAppAction)
		}
	end
	if self.refresh_charts_sort_detail_action ~= nil then
		var3797.kind = {
			type = "refresh_charts_sort_detail_action",
			value = t.RefreshChartsSortDetailAction.jsonDecode(self.refresh_charts_sort_detail_action)
		}
	end
	if self.refreshChartsSortDetailAction ~= nil then
		var3797.kind = {
			type = "refresh_charts_sort_detail_action",
			value = t.RefreshChartsSortDetailAction.jsonDecode(self.refreshChartsSortDetailAction)
		}
	end
	if self.join_community_action ~= nil then
		var3797.kind = {
			type = "join_community_action",
			value = t.JoinCommunityAction.jsonDecode(self.join_community_action)
		}
	end
	if self.joinCommunityAction ~= nil then
		var3797.kind = {
			type = "join_community_action",
			value = t.JoinCommunityAction.jsonDecode(self.joinCommunityAction)
		}
	end
	if self.view_community_action ~= nil then
		var3797.kind = {
			type = "view_community_action",
			value = t.ViewCommunityAction.jsonDecode(self.view_community_action)
		}
	end
	if self.viewCommunityAction ~= nil then
		var3797.kind = {
			type = "view_community_action",
			value = t.ViewCommunityAction.jsonDecode(self.viewCommunityAction)
		}
	end
	if self.pin_experience_shortcut_action ~= nil then
		var3797.kind = {
			type = "pin_experience_shortcut_action",
			value = t.PinExperienceShortcutAction.jsonDecode(self.pin_experience_shortcut_action)
		}
	end
	if self.pinExperienceShortcutAction ~= nil then
		var3797.kind = {
			type = "pin_experience_shortcut_action",
			value = t.PinExperienceShortcutAction.jsonDecode(self.pinExperienceShortcutAction)
		}
	end
	if self.select_marketplace_favorites_subcategory ~= nil then
		var3797.kind = {
			type = "select_marketplace_favorites_subcategory",
			value = t.SelectMarketplaceFavoritesSubcategory.jsonDecode(self.select_marketplace_favorites_subcategory)
		}
	end
	if self.selectMarketplaceFavoritesSubcategory ~= nil then
		var3797.kind = {
			type = "select_marketplace_favorites_subcategory",
			value = t.SelectMarketplaceFavoritesSubcategory.jsonDecode(self.selectMarketplaceFavoritesSubcategory)
		}
	end
	if self.show_toast_action ~= nil then
		var3797.kind = {
			type = "show_toast_action",
			value = t.ShowToastAction.jsonDecode(self.show_toast_action)
		}
	end
	if self.showToastAction ~= nil then
		var3797.kind = {
			type = "show_toast_action",
			value = t.ShowToastAction.jsonDecode(self.showToastAction)
		}
	end
	if self.open_incoming_transfer_upsell_action ~= nil then
		var3797.kind = {
			type = "open_incoming_transfer_upsell_action",
			value = t.OpenIncomingTransferUpsellAction.jsonDecode(self.open_incoming_transfer_upsell_action)
		}
	end
	if self.openIncomingTransferUpsellAction ~= nil then
		var3797.kind = {
			type = "open_incoming_transfer_upsell_action",
			value = t.OpenIncomingTransferUpsellAction.jsonDecode(self.openIncomingTransferUpsellAction)
		}
	end
	if self.action_sequence_action ~= nil then
		var3797.kind = {
			type = "action_sequence_action",
			value = t.ActionSequenceAction.jsonDecode(self.action_sequence_action)
		}
	end
	if self.actionSequenceAction ~= nil then
		var3797.kind = {
			type = "action_sequence_action",
			value = t.ActionSequenceAction.jsonDecode(self.actionSequenceAction)
		}
	end
	if self.refresh_feed_entry_from_api_action ~= nil then
		var3797.kind = {
			type = "refresh_feed_entry_from_api_action",
			value = t.RefreshFeedEntryFromApiAction.jsonDecode(self.refresh_feed_entry_from_api_action)
		}
	end
	if self.refreshFeedEntryFromApiAction ~= nil then
		var3797.kind = {
			type = "refresh_feed_entry_from_api_action",
			value = t.RefreshFeedEntryFromApiAction.jsonDecode(self.refreshFeedEntryFromApiAction)
		}
	end
	if self.open_profile_frames_editor_action ~= nil then
		var3797.kind = {
			type = "open_profile_frames_editor_action",
			value = t.OpenProfileFramesEditorAction.jsonDecode(self.open_profile_frames_editor_action)
		}
	end
	if self.openProfileFramesEditorAction ~= nil then
		var3797.kind = {
			type = "open_profile_frames_editor_action",
			value = t.OpenProfileFramesEditorAction.jsonDecode(self.openProfileFramesEditorAction)
		}
	end
	if self.navigate_action ~= nil then
		var3797.kind = {
			type = "navigate_action",
			value = t.NavigateAction.jsonDecode(self.navigate_action)
		}
	end
	if self.navigateAction ~= nil then
		var3797.kind = {
			type = "navigate_action",
			value = t.NavigateAction.jsonDecode(self.navigateAction)
		}
	end
	if self.set_game_tile_not_interested_action ~= nil then
		var3797.kind = {
			type = "set_game_tile_not_interested_action",
			value = t.SetGameTileNotInterestedAction.jsonDecode(self.set_game_tile_not_interested_action)
		}
	end
	if self.setGameTileNotInterestedAction ~= nil then
		var3797.kind = {
			type = "set_game_tile_not_interested_action",
			value = t.SetGameTileNotInterestedAction.jsonDecode(self.setGameTileNotInterestedAction)
		}
	end
	if self.refresh_home_action ~= nil then
		var3797.kind = {
			type = "refresh_home_action",
			value = t.RefreshHomeAction.jsonDecode(self.refresh_home_action)
		}
	end
	if self.refreshHomeAction ~= nil then
		var3797.kind = {
			type = "refresh_home_action",
			value = t.RefreshHomeAction.jsonDecode(self.refreshHomeAction)
		}
	end
	if self.undo_game_tile_not_interested_action ~= nil then
		var3797.kind = {
			type = "undo_game_tile_not_interested_action",
			value = t.UndoGameTileNotInterestedAction.jsonDecode(self.undo_game_tile_not_interested_action)
		}
	end
	if self.undoGameTileNotInterestedAction ~= nil then
		var3797.kind = {
			type = "undo_game_tile_not_interested_action",
			value = t.UndoGameTileNotInterestedAction.jsonDecode(self.undoGameTileNotInterestedAction)
		}
	end
	if self.apply_dev_store_see_all_category_filter_action ~= nil then
		var3797.kind = {
			type = "apply_dev_store_see_all_category_filter_action",
			value = t.ApplyDevStoreSeeAllCategoryFilterAction.jsonDecode(self.apply_dev_store_see_all_category_filter_action)
		}
	end
	if self.applyDevStoreSeeAllCategoryFilterAction ~= nil then
		var3797.kind = {
			type = "apply_dev_store_see_all_category_filter_action",
			value = t.ApplyDevStoreSeeAllCategoryFilterAction.jsonDecode(self.applyDevStoreSeeAllCategoryFilterAction)
		}
	end
	if self.telemetry_handler ~= nil then
		var3797.telemetry_handler = propTypesModule.StringProp.jsonDecode(self.telemetry_handler)
	end
	if self.telemetryHandler ~= nil then
		var3797.telemetry_handler = propTypesModule.StringProp.jsonDecode(self.telemetryHandler)
	end
	if self.accessibility_label ~= nil then
		var3797.accessibility_label = propTypesModule.StringFormat.jsonDecode(self.accessibility_label)
	end
	if self.accessibilityLabel ~= nil then
		var3797.accessibility_label = propTypesModule.StringFormat.jsonDecode(self.accessibilityLabel)
	end
	if self.skip_unified_logging ~= nil then
		var3797.skip_unified_logging = propTypesModule.BoolProp.jsonDecode(self.skip_unified_logging)
	end
	if self.skipUnifiedLogging ~= nil then
		var3797.skip_unified_logging = propTypesModule.BoolProp.jsonDecode(self.skipUnifiedLogging)
	end
	if self.action_event_name ~= nil then
		var3797.action_event_name = propTypesModule.StringProp.jsonDecode(self.action_event_name)
	end
	if self.actionEventName ~= nil then
		var3797.action_event_name = propTypesModule.StringProp.jsonDecode(self.actionEventName)
	end
	return var3797
end

t_178.descriptor = {
	name = "Action",
	fullName = "roblox.apppageplatform.shared.v1beta1.Action"
}
t.Action = t_178
typeRegistryModule.default:register(t.Action)
local t_179 = {}
t_179.__index = t_179

function t_179.new(p179)
	-- upvalues: t_179 (ref)
	return setmetatable({
		kind = if p179 == nil or p179.kind == nil then nil else p179.kind
	}, t_179)
end

function t_179:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3797 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "value" then
			local var3798 = self.kind.value:encode()
			local var3799, var3800 = protoModule.writeTag(buff, var3797, 1, protoModule.wireTypes.lengthDelimited)
			var3799, var6338 = protoModule.writeBuffer(var3799, var3800, var3798, buffer.len(var3798))
			buff = var3799
			var3797 = var3800
		elseif self.kind.type == "conditional" then
			local var3801 = self.kind.value:encode()
			local var3802, var3803 = protoModule.writeTag(buff, var3797, 2, protoModule.wireTypes.lengthDelimited)
			var3802, var6341 = protoModule.writeBuffer(var3802, var3803, var3801, buffer.len(var3801))
			buff = var3802
			var3797 = var3803
		end
	end
	local buff_1 = buffer.create(var3797)
	buffer.copy(buff_1, 0, buff, 0, var3797)
	
	return buff_1
end

function t_179.decode(p179)
	-- upvalues: t_179 (ref), protoModule (ref), t (ref)
	local var3797 = t_179.new()
	local var3798 = 0
	while var3798 < buffer.len(p179) do
		local _ = nil
		local var3799 = nil
		local var3800, var3801, var3802 = protoModule.readTag(p179, var3798)
		local var3803 = var3800
		var3799 = var3801
		var3798 = var3802
		
		if var3799 == protoModule.wireTypes.varint then
			local _ = nil
			local var3804, var3805 = protoModule.readVarInt(p179, var3798)
			local _ = var3804
			var3798 = var3805
			continue
		end
		if var3799 == protoModule.wireTypes.lengthDelimited then
			if var3803 == 1 then
				local _ = nil
				local var3806, var3807 = protoModule.readBuffer(p179, var3798)
				var3798 = var3807
				var3797.kind = { type = "value", value = t.Action.decode(var3806) }
			elseif var3803 == 2 then
				local _ = nil
				local var3808, var3809 = protoModule.readBuffer(p179, var3798)
				var3798 = var3809
				var3797.kind = {
					type = "conditional",
					value = t.ActionProp_ConditionalOptions.decode(var3808)
				}
			else
				local _ = nil
				local var3810, var3811 = protoModule.readVarInt(p179, var3798)
				var3798 = var3811 + var3810
			end
		elseif var3799 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3812, var3813 = protoModule.readFixed32(p179, var3798)
			local _ = var3812
			var3798 = var3813
		elseif var3799 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3814, var3815 = protoModule.readFixed64(p179, var3798)
			local _ = var3814
			var3798 = var3815
		else
			error("Unsupported wire type: " .. var6345)
		end
	end
	return var3797
end

function t_179:jsonEncode()
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

function t_179:jsonDecode()
	-- upvalues: t_179 (ref), t (ref)
	local var3816 = t_179.new()
	
	if self.value ~= nil then
		var3816.kind = { type = "value", value = t.Action.jsonDecode(self.value) }
	end
	if self.conditional ~= nil then
		var3816.kind = {
			type = "conditional",
			value = t.ActionProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var3816
end

t_179.descriptor = {
	name = "ActionProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionProp"
}
t.ActionProp = t_179
typeRegistryModule.default:register(t.ActionProp)
local t_180 = {}
t_180.__index = t_180

function t_180.new(p180)
	-- upvalues: t_180 (ref)
	return setmetatable({
		condition = if p180 == nil or p180.condition == nil then nil else p180.condition,
		kind = if p180 == nil or p180.kind == nil then nil else p180.kind
	}, t_180)
end

function t_180:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3816 = 0
	
	if self.condition ~= nil then
		local var3817 = self.condition:encode()
		local var3818, var3819 = protoModule.writeTag(buff, var3816, 1, protoModule.wireTypes.lengthDelimited)
		var3818, var6368 = protoModule.writeBuffer(var3818, var3819, var3817, buffer.len(var3817))
		buff = var3818
		var3816 = var3819
	end
	if self.kind ~= nil and self.kind.type == "value" then
		local var3820 = self.kind.value:encode()
		local var3821, var3822 = protoModule.writeTag(buff, var3816, 3, protoModule.wireTypes.lengthDelimited)
		var3821, var6371 = protoModule.writeBuffer(var3821, var3822, var3820, buffer.len(var3820))
		buff = var3821
		var3816 = var3822
	end
	local buff_1 = buffer.create(var3816)
	buffer.copy(buff_1, 0, buff, 0, var3816)
	
	return buff_1
end

function t_180.decode(p180)
	-- upvalues: t_180 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var3816 = t_180.new()
	local var3817 = 0
	while var3817 < buffer.len(p180) do
		local _ = nil
		local var3818 = nil
		local var3819, var3820, var3821 = protoModule.readTag(p180, var3817)
		local var3822 = var3819
		var3818 = var3820
		var3817 = var3821
		
		if var3818 == protoModule.wireTypes.varint then
			local _ = nil
			local var3823, var3824 = protoModule.readVarInt(p180, var3817)
			local _ = var3823
			var3817 = var3824
			continue
		end
		if var3818 == protoModule.wireTypes.lengthDelimited then
			if var3822 == 1 then
				local _ = nil
				local var3825, var3826 = protoModule.readBuffer(p180, var3817)
				var3817 = var3826
				var3816.condition = propConditionModule.PropCondition.decode(var3825)
			elseif var3822 == 3 then
				local _ = nil
				local var3827, var3828 = protoModule.readBuffer(p180, var3817)
				var3817 = var3828
				var3816.kind = { type = "value", value = t.Action.decode(var3827) }
			else
				local _ = nil
				local var3829, var3830 = protoModule.readVarInt(p180, var3817)
				var3817 = var3830 + var3829
			end
		elseif var3818 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3831, var3832 = protoModule.readFixed32(p180, var3817)
			local _ = var3831
			var3817 = var3832
		elseif var3818 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3833, var3834 = protoModule.readFixed64(p180, var3817)
			local _ = var3833
			var3817 = var3834
		else
			error("Unsupported wire type: " .. var6375)
		end
	end
	return var3816
end

function t_180:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "value" then
		t.value = self.kind.value:jsonEncode()
	end
	return t
end

function t_180:jsonDecode()
	-- upvalues: t_180 (ref), propConditionModule (ref), t (ref)
	local var3835 = t_180.new()
	
	if self.condition ~= nil then
		var3835.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.value ~= nil then
		var3835.kind = { type = "value", value = t.Action.jsonDecode(self.value) }
	end
	return var3835
end

t_180.descriptor = {
	name = "ActionProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ActionProp_ConditionalOption = t_180
typeRegistryModule.default:register(t.ActionProp_ConditionalOption)
local t_181 = {}
t_181.__index = t_181

function t_181.new(p181)
	-- upvalues: t_181 (ref)
	return setmetatable({
		options = if p181 == nil or p181.options == nil then {} else p181.options
	}, t_181)
end

function t_181:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3835 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3836 = v:encode()
			local var3837, var3838 = protoModule.writeTag(buff, var3835, 1, protoModule.wireTypes.lengthDelimited)
			var3837, var6398 = protoModule.writeBuffer(var3837, var3838, var3836, buffer.len(var3836))
			buff = var3837
			var3835 = var3838
		end
	end
	local buff_1 = buffer.create(var3835)
	buffer.copy(buff_1, 0, buff, 0, var3835)
	
	return buff_1
end

function t_181.decode(p181)
	-- upvalues: t_181 (ref), protoModule (ref), t (ref)
	local var3839 = t_181.new()
	local var3840 = 0
	while var3840 < buffer.len(p181) do
		local _ = nil
		local var3841 = nil
		local var3842, var3843, var3844 = protoModule.readTag(p181, var3840)
		local var3845 = var3842
		var3841 = var3843
		var3840 = var3844
		
		if var3841 == protoModule.wireTypes.varint then
			local _ = nil
			local var3846, var3847 = protoModule.readVarInt(p181, var3840)
			local _ = var3846
			var3840 = var3847
			continue
		end
		if var3841 == protoModule.wireTypes.lengthDelimited then
			if var3845 == 1 then
				local _ = nil
				local var3848, var3849 = protoModule.readBuffer(p181, var3840)
				var3840 = var3849
				table.insert(var3839.options, t.ActionProp_ConditionalOption.decode(var3848))
			else
				local _ = nil
				local var3850, var3851 = protoModule.readVarInt(p181, var3840)
				var3840 = var3851 + var3850
			end
		elseif var3841 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3852, var3853 = protoModule.readFixed32(p181, var3840)
			local _ = var3852
			var3840 = var3853
		elseif var3841 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3854, var3855 = protoModule.readFixed64(p181, var3840)
			local _ = var3854
			var3840 = var3855
		else
			error("Unsupported wire type: " .. var6402)
		end
	end
	return var3839
end

function t_181:jsonEncode()
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

function t_181:jsonDecode()
	-- upvalues: t_181 (ref), t (ref)
	local var3856 = t_181.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ActionProp_ConditionalOption.jsonDecode(v))
		end
		var3856.options = t_1
	end
	return var3856
end

t_181.descriptor = {
	name = "ActionProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ActionProp_ConditionalOptions = t_181
typeRegistryModule.default:register(t.ActionProp_ConditionalOptions)
local t_182 = {}
t_182.__index = t_182

function t_182.new(p182)
	-- upvalues: t_182 (ref)
	return setmetatable({
		kind = if p182 == nil or p182.kind == nil then nil else p182.kind
	}, t_182)
end

function t_182:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3857 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3858 = self.kind.value:encode()
			local var3859, var3860 = protoModule.writeTag(buff, var3857, 1, protoModule.wireTypes.lengthDelimited)
			var3859, var6425 = protoModule.writeBuffer(var3859, var3860, var3858, buffer.len(var3858))
			buff = var3859
			var3857 = var3860
		elseif self.kind.type == "conditional" then
			local var3861 = self.kind.value:encode()
			local var3862, var3863 = protoModule.writeTag(buff, var3857, 2, protoModule.wireTypes.lengthDelimited)
			var3862, var6428 = protoModule.writeBuffer(var3862, var3863, var3861, buffer.len(var3861))
			buff = var3862
			var3857 = var3863
		elseif self.kind.type == "binding_path" then
			local var3864, var3865 = protoModule.writeTag(buff, var3857, 3, protoModule.wireTypes.lengthDelimited)
			var3864, var6430 = protoModule.writeString(var3864, var3865, self.kind.value)
			buff = var3864
			var3857 = var3865
		end
	end
	local buff_1 = buffer.create(var3857)
	buffer.copy(buff_1, 0, buff, 0, var3857)
	
	return buff_1
end

function t_182.decode(p182)
	-- upvalues: t_182 (ref), protoModule (ref), t (ref)
	local var3857 = t_182.new()
	local var3858 = 0
	while var3858 < buffer.len(p182) do
		local _ = nil
		local var3859 = nil
		local var3860, var3861, var3862 = protoModule.readTag(p182, var3858)
		local var3863 = var3860
		var3859 = var3861
		var3858 = var3862
		
		if var3859 == protoModule.wireTypes.varint then
			local _ = nil
			local var3864, var3865 = protoModule.readVarInt(p182, var3858)
			local _ = var3864
			var3858 = var3865
			continue
		end
		if var3859 == protoModule.wireTypes.lengthDelimited then
			if var3863 == 1 then
				local _ = nil
				local var3866, var3867 = protoModule.readBuffer(p182, var3858)
				var3858 = var3867
				var3857.kind = {
					type = "literal",
					value = t.FocusNavActionsProp_FocusNavData.decode(var3866)
				}
			elseif var3863 == 2 then
				local _ = nil
				local var3868, var3869 = protoModule.readBuffer(p182, var3858)
				var3858 = var3869
				var3857.kind = {
					type = "conditional",
					value = t.FocusNavActionsProp_ConditionalOptions.decode(var3868)
				}
			elseif var3863 == 3 then
				local _ = nil
				local var3870, var3871 = protoModule.readBuffer(p182, var3858)
				var3858 = var3871
				var3857.kind = { type = "binding_path", value = buffer.tostring(var3870) }
			else
				local _ = nil
				local var3872, var3873 = protoModule.readVarInt(p182, var3858)
				var3858 = var3873 + var3872
			end
		elseif var3859 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3874, var3875 = protoModule.readFixed32(p182, var3858)
			local _ = var3874
			var3858 = var3875
		elseif var3859 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3876, var3877 = protoModule.readFixed64(p182, var3858)
			local _ = var3876
			var3858 = var3877
		else
			error("Unsupported wire type: " .. var6434)
		end
	end
	return var3857
end

function t_182:jsonEncode()
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

function t_182:jsonDecode()
	-- upvalues: t_182 (ref), t (ref)
	local var3878 = t_182.new()
	
	if self.literal ~= nil then
		var3878.kind = {
			type = "literal",
			value = t.FocusNavActionsProp_FocusNavData.jsonDecode(self.literal)
		}
	end
	if self.conditional ~= nil then
		var3878.kind = {
			type = "conditional",
			value = t.FocusNavActionsProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var3878.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3878.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3878
end

t_182.descriptor = {
	name = "FocusNavActionsProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavActionsProp"
}
t.FocusNavActionsProp = t_182
typeRegistryModule.default:register(t.FocusNavActionsProp)
local t_183 = {}
t_183.__index = t_183

function t_183.new(p183)
	-- upvalues: t_183 (ref)
	return setmetatable({
		condition = if p183 == nil or p183.condition == nil then nil else p183.condition,
		kind = if p183 == nil or p183.kind == nil then nil else p183.kind
	}, t_183)
end

function t_183:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3878 = 0
	
	if self.condition ~= nil then
		local var3879 = self.condition:encode()
		local var3880, var3881 = protoModule.writeTag(buff, var3878, 1, protoModule.wireTypes.lengthDelimited)
		var3880, var6459 = protoModule.writeBuffer(var3880, var3881, var3879, buffer.len(var3879))
		buff = var3880
		var3878 = var3881
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3882 = self.kind.value:encode()
			local var3883, var3884 = protoModule.writeTag(buff, var3878, 3, protoModule.wireTypes.lengthDelimited)
			var3883, var6462 = protoModule.writeBuffer(var3883, var3884, var3882, buffer.len(var3882))
			buff = var3883
			var3878 = var3884
		elseif self.kind.type == "binding_path" then
			local var3885, var3886 = protoModule.writeTag(buff, var3878, 4, protoModule.wireTypes.lengthDelimited)
			var3885, var6464 = protoModule.writeString(var3885, var3886, self.kind.value)
			buff = var3885
			var3878 = var3886
		end
	end
	local buff_1 = buffer.create(var3878)
	buffer.copy(buff_1, 0, buff, 0, var3878)
	
	return buff_1
end

function t_183.decode(p183)
	-- upvalues: t_183 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var3878 = t_183.new()
	local var3879 = 0
	while var3879 < buffer.len(p183) do
		local _ = nil
		local var3880 = nil
		local var3881, var3882, var3883 = protoModule.readTag(p183, var3879)
		local var3884 = var3881
		var3880 = var3882
		var3879 = var3883
		
		if var3880 == protoModule.wireTypes.varint then
			local _ = nil
			local var3885, var3886 = protoModule.readVarInt(p183, var3879)
			local _ = var3885
			var3879 = var3886
			continue
		end
		if var3880 == protoModule.wireTypes.lengthDelimited then
			if var3884 == 1 then
				local _ = nil
				local var3887, var3888 = protoModule.readBuffer(p183, var3879)
				var3879 = var3888
				var3878.condition = propConditionModule.PropCondition.decode(var3887)
			elseif var3884 == 3 then
				local _ = nil
				local var3889, var3890 = protoModule.readBuffer(p183, var3879)
				var3879 = var3890
				var3878.kind = {
					type = "literal",
					value = t.FocusNavActionsProp_FocusNavData.decode(var3889)
				}
			elseif var3884 == 4 then
				local _ = nil
				local var3891, var3892 = protoModule.readBuffer(p183, var3879)
				var3879 = var3892
				var3878.kind = { type = "binding_path", value = buffer.tostring(var3891) }
			else
				local _ = nil
				local var3893, var3894 = protoModule.readVarInt(p183, var3879)
				var3879 = var3894 + var3893
			end
		elseif var3880 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3895, var3896 = protoModule.readFixed32(p183, var3879)
			local _ = var3895
			var3879 = var3896
		elseif var3880 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3897, var3898 = protoModule.readFixed64(p183, var3879)
			local _ = var3897
			var3879 = var3898
		else
			error("Unsupported wire type: " .. var6468)
		end
	end
	return var3878
end

function t_183:jsonEncode()
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

function t_183:jsonDecode()
	-- upvalues: t_183 (ref), propConditionModule (ref), t (ref)
	local var3899 = t_183.new()
	
	if self.condition ~= nil then
		var3899.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var3899.kind = {
			type = "literal",
			value = t.FocusNavActionsProp_FocusNavData.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3899.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3899.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3899
end

t_183.descriptor = {
	name = "FocusNavActionsProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FocusNavActionsProp_ConditionalOption = t_183
typeRegistryModule.default:register(t.FocusNavActionsProp_ConditionalOption)
local t_184 = {}
t_184.__index = t_184

function t_184.new(p184)
	-- upvalues: t_184 (ref)
	return setmetatable({
		options = if p184 == nil or p184.options == nil then {} else p184.options
	}, t_184)
end

function t_184:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3899 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3900 = v:encode()
			local var3901, var3902 = protoModule.writeTag(buff, var3899, 1, protoModule.wireTypes.lengthDelimited)
			var3901, var6493 = protoModule.writeBuffer(var3901, var3902, var3900, buffer.len(var3900))
			buff = var3901
			var3899 = var3902
		end
	end
	local buff_1 = buffer.create(var3899)
	buffer.copy(buff_1, 0, buff, 0, var3899)
	
	return buff_1
end

function t_184.decode(p184)
	-- upvalues: t_184 (ref), protoModule (ref), t (ref)
	local var3903 = t_184.new()
	local var3904 = 0
	while var3904 < buffer.len(p184) do
		local _ = nil
		local var3905 = nil
		local var3906, var3907, var3908 = protoModule.readTag(p184, var3904)
		local var3909 = var3906
		var3905 = var3907
		var3904 = var3908
		
		if var3905 == protoModule.wireTypes.varint then
			local _ = nil
			local var3910, var3911 = protoModule.readVarInt(p184, var3904)
			local _ = var3910
			var3904 = var3911
			continue
		end
		if var3905 == protoModule.wireTypes.lengthDelimited then
			if var3909 == 1 then
				local _ = nil
				local var3912, var3913 = protoModule.readBuffer(p184, var3904)
				var3904 = var3913
				table.insert(var3903.options, t.FocusNavActionsProp_ConditionalOption.decode(var3912))
			else
				local _ = nil
				local var3914, var3915 = protoModule.readVarInt(p184, var3904)
				var3904 = var3915 + var3914
			end
		elseif var3905 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3916, var3917 = protoModule.readFixed32(p184, var3904)
			local _ = var3916
			var3904 = var3917
		elseif var3905 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3918, var3919 = protoModule.readFixed64(p184, var3904)
			local _ = var3918
			var3904 = var3919
		else
			error("Unsupported wire type: " .. var6497)
		end
	end
	return var3903
end

function t_184:jsonEncode()
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

function t_184:jsonDecode()
	-- upvalues: t_184 (ref), t (ref)
	local var3920 = t_184.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FocusNavActionsProp_ConditionalOption.jsonDecode(v))
		end
		var3920.options = t_1
	end
	return var3920
end

t_184.descriptor = {
	name = "FocusNavActionsProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FocusNavActionsProp_ConditionalOptions = t_184
typeRegistryModule.default:register(t.FocusNavActionsProp_ConditionalOptions)
local t_185 = {}
t_185.__index = t_185

function t_185.new(p185)
	-- upvalues: t_185 (ref)
	return setmetatable({
		keys = if p185 == nil or p185.keys == nil then {} else p185.keys,
		events = if p185 == nil or p185.events == nil then {} else p185.events
	}, t_185)
end

function t_185:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3921 = 0
	
	if self.keys ~= nil and next(self.keys) ~= nil then
		for i, v in self.keys do
			local var3922, var3923 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3922, var6519 = protoModule.writeString(var3922, var3923, i)
			local var3924 = v:encode()
			var3923, var6521 = protoModule.writeTag(var3922, var3923, 2, protoModule.wireTypes.lengthDelimited)
			var3923, var6521 = protoModule.writeBuffer(var3923, var6521, var3924, buffer.len(var3924))
			local var3925 = var3923
			local var3926 = var6521
			local var3927, var3928 = protoModule.writeTag(buff, var3921, 3, protoModule.wireTypes.lengthDelimited)
			var3927, var6525 = protoModule.writeBuffer(var3927, var3928, var3925, var3926)
			buff = var3927
			var3921 = var3928
		end
	end
	if self.events ~= nil and next(self.events) ~= nil then
		for i, v in self.events do
			local var3929, var3930 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3929, var6527 = protoModule.writeString(var3929, var3930, i)
			local var3931 = v:encode()
			var3930, var6529 = protoModule.writeTag(var3929, var3930, 2, protoModule.wireTypes.lengthDelimited)
			var3930, var6529 = protoModule.writeBuffer(var3930, var6529, var3931, buffer.len(var3931))
			local var3932 = var3930
			local var3933 = var6529
			local var3934, var3935 = protoModule.writeTag(buff, var3921, 4, protoModule.wireTypes.lengthDelimited)
			var3934, var6533 = protoModule.writeBuffer(var3934, var3935, var3932, var3933)
			buff = var3934
			var3921 = var3935
		end
	end
	local buff_1 = buffer.create(var3921)
	buffer.copy(buff_1, 0, buff, 0, var3921)
	
	return buff_1
end

function t_185.decode(p185)
	-- upvalues: t_185 (ref), protoModule (ref), t (ref), propTypesEngineModule (ref)
	local var3936 = t_185.new()
	local var3937 = 0
	while var3937 < buffer.len(p185) do
		local _ = nil
		local var3938 = nil
		local var3939, var3940, var3941 = protoModule.readTag(p185, var3937)
		local var3942 = var3939
		var3938 = var3940
		var3937 = var3941
		
		if var3938 == protoModule.wireTypes.varint then
			local _ = nil
			local var3943, var3944 = protoModule.readVarInt(p185, var3937)
			local _ = var3943
			var3937 = var3944
			continue
		end
		if var3938 == protoModule.wireTypes.lengthDelimited then
			if var3942 == 3 then
				local _ = nil
				local var3945, var3946 = protoModule.readBuffer(p185, var3937)
				var3937 = var3946
				var3945 = t.FocusNavActionsProp_FocusNavData_KeysEntry.decode(var3945)
				var3936.keys[var3945.key or ""] = var3945.value or propTypesEngineModule.KeyCodeProp.new()
			elseif var3942 == 4 then
				local _ = nil
				local var3947, var3948 = protoModule.readBuffer(p185, var3937)
				var3937 = var3948
				var3947 = t.FocusNavActionsProp_FocusNavData_EventsEntry.decode(var3947)
				var3936.events[var3947.key or ""] = var3947.value or t.ActionProp.new()
			else
				local _ = nil
				local var3949, var3950 = protoModule.readVarInt(p185, var3937)
				var3937 = var3950 + var3949
			end
		elseif var3938 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3951, var3952 = protoModule.readFixed32(p185, var3937)
			local _ = var3951
			var3937 = var3952
		elseif var3938 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3953, var3954 = protoModule.readFixed64(p185, var3937)
			local _ = var3953
			var3937 = var3954
		else
			error("Unsupported wire type: " .. var6537)
		end
	end
	return var3936
end

function t_185:jsonEncode()
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

function t_185:jsonDecode()
	-- upvalues: t_185 (ref), propTypesEngineModule (ref), t (ref)
	local var3955 = t_185.new()
	
	if self.keys ~= nil then
		local t_1 = {}
		
		for i, v in self.keys do
			t_1[i] = propTypesEngineModule.KeyCodeProp.jsonDecode(v)
		end
		var3955.keys = t_1
	end
	if self.events ~= nil then
		local t_1 = {}
		
		for i, v in self.events do
			t_1[i] = t.ActionProp.jsonDecode(v)
		end
		var3955.events = t_1
	end
	return var3955
end

t_185.descriptor = {
	name = "FocusNavActionsProp_FocusNavData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavData"
}
t.FocusNavActionsProp_FocusNavData = t_185
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData)
local t_186 = {}
t_186.__index = t_186

function t_186.new(p186)
	-- upvalues: t_186 (ref)
	return setmetatable({
		key = if p186 == nil or p186.key == nil then "" else p186.key,
		value = if p186 == nil or p186.value == nil then nil else p186.value
	}, t_186)
end

function t_186:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3956 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3957, var3958 = protoModule.writeTag(buff, var3956, 1, protoModule.wireTypes.lengthDelimited)
		var3957, var6563 = protoModule.writeString(var3957, var3958, self.key)
		buff = var3957
		var3956 = var3958
	end
	if self.value ~= nil then
		local var3959 = self.value:encode()
		local var3960, var3961 = protoModule.writeTag(buff, var3956, 2, protoModule.wireTypes.lengthDelimited)
		var3960, var6566 = protoModule.writeBuffer(var3960, var3961, var3959, buffer.len(var3959))
		buff = var3960
		var3956 = var3961
	end
	local buff_1 = buffer.create(var3956)
	buffer.copy(buff_1, 0, buff, 0, var3956)
	
	return buff_1
end

function t_186.decode(p186)
	-- upvalues: t_186 (ref), protoModule (ref), propTypesEngineModule (ref)
	local var3956 = t_186.new()
	local var3957 = 0
	while var3957 < buffer.len(p186) do
		local _ = nil
		local var3958 = nil
		local var3959, var3960, var3961 = protoModule.readTag(p186, var3957)
		local var3962 = var3959
		var3958 = var3960
		var3957 = var3961
		
		if var3958 == protoModule.wireTypes.varint then
			local _ = nil
			local var3963, var3964 = protoModule.readVarInt(p186, var3957)
			local _ = var3963
			var3957 = var3964
			continue
		end
		if var3958 == protoModule.wireTypes.lengthDelimited then
			if var3962 == 1 then
				local _ = nil
				local var3965, var3966 = protoModule.readBuffer(p186, var3957)
				var3957 = var3966
				var3956.key = buffer.tostring(var3965)
			elseif var3962 == 2 then
				local _ = nil
				local var3967, var3968 = protoModule.readBuffer(p186, var3957)
				var3957 = var3968
				var3956.value = propTypesEngineModule.KeyCodeProp.decode(var3967)
			else
				local _ = nil
				local var3969, var3970 = protoModule.readVarInt(p186, var3957)
				var3957 = var3970 + var3969
			end
		elseif var3958 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3971, var3972 = protoModule.readFixed32(p186, var3957)
			local _ = var3971
			var3957 = var3972
		elseif var3958 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3973, var3974 = protoModule.readFixed64(p186, var3957)
			local _ = var3973
			var3957 = var3974
		else
			error("Unsupported wire type: " .. var6570)
		end
	end
	return var3956
end

function t_186:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_186:jsonDecode()
	-- upvalues: t_186 (ref), propTypesEngineModule (ref)
	local var3975 = t_186.new()
	
	if self.key ~= nil then
		var3975.key = self.key
	end
	if self.value ~= nil then
		var3975.value = propTypesEngineModule.KeyCodeProp.jsonDecode(self.value)
	end
	return var3975
end

t_186.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_KeysEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.KeysEntry"
}
t.FocusNavActionsProp_FocusNavData_KeysEntry = t_186
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData_KeysEntry)
local t_187 = {}
t_187.__index = t_187

function t_187.new(p187)
	-- upvalues: t_187 (ref)
	return setmetatable({
		key = if p187 == nil or p187.key == nil then "" else p187.key,
		value = if p187 == nil or p187.value == nil then nil else p187.value
	}, t_187)
end

function t_187:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3975 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3976, var3977 = protoModule.writeTag(buff, var3975, 1, protoModule.wireTypes.lengthDelimited)
		var3976, var6592 = protoModule.writeString(var3976, var3977, self.key)
		buff = var3976
		var3975 = var3977
	end
	if self.value ~= nil then
		local var3978 = self.value:encode()
		local var3979, var3980 = protoModule.writeTag(buff, var3975, 2, protoModule.wireTypes.lengthDelimited)
		var3979, var6595 = protoModule.writeBuffer(var3979, var3980, var3978, buffer.len(var3978))
		buff = var3979
		var3975 = var3980
	end
	local buff_1 = buffer.create(var3975)
	buffer.copy(buff_1, 0, buff, 0, var3975)
	
	return buff_1
end

function t_187.decode(p187)
	-- upvalues: t_187 (ref), protoModule (ref), t (ref)
	local var3975 = t_187.new()
	local var3976 = 0
	while var3976 < buffer.len(p187) do
		local _ = nil
		local var3977 = nil
		local var3978, var3979, var3980 = protoModule.readTag(p187, var3976)
		local var3981 = var3978
		var3977 = var3979
		var3976 = var3980
		
		if var3977 == protoModule.wireTypes.varint then
			local _ = nil
			local var3982, var3983 = protoModule.readVarInt(p187, var3976)
			local _ = var3982
			var3976 = var3983
			continue
		end
		if var3977 == protoModule.wireTypes.lengthDelimited then
			if var3981 == 1 then
				local _ = nil
				local var3984, var3985 = protoModule.readBuffer(p187, var3976)
				var3976 = var3985
				var3975.key = buffer.tostring(var3984)
			elseif var3981 == 2 then
				local _ = nil
				local var3986, var3987 = protoModule.readBuffer(p187, var3976)
				var3976 = var3987
				var3975.value = t.ActionProp.decode(var3986)
			else
				local _ = nil
				local var3988, var3989 = protoModule.readVarInt(p187, var3976)
				var3976 = var3989 + var3988
			end
		elseif var3977 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3990, var3991 = protoModule.readFixed32(p187, var3976)
			local _ = var3990
			var3976 = var3991
		elseif var3977 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3992, var3993 = protoModule.readFixed64(p187, var3976)
			local _ = var3992
			var3976 = var3993
		else
			error("Unsupported wire type: " .. var6599)
		end
	end
	return var3975
end

function t_187:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_187:jsonDecode()
	-- upvalues: t_187 (ref), t (ref)
	local var3994 = t_187.new()
	
	if self.key ~= nil then
		var3994.key = self.key
	end
	if self.value ~= nil then
		var3994.value = t.ActionProp.jsonDecode(self.value)
	end
	return var3994
end

t_187.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_EventsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsEntry"
}
t.FocusNavActionsProp_FocusNavData_EventsEntry = t_187
typeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData_EventsEntry)
t.ActionType = {
	fromNumber = function(p188)
		return if p188 == 0 then "ACTION_TYPE_INVALID" elseif p188 == 1 then "ACTION_TYPE_DISMISS_DIALOG" elseif p188 == 2 then "ACTION_TYPE_LINK" elseif p188 == 3 then "ACTION_TYPE_OPEN_GAME_DETAILS" elseif p188 == 4 then "ACTION_TYPE_OPEN_JOIN_FRIENDS" elseif p188 == 5 then "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" elseif p188 == 6 then "ACTION_TYPE_OPEN_SEE_ALL" elseif p188 == 7 then "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" elseif p188 == 8 then "ACTION_TYPE_PLAY_BUTTON_CLICK" elseif p188 == 9 then "ACTION_TYPE_UPDATE_USER_SETTINGS" elseif p188 == 10 then "ACTION_TYPE_OPEN_TOOLTIP" elseif p188 == 11 then "ACTION_TYPE_OPEN_BADGE_DETAILS" elseif p188 == 12 then "ACTION_TYPE_LOAD_MORE_FROM_API" elseif p188 == 13 then "ACTION_TYPE_SHARE" elseif p188 == 14 then "ACTION_TYPE_OPEN_ABUSE_REPORT" elseif p188 == 15 then "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" elseif p188 == 16 then "ACTION_TYPE_OPEN_PROFILE" elseif p188 == 17 then "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" elseif p188 == 18 then "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" elseif p188 == 19 then "ACTION_TYPE_OPEN_MARKETPLACE" elseif p188 == 20 then "ACTION_TYPE_HIDE_PROFILE_COMPLETION" elseif p188 == 21 then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" elseif p188 == 22 then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" elseif p188 == 23 then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" elseif p188 == 24 then "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" elseif p188 == 25 then "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" elseif p188 == 26 then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" elseif p188 == 27 then "ACTION_TYPE_OPEN_SOCIAL_LINK" elseif p188 == 28 then "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" elseif p188 == 29 then "ACTION_TYPE_OPEN_SONG_DETAIL" elseif p188 == 30 then "ACTION_TYPE_REFRESH_FROM_API" elseif p188 == 31 then "ACTION_TYPE_RSVP_TO_EVENT" elseif p188 == 32 then "ACTION_TYPE_APPLY_CHARTS_FILTER" elseif p188 == 33 then "ACTION_TYPE_ANALYTICS_EVENT" elseif p188 == 34 then "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" elseif p188 == 35 then "ACTION_TYPE_OPEN_GAME_INVITE" elseif p188 == 36 then "ACTION_TYPE_OPEN_EVENT_DETAILS" elseif p188 == 37 then "ACTION_TYPE_LAUNCH_EXPERIENCE" elseif p188 == 38 then "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" elseif p188 == 39 then "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" elseif p188 == 40 then "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" elseif p188 == 41 then "ACTION_TYPE_OPEN_PURCHASE_PROMPT" elseif p188 == 42 then "ACTION_TYPE_OPEN_SDUI_OVERLAY" elseif p188 == 43 then "ACTION_TYPE_OPEN_BADGES_SEE_ALL" elseif p188 == 44 then "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" elseif p188 == 45 then "ACTION_TYPE_DISMISS_GAME_FEEDBACK" elseif p188 == 46 then "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" elseif p188 == 47 then "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" elseif p188 == 48 then "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" elseif p188 == 49 then "ACTION_TYPE_OPEN_AMP_WIZARD" elseif p188 == 50 then "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" elseif p188 == 51 then "ACTION_TYPE_REFRESH_GAME_PASSES" elseif p188 == 52 then "ACTION_TYPE_REFRESH_PLAYABILITY" elseif p188 == 53 then "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" elseif p188 == 54 then "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" elseif p188 == 55 then "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" elseif p188 == 56 then "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" elseif p188 == 57 then "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" elseif p188 == 58 then "ACTION_TYPE_DISMISS_PROMPT" elseif p188 == 59 then "ACTION_TYPE_REQUEST_FRIENDSHIP" elseif p188 == 60 then "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" elseif p188 == 61 then "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" elseif p188 == 62 then "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" elseif p188 == 63 then "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" elseif p188 == 64 then "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" elseif p188 == 65 then "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" elseif p188 == 66 then "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" elseif p188 == 67 then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" elseif p188 == 68 then "ACTION_TYPE_DOWNLOAD_APP" elseif p188 == 69 then "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" elseif p188 == 70 then "ACTION_TYPE_JOIN_COMMUNITY" elseif p188 == 71 then "ACTION_TYPE_VIEW_COMMUNITY" elseif p188 == 72 then "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" elseif p188 == 73 then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" elseif p188 == 74 then "ACTION_TYPE_SHOW_TOAST" elseif p188 == 75 then "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" elseif p188 == 76 then "ACTION_TYPE_ACTION_SEQUENCE" elseif p188 == 77 then "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" elseif p188 == 78 then "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" elseif p188 == 79 then "ACTION_TYPE_NAVIGATE" elseif p188 == 80 then "ACTION_TYPE_SET_GAME_TILE_NOT_INTERESTED" elseif p188 == 81 then "ACTION_TYPE_REFRESH_HOME" elseif p188 == 82 then "ACTION_TYPE_UNDO_GAME_TILE_NOT_INTERESTED" elseif p188 == 83 then "ACTION_TYPE_APPLY_DEV_STORE_SEE_ALL_CATEGORY_FILTER" else nil
	end,
	toNumber = function(p188)
		return if p188 == "ACTION_TYPE_INVALID" then 0 elseif p188 == "ACTION_TYPE_DISMISS_DIALOG" then 1 elseif p188 == "ACTION_TYPE_LINK" then 2 elseif p188 == "ACTION_TYPE_OPEN_GAME_DETAILS" then 3 elseif p188 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then 4 elseif p188 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then 5 elseif p188 == "ACTION_TYPE_OPEN_SEE_ALL" then 6 elseif p188 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then 7 elseif p188 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then 8 elseif p188 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then 9 elseif p188 == "ACTION_TYPE_OPEN_TOOLTIP" then 10 elseif p188 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then 11 elseif p188 == "ACTION_TYPE_LOAD_MORE_FROM_API" then 12 elseif p188 == "ACTION_TYPE_SHARE" then 13 elseif p188 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then 14 elseif p188 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then 15 elseif p188 == "ACTION_TYPE_OPEN_PROFILE" then 16 elseif p188 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then 17 elseif p188 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then 18 elseif p188 == "ACTION_TYPE_OPEN_MARKETPLACE" then 19 elseif p188 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then 20 elseif p188 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then 21 elseif p188 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then 22 elseif p188 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then 23 elseif p188 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then 24 elseif p188 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then 25 elseif p188 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then 26 elseif p188 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then 27 elseif p188 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then 28 elseif p188 == "ACTION_TYPE_OPEN_SONG_DETAIL" then 29 elseif p188 == "ACTION_TYPE_REFRESH_FROM_API" then 30 elseif p188 == "ACTION_TYPE_RSVP_TO_EVENT" then 31 elseif p188 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then 32 elseif p188 == "ACTION_TYPE_ANALYTICS_EVENT" then 33 elseif p188 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then 34 elseif p188 == "ACTION_TYPE_OPEN_GAME_INVITE" then 35 elseif p188 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then 36 elseif p188 == "ACTION_TYPE_LAUNCH_EXPERIENCE" then 37 elseif p188 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" then 38 elseif p188 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" then 39 elseif p188 == "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" then 40 elseif p188 == "ACTION_TYPE_OPEN_PURCHASE_PROMPT" then 41 elseif p188 == "ACTION_TYPE_OPEN_SDUI_OVERLAY" then 42 elseif p188 == "ACTION_TYPE_OPEN_BADGES_SEE_ALL" then 43 elseif p188 == "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" then 44 elseif p188 == "ACTION_TYPE_DISMISS_GAME_FEEDBACK" then 45 elseif p188 == "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" then 46 elseif p188 == "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" then 47 elseif p188 == "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" then 48 elseif p188 == "ACTION_TYPE_OPEN_AMP_WIZARD" then 49 elseif p188 == "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" then 50 elseif p188 == "ACTION_TYPE_REFRESH_GAME_PASSES" then 51 elseif p188 == "ACTION_TYPE_REFRESH_PLAYABILITY" then 52 elseif p188 == "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" then 53 elseif p188 == "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" then 54 elseif p188 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" then 55 elseif p188 == "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" then 56 elseif p188 == "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" then 57 elseif p188 == "ACTION_TYPE_DISMISS_PROMPT" then 58 elseif p188 == "ACTION_TYPE_REQUEST_FRIENDSHIP" then 59 elseif p188 == "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" then 60 elseif p188 == "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" then 61 elseif p188 == "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" then 62 elseif p188 == "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" then 63 elseif p188 == "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" then 64 elseif p188 == "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" then 65 elseif p188 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" then 66 elseif p188 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" then 67 elseif p188 == "ACTION_TYPE_DOWNLOAD_APP" then 68 elseif p188 == "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" then 69 elseif p188 == "ACTION_TYPE_JOIN_COMMUNITY" then 70 elseif p188 == "ACTION_TYPE_VIEW_COMMUNITY" then 71 elseif p188 == "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" then 72 elseif p188 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" then 73 elseif p188 == "ACTION_TYPE_SHOW_TOAST" then 74 elseif p188 == "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" then 75 elseif p188 == "ACTION_TYPE_ACTION_SEQUENCE" then 76 elseif p188 == "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" then 77 elseif p188 == "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" then 78 elseif p188 == "ACTION_TYPE_NAVIGATE" then 79 elseif p188 == "ACTION_TYPE_SET_GAME_TILE_NOT_INTERESTED" then 80 elseif p188 == "ACTION_TYPE_REFRESH_HOME" then 81 elseif p188 == "ACTION_TYPE_UNDO_GAME_TILE_NOT_INTERESTED" then 82 elseif p188 == "ACTION_TYPE_APPLY_DEV_STORE_SEE_ALL_CATEGORY_FILTER" then 83 else p188
	end,
	fromName = function(p188)
		return if p188 == "ACTION_TYPE_INVALID" then "ACTION_TYPE_INVALID" elseif p188 == "ACTION_TYPE_DISMISS_DIALOG" then "ACTION_TYPE_DISMISS_DIALOG" elseif p188 == "ACTION_TYPE_LINK" then "ACTION_TYPE_LINK" elseif p188 == "ACTION_TYPE_OPEN_GAME_DETAILS" then "ACTION_TYPE_OPEN_GAME_DETAILS" elseif p188 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then "ACTION_TYPE_OPEN_JOIN_FRIENDS" elseif p188 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" elseif p188 == "ACTION_TYPE_OPEN_SEE_ALL" then "ACTION_TYPE_OPEN_SEE_ALL" elseif p188 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" elseif p188 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then "ACTION_TYPE_PLAY_BUTTON_CLICK" elseif p188 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then "ACTION_TYPE_UPDATE_USER_SETTINGS" elseif p188 == "ACTION_TYPE_OPEN_TOOLTIP" then "ACTION_TYPE_OPEN_TOOLTIP" elseif p188 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then "ACTION_TYPE_OPEN_BADGE_DETAILS" elseif p188 == "ACTION_TYPE_LOAD_MORE_FROM_API" then "ACTION_TYPE_LOAD_MORE_FROM_API" elseif p188 == "ACTION_TYPE_SHARE" then "ACTION_TYPE_SHARE" elseif p188 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then "ACTION_TYPE_OPEN_ABUSE_REPORT" elseif p188 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" elseif p188 == "ACTION_TYPE_OPEN_PROFILE" then "ACTION_TYPE_OPEN_PROFILE" elseif p188 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" elseif p188 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" elseif p188 == "ACTION_TYPE_OPEN_MARKETPLACE" then "ACTION_TYPE_OPEN_MARKETPLACE" elseif p188 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then "ACTION_TYPE_HIDE_PROFILE_COMPLETION" elseif p188 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" elseif p188 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" elseif p188 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" elseif p188 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" elseif p188 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" elseif p188 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" elseif p188 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then "ACTION_TYPE_OPEN_SOCIAL_LINK" elseif p188 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" elseif p188 == "ACTION_TYPE_OPEN_SONG_DETAIL" then "ACTION_TYPE_OPEN_SONG_DETAIL" elseif p188 == "ACTION_TYPE_REFRESH_FROM_API" then "ACTION_TYPE_REFRESH_FROM_API" elseif p188 == "ACTION_TYPE_RSVP_TO_EVENT" then "ACTION_TYPE_RSVP_TO_EVENT" elseif p188 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then "ACTION_TYPE_APPLY_CHARTS_FILTER" elseif p188 == "ACTION_TYPE_ANALYTICS_EVENT" then "ACTION_TYPE_ANALYTICS_EVENT" elseif p188 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" elseif p188 == "ACTION_TYPE_OPEN_GAME_INVITE" then "ACTION_TYPE_OPEN_GAME_INVITE" elseif p188 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then "ACTION_TYPE_OPEN_EVENT_DETAILS" elseif p188 == "ACTION_TYPE_LAUNCH_EXPERIENCE" then "ACTION_TYPE_LAUNCH_EXPERIENCE" elseif p188 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" then "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" elseif p188 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" then "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" elseif p188 == "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" then "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" elseif p188 == "ACTION_TYPE_OPEN_PURCHASE_PROMPT" then "ACTION_TYPE_OPEN_PURCHASE_PROMPT" elseif p188 == "ACTION_TYPE_OPEN_SDUI_OVERLAY" then "ACTION_TYPE_OPEN_SDUI_OVERLAY" elseif p188 == "ACTION_TYPE_OPEN_BADGES_SEE_ALL" then "ACTION_TYPE_OPEN_BADGES_SEE_ALL" elseif p188 == "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" then "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" elseif p188 == "ACTION_TYPE_DISMISS_GAME_FEEDBACK" then "ACTION_TYPE_DISMISS_GAME_FEEDBACK" elseif p188 == "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" then "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" elseif p188 == "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" then "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" elseif p188 == "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" then "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" elseif p188 == "ACTION_TYPE_OPEN_AMP_WIZARD" then "ACTION_TYPE_OPEN_AMP_WIZARD" elseif p188 == "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" then "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" elseif p188 == "ACTION_TYPE_REFRESH_GAME_PASSES" then "ACTION_TYPE_REFRESH_GAME_PASSES" elseif p188 == "ACTION_TYPE_REFRESH_PLAYABILITY" then "ACTION_TYPE_REFRESH_PLAYABILITY" elseif p188 == "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" then "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" elseif p188 == "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" then "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" elseif p188 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" then "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" elseif p188 == "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" then "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" elseif p188 == "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" then "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" elseif p188 == "ACTION_TYPE_DISMISS_PROMPT" then "ACTION_TYPE_DISMISS_PROMPT" elseif p188 == "ACTION_TYPE_REQUEST_FRIENDSHIP" then "ACTION_TYPE_REQUEST_FRIENDSHIP" elseif p188 == "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" then "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" elseif p188 == "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" then "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" elseif p188 == "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" then "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" elseif p188 == "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" then "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" elseif p188 == "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" then "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" elseif p188 == "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" then "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" elseif p188 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" then "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" elseif p188 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" elseif p188 == "ACTION_TYPE_DOWNLOAD_APP" then "ACTION_TYPE_DOWNLOAD_APP" elseif p188 == "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" then "ACTION_TYPE_REFRESH_CHARTS_SORT_DETAIL" elseif p188 == "ACTION_TYPE_JOIN_COMMUNITY" then "ACTION_TYPE_JOIN_COMMUNITY" elseif p188 == "ACTION_TYPE_VIEW_COMMUNITY" then "ACTION_TYPE_VIEW_COMMUNITY" elseif p188 == "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" then "ACTION_TYPE_PIN_EXPERIENCE_SHORTCUT" elseif p188 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_SUBCATEGORY" elseif p188 == "ACTION_TYPE_SHOW_TOAST" then "ACTION_TYPE_SHOW_TOAST" elseif p188 == "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" then "ACTION_TYPE_OPEN_INCOMING_TRANSFER_UPSELL" elseif p188 == "ACTION_TYPE_ACTION_SEQUENCE" then "ACTION_TYPE_ACTION_SEQUENCE" elseif p188 == "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" then "ACTION_TYPE_REFRESH_FEED_ENTRY_FROM_API" elseif p188 == "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" then "ACTION_TYPE_OPEN_PROFILE_FRAMES_EDITOR" elseif p188 == "ACTION_TYPE_NAVIGATE" then "ACTION_TYPE_NAVIGATE" elseif p188 == "ACTION_TYPE_SET_GAME_TILE_NOT_INTERESTED" then "ACTION_TYPE_SET_GAME_TILE_NOT_INTERESTED" elseif p188 == "ACTION_TYPE_REFRESH_HOME" then "ACTION_TYPE_REFRESH_HOME" elseif p188 == "ACTION_TYPE_UNDO_GAME_TILE_NOT_INTERESTED" then "ACTION_TYPE_UNDO_GAME_TILE_NOT_INTERESTED" elseif p188 == "ACTION_TYPE_APPLY_DEV_STORE_SEE_ALL_CATEGORY_FILTER" then "ACTION_TYPE_APPLY_DEV_STORE_SEE_ALL_CATEGORY_FILTER" else nil
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