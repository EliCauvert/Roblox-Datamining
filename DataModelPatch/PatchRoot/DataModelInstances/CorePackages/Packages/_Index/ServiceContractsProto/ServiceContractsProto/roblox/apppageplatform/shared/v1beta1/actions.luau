local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local PropConditionModule = require(script.Parent.prop_condition)
local PropTypesModule = require(script.Parent.prop_types)
local PropTypesEngineModule = require(script.Parent.prop_types_engine)
local ShareLinkDataModule = require(script.Parent.share_link_data)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: t (copy), Module (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module))
end

function Module:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), t (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v172 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v172 = ProtoModule.readVarIntI32(Buf, v1)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v172 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v172 = ProtoModule.readBuffer(Buf, v1)
				NewModule.action_params = t.DismissDialogAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v172 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v172 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module:jsonDecode()
	-- upvalues: Module (copy), t (copy)
	local NewModule = Module.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.DismissDialogAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.DismissDialogAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module.descriptor = {
	name = "DismissDialogAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissDialogAction"
}
t.DismissDialogAction = Module
TypeRegistryModule.default:register(t.DismissDialogAction)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		dialog_type = if p1 == nil or p1.dialog_type == nil then nil else p1.dialog_type
	}, Module1))
end

function Module1:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.dialog_type ~= nil then
		local EncodeResult = self.dialog_type:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf)
	-- upvalues: Module1 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v190 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v190 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v190 = ProtoModule.readBuffer(Buf, v2)
				NewModule.dialog_type = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v190 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v190 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	local t = {}
	
	if self.dialog_type ~= nil then
		t.dialogType = self.dialog_type:jsonEncode()
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy), PropTypesModule (copy)
	local NewModule = Module1.new()
	
	if self.dialog_type ~= nil then
		NewModule.dialog_type = PropTypesModule.StringProp.jsonDecode(self.dialog_type)
	end
	if self.dialogType ~= nil then
		NewModule.dialog_type = PropTypesModule.StringProp.jsonDecode(self.dialogType)
	end
	return NewModule
end

Module1.descriptor = {
	name = "DismissDialogAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissDialogAction_Params = Module1
TypeRegistryModule.default:register(t.DismissDialogAction_Params)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: t (copy), Module2 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module2))
end

function Module2:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v209 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v209 = ProtoModule.readVarIntI32(Buf, v3)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v209 = ProtoModule.readVarInt(Buf, v3)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v209 = ProtoModule.readBuffer(Buf, v3)
				NewModule.action_params = t.LinkAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v209 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v209 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module2:jsonDecode()
	-- upvalues: Module2 (copy), t (copy)
	local NewModule = Module2.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.LinkAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.LinkAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module2.descriptor = {
	name = "LinkAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LinkAction"
}
t.LinkAction = Module2
TypeRegistryModule.default:register(t.LinkAction)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1)
	-- upvalues: Module3 (copy)
	return (setmetatable({
		url = if p1 == nil or p1.url == nil then nil else p1.url,
		title_key = if p1 == nil or p1.title_key == nil then nil else p1.title_key,
		on_webview_close = if p1 == nil or p1.on_webview_close == nil then nil else p1.on_webview_close
	}, Module3))
end

function Module3:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.url ~= nil then
		local EncodeResult = self.url:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.title_key ~= nil then
		local EncodeResult = self.title_key:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.on_webview_close ~= nil then
		local EncodeResult = self.on_webview_close:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf)
	-- upvalues: Module3 (copy), ProtoModule (copy), PropTypesModule (copy), t (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v233 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v233 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v233 = ProtoModule.readBuffer(Buf, v4)
				NewModule.url = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v233 = ProtoModule.readBuffer(Buf, v4)
				NewModule.title_key = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v233 = ProtoModule.readBuffer(Buf, v4)
				NewModule.on_webview_close = t.ActionProp.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v233 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v233 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode()
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

function Module3:jsonDecode()
	-- upvalues: Module3 (copy), PropTypesModule (copy), t (copy)
	local NewModule = Module3.new()
	
	if self.url ~= nil then
		NewModule.url = PropTypesModule.StringProp.jsonDecode(self.url)
	end
	if self.title_key ~= nil then
		NewModule.title_key = PropTypesModule.StringProp.jsonDecode(self.title_key)
	end
	if self.titleKey ~= nil then
		NewModule.title_key = PropTypesModule.StringProp.jsonDecode(self.titleKey)
	end
	if self.on_webview_close ~= nil then
		NewModule.on_webview_close = t.ActionProp.jsonDecode(self.on_webview_close)
	end
	if self.onWebviewClose ~= nil then
		NewModule.on_webview_close = t.ActionProp.jsonDecode(self.onWebviewClose)
	end
	return NewModule
end

Module3.descriptor = {
	name = "LinkAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LinkAction_Params = Module3
TypeRegistryModule.default:register(t.LinkAction_Params)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1)
	-- upvalues: t (copy), Module4 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module4))
end

function Module4:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf)
	-- upvalues: Module4 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v254 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v254 = ProtoModule.readVarIntI32(Buf, v5)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v254 = ProtoModule.readVarInt(Buf, v5)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v254 = ProtoModule.readBuffer(Buf, v5)
				NewModule.action_params = t.OpenSocialLinkAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v254 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v254 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module4:jsonDecode()
	-- upvalues: Module4 (copy), t (copy)
	local NewModule = Module4.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenSocialLinkAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenSocialLinkAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module4.descriptor = {
	name = "OpenSocialLinkAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSocialLinkAction"
}
t.OpenSocialLinkAction = Module4
TypeRegistryModule.default:register(t.OpenSocialLinkAction)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1)
	-- upvalues: Module5 (copy)
	return (setmetatable({
		assignment_id = if p1 == nil or p1.assignment_id == nil then nil else p1.assignment_id,
		assignment_type = if p1 == nil or p1.assignment_type == nil then nil else p1.assignment_type,
		social_link_type = if p1 == nil or p1.social_link_type == nil then nil else p1.social_link_type,
		social_link_url = if p1 == nil or p1.social_link_url == nil then nil else p1.social_link_url,
		social_link_display_type = if p1 == nil or p1.social_link_display_type == nil then nil else p1.social_link_display_type
	}, Module5))
end

function Module5:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.assignment_id ~= nil then
		local EncodeResult = self.assignment_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.assignment_type ~= nil then
		local EncodeResult = self.assignment_type:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.social_link_type ~= nil then
		local EncodeResult = self.social_link_type:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.social_link_url ~= nil then
		local EncodeResult = self.social_link_url:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	if self.social_link_display_type ~= nil then
		local EncodeResult = self.social_link_display_type:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf)
	-- upvalues: Module5 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v284 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v284 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v284 = ProtoModule.readBuffer(Buf, v6)
				NewModule.assignment_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v284 = ProtoModule.readBuffer(Buf, v6)
				NewModule.assignment_type = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v284 = ProtoModule.readBuffer(Buf, v6)
				NewModule.social_link_type = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v284 = ProtoModule.readBuffer(Buf, v6)
				NewModule.social_link_url = PropTypesModule.StringProp.decode(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v284 = ProtoModule.readBuffer(Buf, v6)
				NewModule.social_link_display_type = PropTypesModule.StringProp.decode(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v284 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v284 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode()
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

function Module5:jsonDecode()
	-- upvalues: Module5 (copy), PropTypesModule (copy)
	local NewModule = Module5.new()
	
	if self.assignment_id ~= nil then
		NewModule.assignment_id = PropTypesModule.StringProp.jsonDecode(self.assignment_id)
	end
	if self.assignmentId ~= nil then
		NewModule.assignment_id = PropTypesModule.StringProp.jsonDecode(self.assignmentId)
	end
	if self.assignment_type ~= nil then
		NewModule.assignment_type = PropTypesModule.StringProp.jsonDecode(self.assignment_type)
	end
	if self.assignmentType ~= nil then
		NewModule.assignment_type = PropTypesModule.StringProp.jsonDecode(self.assignmentType)
	end
	if self.social_link_type ~= nil then
		NewModule.social_link_type = PropTypesModule.StringProp.jsonDecode(self.social_link_type)
	end
	if self.socialLinkType ~= nil then
		NewModule.social_link_type = PropTypesModule.StringProp.jsonDecode(self.socialLinkType)
	end
	if self.social_link_url ~= nil then
		NewModule.social_link_url = PropTypesModule.StringProp.jsonDecode(self.social_link_url)
	end
	if self.socialLinkUrl ~= nil then
		NewModule.social_link_url = PropTypesModule.StringProp.jsonDecode(self.socialLinkUrl)
	end
	if self.social_link_display_type ~= nil then
		NewModule.social_link_display_type = PropTypesModule.StringProp.jsonDecode(self.social_link_display_type)
	end
	if self.socialLinkDisplayType ~= nil then
		NewModule.social_link_display_type = PropTypesModule.StringProp.jsonDecode(self.socialLinkDisplayType)
	end
	return NewModule
end

Module5.descriptor = {
	name = "OpenSocialLinkAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSocialLinkAction_Params = Module5
TypeRegistryModule.default:register(t.OpenSocialLinkAction_Params)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1)
	-- upvalues: t (copy), Module6 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module6))
end

function Module6:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module6.decode(Buf)
	-- upvalues: Module6 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v307 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v307 = ProtoModule.readVarIntI32(Buf, v7)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v307 = ProtoModule.readVarInt(Buf, v7)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v307 = ProtoModule.readBuffer(Buf, v7)
				NewModule.action_params = t.OpenGameDetailsAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v307 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v307 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module6:jsonDecode()
	-- upvalues: Module6 (copy), t (copy)
	local NewModule = Module6.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenGameDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenGameDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module6.descriptor = {
	name = "OpenGameDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameDetailsAction"
}
t.OpenGameDetailsAction = Module6
TypeRegistryModule.default:register(t.OpenGameDetailsAction)
local Module7 = {}
Module7.__index = Module7

function Module7.new(p1)
	-- upvalues: Module7 (copy)
	return (setmetatable({
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id,
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		inherit_referral_session = if p1 == nil or p1.inherit_referral_session == nil then nil else p1.inherit_referral_session
	}, Module7))
end

function Module7:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.place_id ~= nil then
		local EncodeResult = self.place_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.inherit_referral_session ~= nil then
		local EncodeResult = self.inherit_referral_session:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module7.decode(Buf)
	-- upvalues: Module7 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v331 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v331 = ProtoModule.readVarInt(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v331 = ProtoModule.readBuffer(Buf, v8)
				NewModule.place_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v331 = ProtoModule.readBuffer(Buf, v8)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v331 = ProtoModule.readBuffer(Buf, v8)
				NewModule.inherit_referral_session = PropTypesModule.BoolProp.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v331 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v331 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode()
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

function Module7:jsonDecode()
	-- upvalues: Module7 (copy), PropTypesModule (copy)
	local NewModule = Module7.new()
	
	if self.place_id ~= nil then
		NewModule.place_id = PropTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		NewModule.place_id = PropTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.inherit_referral_session ~= nil then
		NewModule.inherit_referral_session = PropTypesModule.BoolProp.jsonDecode(self.inherit_referral_session)
	end
	if self.inheritReferralSession ~= nil then
		NewModule.inherit_referral_session = PropTypesModule.BoolProp.jsonDecode(self.inheritReferralSession)
	end
	return NewModule
end

Module7.descriptor = {
	name = "OpenGameDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameDetailsAction_Params = Module7
TypeRegistryModule.default:register(t.OpenGameDetailsAction_Params)
local Module8 = {}
Module8.__index = Module8

function Module8.new(p1)
	-- upvalues: t (copy), Module8 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module8))
end

function Module8:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module8.decode(Buf)
	-- upvalues: Module8 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module8.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v352 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v352 = ProtoModule.readVarIntI32(Buf, v9)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v352 = ProtoModule.readVarInt(Buf, v9)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v352 = ProtoModule.readBuffer(Buf, v9)
				NewModule.action_params = t.OpenJoinFriendsAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v352 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v352 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module8:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module8:jsonDecode()
	-- upvalues: Module8 (copy), t (copy)
	local NewModule = Module8.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenJoinFriendsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenJoinFriendsAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module8.descriptor = {
	name = "OpenJoinFriendsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenJoinFriendsAction"
}
t.OpenJoinFriendsAction = Module8
TypeRegistryModule.default:register(t.OpenJoinFriendsAction)
local Module9 = {}
Module9.__index = Module9

function Module9.new(p1)
	-- upvalues: Module9 (copy)
	return (setmetatable({
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id,
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id
	}, Module9))
end

function Module9:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.place_id ~= nil then
		local EncodeResult = self.place_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module9.decode(Buf)
	-- upvalues: Module9 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module9.new()
	local v10 = 0
	while v10 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v373 = ProtoModule.readTag(Buf, v10)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v373 = ProtoModule.readVarInt(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v373 = ProtoModule.readBuffer(Buf, v10)
				NewModule.place_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v373 = ProtoModule.readBuffer(Buf, v10)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v10)
				v10 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v373 = ProtoModule.readFixed32(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v373 = ProtoModule.readFixed64(Buf, v10)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module9:jsonEncode()
	local t = {}
	
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function Module9:jsonDecode()
	-- upvalues: Module9 (copy), PropTypesModule (copy)
	local NewModule = Module9.new()
	
	if self.place_id ~= nil then
		NewModule.place_id = PropTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		NewModule.place_id = PropTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return NewModule
end

Module9.descriptor = {
	name = "OpenJoinFriendsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenJoinFriendsAction_Params = Module9
TypeRegistryModule.default:register(t.OpenJoinFriendsAction_Params)
local Module10 = {}
Module10.__index = Module10

function Module10.new(p1)
	-- upvalues: t (copy), Module10 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module10))
end

function Module10:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module10.decode(Buf)
	-- upvalues: Module10 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module10.new()
	local v11 = 0
	while v11 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v393 = ProtoModule.readTag(Buf, v11)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v393 = ProtoModule.readVarIntI32(Buf, v11)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v393 = ProtoModule.readVarInt(Buf, v11)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v393 = ProtoModule.readBuffer(Buf, v11)
				NewModule.action_params = t.OpenMarketplaceTryOnAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v11)
				v11 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v393 = ProtoModule.readFixed32(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v393 = ProtoModule.readFixed64(Buf, v11)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module10:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module10:jsonDecode()
	-- upvalues: Module10 (copy), t (copy)
	local NewModule = Module10.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenMarketplaceTryOnAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenMarketplaceTryOnAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module10.descriptor = {
	name = "OpenMarketplaceTryOnAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceTryOnAction"
}
t.OpenMarketplaceTryOnAction = Module10
TypeRegistryModule.default:register(t.OpenMarketplaceTryOnAction)
local Module11 = {}
Module11.__index = Module11

function Module11.new(p1)
	-- upvalues: Module11 (copy)
	return (setmetatable({
		item_id = if p1 == nil or p1.item_id == nil then nil else p1.item_id,
		item_type = if p1 == nil or p1.item_type == nil then nil else p1.item_type,
		item_sub_type_name = if p1 == nil or p1.item_sub_type_name == nil then nil else p1.item_sub_type_name
	}, Module11))
end

function Module11:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.item_id ~= nil then
		local EncodeResult = self.item_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.item_type ~= nil then
		local EncodeResult = self.item_type:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.item_sub_type_name ~= nil then
		local EncodeResult = self.item_sub_type_name:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module11.decode(Buf)
	-- upvalues: Module11 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module11.new()
	local v12 = 0
	while v12 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v417 = ProtoModule.readTag(Buf, v12)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v417 = ProtoModule.readVarInt(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v417 = ProtoModule.readBuffer(Buf, v12)
				NewModule.item_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v417 = ProtoModule.readBuffer(Buf, v12)
				NewModule.item_type = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v417 = ProtoModule.readBuffer(Buf, v12)
				NewModule.item_sub_type_name = PropTypesModule.StringProp.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v12)
				v12 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v417 = ProtoModule.readFixed32(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v417 = ProtoModule.readFixed64(Buf, v12)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module11:jsonEncode()
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

function Module11:jsonDecode()
	-- upvalues: Module11 (copy), PropTypesModule (copy)
	local NewModule = Module11.new()
	
	if self.item_id ~= nil then
		NewModule.item_id = PropTypesModule.StringProp.jsonDecode(self.item_id)
	end
	if self.itemId ~= nil then
		NewModule.item_id = PropTypesModule.StringProp.jsonDecode(self.itemId)
	end
	if self.item_type ~= nil then
		NewModule.item_type = PropTypesModule.StringProp.jsonDecode(self.item_type)
	end
	if self.itemType ~= nil then
		NewModule.item_type = PropTypesModule.StringProp.jsonDecode(self.itemType)
	end
	if self.item_sub_type_name ~= nil then
		NewModule.item_sub_type_name = PropTypesModule.StringProp.jsonDecode(self.item_sub_type_name)
	end
	if self.itemSubTypeName ~= nil then
		NewModule.item_sub_type_name = PropTypesModule.StringProp.jsonDecode(self.itemSubTypeName)
	end
	return NewModule
end

Module11.descriptor = {
	name = "OpenMarketplaceTryOnAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceTryOnAction_Params = Module11
TypeRegistryModule.default:register(t.OpenMarketplaceTryOnAction_Params)
local Module12 = {}
Module12.__index = Module12

function Module12.new(p1)
	-- upvalues: t (copy), Module12 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module12))
end

function Module12:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module12.decode(Buf)
	-- upvalues: Module12 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module12.new()
	local v13 = 0
	while v13 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v438 = ProtoModule.readTag(Buf, v13)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v438 = ProtoModule.readVarIntI32(Buf, v13)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v438 = ProtoModule.readVarInt(Buf, v13)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v438 = ProtoModule.readBuffer(Buf, v13)
				NewModule.action_params = t.OpenSeeAllAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v13)
				v13 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v438 = ProtoModule.readFixed32(Buf, v13)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v438 = ProtoModule.readFixed64(Buf, v13)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module12:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module12:jsonDecode()
	-- upvalues: Module12 (copy), t (copy)
	local NewModule = Module12.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module12.descriptor = {
	name = "OpenSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSeeAllAction"
}
t.OpenSeeAllAction = Module12
TypeRegistryModule.default:register(t.OpenSeeAllAction)
local Module13 = {}
Module13.__index = Module13

function Module13.new(p1)
	-- upvalues: Module13 (copy)
	return (setmetatable({
		collection_id = if p1 == nil or p1.collection_id == nil then nil else p1.collection_id,
		game_set_target_id = if p1 == nil or p1.game_set_target_id == nil then nil else p1.game_set_target_id,
		collection_position = if p1 == nil or p1.collection_position == nil then nil else p1.collection_position
	}, Module13))
end

function Module13:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.collection_id ~= nil then
		local EncodeResult = self.collection_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.game_set_target_id ~= nil then
		local EncodeResult = self.game_set_target_id:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.collection_position ~= nil then
		local EncodeResult = self.collection_position:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module13.decode(Buf)
	-- upvalues: Module13 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module13.new()
	local v14 = 0
	while v14 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v462 = ProtoModule.readTag(Buf, v14)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v462 = ProtoModule.readVarInt(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v462 = ProtoModule.readBuffer(Buf, v14)
				NewModule.collection_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v462 = ProtoModule.readBuffer(Buf, v14)
				NewModule.game_set_target_id = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v462 = ProtoModule.readBuffer(Buf, v14)
				NewModule.collection_position = PropTypesModule.StringProp.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v14)
				v14 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v462 = ProtoModule.readFixed32(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v462 = ProtoModule.readFixed64(Buf, v14)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module13:jsonEncode()
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

function Module13:jsonDecode()
	-- upvalues: Module13 (copy), PropTypesModule (copy)
	local NewModule = Module13.new()
	
	if self.collection_id ~= nil then
		NewModule.collection_id = PropTypesModule.StringProp.jsonDecode(self.collection_id)
	end
	if self.collectionId ~= nil then
		NewModule.collection_id = PropTypesModule.StringProp.jsonDecode(self.collectionId)
	end
	if self.game_set_target_id ~= nil then
		NewModule.game_set_target_id = PropTypesModule.StringProp.jsonDecode(self.game_set_target_id)
	end
	if self.gameSetTargetId ~= nil then
		NewModule.game_set_target_id = PropTypesModule.StringProp.jsonDecode(self.gameSetTargetId)
	end
	if self.collection_position ~= nil then
		NewModule.collection_position = PropTypesModule.StringProp.jsonDecode(self.collection_position)
	end
	if self.collectionPosition ~= nil then
		NewModule.collection_position = PropTypesModule.StringProp.jsonDecode(self.collectionPosition)
	end
	return NewModule
end

Module13.descriptor = {
	name = "OpenSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSeeAllAction_Params = Module13
TypeRegistryModule.default:register(t.OpenSeeAllAction_Params)
local Module14 = {}
Module14.__index = Module14

function Module14.new(p1)
	-- upvalues: t (copy), Module14 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module14))
end

function Module14:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module14.decode(Buf)
	-- upvalues: Module14 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module14.new()
	local v15 = 0
	while v15 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v483 = ProtoModule.readTag(Buf, v15)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v483 = ProtoModule.readVarIntI32(Buf, v15)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v483 = ProtoModule.readVarInt(Buf, v15)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v483 = ProtoModule.readBuffer(Buf, v15)
				NewModule.action_params = t.OpenSponsoredTooltipAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v15)
				v15 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v483 = ProtoModule.readFixed32(Buf, v15)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v483 = ProtoModule.readFixed64(Buf, v15)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module14:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module14:jsonDecode()
	-- upvalues: Module14 (copy), t (copy)
	local NewModule = Module14.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenSponsoredTooltipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenSponsoredTooltipAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module14.descriptor = {
	name = "OpenSponsoredTooltipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSponsoredTooltipAction"
}
t.OpenSponsoredTooltipAction = Module14
TypeRegistryModule.default:register(t.OpenSponsoredTooltipAction)
local Module15 = {}
Module15.__index = Module15

function Module15:new()
	-- upvalues: Module15 (copy)
	return (setmetatable({}, Module15))
end

function Module15:encode()
	local Buf = buffer.create(0)
	buffer.copy(Buf, 0, buffer.create(0), 0, 0)
	
	return Buf
end

function Module15.decode(Buf)
	-- upvalues: Module15 (copy), ProtoModule (copy)
	local NewModule = Module15.new()
	local v16 = 0
	while v16 < buffer.len(Buf) do
		local _, Tag2
		_, Tag2, v497 = ProtoModule.readTag(Buf, v16)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v497 = ProtoModule.readVarInt(Buf, v16)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v16)
			v16 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v497 = ProtoModule.readFixed32(Buf, v16)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v497 = ProtoModule.readFixed64(Buf, v16)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module15:jsonEncode()
	return {}
end

function Module15:jsonDecode()
	-- upvalues: Module15 (copy)
	return (Module15.new())
end

Module15.descriptor = {
	name = "OpenSponsoredTooltipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSponsoredTooltipAction_Params = Module15
TypeRegistryModule.default:register(t.OpenSponsoredTooltipAction_Params)
local Module16 = {}
Module16.__index = Module16

function Module16.new(p1)
	-- upvalues: t (copy), Module16 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module16))
end

function Module16:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module16.decode(Buf)
	-- upvalues: Module16 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module16.new()
	local v17 = 0
	while v17 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v513 = ProtoModule.readTag(Buf, v17)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v513 = ProtoModule.readVarIntI32(Buf, v17)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v513 = ProtoModule.readVarInt(Buf, v17)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v513 = ProtoModule.readBuffer(Buf, v17)
				NewModule.action_params = t.PlayButtonClickAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v17)
				v17 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v513 = ProtoModule.readFixed32(Buf, v17)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v513 = ProtoModule.readFixed64(Buf, v17)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module16:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module16:jsonDecode()
	-- upvalues: Module16 (copy), t (copy)
	local NewModule = Module16.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.PlayButtonClickAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.PlayButtonClickAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module16.descriptor = {
	name = "PlayButtonClickAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.PlayButtonClickAction"
}
t.PlayButtonClickAction = Module16
TypeRegistryModule.default:register(t.PlayButtonClickAction)
local Module17 = {}
Module17.__index = Module17

function Module17:new()
	-- upvalues: Module17 (copy)
	return (setmetatable({}, Module17))
end

function Module17:encode()
	local Buf = buffer.create(0)
	buffer.copy(Buf, 0, buffer.create(0), 0, 0)
	
	return Buf
end

function Module17.decode(Buf)
	-- upvalues: Module17 (copy), ProtoModule (copy)
	local NewModule = Module17.new()
	local v18 = 0
	while v18 < buffer.len(Buf) do
		local _, Tag2
		_, Tag2, v527 = ProtoModule.readTag(Buf, v18)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v527 = ProtoModule.readVarInt(Buf, v18)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v18)
			v18 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v527 = ProtoModule.readFixed32(Buf, v18)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v527 = ProtoModule.readFixed64(Buf, v18)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module17:jsonEncode()
	return {}
end

function Module17:jsonDecode()
	-- upvalues: Module17 (copy)
	return (Module17.new())
end

Module17.descriptor = {
	name = "PlayButtonClickAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.PlayButtonClickAction_Params = Module17
TypeRegistryModule.default:register(t.PlayButtonClickAction_Params)
local Module18 = {}
Module18.__index = Module18

function Module18.new(p1)
	-- upvalues: t (copy), Module18 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module18))
end

function Module18:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module18.decode(Buf)
	-- upvalues: Module18 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module18.new()
	local v19 = 0
	while v19 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v543 = ProtoModule.readTag(Buf, v19)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v543 = ProtoModule.readVarIntI32(Buf, v19)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v543 = ProtoModule.readVarInt(Buf, v19)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v543 = ProtoModule.readBuffer(Buf, v19)
				NewModule.action_params = t.UpdateUserSettingsAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v19)
				v19 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v543 = ProtoModule.readFixed32(Buf, v19)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v543 = ProtoModule.readFixed64(Buf, v19)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module18:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module18:jsonDecode()
	-- upvalues: Module18 (copy), t (copy)
	local NewModule = Module18.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.UpdateUserSettingsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.UpdateUserSettingsAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module18.descriptor = {
	name = "UpdateUserSettingsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.UpdateUserSettingsAction"
}
t.UpdateUserSettingsAction = Module18
TypeRegistryModule.default:register(t.UpdateUserSettingsAction)
local Module19 = {}
Module19.__index = Module19

function Module19.new(p1)
	-- upvalues: Module19 (copy)
	return (setmetatable({
		settings = if p1 == nil or p1.settings == nil then nil else p1.settings,
		audit_data = if p1 == nil or p1.audit_data == nil then nil else p1.audit_data
	}, Module19))
end

function Module19:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.settings ~= nil then
		local EncodeResult = self.settings:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.audit_data ~= nil then
		local EncodeResult = self.audit_data:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module19.decode(Buf)
	-- upvalues: Module19 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module19.new()
	local v20 = 0
	while v20 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v564 = ProtoModule.readTag(Buf, v20)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v564 = ProtoModule.readVarInt(Buf, v20)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v564 = ProtoModule.readBuffer(Buf, v20)
				NewModule.settings = PropTypesModule.StructProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v564 = ProtoModule.readBuffer(Buf, v20)
				NewModule.audit_data = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v20)
				v20 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v564 = ProtoModule.readFixed32(Buf, v20)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v564 = ProtoModule.readFixed64(Buf, v20)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module19:jsonEncode()
	local t = {}
	
	if self.settings ~= nil then
		t.settings = self.settings:jsonEncode()
	end
	if self.audit_data ~= nil then
		t.auditData = self.audit_data:jsonEncode()
	end
	return t
end

function Module19:jsonDecode()
	-- upvalues: Module19 (copy), PropTypesModule (copy)
	local NewModule = Module19.new()
	
	if self.settings ~= nil then
		NewModule.settings = PropTypesModule.StructProp.jsonDecode(self.settings)
	end
	if self.audit_data ~= nil then
		NewModule.audit_data = PropTypesModule.StringProp.jsonDecode(self.audit_data)
	end
	if self.auditData ~= nil then
		NewModule.audit_data = PropTypesModule.StringProp.jsonDecode(self.auditData)
	end
	return NewModule
end

Module19.descriptor = {
	name = "UpdateUserSettingsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.UpdateUserSettingsAction_Params = Module19
TypeRegistryModule.default:register(t.UpdateUserSettingsAction_Params)
local Module20 = {}
Module20.__index = Module20

function Module20.new(p1)
	-- upvalues: t (copy), Module20 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module20))
end

function Module20:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module20.decode(Buf)
	-- upvalues: Module20 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module20.new()
	local v21 = 0
	while v21 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v584 = ProtoModule.readTag(Buf, v21)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v584 = ProtoModule.readVarIntI32(Buf, v21)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v584 = ProtoModule.readVarInt(Buf, v21)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v584 = ProtoModule.readBuffer(Buf, v21)
				NewModule.action_params = t.OpenTooltipAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v21)
				v21 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v584 = ProtoModule.readFixed32(Buf, v21)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v584 = ProtoModule.readFixed64(Buf, v21)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module20:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module20:jsonDecode()
	-- upvalues: Module20 (copy), t (copy)
	local NewModule = Module20.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenTooltipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenTooltipAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module20.descriptor = {
	name = "OpenTooltipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenTooltipAction"
}
t.OpenTooltipAction = Module20
TypeRegistryModule.default:register(t.OpenTooltipAction)
local Module21 = {}
Module21.__index = Module21

function Module21.new(p1)
	-- upvalues: Module21 (copy)
	return (setmetatable({
		tooltip_title = if p1 == nil or p1.tooltip_title == nil then nil else p1.tooltip_title,
		tooltip_info_text = if p1 == nil or p1.tooltip_info_text == nil then nil else p1.tooltip_info_text
	}, Module21))
end

function Module21:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.tooltip_title ~= nil then
		local EncodeResult = self.tooltip_title:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.tooltip_info_text ~= nil then
		local EncodeResult = self.tooltip_info_text:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module21.decode(Buf)
	-- upvalues: Module21 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module21.new()
	local v22 = 0
	while v22 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v605 = ProtoModule.readTag(Buf, v22)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v605 = ProtoModule.readVarInt(Buf, v22)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v605 = ProtoModule.readBuffer(Buf, v22)
				NewModule.tooltip_title = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v605 = ProtoModule.readBuffer(Buf, v22)
				NewModule.tooltip_info_text = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v22)
				v22 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v605 = ProtoModule.readFixed32(Buf, v22)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v605 = ProtoModule.readFixed64(Buf, v22)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module21:jsonEncode()
	local t = {}
	
	if self.tooltip_title ~= nil then
		t.tooltipTitle = self.tooltip_title:jsonEncode()
	end
	if self.tooltip_info_text ~= nil then
		t.tooltipInfoText = self.tooltip_info_text:jsonEncode()
	end
	return t
end

function Module21:jsonDecode()
	-- upvalues: Module21 (copy), PropTypesModule (copy)
	local NewModule = Module21.new()
	
	if self.tooltip_title ~= nil then
		NewModule.tooltip_title = PropTypesModule.StringProp.jsonDecode(self.tooltip_title)
	end
	if self.tooltipTitle ~= nil then
		NewModule.tooltip_title = PropTypesModule.StringProp.jsonDecode(self.tooltipTitle)
	end
	if self.tooltip_info_text ~= nil then
		NewModule.tooltip_info_text = PropTypesModule.StringProp.jsonDecode(self.tooltip_info_text)
	end
	if self.tooltipInfoText ~= nil then
		NewModule.tooltip_info_text = PropTypesModule.StringProp.jsonDecode(self.tooltipInfoText)
	end
	return NewModule
end

Module21.descriptor = {
	name = "OpenTooltipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenTooltipAction_Params = Module21
TypeRegistryModule.default:register(t.OpenTooltipAction_Params)
local Module22 = {}
Module22.__index = Module22

function Module22.new(p1)
	-- upvalues: t (copy), Module22 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module22))
end

function Module22:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module22.decode(Buf)
	-- upvalues: Module22 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module22.new()
	local v23 = 0
	while v23 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v625 = ProtoModule.readTag(Buf, v23)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v625 = ProtoModule.readVarIntI32(Buf, v23)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v625 = ProtoModule.readVarInt(Buf, v23)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v625 = ProtoModule.readBuffer(Buf, v23)
				NewModule.action_params = t.OpenBadgeDetailsAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v23)
				v23 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v625 = ProtoModule.readFixed32(Buf, v23)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v625 = ProtoModule.readFixed64(Buf, v23)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module22:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module22:jsonDecode()
	-- upvalues: Module22 (copy), t (copy)
	local NewModule = Module22.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenBadgeDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenBadgeDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module22.descriptor = {
	name = "OpenBadgeDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenBadgeDetailsAction"
}
t.OpenBadgeDetailsAction = Module22
TypeRegistryModule.default:register(t.OpenBadgeDetailsAction)
local Module23 = {}
Module23.__index = Module23

function Module23.new(p1)
	-- upvalues: Module23 (copy)
	return (setmetatable({
		badge_id = if p1 == nil or p1.badge_id == nil then nil else p1.badge_id,
		title_text = if p1 == nil or p1.title_text == nil then nil else p1.title_text
	}, Module23))
end

function Module23:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.badge_id ~= nil then
		local EncodeResult = self.badge_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.title_text ~= nil then
		local EncodeResult = self.title_text:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module23.decode(Buf)
	-- upvalues: Module23 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module23.new()
	local v24 = 0
	while v24 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v646 = ProtoModule.readTag(Buf, v24)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v646 = ProtoModule.readVarInt(Buf, v24)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v646 = ProtoModule.readBuffer(Buf, v24)
				NewModule.badge_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v646 = ProtoModule.readBuffer(Buf, v24)
				NewModule.title_text = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v24)
				v24 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v646 = ProtoModule.readFixed32(Buf, v24)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v646 = ProtoModule.readFixed64(Buf, v24)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module23:jsonEncode()
	local t = {}
	
	if self.badge_id ~= nil then
		t.badgeId = self.badge_id:jsonEncode()
	end
	if self.title_text ~= nil then
		t.titleText = self.title_text:jsonEncode()
	end
	return t
end

function Module23:jsonDecode()
	-- upvalues: Module23 (copy), PropTypesModule (copy)
	local NewModule = Module23.new()
	
	if self.badge_id ~= nil then
		NewModule.badge_id = PropTypesModule.StringProp.jsonDecode(self.badge_id)
	end
	if self.badgeId ~= nil then
		NewModule.badge_id = PropTypesModule.StringProp.jsonDecode(self.badgeId)
	end
	if self.title_text ~= nil then
		NewModule.title_text = PropTypesModule.StringProp.jsonDecode(self.title_text)
	end
	if self.titleText ~= nil then
		NewModule.title_text = PropTypesModule.StringProp.jsonDecode(self.titleText)
	end
	return NewModule
end

Module23.descriptor = {
	name = "OpenBadgeDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenBadgeDetailsAction_Params = Module23
TypeRegistryModule.default:register(t.OpenBadgeDetailsAction_Params)
local Module24 = {}
Module24.__index = Module24

function Module24.new(p1)
	-- upvalues: t (copy), Module24 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module24))
end

function Module24:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module24.decode(Buf)
	-- upvalues: Module24 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module24.new()
	local v25 = 0
	while v25 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v666 = ProtoModule.readTag(Buf, v25)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v666 = ProtoModule.readVarIntI32(Buf, v25)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v666 = ProtoModule.readVarInt(Buf, v25)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v666 = ProtoModule.readBuffer(Buf, v25)
				NewModule.action_params = t.LoadMoreFromApiAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v25)
				v25 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v666 = ProtoModule.readFixed32(Buf, v25)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v666 = ProtoModule.readFixed64(Buf, v25)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module24:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module24:jsonDecode()
	-- upvalues: Module24 (copy), t (copy)
	local NewModule = Module24.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.LoadMoreFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.LoadMoreFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module24.descriptor = {
	name = "LoadMoreFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LoadMoreFromApiAction"
}
t.LoadMoreFromApiAction = Module24
TypeRegistryModule.default:register(t.LoadMoreFromApiAction)
local Module25 = {}
Module25.__index = Module25

function Module25.new(p1)
	-- upvalues: Module25 (copy)
	return (setmetatable({
		surface_key = if p1 == nil or p1.surface_key == nil then nil else p1.surface_key,
		config_key = if p1 == nil or p1.config_key == nil then nil else p1.config_key
	}, Module25))
end

function Module25:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.surface_key ~= nil then
		local EncodeResult = self.surface_key:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.config_key ~= nil then
		local EncodeResult = self.config_key:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module25.decode(Buf)
	-- upvalues: Module25 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module25.new()
	local v26 = 0
	while v26 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v687 = ProtoModule.readTag(Buf, v26)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v687 = ProtoModule.readVarInt(Buf, v26)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v687 = ProtoModule.readBuffer(Buf, v26)
				NewModule.surface_key = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v687 = ProtoModule.readBuffer(Buf, v26)
				NewModule.config_key = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v26)
				v26 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v687 = ProtoModule.readFixed32(Buf, v26)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v687 = ProtoModule.readFixed64(Buf, v26)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module25:jsonEncode()
	local t = {}
	
	if self.surface_key ~= nil then
		t.surfaceKey = self.surface_key:jsonEncode()
	end
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	return t
end

function Module25:jsonDecode()
	-- upvalues: Module25 (copy), PropTypesModule (copy)
	local NewModule = Module25.new()
	
	if self.surface_key ~= nil then
		NewModule.surface_key = PropTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		NewModule.surface_key = PropTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.config_key ~= nil then
		NewModule.config_key = PropTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		NewModule.config_key = PropTypesModule.StringProp.jsonDecode(self.configKey)
	end
	return NewModule
end

Module25.descriptor = {
	name = "LoadMoreFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LoadMoreFromApiAction_Params = Module25
TypeRegistryModule.default:register(t.LoadMoreFromApiAction_Params)
local Module26 = {}
Module26.__index = Module26

function Module26.new(p1)
	-- upvalues: t (copy), Module26 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module26))
end

function Module26:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module26.decode(Buf)
	-- upvalues: Module26 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module26.new()
	local v27 = 0
	while v27 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v707 = ProtoModule.readTag(Buf, v27)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v707 = ProtoModule.readVarIntI32(Buf, v27)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v707 = ProtoModule.readVarInt(Buf, v27)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v707 = ProtoModule.readBuffer(Buf, v27)
				NewModule.action_params = t.ShareAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v27)
				v27 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v707 = ProtoModule.readFixed32(Buf, v27)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v707 = ProtoModule.readFixed64(Buf, v27)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module26:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module26:jsonDecode()
	-- upvalues: Module26 (copy), t (copy)
	local NewModule = Module26.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.ShareAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.ShareAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module26.descriptor = {
	name = "ShareAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareAction"
}
t.ShareAction = Module26
TypeRegistryModule.default:register(t.ShareAction)
local Module27 = {}
Module27.__index = Module27

function Module27.new(p1)
	-- upvalues: Module27 (copy)
	return (setmetatable({
		oneof_prop = if p1 == nil or p1.oneof_prop == nil then nil else p1.oneof_prop
	}, Module27))
end

function Module27:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "generic_share_link_data" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "share_link_fetch_data" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module27.decode(Buf)
	-- upvalues: Module27 (copy), ProtoModule (copy), ShareLinkDataModule (copy)
	local NewModule = Module27.new()
	local v28 = 0
	while v28 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v728 = ProtoModule.readTag(Buf, v28)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v728 = ProtoModule.readVarInt(Buf, v28)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v728 = ProtoModule.readBuffer(Buf, v28)
				NewModule.oneof_prop = {
					type = "generic_share_link_data",
					value = ShareLinkDataModule.GenericShareLinkData.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v728 = ProtoModule.readBuffer(Buf, v28)
				NewModule.oneof_prop = {
					type = "share_link_fetch_data",
					value = ShareLinkDataModule.ShareLinkFetchData.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v28)
				v28 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v728 = ProtoModule.readFixed32(Buf, v28)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v728 = ProtoModule.readFixed64(Buf, v28)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module27:jsonEncode()
	local t = {}
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "generic_share_link_data" then
			t.genericShareLinkData = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "share_link_fetch_data" then
			t.shareLinkFetchData = self.oneof_prop.value:jsonEncode()
		end
	end
	return t
end

function Module27:jsonDecode()
	-- upvalues: Module27 (copy), ShareLinkDataModule (copy)
	local NewModule = Module27.new()
	
	if self.generic_share_link_data ~= nil then
		NewModule.oneof_prop = {
			type = "generic_share_link_data",
			value = ShareLinkDataModule.GenericShareLinkData.jsonDecode(self.generic_share_link_data)
		}
	end
	if self.genericShareLinkData ~= nil then
		NewModule.oneof_prop = {
			type = "generic_share_link_data",
			value = ShareLinkDataModule.GenericShareLinkData.jsonDecode(self.genericShareLinkData)
		}
	end
	if self.share_link_fetch_data ~= nil then
		NewModule.oneof_prop = {
			type = "share_link_fetch_data",
			value = ShareLinkDataModule.ShareLinkFetchData.jsonDecode(self.share_link_fetch_data)
		}
	end
	if self.shareLinkFetchData ~= nil then
		NewModule.oneof_prop = {
			type = "share_link_fetch_data",
			value = ShareLinkDataModule.ShareLinkFetchData.jsonDecode(self.shareLinkFetchData)
		}
	end
	return NewModule
end

Module27.descriptor = {
	name = "ShareAction_ShareLinkData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkData"
}
t.ShareAction_ShareLinkData = Module27
TypeRegistryModule.default:register(t.ShareAction_ShareLinkData)
local Module28 = {}
Module28.__index = Module28

function Module28.new(p1)
	-- upvalues: Module28 (copy)
	return (setmetatable({
		share_link_type = if p1 == nil or p1.share_link_type == nil then nil else p1.share_link_type,
		share_link_data = if p1 == nil or p1.share_link_data == nil then nil else p1.share_link_data,
		entry_point_key = if p1 == nil or p1.entry_point_key == nil then nil else p1.entry_point_key
	}, Module28))
end

function Module28:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.share_link_type ~= nil then
		local EncodeResult = self.share_link_type:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.share_link_data ~= nil then
		local EncodeResult = self.share_link_data:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.entry_point_key ~= nil then
		local EncodeResult = self.entry_point_key:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module28.decode(Buf)
	-- upvalues: Module28 (copy), ProtoModule (copy), PropTypesModule (copy), t (copy)
	local NewModule = Module28.new()
	local v29 = 0
	while v29 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v752 = ProtoModule.readTag(Buf, v29)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v752 = ProtoModule.readVarInt(Buf, v29)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v752 = ProtoModule.readBuffer(Buf, v29)
				NewModule.share_link_type = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v752 = ProtoModule.readBuffer(Buf, v29)
				NewModule.share_link_data = t.ShareAction_ShareLinkData.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v752 = ProtoModule.readBuffer(Buf, v29)
				NewModule.entry_point_key = PropTypesModule.StringProp.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v29)
				v29 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v752 = ProtoModule.readFixed32(Buf, v29)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v752 = ProtoModule.readFixed64(Buf, v29)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module28:jsonEncode()
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

function Module28:jsonDecode()
	-- upvalues: Module28 (copy), PropTypesModule (copy), t (copy)
	local NewModule = Module28.new()
	
	if self.share_link_type ~= nil then
		NewModule.share_link_type = PropTypesModule.StringProp.jsonDecode(self.share_link_type)
	end
	if self.shareLinkType ~= nil then
		NewModule.share_link_type = PropTypesModule.StringProp.jsonDecode(self.shareLinkType)
	end
	if self.share_link_data ~= nil then
		NewModule.share_link_data = t.ShareAction_ShareLinkData.jsonDecode(self.share_link_data)
	end
	if self.shareLinkData ~= nil then
		NewModule.share_link_data = t.ShareAction_ShareLinkData.jsonDecode(self.shareLinkData)
	end
	if self.entry_point_key ~= nil then
		NewModule.entry_point_key = PropTypesModule.StringProp.jsonDecode(self.entry_point_key)
	end
	if self.entryPointKey ~= nil then
		NewModule.entry_point_key = PropTypesModule.StringProp.jsonDecode(self.entryPointKey)
	end
	return NewModule
end

Module28.descriptor = {
	name = "ShareAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ShareAction_Params = Module28
TypeRegistryModule.default:register(t.ShareAction_Params)
local Module29 = {}
Module29.__index = Module29

function Module29.new(p1)
	-- upvalues: t (copy), Module29 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module29))
end

function Module29:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module29.decode(Buf)
	-- upvalues: Module29 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module29.new()
	local v30 = 0
	while v30 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v773 = ProtoModule.readTag(Buf, v30)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v773 = ProtoModule.readVarIntI32(Buf, v30)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v773 = ProtoModule.readVarInt(Buf, v30)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v773 = ProtoModule.readBuffer(Buf, v30)
				NewModule.action_params = t.OpenAbuseReportAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v30)
				v30 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v773 = ProtoModule.readFixed32(Buf, v30)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v773 = ProtoModule.readFixed64(Buf, v30)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module29:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module29:jsonDecode()
	-- upvalues: Module29 (copy), t (copy)
	local NewModule = Module29.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenAbuseReportAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenAbuseReportAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module29.descriptor = {
	name = "OpenAbuseReportAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAbuseReportAction"
}
t.OpenAbuseReportAction = Module29
TypeRegistryModule.default:register(t.OpenAbuseReportAction)
local Module30 = {}
Module30.__index = Module30

function Module30.new(p1)
	-- upvalues: Module30 (copy)
	return (setmetatable({
		target_id = if p1 == nil or p1.target_id == nil then nil else p1.target_id,
		abuse_vector = if p1 == nil or p1.abuse_vector == nil then nil else p1.abuse_vector,
		asset_type_name = if p1 == nil or p1.asset_type_name == nil then nil else p1.asset_type_name,
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id
	}, Module30))
end

function Module30:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.target_id ~= nil then
		local EncodeResult = self.target_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.abuse_vector ~= nil then
		local EncodeResult = self.abuse_vector:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.asset_type_name ~= nil then
		local EncodeResult = self.asset_type_name:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module30.decode(Buf)
	-- upvalues: Module30 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module30.new()
	local v31 = 0
	while v31 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v800 = ProtoModule.readTag(Buf, v31)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v800 = ProtoModule.readVarInt(Buf, v31)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v800 = ProtoModule.readBuffer(Buf, v31)
				NewModule.target_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v800 = ProtoModule.readBuffer(Buf, v31)
				NewModule.abuse_vector = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v800 = ProtoModule.readBuffer(Buf, v31)
				NewModule.asset_type_name = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v800 = ProtoModule.readBuffer(Buf, v31)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v31)
				v31 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v800 = ProtoModule.readFixed32(Buf, v31)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v800 = ProtoModule.readFixed64(Buf, v31)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module30:jsonEncode()
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

function Module30:jsonDecode()
	-- upvalues: Module30 (copy), PropTypesModule (copy)
	local NewModule = Module30.new()
	
	if self.target_id ~= nil then
		NewModule.target_id = PropTypesModule.StringProp.jsonDecode(self.target_id)
	end
	if self.targetId ~= nil then
		NewModule.target_id = PropTypesModule.StringProp.jsonDecode(self.targetId)
	end
	if self.abuse_vector ~= nil then
		NewModule.abuse_vector = PropTypesModule.StringProp.jsonDecode(self.abuse_vector)
	end
	if self.abuseVector ~= nil then
		NewModule.abuse_vector = PropTypesModule.StringProp.jsonDecode(self.abuseVector)
	end
	if self.asset_type_name ~= nil then
		NewModule.asset_type_name = PropTypesModule.StringProp.jsonDecode(self.asset_type_name)
	end
	if self.assetTypeName ~= nil then
		NewModule.asset_type_name = PropTypesModule.StringProp.jsonDecode(self.assetTypeName)
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return NewModule
end

Module30.descriptor = {
	name = "OpenAbuseReportAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAbuseReportAction_Params = Module30
TypeRegistryModule.default:register(t.OpenAbuseReportAction_Params)
local Module31 = {}
Module31.__index = Module31

function Module31.new(p1)
	-- upvalues: t (copy), Module31 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module31))
end

function Module31:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module31.decode(Buf)
	-- upvalues: Module31 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module31.new()
	local v32 = 0
	while v32 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v822 = ProtoModule.readTag(Buf, v32)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v822 = ProtoModule.readVarIntI32(Buf, v32)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v822 = ProtoModule.readVarInt(Buf, v32)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v822 = ProtoModule.readBuffer(Buf, v32)
				NewModule.action_params = t.RemoveBadgeFromInventoryAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v32)
				v32 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v822 = ProtoModule.readFixed32(Buf, v32)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v822 = ProtoModule.readFixed64(Buf, v32)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module31:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module31:jsonDecode()
	-- upvalues: Module31 (copy), t (copy)
	local NewModule = Module31.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.RemoveBadgeFromInventoryAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.RemoveBadgeFromInventoryAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module31.descriptor = {
	name = "RemoveBadgeFromInventoryAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RemoveBadgeFromInventoryAction"
}
t.RemoveBadgeFromInventoryAction = Module31
TypeRegistryModule.default:register(t.RemoveBadgeFromInventoryAction)
local Module32 = {}
Module32.__index = Module32

function Module32.new(p1)
	-- upvalues: Module32 (copy)
	return (setmetatable({
		asset_id = if p1 == nil or p1.asset_id == nil then nil else p1.asset_id
	}, Module32))
end

function Module32:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.asset_id ~= nil then
		local EncodeResult = self.asset_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module32.decode(Buf)
	-- upvalues: Module32 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module32.new()
	local v33 = 0
	while v33 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v840 = ProtoModule.readTag(Buf, v33)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v840 = ProtoModule.readVarInt(Buf, v33)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v840 = ProtoModule.readBuffer(Buf, v33)
				NewModule.asset_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v33)
				v33 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v840 = ProtoModule.readFixed32(Buf, v33)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v840 = ProtoModule.readFixed64(Buf, v33)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module32:jsonEncode()
	local t = {}
	
	if self.asset_id ~= nil then
		t.assetId = self.asset_id:jsonEncode()
	end
	return t
end

function Module32:jsonDecode()
	-- upvalues: Module32 (copy), PropTypesModule (copy)
	local NewModule = Module32.new()
	
	if self.asset_id ~= nil then
		NewModule.asset_id = PropTypesModule.StringProp.jsonDecode(self.asset_id)
	end
	if self.assetId ~= nil then
		NewModule.asset_id = PropTypesModule.StringProp.jsonDecode(self.assetId)
	end
	return NewModule
end

Module32.descriptor = {
	name = "RemoveBadgeFromInventoryAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RemoveBadgeFromInventoryAction_Params = Module32
TypeRegistryModule.default:register(t.RemoveBadgeFromInventoryAction_Params)
local Module33 = {}
Module33.__index = Module33

function Module33.new(p1)
	-- upvalues: t (copy), Module33 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module33))
end

function Module33:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module33.decode(Buf)
	-- upvalues: Module33 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module33.new()
	local v34 = 0
	while v34 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v859 = ProtoModule.readTag(Buf, v34)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v859 = ProtoModule.readVarIntI32(Buf, v34)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v859 = ProtoModule.readVarInt(Buf, v34)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v859 = ProtoModule.readBuffer(Buf, v34)
				NewModule.action_params = t.OpenProfileAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v34)
				v34 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v859 = ProtoModule.readFixed32(Buf, v34)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v859 = ProtoModule.readFixed64(Buf, v34)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module33:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module33:jsonDecode()
	-- upvalues: Module33 (copy), t (copy)
	local NewModule = Module33.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenProfileAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenProfileAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module33.descriptor = {
	name = "OpenProfileAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenProfileAction"
}
t.OpenProfileAction = Module33
TypeRegistryModule.default:register(t.OpenProfileAction)
local Module34 = {}
Module34.__index = Module34

function Module34.new(p1)
	-- upvalues: Module34 (copy)
	return (setmetatable({
		profile_id = if p1 == nil or p1.profile_id == nil then nil else p1.profile_id,
		profile_type = if p1 == nil or p1.profile_type == nil then nil else p1.profile_type,
		source = if p1 == nil or p1.source == nil then nil else p1.source
	}, Module34))
end

function Module34:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.profile_id ~= nil then
		local EncodeResult = self.profile_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.profile_type ~= nil then
		local EncodeResult = self.profile_type:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.source ~= nil then
		local EncodeResult = self.source:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module34.decode(Buf)
	-- upvalues: Module34 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module34.new()
	local v35 = 0
	while v35 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v883 = ProtoModule.readTag(Buf, v35)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v883 = ProtoModule.readVarInt(Buf, v35)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v883 = ProtoModule.readBuffer(Buf, v35)
				NewModule.profile_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v883 = ProtoModule.readBuffer(Buf, v35)
				NewModule.profile_type = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v883 = ProtoModule.readBuffer(Buf, v35)
				NewModule.source = PropTypesModule.StringProp.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v35)
				v35 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v883 = ProtoModule.readFixed32(Buf, v35)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v883 = ProtoModule.readFixed64(Buf, v35)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module34:jsonEncode()
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

function Module34:jsonDecode()
	-- upvalues: Module34 (copy), PropTypesModule (copy)
	local NewModule = Module34.new()
	
	if self.profile_id ~= nil then
		NewModule.profile_id = PropTypesModule.StringProp.jsonDecode(self.profile_id)
	end
	if self.profileId ~= nil then
		NewModule.profile_id = PropTypesModule.StringProp.jsonDecode(self.profileId)
	end
	if self.profile_type ~= nil then
		NewModule.profile_type = PropTypesModule.StringProp.jsonDecode(self.profile_type)
	end
	if self.profileType ~= nil then
		NewModule.profile_type = PropTypesModule.StringProp.jsonDecode(self.profileType)
	end
	if self.source ~= nil then
		NewModule.source = PropTypesModule.StringProp.jsonDecode(self.source)
	end
	return NewModule
end

Module34.descriptor = {
	name = "OpenProfileAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenProfileAction_Params = Module34
TypeRegistryModule.default:register(t.OpenProfileAction_Params)
local Module35 = {}
Module35.__index = Module35

function Module35.new(p1)
	-- upvalues: t (copy), Module35 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module35))
end

function Module35:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module35.decode(Buf)
	-- upvalues: Module35 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module35.new()
	local v36 = 0
	while v36 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v904 = ProtoModule.readTag(Buf, v36)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v904 = ProtoModule.readVarIntI32(Buf, v36)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v904 = ProtoModule.readVarInt(Buf, v36)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v904 = ProtoModule.readBuffer(Buf, v36)
				NewModule.action_params = t.OpenFacialAgeEstimationAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v36)
				v36 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v904 = ProtoModule.readFixed32(Buf, v36)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v904 = ProtoModule.readFixed64(Buf, v36)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module35:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module35:jsonDecode()
	-- upvalues: Module35 (copy), t (copy)
	local NewModule = Module35.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenFacialAgeEstimationAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenFacialAgeEstimationAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module35.descriptor = {
	name = "OpenFacialAgeEstimationAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenFacialAgeEstimationAction"
}
t.OpenFacialAgeEstimationAction = Module35
TypeRegistryModule.default:register(t.OpenFacialAgeEstimationAction)
local Module36 = {}
Module36.__index = Module36

function Module36.new(p1)
	-- upvalues: Module36 (copy)
	return (setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then nil else p1.user_id,
		source = if p1 == nil or p1.source == nil then nil else p1.source,
		context = if p1 == nil or p1.context == nil then nil else p1.context,
		is_in_experience = if p1 == nil or p1.is_in_experience == nil then nil else p1.is_in_experience,
		on_success = if p1 == nil or p1.on_success == nil then nil else p1.on_success,
		on_failure = if p1 == nil or p1.on_failure == nil then nil else p1.on_failure
	}, Module36))
end

function Module36:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.user_id ~= nil then
		local EncodeResult = self.user_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.source ~= nil then
		local EncodeResult = self.source:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.context ~= nil then
		local EncodeResult = self.context:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.is_in_experience ~= nil then
		local EncodeResult = self.is_in_experience:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	if self.on_success ~= nil then
		local EncodeResult = self.on_success:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	if self.on_failure ~= nil then
		local EncodeResult = self.on_failure:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module36.decode(Buf)
	-- upvalues: Module36 (copy), ProtoModule (copy), PropTypesModule (copy), t (copy)
	local NewModule = Module36.new()
	local v37 = 0
	while v37 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v937 = ProtoModule.readTag(Buf, v37)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v937 = ProtoModule.readVarInt(Buf, v37)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v937 = ProtoModule.readBuffer(Buf, v37)
				NewModule.user_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v937 = ProtoModule.readBuffer(Buf, v37)
				NewModule.source = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v937 = ProtoModule.readBuffer(Buf, v37)
				NewModule.context = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v937 = ProtoModule.readBuffer(Buf, v37)
				NewModule.is_in_experience = PropTypesModule.BoolProp.decode(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v937 = ProtoModule.readBuffer(Buf, v37)
				NewModule.on_success = t.ActionProp.decode(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v937 = ProtoModule.readBuffer(Buf, v37)
				NewModule.on_failure = t.ActionProp.decode(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v37)
				v37 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v937 = ProtoModule.readFixed32(Buf, v37)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v937 = ProtoModule.readFixed64(Buf, v37)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module36:jsonEncode()
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

function Module36:jsonDecode()
	-- upvalues: Module36 (copy), PropTypesModule (copy), t (copy)
	local NewModule = Module36.new()
	
	if self.user_id ~= nil then
		NewModule.user_id = PropTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		NewModule.user_id = PropTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		NewModule.source = PropTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.context ~= nil then
		NewModule.context = PropTypesModule.StringProp.jsonDecode(self.context)
	end
	if self.is_in_experience ~= nil then
		NewModule.is_in_experience = PropTypesModule.BoolProp.jsonDecode(self.is_in_experience)
	end
	if self.isInExperience ~= nil then
		NewModule.is_in_experience = PropTypesModule.BoolProp.jsonDecode(self.isInExperience)
	end
	if self.on_success ~= nil then
		NewModule.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		NewModule.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		NewModule.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		NewModule.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	return NewModule
end

Module36.descriptor = {
	name = "OpenFacialAgeEstimationAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenFacialAgeEstimationAction_Params = Module36
TypeRegistryModule.default:register(t.OpenFacialAgeEstimationAction_Params)
local Module37 = {}
Module37.__index = Module37

function Module37.new(p1)
	-- upvalues: t (copy), Module37 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module37))
end

function Module37:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module37.decode(Buf)
	-- upvalues: Module37 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module37.new()
	local v38 = 0
	while v38 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v961 = ProtoModule.readTag(Buf, v38)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v961 = ProtoModule.readVarIntI32(Buf, v38)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v961 = ProtoModule.readVarInt(Buf, v38)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v961 = ProtoModule.readBuffer(Buf, v38)
				NewModule.action_params = t.OpenPhoneUpsellModalAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v38)
				v38 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v961 = ProtoModule.readFixed32(Buf, v38)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v961 = ProtoModule.readFixed64(Buf, v38)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module37:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module37:jsonDecode()
	-- upvalues: Module37 (copy), t (copy)
	local NewModule = Module37.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenPhoneUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenPhoneUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module37.descriptor = {
	name = "OpenPhoneUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenPhoneUpsellModalAction"
}
t.OpenPhoneUpsellModalAction = Module37
TypeRegistryModule.default:register(t.OpenPhoneUpsellModalAction)
local Module38 = {}
Module38.__index = Module38

function Module38.new(p1)
	-- upvalues: Module38 (copy)
	return (setmetatable({
		voice_opt_in = if p1 == nil or p1.voice_opt_in == nil then nil else p1.voice_opt_in,
		event_context = if p1 == nil or p1.event_context == nil then nil else p1.event_context,
		origin = if p1 == nil or p1.origin == nil then nil else p1.origin,
		should_autofill_android_phone_number_at_launch = if p1 == nil or p1.should_autofill_android_phone_number_at_launch == nil then nil else p1.should_autofill_android_phone_number_at_launch,
		add_phone_description_key = if p1 == nil or p1.add_phone_description_key == nil then nil else p1.add_phone_description_key,
		on_success = if p1 == nil or p1.on_success == nil then nil else p1.on_success,
		on_failure = if p1 == nil or p1.on_failure == nil then nil else p1.on_failure,
		on_cancelled = if p1 == nil or p1.on_cancelled == nil then nil else p1.on_cancelled
	}, Module38))
end

function Module38:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.voice_opt_in ~= nil then
		local EncodeResult = self.voice_opt_in:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.event_context ~= nil then
		local EncodeResult = self.event_context:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.origin ~= nil then
		local EncodeResult = self.origin:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		local EncodeResult = self.should_autofill_android_phone_number_at_launch:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	if self.add_phone_description_key ~= nil then
		local EncodeResult = self.add_phone_description_key:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	if self.on_success ~= nil then
		local EncodeResult = self.on_success:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	if self.on_failure ~= nil then
		local EncodeResult = self.on_failure:encode()
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, EncodeResult, buffer.len(EncodeResult))
	end
	if self.on_cancelled ~= nil then
		local EncodeResult = self.on_cancelled:encode()
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module38.decode(Buf)
	-- upvalues: Module38 (copy), ProtoModule (copy), PropTypesModule (copy), t (copy)
	local NewModule = Module38.new()
	local v39 = 0
	while v39 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1000 = ProtoModule.readTag(Buf, v39)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1000 = ProtoModule.readVarInt(Buf, v39)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1000 = ProtoModule.readBuffer(Buf, v39)
				NewModule.voice_opt_in = PropTypesModule.BoolProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1000 = ProtoModule.readBuffer(Buf, v39)
				NewModule.event_context = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1000 = ProtoModule.readBuffer(Buf, v39)
				NewModule.origin = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1000 = ProtoModule.readBuffer(Buf, v39)
				NewModule.should_autofill_android_phone_number_at_launch = PropTypesModule.BoolProp.decode(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v1000 = ProtoModule.readBuffer(Buf, v39)
				NewModule.add_phone_description_key = PropTypesModule.StringProp.decode(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v1000 = ProtoModule.readBuffer(Buf, v39)
				NewModule.on_success = t.ActionProp.decode(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v1000 = ProtoModule.readBuffer(Buf, v39)
				NewModule.on_failure = t.ActionProp.decode(Buffer7)
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v1000 = ProtoModule.readBuffer(Buf, v39)
				NewModule.on_cancelled = t.ActionProp.decode(Buffer8)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v39)
				v39 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1000 = ProtoModule.readFixed32(Buf, v39)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1000 = ProtoModule.readFixed64(Buf, v39)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module38:jsonEncode()
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

function Module38:jsonDecode()
	-- upvalues: Module38 (copy), PropTypesModule (copy), t (copy)
	local NewModule = Module38.new()
	
	if self.voice_opt_in ~= nil then
		NewModule.voice_opt_in = PropTypesModule.BoolProp.jsonDecode(self.voice_opt_in)
	end
	if self.voiceOptIn ~= nil then
		NewModule.voice_opt_in = PropTypesModule.BoolProp.jsonDecode(self.voiceOptIn)
	end
	if self.event_context ~= nil then
		NewModule.event_context = PropTypesModule.StringProp.jsonDecode(self.event_context)
	end
	if self.eventContext ~= nil then
		NewModule.event_context = PropTypesModule.StringProp.jsonDecode(self.eventContext)
	end
	if self.origin ~= nil then
		NewModule.origin = PropTypesModule.StringProp.jsonDecode(self.origin)
	end
	if self.should_autofill_android_phone_number_at_launch ~= nil then
		NewModule.should_autofill_android_phone_number_at_launch = PropTypesModule.BoolProp.jsonDecode(self.should_autofill_android_phone_number_at_launch)
	end
	if self.shouldAutofillAndroidPhoneNumberAtLaunch ~= nil then
		NewModule.should_autofill_android_phone_number_at_launch = PropTypesModule.BoolProp.jsonDecode(self.shouldAutofillAndroidPhoneNumberAtLaunch)
	end
	if self.add_phone_description_key ~= nil then
		NewModule.add_phone_description_key = PropTypesModule.StringProp.jsonDecode(self.add_phone_description_key)
	end
	if self.addPhoneDescriptionKey ~= nil then
		NewModule.add_phone_description_key = PropTypesModule.StringProp.jsonDecode(self.addPhoneDescriptionKey)
	end
	if self.on_success ~= nil then
		NewModule.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		NewModule.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		NewModule.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		NewModule.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	if self.on_cancelled ~= nil then
		NewModule.on_cancelled = t.ActionProp.jsonDecode(self.on_cancelled)
	end
	if self.onCancelled ~= nil then
		NewModule.on_cancelled = t.ActionProp.jsonDecode(self.onCancelled)
	end
	return NewModule
end

Module38.descriptor = {
	name = "OpenPhoneUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenPhoneUpsellModalAction_Params = Module38
TypeRegistryModule.default:register(t.OpenPhoneUpsellModalAction_Params)
local Module39 = {}
Module39.__index = Module39

function Module39.new(p1)
	-- upvalues: t (copy), Module39 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module39))
end

function Module39:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module39.decode(Buf)
	-- upvalues: Module39 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module39.new()
	local v40 = 0
	while v40 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1026 = ProtoModule.readTag(Buf, v40)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1026 = ProtoModule.readVarIntI32(Buf, v40)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1026 = ProtoModule.readVarInt(Buf, v40)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1026 = ProtoModule.readBuffer(Buf, v40)
				NewModule.action_params = t.OpenEmailUpsellModalAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v40)
				v40 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1026 = ProtoModule.readFixed32(Buf, v40)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1026 = ProtoModule.readFixed64(Buf, v40)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module39:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module39:jsonDecode()
	-- upvalues: Module39 (copy), t (copy)
	local NewModule = Module39.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenEmailUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenEmailUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module39.descriptor = {
	name = "OpenEmailUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenEmailUpsellModalAction"
}
t.OpenEmailUpsellModalAction = Module39
TypeRegistryModule.default:register(t.OpenEmailUpsellModalAction)
local Module40 = {}
Module40.__index = Module40

function Module40.new(p1)
	-- upvalues: Module40 (copy)
	return (setmetatable({
		add_email_over13_text_key = if p1 == nil or p1.add_email_over13_text_key == nil then nil else p1.add_email_over13_text_key,
		add_email_title_key = if p1 == nil or p1.add_email_title_key == nil then nil else p1.add_email_title_key,
		is_email_modal_called_from_home_page = if p1 == nil or p1.is_email_modal_called_from_home_page == nil then nil else p1.is_email_modal_called_from_home_page,
		event_context = if p1 == nil or p1.event_context == nil then nil else p1.event_context,
		origin = if p1 == nil or p1.origin == nil then nil else p1.origin,
		section = if p1 == nil or p1.section == nil then nil else p1.section,
		on_success = if p1 == nil or p1.on_success == nil then nil else p1.on_success,
		on_failure = if p1 == nil or p1.on_failure == nil then nil else p1.on_failure
	}, Module40))
end

function Module40:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.add_email_over13_text_key ~= nil then
		local EncodeResult = self.add_email_over13_text_key:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.add_email_title_key ~= nil then
		local EncodeResult = self.add_email_title_key:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		local EncodeResult = self.is_email_modal_called_from_home_page:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.event_context ~= nil then
		local EncodeResult = self.event_context:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	if self.origin ~= nil then
		local EncodeResult = self.origin:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	if self.section ~= nil then
		local EncodeResult = self.section:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	if self.on_success ~= nil then
		local EncodeResult = self.on_success:encode()
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, EncodeResult, buffer.len(EncodeResult))
	end
	if self.on_failure ~= nil then
		local EncodeResult = self.on_failure:encode()
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module40.decode(Buf)
	-- upvalues: Module40 (copy), ProtoModule (copy), PropTypesModule (copy), t (copy)
	local NewModule = Module40.new()
	local v41 = 0
	while v41 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1065 = ProtoModule.readTag(Buf, v41)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1065 = ProtoModule.readVarInt(Buf, v41)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1065 = ProtoModule.readBuffer(Buf, v41)
				NewModule.add_email_over13_text_key = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1065 = ProtoModule.readBuffer(Buf, v41)
				NewModule.add_email_title_key = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1065 = ProtoModule.readBuffer(Buf, v41)
				NewModule.is_email_modal_called_from_home_page = PropTypesModule.BoolProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1065 = ProtoModule.readBuffer(Buf, v41)
				NewModule.event_context = PropTypesModule.StringProp.decode(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v1065 = ProtoModule.readBuffer(Buf, v41)
				NewModule.origin = PropTypesModule.StringProp.decode(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v1065 = ProtoModule.readBuffer(Buf, v41)
				NewModule.section = PropTypesModule.StringProp.decode(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v1065 = ProtoModule.readBuffer(Buf, v41)
				NewModule.on_success = t.ActionProp.decode(Buffer7)
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v1065 = ProtoModule.readBuffer(Buf, v41)
				NewModule.on_failure = t.ActionProp.decode(Buffer8)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v41)
				v41 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1065 = ProtoModule.readFixed32(Buf, v41)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1065 = ProtoModule.readFixed64(Buf, v41)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module40:jsonEncode()
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

function Module40:jsonDecode()
	-- upvalues: Module40 (copy), PropTypesModule (copy), t (copy)
	local NewModule = Module40.new()
	
	if self.add_email_over13_text_key ~= nil then
		NewModule.add_email_over13_text_key = PropTypesModule.StringProp.jsonDecode(self.add_email_over13_text_key)
	end
	if self.addEmailOver13TextKey ~= nil then
		NewModule.add_email_over13_text_key = PropTypesModule.StringProp.jsonDecode(self.addEmailOver13TextKey)
	end
	if self.add_email_title_key ~= nil then
		NewModule.add_email_title_key = PropTypesModule.StringProp.jsonDecode(self.add_email_title_key)
	end
	if self.addEmailTitleKey ~= nil then
		NewModule.add_email_title_key = PropTypesModule.StringProp.jsonDecode(self.addEmailTitleKey)
	end
	if self.is_email_modal_called_from_home_page ~= nil then
		NewModule.is_email_modal_called_from_home_page = PropTypesModule.BoolProp.jsonDecode(self.is_email_modal_called_from_home_page)
	end
	if self.isEmailModalCalledFromHomePage ~= nil then
		NewModule.is_email_modal_called_from_home_page = PropTypesModule.BoolProp.jsonDecode(self.isEmailModalCalledFromHomePage)
	end
	if self.event_context ~= nil then
		NewModule.event_context = PropTypesModule.StringProp.jsonDecode(self.event_context)
	end
	if self.eventContext ~= nil then
		NewModule.event_context = PropTypesModule.StringProp.jsonDecode(self.eventContext)
	end
	if self.origin ~= nil then
		NewModule.origin = PropTypesModule.StringProp.jsonDecode(self.origin)
	end
	if self.section ~= nil then
		NewModule.section = PropTypesModule.StringProp.jsonDecode(self.section)
	end
	if self.on_success ~= nil then
		NewModule.on_success = t.ActionProp.jsonDecode(self.on_success)
	end
	if self.onSuccess ~= nil then
		NewModule.on_success = t.ActionProp.jsonDecode(self.onSuccess)
	end
	if self.on_failure ~= nil then
		NewModule.on_failure = t.ActionProp.jsonDecode(self.on_failure)
	end
	if self.onFailure ~= nil then
		NewModule.on_failure = t.ActionProp.jsonDecode(self.onFailure)
	end
	return NewModule
end

Module40.descriptor = {
	name = "OpenEmailUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenEmailUpsellModalAction_Params = Module40
TypeRegistryModule.default:register(t.OpenEmailUpsellModalAction_Params)
local Module41 = {}
Module41.__index = Module41

function Module41.new(p1)
	-- upvalues: t (copy), Module41 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module41))
end

function Module41:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module41.decode(Buf)
	-- upvalues: Module41 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module41.new()
	local v42 = 0
	while v42 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1091 = ProtoModule.readTag(Buf, v42)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1091 = ProtoModule.readVarIntI32(Buf, v42)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1091 = ProtoModule.readVarInt(Buf, v42)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1091 = ProtoModule.readBuffer(Buf, v42)
				NewModule.action_params = t.OpenAddConnectionsPageAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v42)
				v42 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1091 = ProtoModule.readFixed32(Buf, v42)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1091 = ProtoModule.readFixed64(Buf, v42)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module41:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module41:jsonDecode()
	-- upvalues: Module41 (copy), t (copy)
	local NewModule = Module41.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenAddConnectionsPageAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenAddConnectionsPageAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module41.descriptor = {
	name = "OpenAddConnectionsPageAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAddConnectionsPageAction"
}
t.OpenAddConnectionsPageAction = Module41
TypeRegistryModule.default:register(t.OpenAddConnectionsPageAction)
local Module42 = {}
Module42.__index = Module42

function Module42.new(p1)
	-- upvalues: Module42 (copy)
	return (setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then nil else p1.user_id,
		source = if p1 == nil or p1.source == nil then nil else p1.source
	}, Module42))
end

function Module42:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.user_id ~= nil then
		local EncodeResult = self.user_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.source ~= nil then
		local EncodeResult = self.source:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module42.decode(Buf)
	-- upvalues: Module42 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module42.new()
	local v43 = 0
	while v43 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1112 = ProtoModule.readTag(Buf, v43)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1112 = ProtoModule.readVarInt(Buf, v43)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1112 = ProtoModule.readBuffer(Buf, v43)
				NewModule.user_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1112 = ProtoModule.readBuffer(Buf, v43)
				NewModule.source = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v43)
				v43 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1112 = ProtoModule.readFixed32(Buf, v43)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1112 = ProtoModule.readFixed64(Buf, v43)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module42:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function Module42:jsonDecode()
	-- upvalues: Module42 (copy), PropTypesModule (copy)
	local NewModule = Module42.new()
	
	if self.user_id ~= nil then
		NewModule.user_id = PropTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		NewModule.user_id = PropTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		NewModule.source = PropTypesModule.StringProp.jsonDecode(self.source)
	end
	return NewModule
end

Module42.descriptor = {
	name = "OpenAddConnectionsPageAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAddConnectionsPageAction_Params = Module42
TypeRegistryModule.default:register(t.OpenAddConnectionsPageAction_Params)
local Module43 = {}
Module43.__index = Module43

function Module43.new(p1)
	-- upvalues: t (copy), Module43 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module43))
end

function Module43:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module43.decode(Buf)
	-- upvalues: Module43 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module43.new()
	local v44 = 0
	while v44 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1132 = ProtoModule.readTag(Buf, v44)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1132 = ProtoModule.readVarIntI32(Buf, v44)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1132 = ProtoModule.readVarInt(Buf, v44)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1132 = ProtoModule.readBuffer(Buf, v44)
				NewModule.action_params = t.OpenMarketplaceAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v44)
				v44 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1132 = ProtoModule.readFixed32(Buf, v44)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1132 = ProtoModule.readFixed64(Buf, v44)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module43:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module43:jsonDecode()
	-- upvalues: Module43 (copy), t (copy)
	local NewModule = Module43.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenMarketplaceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenMarketplaceAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module43.descriptor = {
	name = "OpenMarketplaceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceAction"
}
t.OpenMarketplaceAction = Module43
TypeRegistryModule.default:register(t.OpenMarketplaceAction)
local Module44 = {}
Module44.__index = Module44

function Module44.new(p1)
	-- upvalues: Module44 (copy)
	return (setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then nil else p1.user_id,
		source = if p1 == nil or p1.source == nil then nil else p1.source
	}, Module44))
end

function Module44:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.user_id ~= nil then
		local EncodeResult = self.user_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.source ~= nil then
		local EncodeResult = self.source:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module44.decode(Buf)
	-- upvalues: Module44 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module44.new()
	local v45 = 0
	while v45 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1153 = ProtoModule.readTag(Buf, v45)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1153 = ProtoModule.readVarInt(Buf, v45)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1153 = ProtoModule.readBuffer(Buf, v45)
				NewModule.user_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1153 = ProtoModule.readBuffer(Buf, v45)
				NewModule.source = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v45)
				v45 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1153 = ProtoModule.readFixed32(Buf, v45)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1153 = ProtoModule.readFixed64(Buf, v45)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module44:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function Module44:jsonDecode()
	-- upvalues: Module44 (copy), PropTypesModule (copy)
	local NewModule = Module44.new()
	
	if self.user_id ~= nil then
		NewModule.user_id = PropTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		NewModule.user_id = PropTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.source ~= nil then
		NewModule.source = PropTypesModule.StringProp.jsonDecode(self.source)
	end
	return NewModule
end

Module44.descriptor = {
	name = "OpenMarketplaceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceAction_Params = Module44
TypeRegistryModule.default:register(t.OpenMarketplaceAction_Params)
local Module45 = {}
Module45.__index = Module45

function Module45.new(p1)
	-- upvalues: t (copy), Module45 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module45))
end

function Module45:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module45.decode(Buf)
	-- upvalues: Module45 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module45.new()
	local v46 = 0
	while v46 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1173 = ProtoModule.readTag(Buf, v46)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1173 = ProtoModule.readVarIntI32(Buf, v46)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1173 = ProtoModule.readVarInt(Buf, v46)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1173 = ProtoModule.readBuffer(Buf, v46)
				NewModule.action_params = t.HideProfileCompletionAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v46)
				v46 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1173 = ProtoModule.readFixed32(Buf, v46)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1173 = ProtoModule.readFixed64(Buf, v46)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module45:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module45:jsonDecode()
	-- upvalues: Module45 (copy), t (copy)
	local NewModule = Module45.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.HideProfileCompletionAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.HideProfileCompletionAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module45.descriptor = {
	name = "HideProfileCompletionAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.HideProfileCompletionAction"
}
t.HideProfileCompletionAction = Module45
TypeRegistryModule.default:register(t.HideProfileCompletionAction)
local Module46 = {}
Module46.__index = Module46

function Module46.new(p1)
	-- upvalues: Module46 (copy)
	return (setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then nil else p1.user_id,
		prompt_id = if p1 == nil or p1.prompt_id == nil then nil else p1.prompt_id,
		source = if p1 == nil or p1.source == nil then nil else p1.source,
		prompt_type = if p1 == nil or p1.prompt_type == nil then nil else p1.prompt_type
	}, Module46))
end

function Module46:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.user_id ~= nil then
		local EncodeResult = self.user_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.prompt_id ~= nil then
		local EncodeResult = self.prompt_id:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.source ~= nil then
		local EncodeResult = self.source:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.prompt_type ~= nil then
		local EncodeResult = self.prompt_type:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module46.decode(Buf)
	-- upvalues: Module46 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module46.new()
	local v47 = 0
	while v47 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1200 = ProtoModule.readTag(Buf, v47)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1200 = ProtoModule.readVarInt(Buf, v47)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1200 = ProtoModule.readBuffer(Buf, v47)
				NewModule.user_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1200 = ProtoModule.readBuffer(Buf, v47)
				NewModule.prompt_id = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1200 = ProtoModule.readBuffer(Buf, v47)
				NewModule.source = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1200 = ProtoModule.readBuffer(Buf, v47)
				NewModule.prompt_type = PropTypesModule.StringProp.decode(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v47)
				v47 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1200 = ProtoModule.readFixed32(Buf, v47)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1200 = ProtoModule.readFixed64(Buf, v47)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module46:jsonEncode()
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

function Module46:jsonDecode()
	-- upvalues: Module46 (copy), PropTypesModule (copy)
	local NewModule = Module46.new()
	
	if self.user_id ~= nil then
		NewModule.user_id = PropTypesModule.StringProp.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		NewModule.user_id = PropTypesModule.StringProp.jsonDecode(self.userId)
	end
	if self.prompt_id ~= nil then
		NewModule.prompt_id = PropTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		NewModule.prompt_id = PropTypesModule.StringProp.jsonDecode(self.promptId)
	end
	if self.source ~= nil then
		NewModule.source = PropTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.prompt_type ~= nil then
		NewModule.prompt_type = PropTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		NewModule.prompt_type = PropTypesModule.StringProp.jsonDecode(self.promptType)
	end
	return NewModule
end

Module46.descriptor = {
	name = "HideProfileCompletionAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.HideProfileCompletionAction_Params = Module46
TypeRegistryModule.default:register(t.HideProfileCompletionAction_Params)
local Module47 = {}
Module47.__index = Module47

function Module47.new(p1)
	-- upvalues: t (copy), Module47 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module47))
end

function Module47:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module47.decode(Buf)
	-- upvalues: Module47 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module47.new()
	local v48 = 0
	while v48 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1222 = ProtoModule.readTag(Buf, v48)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1222 = ProtoModule.readVarIntI32(Buf, v48)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1222 = ProtoModule.readVarInt(Buf, v48)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1222 = ProtoModule.readBuffer(Buf, v48)
				NewModule.action_params = t.SelectMarketplaceCatalogCategory_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v48)
				v48 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1222 = ProtoModule.readFixed32(Buf, v48)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1222 = ProtoModule.readFixed64(Buf, v48)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module47:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module47:jsonDecode()
	-- upvalues: Module47 (copy), t (copy)
	local NewModule = Module47.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.SelectMarketplaceCatalogCategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.SelectMarketplaceCatalogCategory_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module47.descriptor = {
	name = "SelectMarketplaceCatalogCategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogCategory"
}
t.SelectMarketplaceCatalogCategory = Module47
TypeRegistryModule.default:register(t.SelectMarketplaceCatalogCategory)
local Module48 = {}
Module48.__index = Module48

function Module48.new(p1)
	-- upvalues: Module48 (copy)
	return (setmetatable({
		category_id = if p1 == nil or p1.category_id == nil then nil else p1.category_id
	}, Module48))
end

function Module48:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.category_id ~= nil then
		local EncodeResult = self.category_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module48.decode(Buf)
	-- upvalues: Module48 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module48.new()
	local v49 = 0
	while v49 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1240 = ProtoModule.readTag(Buf, v49)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1240 = ProtoModule.readVarInt(Buf, v49)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1240 = ProtoModule.readBuffer(Buf, v49)
				NewModule.category_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v49)
				v49 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1240 = ProtoModule.readFixed32(Buf, v49)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1240 = ProtoModule.readFixed64(Buf, v49)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module48:jsonEncode()
	local t = {}
	
	if self.category_id ~= nil then
		t.categoryId = self.category_id:jsonEncode()
	end
	return t
end

function Module48:jsonDecode()
	-- upvalues: Module48 (copy), PropTypesModule (copy)
	local NewModule = Module48.new()
	
	if self.category_id ~= nil then
		NewModule.category_id = PropTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		NewModule.category_id = PropTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	return NewModule
end

Module48.descriptor = {
	name = "SelectMarketplaceCatalogCategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceCatalogCategory_Params = Module48
TypeRegistryModule.default:register(t.SelectMarketplaceCatalogCategory_Params)
local Module49 = {}
Module49.__index = Module49

function Module49.new(p1)
	-- upvalues: t (copy), Module49 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module49))
end

function Module49:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module49.decode(Buf)
	-- upvalues: Module49 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module49.new()
	local v50 = 0
	while v50 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1259 = ProtoModule.readTag(Buf, v50)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1259 = ProtoModule.readVarIntI32(Buf, v50)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1259 = ProtoModule.readVarInt(Buf, v50)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1259 = ProtoModule.readBuffer(Buf, v50)
				NewModule.action_params = t.SelectMarketplaceCatalogSubcategory_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v50)
				v50 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1259 = ProtoModule.readFixed32(Buf, v50)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1259 = ProtoModule.readFixed64(Buf, v50)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module49:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module49:jsonDecode()
	-- upvalues: Module49 (copy), t (copy)
	local NewModule = Module49.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.SelectMarketplaceCatalogSubcategory_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module49.descriptor = {
	name = "SelectMarketplaceCatalogSubcategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceCatalogSubcategory"
}
t.SelectMarketplaceCatalogSubcategory = Module49
TypeRegistryModule.default:register(t.SelectMarketplaceCatalogSubcategory)
local Module50 = {}
Module50.__index = Module50

function Module50.new(p1)
	-- upvalues: Module50 (copy)
	return (setmetatable({
		subcategory_id = if p1 == nil or p1.subcategory_id == nil then nil else p1.subcategory_id
	}, Module50))
end

function Module50:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.subcategory_id ~= nil then
		local EncodeResult = self.subcategory_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module50.decode(Buf)
	-- upvalues: Module50 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module50.new()
	local v51 = 0
	while v51 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1277 = ProtoModule.readTag(Buf, v51)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1277 = ProtoModule.readVarInt(Buf, v51)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1277 = ProtoModule.readBuffer(Buf, v51)
				NewModule.subcategory_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v51)
				v51 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1277 = ProtoModule.readFixed32(Buf, v51)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1277 = ProtoModule.readFixed64(Buf, v51)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module50:jsonEncode()
	local t = {}
	
	if self.subcategory_id ~= nil then
		t.subcategoryId = self.subcategory_id:jsonEncode()
	end
	return t
end

function Module50:jsonDecode()
	-- upvalues: Module50 (copy), PropTypesModule (copy)
	local NewModule = Module50.new()
	
	if self.subcategory_id ~= nil then
		NewModule.subcategory_id = PropTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		NewModule.subcategory_id = PropTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	return NewModule
end

Module50.descriptor = {
	name = "SelectMarketplaceCatalogSubcategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceCatalogSubcategory_Params = Module50
TypeRegistryModule.default:register(t.SelectMarketplaceCatalogSubcategory_Params)
local Module51 = {}
Module51.__index = Module51

function Module51.new(p1)
	-- upvalues: t (copy), Module51 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module51))
end

function Module51:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module51.decode(Buf)
	-- upvalues: Module51 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module51.new()
	local v52 = 0
	while v52 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1296 = ProtoModule.readTag(Buf, v52)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1296 = ProtoModule.readVarIntI32(Buf, v52)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1296 = ProtoModule.readVarInt(Buf, v52)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1296 = ProtoModule.readBuffer(Buf, v52)
				NewModule.action_params = t.OpenMarketplaceCatalogSeeAll_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v52)
				v52 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1296 = ProtoModule.readFixed32(Buf, v52)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1296 = ProtoModule.readFixed64(Buf, v52)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module51:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module51:jsonDecode()
	-- upvalues: Module51 (copy), t (copy)
	local NewModule = Module51.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenMarketplaceCatalogSeeAll_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module51.descriptor = {
	name = "OpenMarketplaceCatalogSeeAll",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogSeeAll"
}
t.OpenMarketplaceCatalogSeeAll = Module51
TypeRegistryModule.default:register(t.OpenMarketplaceCatalogSeeAll)
local Module52 = {}
Module52.__index = Module52

function Module52.new(p1)
	-- upvalues: Module52 (copy)
	return (setmetatable({
		sort_id = if p1 == nil or p1.sort_id == nil then nil else p1.sort_id,
		title = if p1 == nil or p1.title == nil then nil else p1.title,
		description = if p1 == nil or p1.description == nil then nil else p1.description,
		tooltip_text = if p1 == nil or p1.tooltip_text == nil then nil else p1.tooltip_text
	}, Module52))
end

function Module52:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.sort_id ~= nil then
		local EncodeResult = self.sort_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.title ~= nil then
		local EncodeResult = self.title:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.description ~= nil then
		local EncodeResult = self.description:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.tooltip_text ~= nil then
		local EncodeResult = self.tooltip_text:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module52.decode(Buf)
	-- upvalues: Module52 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module52.new()
	local v53 = 0
	while v53 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1323 = ProtoModule.readTag(Buf, v53)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1323 = ProtoModule.readVarInt(Buf, v53)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1323 = ProtoModule.readBuffer(Buf, v53)
				NewModule.sort_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1323 = ProtoModule.readBuffer(Buf, v53)
				NewModule.title = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1323 = ProtoModule.readBuffer(Buf, v53)
				NewModule.description = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1323 = ProtoModule.readBuffer(Buf, v53)
				NewModule.tooltip_text = PropTypesModule.StringProp.decode(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v53)
				v53 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1323 = ProtoModule.readFixed32(Buf, v53)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1323 = ProtoModule.readFixed64(Buf, v53)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module52:jsonEncode()
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

function Module52:jsonDecode()
	-- upvalues: Module52 (copy), PropTypesModule (copy)
	local NewModule = Module52.new()
	
	if self.sort_id ~= nil then
		NewModule.sort_id = PropTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		NewModule.sort_id = PropTypesModule.StringProp.jsonDecode(self.sortId)
	end
	if self.title ~= nil then
		NewModule.title = PropTypesModule.StringProp.jsonDecode(self.title)
	end
	if self.description ~= nil then
		NewModule.description = PropTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.tooltip_text ~= nil then
		NewModule.tooltip_text = PropTypesModule.StringProp.jsonDecode(self.tooltip_text)
	end
	if self.tooltipText ~= nil then
		NewModule.tooltip_text = PropTypesModule.StringProp.jsonDecode(self.tooltipText)
	end
	return NewModule
end

Module52.descriptor = {
	name = "OpenMarketplaceCatalogSeeAll_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceCatalogSeeAll_Params = Module52
TypeRegistryModule.default:register(t.OpenMarketplaceCatalogSeeAll_Params)
local Module53 = {}
Module53.__index = Module53

function Module53.new(p1)
	-- upvalues: t (copy), Module53 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module53))
end

function Module53:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module53.decode(Buf)
	-- upvalues: Module53 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module53.new()
	local v54 = 0
	while v54 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1345 = ProtoModule.readTag(Buf, v54)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1345 = ProtoModule.readVarIntI32(Buf, v54)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1345 = ProtoModule.readVarInt(Buf, v54)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1345 = ProtoModule.readBuffer(Buf, v54)
				NewModule.action_params = t.CloseMarketplaceCategoryTooltip_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v54)
				v54 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1345 = ProtoModule.readFixed32(Buf, v54)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1345 = ProtoModule.readFixed64(Buf, v54)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module53:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module53:jsonDecode()
	-- upvalues: Module53 (copy), t (copy)
	local NewModule = Module53.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.CloseMarketplaceCategoryTooltip_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.CloseMarketplaceCategoryTooltip_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module53.descriptor = {
	name = "CloseMarketplaceCategoryTooltip",
	fullName = "roblox.apppageplatform.shared.v1beta1.CloseMarketplaceCategoryTooltip"
}
t.CloseMarketplaceCategoryTooltip = Module53
TypeRegistryModule.default:register(t.CloseMarketplaceCategoryTooltip)
local Module54 = {}
Module54.__index = Module54

function Module54.new(p1)
	-- upvalues: Module54 (copy)
	return (setmetatable({
		tooltip_id = if p1 == nil or p1.tooltip_id == nil then nil else p1.tooltip_id
	}, Module54))
end

function Module54:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.tooltip_id ~= nil then
		local EncodeResult = self.tooltip_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module54.decode(Buf)
	-- upvalues: Module54 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module54.new()
	local v55 = 0
	while v55 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1363 = ProtoModule.readTag(Buf, v55)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1363 = ProtoModule.readVarInt(Buf, v55)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1363 = ProtoModule.readBuffer(Buf, v55)
				NewModule.tooltip_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v55)
				v55 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1363 = ProtoModule.readFixed32(Buf, v55)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1363 = ProtoModule.readFixed64(Buf, v55)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module54:jsonEncode()
	local t = {}
	
	if self.tooltip_id ~= nil then
		t.tooltipId = self.tooltip_id:jsonEncode()
	end
	return t
end

function Module54:jsonDecode()
	-- upvalues: Module54 (copy), PropTypesModule (copy)
	local NewModule = Module54.new()
	
	if self.tooltip_id ~= nil then
		NewModule.tooltip_id = PropTypesModule.StringProp.jsonDecode(self.tooltip_id)
	end
	if self.tooltipId ~= nil then
		NewModule.tooltip_id = PropTypesModule.StringProp.jsonDecode(self.tooltipId)
	end
	return NewModule
end

Module54.descriptor = {
	name = "CloseMarketplaceCategoryTooltip_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.CloseMarketplaceCategoryTooltip_Params = Module54
TypeRegistryModule.default:register(t.CloseMarketplaceCategoryTooltip_Params)
local Module55 = {}
Module55.__index = Module55

function Module55.new(p1)
	-- upvalues: t (copy), Module55 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module55))
end

function Module55:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module55.decode(Buf)
	-- upvalues: Module55 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module55.new()
	local v56 = 0
	while v56 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1382 = ProtoModule.readTag(Buf, v56)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1382 = ProtoModule.readVarIntI32(Buf, v56)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1382 = ProtoModule.readVarInt(Buf, v56)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1382 = ProtoModule.readBuffer(Buf, v56)
				NewModule.action_params = t.ResizeMarketplaceCatalog_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v56)
				v56 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1382 = ProtoModule.readFixed32(Buf, v56)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1382 = ProtoModule.readFixed64(Buf, v56)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module55:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module55:jsonDecode()
	-- upvalues: Module55 (copy), t (copy)
	local NewModule = Module55.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.ResizeMarketplaceCatalog_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.ResizeMarketplaceCatalog_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module55.descriptor = {
	name = "ResizeMarketplaceCatalog",
	fullName = "roblox.apppageplatform.shared.v1beta1.ResizeMarketplaceCatalog"
}
t.ResizeMarketplaceCatalog = Module55
TypeRegistryModule.default:register(t.ResizeMarketplaceCatalog)
local Module56 = {}
Module56.__index = Module56

function Module56.new(p1)
	-- upvalues: Module56 (copy)
	return (setmetatable({
		category_id = if p1 == nil or p1.category_id == nil then nil else p1.category_id,
		subcategory_id = if p1 == nil or p1.subcategory_id == nil then nil else p1.subcategory_id,
		screen_size = if p1 == nil or p1.screen_size == nil then nil else p1.screen_size
	}, Module56))
end

function Module56:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.category_id ~= nil then
		local EncodeResult = self.category_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.subcategory_id ~= nil then
		local EncodeResult = self.subcategory_id:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.screen_size ~= nil then
		local EncodeResult = self.screen_size:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module56.decode(Buf)
	-- upvalues: Module56 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module56.new()
	local v57 = 0
	while v57 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1406 = ProtoModule.readTag(Buf, v57)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1406 = ProtoModule.readVarInt(Buf, v57)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1406 = ProtoModule.readBuffer(Buf, v57)
				NewModule.category_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1406 = ProtoModule.readBuffer(Buf, v57)
				NewModule.subcategory_id = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1406 = ProtoModule.readBuffer(Buf, v57)
				NewModule.screen_size = PropTypesModule.StringProp.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v57)
				v57 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1406 = ProtoModule.readFixed32(Buf, v57)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1406 = ProtoModule.readFixed64(Buf, v57)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module56:jsonEncode()
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

function Module56:jsonDecode()
	-- upvalues: Module56 (copy), PropTypesModule (copy)
	local NewModule = Module56.new()
	
	if self.category_id ~= nil then
		NewModule.category_id = PropTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		NewModule.category_id = PropTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	if self.subcategory_id ~= nil then
		NewModule.subcategory_id = PropTypesModule.StringProp.jsonDecode(self.subcategory_id)
	end
	if self.subcategoryId ~= nil then
		NewModule.subcategory_id = PropTypesModule.StringProp.jsonDecode(self.subcategoryId)
	end
	if self.screen_size ~= nil then
		NewModule.screen_size = PropTypesModule.StringProp.jsonDecode(self.screen_size)
	end
	if self.screenSize ~= nil then
		NewModule.screen_size = PropTypesModule.StringProp.jsonDecode(self.screenSize)
	end
	return NewModule
end

Module56.descriptor = {
	name = "ResizeMarketplaceCatalog_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ResizeMarketplaceCatalog_Params = Module56
TypeRegistryModule.default:register(t.ResizeMarketplaceCatalog_Params)
local Module57 = {}
Module57.__index = Module57

function Module57.new(p1)
	-- upvalues: t (copy), Module57 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module57))
end

function Module57:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module57.decode(Buf)
	-- upvalues: Module57 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module57.new()
	local v58 = 0
	while v58 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1427 = ProtoModule.readTag(Buf, v58)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1427 = ProtoModule.readVarIntI32(Buf, v58)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1427 = ProtoModule.readVarInt(Buf, v58)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1427 = ProtoModule.readBuffer(Buf, v58)
				NewModule.action_params = t.OpenChartsSortDetailAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v58)
				v58 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1427 = ProtoModule.readFixed32(Buf, v58)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1427 = ProtoModule.readFixed64(Buf, v58)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module57:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module57:jsonDecode()
	-- upvalues: Module57 (copy), t (copy)
	local NewModule = Module57.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenChartsSortDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenChartsSortDetailAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module57.descriptor = {
	name = "OpenChartsSortDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenChartsSortDetailAction"
}
t.OpenChartsSortDetailAction = Module57
TypeRegistryModule.default:register(t.OpenChartsSortDetailAction)
local Module58 = {}
Module58.__index = Module58

function Module58.new(p1)
	-- upvalues: Module58 (copy)
	return (setmetatable({
		sort_id = if p1 == nil or p1.sort_id == nil then nil else p1.sort_id,
		secondary_sort_id = if p1 == nil or p1.secondary_sort_id == nil then nil else p1.secondary_sort_id
	}, Module58))
end

function Module58:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.sort_id ~= nil then
		local EncodeResult = self.sort_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.secondary_sort_id ~= nil then
		local EncodeResult = self.secondary_sort_id:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module58.decode(Buf)
	-- upvalues: Module58 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module58.new()
	local v59 = 0
	while v59 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1448 = ProtoModule.readTag(Buf, v59)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1448 = ProtoModule.readVarInt(Buf, v59)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1448 = ProtoModule.readBuffer(Buf, v59)
				NewModule.sort_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1448 = ProtoModule.readBuffer(Buf, v59)
				NewModule.secondary_sort_id = PropTypesModule.Int32Prop.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v59)
				v59 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1448 = ProtoModule.readFixed32(Buf, v59)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1448 = ProtoModule.readFixed64(Buf, v59)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module58:jsonEncode()
	local t = {}
	
	if self.sort_id ~= nil then
		t.sortId = self.sort_id:jsonEncode()
	end
	if self.secondary_sort_id ~= nil then
		t.secondarySortId = self.secondary_sort_id:jsonEncode()
	end
	return t
end

function Module58:jsonDecode()
	-- upvalues: Module58 (copy), PropTypesModule (copy)
	local NewModule = Module58.new()
	
	if self.sort_id ~= nil then
		NewModule.sort_id = PropTypesModule.StringProp.jsonDecode(self.sort_id)
	end
	if self.sortId ~= nil then
		NewModule.sort_id = PropTypesModule.StringProp.jsonDecode(self.sortId)
	end
	if self.secondary_sort_id ~= nil then
		NewModule.secondary_sort_id = PropTypesModule.Int32Prop.jsonDecode(self.secondary_sort_id)
	end
	if self.secondarySortId ~= nil then
		NewModule.secondary_sort_id = PropTypesModule.Int32Prop.jsonDecode(self.secondarySortId)
	end
	return NewModule
end

Module58.descriptor = {
	name = "OpenChartsSortDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenChartsSortDetailAction_Params = Module58
TypeRegistryModule.default:register(t.OpenChartsSortDetailAction_Params)
local Module59 = {}
Module59.__index = Module59

function Module59.new(p1)
	-- upvalues: t (copy), Module59 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module59))
end

function Module59:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module59.decode(Buf)
	-- upvalues: Module59 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module59.new()
	local v60 = 0
	while v60 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1468 = ProtoModule.readTag(Buf, v60)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1468 = ProtoModule.readVarIntI32(Buf, v60)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1468 = ProtoModule.readVarInt(Buf, v60)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1468 = ProtoModule.readBuffer(Buf, v60)
				NewModule.action_params = t.OpenSongDetailAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v60)
				v60 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1468 = ProtoModule.readFixed32(Buf, v60)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1468 = ProtoModule.readFixed64(Buf, v60)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module59:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module59:jsonDecode()
	-- upvalues: Module59 (copy), t (copy)
	local NewModule = Module59.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenSongDetailAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenSongDetailAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module59.descriptor = {
	name = "OpenSongDetailAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSongDetailAction"
}
t.OpenSongDetailAction = Module59
TypeRegistryModule.default:register(t.OpenSongDetailAction)
local Module60 = {}
Module60.__index = Module60

function Module60.new(p1)
	-- upvalues: Module60 (copy)
	return (setmetatable({
		song_id = if p1 == nil or p1.song_id == nil then nil else p1.song_id
	}, Module60))
end

function Module60:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.song_id ~= nil then
		local EncodeResult = self.song_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module60.decode(Buf)
	-- upvalues: Module60 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module60.new()
	local v61 = 0
	while v61 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1486 = ProtoModule.readTag(Buf, v61)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1486 = ProtoModule.readVarInt(Buf, v61)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1486 = ProtoModule.readBuffer(Buf, v61)
				NewModule.song_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v61)
				v61 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1486 = ProtoModule.readFixed32(Buf, v61)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1486 = ProtoModule.readFixed64(Buf, v61)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module60:jsonEncode()
	local t = {}
	
	if self.song_id ~= nil then
		t.songId = self.song_id:jsonEncode()
	end
	return t
end

function Module60:jsonDecode()
	-- upvalues: Module60 (copy), PropTypesModule (copy)
	local NewModule = Module60.new()
	
	if self.song_id ~= nil then
		NewModule.song_id = PropTypesModule.StringProp.jsonDecode(self.song_id)
	end
	if self.songId ~= nil then
		NewModule.song_id = PropTypesModule.StringProp.jsonDecode(self.songId)
	end
	return NewModule
end

Module60.descriptor = {
	name = "OpenSongDetailAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSongDetailAction_Params = Module60
TypeRegistryModule.default:register(t.OpenSongDetailAction_Params)
local Module61 = {}
Module61.__index = Module61

function Module61.new(p1)
	-- upvalues: t (copy), Module61 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module61))
end

function Module61:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module61.decode(Buf)
	-- upvalues: Module61 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module61.new()
	local v62 = 0
	while v62 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1505 = ProtoModule.readTag(Buf, v62)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1505 = ProtoModule.readVarIntI32(Buf, v62)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1505 = ProtoModule.readVarInt(Buf, v62)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1505 = ProtoModule.readBuffer(Buf, v62)
				NewModule.action_params = t.OpenMarketplaceCatalogFilters_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v62)
				v62 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1505 = ProtoModule.readFixed32(Buf, v62)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1505 = ProtoModule.readFixed64(Buf, v62)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module61:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module61:jsonDecode()
	-- upvalues: Module61 (copy), t (copy)
	local NewModule = Module61.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenMarketplaceCatalogFilters_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenMarketplaceCatalogFilters_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module61.descriptor = {
	name = "OpenMarketplaceCatalogFilters",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenMarketplaceCatalogFilters"
}
t.OpenMarketplaceCatalogFilters = Module61
TypeRegistryModule.default:register(t.OpenMarketplaceCatalogFilters)
local Module62 = {}
Module62.__index = Module62

function Module62:new()
	-- upvalues: Module62 (copy)
	return (setmetatable({}, Module62))
end

function Module62:encode()
	local Buf = buffer.create(0)
	buffer.copy(Buf, 0, buffer.create(0), 0, 0)
	
	return Buf
end

function Module62.decode(Buf)
	-- upvalues: Module62 (copy), ProtoModule (copy)
	local NewModule = Module62.new()
	local v63 = 0
	while v63 < buffer.len(Buf) do
		local _, Tag2
		_, Tag2, v1519 = ProtoModule.readTag(Buf, v63)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1519 = ProtoModule.readVarInt(Buf, v63)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v63)
			v63 = VarInt2 + VarInt
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1519 = ProtoModule.readFixed32(Buf, v63)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1519 = ProtoModule.readFixed64(Buf, v63)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module62:jsonEncode()
	return {}
end

function Module62:jsonDecode()
	-- upvalues: Module62 (copy)
	return (Module62.new())
end

Module62.descriptor = {
	name = "OpenMarketplaceCatalogFilters_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenMarketplaceCatalogFilters_Params = Module62
TypeRegistryModule.default:register(t.OpenMarketplaceCatalogFilters_Params)
local Module63 = {}
Module63.__index = Module63

function Module63.new(p1)
	-- upvalues: t (copy), Module63 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module63))
end

function Module63:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module63.decode(Buf)
	-- upvalues: Module63 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module63.new()
	local v64 = 0
	while v64 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1535 = ProtoModule.readTag(Buf, v64)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1535 = ProtoModule.readVarIntI32(Buf, v64)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1535 = ProtoModule.readVarInt(Buf, v64)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1535 = ProtoModule.readBuffer(Buf, v64)
				NewModule.action_params = t.RefreshFromApiAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v64)
				v64 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1535 = ProtoModule.readFixed32(Buf, v64)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1535 = ProtoModule.readFixed64(Buf, v64)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module63:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module63:jsonDecode()
	-- upvalues: Module63 (copy), t (copy)
	local NewModule = Module63.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.RefreshFromApiAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.RefreshFromApiAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module63.descriptor = {
	name = "RefreshFromApiAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshFromApiAction"
}
t.RefreshFromApiAction = Module63
TypeRegistryModule.default:register(t.RefreshFromApiAction)
local Module64 = {}
Module64.__index = Module64

function Module64.new(p1)
	-- upvalues: Module64 (copy)
	return (setmetatable({
		surface_key = if p1 == nil or p1.surface_key == nil then nil else p1.surface_key,
		config_key = if p1 == nil or p1.config_key == nil then nil else p1.config_key
	}, Module64))
end

function Module64:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.surface_key ~= nil then
		local EncodeResult = self.surface_key:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.config_key ~= nil then
		local EncodeResult = self.config_key:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module64.decode(Buf)
	-- upvalues: Module64 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module64.new()
	local v65 = 0
	while v65 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1556 = ProtoModule.readTag(Buf, v65)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1556 = ProtoModule.readVarInt(Buf, v65)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1556 = ProtoModule.readBuffer(Buf, v65)
				NewModule.surface_key = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1556 = ProtoModule.readBuffer(Buf, v65)
				NewModule.config_key = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v65)
				v65 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1556 = ProtoModule.readFixed32(Buf, v65)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1556 = ProtoModule.readFixed64(Buf, v65)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module64:jsonEncode()
	local t = {}
	
	if self.surface_key ~= nil then
		t.surfaceKey = self.surface_key:jsonEncode()
	end
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	return t
end

function Module64:jsonDecode()
	-- upvalues: Module64 (copy), PropTypesModule (copy)
	local NewModule = Module64.new()
	
	if self.surface_key ~= nil then
		NewModule.surface_key = PropTypesModule.StringProp.jsonDecode(self.surface_key)
	end
	if self.surfaceKey ~= nil then
		NewModule.surface_key = PropTypesModule.StringProp.jsonDecode(self.surfaceKey)
	end
	if self.config_key ~= nil then
		NewModule.config_key = PropTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		NewModule.config_key = PropTypesModule.StringProp.jsonDecode(self.configKey)
	end
	return NewModule
end

Module64.descriptor = {
	name = "RefreshFromApiAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshFromApiAction_Params = Module64
TypeRegistryModule.default:register(t.RefreshFromApiAction_Params)
local Module65 = {}
Module65.__index = Module65

function Module65.new(p1)
	-- upvalues: t (copy), Module65 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module65))
end

function Module65:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module65.decode(Buf)
	-- upvalues: Module65 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module65.new()
	local v66 = 0
	while v66 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1576 = ProtoModule.readTag(Buf, v66)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1576 = ProtoModule.readVarIntI32(Buf, v66)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1576 = ProtoModule.readVarInt(Buf, v66)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1576 = ProtoModule.readBuffer(Buf, v66)
				NewModule.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v66)
				v66 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1576 = ProtoModule.readFixed32(Buf, v66)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1576 = ProtoModule.readFixed64(Buf, v66)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module65:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module65:jsonDecode()
	-- upvalues: Module65 (copy), t (copy)
	local NewModule = Module65.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.RefreshOmniRecommendationFeedItemAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module65.descriptor = {
	name = "RefreshOmniRecommendationFeedItemAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshOmniRecommendationFeedItemAction"
}
t.RefreshOmniRecommendationFeedItemAction = Module65
TypeRegistryModule.default:register(t.RefreshOmniRecommendationFeedItemAction)
local Module66 = {}
Module66.__index = Module66

function Module66.new(p1)
	-- upvalues: Module66 (copy)
	return (setmetatable({
		topic_id = if p1 == nil or p1.topic_id == nil then nil else p1.topic_id,
		selected_option = if p1 == nil or p1.selected_option == nil then nil else p1.selected_option,
		request_intent = if p1 == nil or p1.request_intent == nil then nil else p1.request_intent,
		feed_item_key = if p1 == nil or p1.feed_item_key == nil then nil else p1.feed_item_key
	}, Module66))
end

function Module66:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.topic_id ~= nil then
		local EncodeResult = self.topic_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.selected_option ~= nil then
		local EncodeResult = self.selected_option:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.request_intent ~= nil then
		local EncodeResult = self.request_intent:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.feed_item_key ~= nil then
		local EncodeResult = self.feed_item_key:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module66.decode(Buf)
	-- upvalues: Module66 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module66.new()
	local v67 = 0
	while v67 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1603 = ProtoModule.readTag(Buf, v67)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1603 = ProtoModule.readVarInt(Buf, v67)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1603 = ProtoModule.readBuffer(Buf, v67)
				NewModule.topic_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1603 = ProtoModule.readBuffer(Buf, v67)
				NewModule.selected_option = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1603 = ProtoModule.readBuffer(Buf, v67)
				NewModule.request_intent = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1603 = ProtoModule.readBuffer(Buf, v67)
				NewModule.feed_item_key = PropTypesModule.StringProp.decode(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v67)
				v67 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1603 = ProtoModule.readFixed32(Buf, v67)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1603 = ProtoModule.readFixed64(Buf, v67)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module66:jsonEncode()
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

function Module66:jsonDecode()
	-- upvalues: Module66 (copy), PropTypesModule (copy)
	local NewModule = Module66.new()
	
	if self.topic_id ~= nil then
		NewModule.topic_id = PropTypesModule.StringProp.jsonDecode(self.topic_id)
	end
	if self.topicId ~= nil then
		NewModule.topic_id = PropTypesModule.StringProp.jsonDecode(self.topicId)
	end
	if self.selected_option ~= nil then
		NewModule.selected_option = PropTypesModule.StringProp.jsonDecode(self.selected_option)
	end
	if self.selectedOption ~= nil then
		NewModule.selected_option = PropTypesModule.StringProp.jsonDecode(self.selectedOption)
	end
	if self.request_intent ~= nil then
		NewModule.request_intent = PropTypesModule.StringProp.jsonDecode(self.request_intent)
	end
	if self.requestIntent ~= nil then
		NewModule.request_intent = PropTypesModule.StringProp.jsonDecode(self.requestIntent)
	end
	if self.feed_item_key ~= nil then
		NewModule.feed_item_key = PropTypesModule.StringProp.jsonDecode(self.feed_item_key)
	end
	if self.feedItemKey ~= nil then
		NewModule.feed_item_key = PropTypesModule.StringProp.jsonDecode(self.feedItemKey)
	end
	return NewModule
end

Module66.descriptor = {
	name = "RefreshOmniRecommendationFeedItemAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshOmniRecommendationFeedItemAction_Params = Module66
TypeRegistryModule.default:register(t.RefreshOmniRecommendationFeedItemAction_Params)
local Module67 = {}
Module67.__index = Module67

function Module67.new(p1)
	-- upvalues: t (copy), Module67 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module67))
end

function Module67:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module67.decode(Buf)
	-- upvalues: Module67 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module67.new()
	local v68 = 0
	while v68 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1625 = ProtoModule.readTag(Buf, v68)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1625 = ProtoModule.readVarIntI32(Buf, v68)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1625 = ProtoModule.readVarInt(Buf, v68)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1625 = ProtoModule.readBuffer(Buf, v68)
				NewModule.action_params = t.RsvpToEventAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v68)
				v68 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1625 = ProtoModule.readFixed32(Buf, v68)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1625 = ProtoModule.readFixed64(Buf, v68)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module67:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module67:jsonDecode()
	-- upvalues: Module67 (copy), t (copy)
	local NewModule = Module67.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.RsvpToEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.RsvpToEventAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module67.descriptor = {
	name = "RsvpToEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpToEventAction"
}
t.RsvpToEventAction = Module67
TypeRegistryModule.default:register(t.RsvpToEventAction)
local Module68 = {}
Module68.__index = Module68

function Module68.new(p1)
	-- upvalues: Module68 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then nil else p1.event_id,
		user_rsvp = if p1 == nil or p1.user_rsvp == nil then nil else p1.user_rsvp,
		notifications_modal_identifier = if p1 == nil or p1.notifications_modal_identifier == nil then nil else p1.notifications_modal_identifier
	}, Module68))
end

function Module68:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.event_id ~= nil then
		local EncodeResult = self.event_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.user_rsvp ~= nil then
		local EncodeResult = self.user_rsvp:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.notifications_modal_identifier ~= nil then
		local EncodeResult = self.notifications_modal_identifier:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module68.decode(Buf)
	-- upvalues: Module68 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module68.new()
	local v69 = 0
	while v69 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1649 = ProtoModule.readTag(Buf, v69)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1649 = ProtoModule.readVarInt(Buf, v69)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1649 = ProtoModule.readBuffer(Buf, v69)
				NewModule.event_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1649 = ProtoModule.readBuffer(Buf, v69)
				NewModule.user_rsvp = PropTypesModule.BoolProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1649 = ProtoModule.readBuffer(Buf, v69)
				NewModule.notifications_modal_identifier = PropTypesModule.StringProp.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v69)
				v69 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1649 = ProtoModule.readFixed32(Buf, v69)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1649 = ProtoModule.readFixed64(Buf, v69)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module68:jsonEncode()
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

function Module68:jsonDecode()
	-- upvalues: Module68 (copy), PropTypesModule (copy)
	local NewModule = Module68.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = PropTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		NewModule.event_id = PropTypesModule.StringProp.jsonDecode(self.eventId)
	end
	if self.user_rsvp ~= nil then
		NewModule.user_rsvp = PropTypesModule.BoolProp.jsonDecode(self.user_rsvp)
	end
	if self.userRsvp ~= nil then
		NewModule.user_rsvp = PropTypesModule.BoolProp.jsonDecode(self.userRsvp)
	end
	if self.notifications_modal_identifier ~= nil then
		NewModule.notifications_modal_identifier = PropTypesModule.StringProp.jsonDecode(self.notifications_modal_identifier)
	end
	if self.notificationsModalIdentifier ~= nil then
		NewModule.notifications_modal_identifier = PropTypesModule.StringProp.jsonDecode(self.notificationsModalIdentifier)
	end
	return NewModule
end

Module68.descriptor = {
	name = "RsvpToEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RsvpToEventAction_Params = Module68
TypeRegistryModule.default:register(t.RsvpToEventAction_Params)
local Module69 = {}
Module69.__index = Module69

function Module69.new(p1)
	-- upvalues: t (copy), Module69 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module69))
end

function Module69:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module69.decode(Buf)
	-- upvalues: Module69 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module69.new()
	local v70 = 0
	while v70 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1670 = ProtoModule.readTag(Buf, v70)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1670 = ProtoModule.readVarIntI32(Buf, v70)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1670 = ProtoModule.readVarInt(Buf, v70)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1670 = ProtoModule.readBuffer(Buf, v70)
				NewModule.action_params = t.OpenEventDetailsAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v70)
				v70 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1670 = ProtoModule.readFixed32(Buf, v70)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1670 = ProtoModule.readFixed64(Buf, v70)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module69:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module69:jsonDecode()
	-- upvalues: Module69 (copy), t (copy)
	local NewModule = Module69.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenEventDetailsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenEventDetailsAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module69.descriptor = {
	name = "OpenEventDetailsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenEventDetailsAction"
}
t.OpenEventDetailsAction = Module69
TypeRegistryModule.default:register(t.OpenEventDetailsAction)
local Module70 = {}
Module70.__index = Module70

function Module70.new(p1)
	-- upvalues: Module70 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then nil else p1.event_id
	}, Module70))
end

function Module70:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.event_id ~= nil then
		local EncodeResult = self.event_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module70.decode(Buf)
	-- upvalues: Module70 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module70.new()
	local v71 = 0
	while v71 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1688 = ProtoModule.readTag(Buf, v71)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1688 = ProtoModule.readVarInt(Buf, v71)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1688 = ProtoModule.readBuffer(Buf, v71)
				NewModule.event_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v71)
				v71 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1688 = ProtoModule.readFixed32(Buf, v71)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1688 = ProtoModule.readFixed64(Buf, v71)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module70:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function Module70:jsonDecode()
	-- upvalues: Module70 (copy), PropTypesModule (copy)
	local NewModule = Module70.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = PropTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		NewModule.event_id = PropTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return NewModule
end

Module70.descriptor = {
	name = "OpenEventDetailsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenEventDetailsAction_Params = Module70
TypeRegistryModule.default:register(t.OpenEventDetailsAction_Params)
local Module71 = {}
Module71.__index = Module71

function Module71.new(p1)
	-- upvalues: t (copy), Module71 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module71))
end

function Module71:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module71.decode(Buf)
	-- upvalues: Module71 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module71.new()
	local v72 = 0
	while v72 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1707 = ProtoModule.readTag(Buf, v72)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1707 = ProtoModule.readVarIntI32(Buf, v72)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1707 = ProtoModule.readVarInt(Buf, v72)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1707 = ProtoModule.readBuffer(Buf, v72)
				NewModule.action_params = t.OpenBadgesSeeAllAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v72)
				v72 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1707 = ProtoModule.readFixed32(Buf, v72)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1707 = ProtoModule.readFixed64(Buf, v72)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module71:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module71:jsonDecode()
	-- upvalues: Module71 (copy), t (copy)
	local NewModule = Module71.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenBadgesSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenBadgesSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module71.descriptor = {
	name = "OpenBadgesSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenBadgesSeeAllAction"
}
t.OpenBadgesSeeAllAction = Module71
TypeRegistryModule.default:register(t.OpenBadgesSeeAllAction)
local Module72 = {}
Module72.__index = Module72

function Module72.new(p1)
	-- upvalues: Module72 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id
	}, Module72))
end

function Module72:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module72.decode(Buf)
	-- upvalues: Module72 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module72.new()
	local v73 = 0
	while v73 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1725 = ProtoModule.readTag(Buf, v73)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1725 = ProtoModule.readVarInt(Buf, v73)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1725 = ProtoModule.readBuffer(Buf, v73)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v73)
				v73 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1725 = ProtoModule.readFixed32(Buf, v73)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1725 = ProtoModule.readFixed64(Buf, v73)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module72:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function Module72:jsonDecode()
	-- upvalues: Module72 (copy), PropTypesModule (copy)
	local NewModule = Module72.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return NewModule
end

Module72.descriptor = {
	name = "OpenBadgesSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenBadgesSeeAllAction_Params = Module72
TypeRegistryModule.default:register(t.OpenBadgesSeeAllAction_Params)
local Module73 = {}
Module73.__index = Module73

function Module73.new(p1)
	-- upvalues: t (copy), Module73 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module73))
end

function Module73:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module73.decode(Buf)
	-- upvalues: Module73 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module73.new()
	local v74 = 0
	while v74 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1744 = ProtoModule.readTag(Buf, v74)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1744 = ProtoModule.readVarIntI32(Buf, v74)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1744 = ProtoModule.readVarInt(Buf, v74)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1744 = ProtoModule.readBuffer(Buf, v74)
				NewModule.action_params = t.OpenExperienceStoreSeeAllAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v74)
				v74 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1744 = ProtoModule.readFixed32(Buf, v74)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1744 = ProtoModule.readFixed64(Buf, v74)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module73:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module73:jsonDecode()
	-- upvalues: Module73 (copy), t (copy)
	local NewModule = Module73.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenExperienceStoreSeeAllAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenExperienceStoreSeeAllAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module73.descriptor = {
	name = "OpenExperienceStoreSeeAllAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenExperienceStoreSeeAllAction"
}
t.OpenExperienceStoreSeeAllAction = Module73
TypeRegistryModule.default:register(t.OpenExperienceStoreSeeAllAction)
local Module74 = {}
Module74.__index = Module74

function Module74.new(p1)
	-- upvalues: Module74 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id
	}, Module74))
end

function Module74:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module74.decode(Buf)
	-- upvalues: Module74 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module74.new()
	local v75 = 0
	while v75 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1762 = ProtoModule.readTag(Buf, v75)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1762 = ProtoModule.readVarInt(Buf, v75)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1762 = ProtoModule.readBuffer(Buf, v75)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v75)
				v75 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1762 = ProtoModule.readFixed32(Buf, v75)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1762 = ProtoModule.readFixed64(Buf, v75)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module74:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function Module74:jsonDecode()
	-- upvalues: Module74 (copy), PropTypesModule (copy)
	local NewModule = Module74.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return NewModule
end

Module74.descriptor = {
	name = "OpenExperienceStoreSeeAllAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenExperienceStoreSeeAllAction_Params = Module74
TypeRegistryModule.default:register(t.OpenExperienceStoreSeeAllAction_Params)
local Module75 = {}
Module75.__index = Module75

function Module75.new(p1)
	-- upvalues: t (copy), Module75 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module75))
end

function Module75:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module75.decode(Buf)
	-- upvalues: Module75 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module75.new()
	local v76 = 0
	while v76 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1781 = ProtoModule.readTag(Buf, v76)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1781 = ProtoModule.readVarIntI32(Buf, v76)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1781 = ProtoModule.readVarInt(Buf, v76)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1781 = ProtoModule.readBuffer(Buf, v76)
				NewModule.action_params = t.OpenSubscriptionPurchasePageAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v76)
				v76 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1781 = ProtoModule.readFixed32(Buf, v76)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1781 = ProtoModule.readFixed64(Buf, v76)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module75:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module75:jsonDecode()
	-- upvalues: Module75 (copy), t (copy)
	local NewModule = Module75.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenSubscriptionPurchasePageAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenSubscriptionPurchasePageAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module75.descriptor = {
	name = "OpenSubscriptionPurchasePageAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSubscriptionPurchasePageAction"
}
t.OpenSubscriptionPurchasePageAction = Module75
TypeRegistryModule.default:register(t.OpenSubscriptionPurchasePageAction)
local Module76 = {}
Module76.__index = Module76

function Module76.new(p1)
	-- upvalues: Module76 (copy)
	return (setmetatable({
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
	}, Module76))
end

function Module76:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.subscription_id ~= nil then
		local EncodeResult = self.subscription_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	if self.creator_name ~= nil then
		local EncodeResult = self.creator_name:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	if self.creator_verified ~= nil then
		local EncodeResult = self.creator_verified:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	if self.name ~= nil then
		local EncodeResult = self.name:encode()
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, EncodeResult, buffer.len(EncodeResult))
	end
	if self.description ~= nil then
		local EncodeResult = self.description:encode()
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, EncodeResult, buffer.len(EncodeResult))
	end
	if self.image_asset_id ~= nil then
		local EncodeResult = self.image_asset_id:encode()
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, EncodeResult, buffer.len(EncodeResult))
	end
	if self.period_type ~= nil then
		local EncodeResult = self.period_type:encode()
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult10, WriteTagResult2_9, EncodeResult, buffer.len(EncodeResult))
	end
	if self.is_subscribed ~= nil then
		local EncodeResult = self.is_subscribed:encode()
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult11, WriteTagResult2_10, EncodeResult, buffer.len(EncodeResult))
	end
	if self.price_display ~= nil then
		local EncodeResult = self.price_display:encode()
		local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult12, WriteTagResult2_11, EncodeResult, buffer.len(EncodeResult))
	end
	if self.price_in_robux ~= nil then
		local EncodeResult = self.price_in_robux:encode()
		local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult13, WriteTagResult2_12, EncodeResult, buffer.len(EncodeResult))
	end
	if self.price_tier ~= nil then
		local EncodeResult = self.price_tier:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.thumbnail_string ~= nil then
		local EncodeResult = self.thumbnail_string:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module76.decode(Buf)
	-- upvalues: Module76 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module76.new()
	local v77 = 0
	while v77 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1835 = ProtoModule.readTag(Buf, v77)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1835 = ProtoModule.readVarInt(Buf, v77)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1835 = ProtoModule.readBuffer(Buf, v77)
				NewModule.subscription_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1835 = ProtoModule.readBuffer(Buf, v77)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1835 = ProtoModule.readBuffer(Buf, v77)
				NewModule.creator_name = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1835 = ProtoModule.readBuffer(Buf, v77)
				NewModule.creator_verified = PropTypesModule.BoolProp.decode(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v1835 = ProtoModule.readBuffer(Buf, v77)
				NewModule.name = PropTypesModule.StringProp.decode(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v1835 = ProtoModule.readBuffer(Buf, v77)
				NewModule.description = PropTypesModule.StringProp.decode(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v1835 = ProtoModule.readBuffer(Buf, v77)
				NewModule.image_asset_id = PropTypesModule.Int64Prop.decode(Buffer7)
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v1835 = ProtoModule.readBuffer(Buf, v77)
				NewModule.period_type = PropTypesModule.StringProp.decode(Buffer8)
			elseif Tag == 9 then
				local Buffer9
				Buffer9, v1835 = ProtoModule.readBuffer(Buf, v77)
				NewModule.is_subscribed = PropTypesModule.BoolProp.decode(Buffer9)
			elseif Tag == 10 then
				local Buffer10
				Buffer10, v1835 = ProtoModule.readBuffer(Buf, v77)
				NewModule.price_display = PropTypesModule.StringProp.decode(Buffer10)
			elseif Tag == 11 then
				local Buffer11
				Buffer11, v1835 = ProtoModule.readBuffer(Buf, v77)
				NewModule.price_in_robux = PropTypesModule.Int64Prop.decode(Buffer11)
			elseif Tag == 12 then
				local Buffer12
				Buffer12, v1835 = ProtoModule.readBuffer(Buf, v77)
				NewModule.price_tier = PropTypesModule.Int64Prop.decode(Buffer12)
			elseif Tag == 13 then
				local Buffer13
				Buffer13, v1835 = ProtoModule.readBuffer(Buf, v77)
				NewModule.thumbnail_string = PropTypesModule.StringProp.decode(Buffer13)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v77)
				v77 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1835 = ProtoModule.readFixed32(Buf, v77)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1835 = ProtoModule.readFixed64(Buf, v77)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module76:jsonEncode()
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

function Module76:jsonDecode()
	-- upvalues: Module76 (copy), PropTypesModule (copy)
	local NewModule = Module76.new()
	
	if self.subscription_id ~= nil then
		NewModule.subscription_id = PropTypesModule.StringProp.jsonDecode(self.subscription_id)
	end
	if self.subscriptionId ~= nil then
		NewModule.subscription_id = PropTypesModule.StringProp.jsonDecode(self.subscriptionId)
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.creator_name ~= nil then
		NewModule.creator_name = PropTypesModule.StringProp.jsonDecode(self.creator_name)
	end
	if self.creatorName ~= nil then
		NewModule.creator_name = PropTypesModule.StringProp.jsonDecode(self.creatorName)
	end
	if self.creator_verified ~= nil then
		NewModule.creator_verified = PropTypesModule.BoolProp.jsonDecode(self.creator_verified)
	end
	if self.creatorVerified ~= nil then
		NewModule.creator_verified = PropTypesModule.BoolProp.jsonDecode(self.creatorVerified)
	end
	if self.name ~= nil then
		NewModule.name = PropTypesModule.StringProp.jsonDecode(self.name)
	end
	if self.description ~= nil then
		NewModule.description = PropTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.image_asset_id ~= nil then
		NewModule.image_asset_id = PropTypesModule.Int64Prop.jsonDecode(self.image_asset_id)
	end
	if self.imageAssetId ~= nil then
		NewModule.image_asset_id = PropTypesModule.Int64Prop.jsonDecode(self.imageAssetId)
	end
	if self.period_type ~= nil then
		NewModule.period_type = PropTypesModule.StringProp.jsonDecode(self.period_type)
	end
	if self.periodType ~= nil then
		NewModule.period_type = PropTypesModule.StringProp.jsonDecode(self.periodType)
	end
	if self.is_subscribed ~= nil then
		NewModule.is_subscribed = PropTypesModule.BoolProp.jsonDecode(self.is_subscribed)
	end
	if self.isSubscribed ~= nil then
		NewModule.is_subscribed = PropTypesModule.BoolProp.jsonDecode(self.isSubscribed)
	end
	if self.price_display ~= nil then
		NewModule.price_display = PropTypesModule.StringProp.jsonDecode(self.price_display)
	end
	if self.priceDisplay ~= nil then
		NewModule.price_display = PropTypesModule.StringProp.jsonDecode(self.priceDisplay)
	end
	if self.price_in_robux ~= nil then
		NewModule.price_in_robux = PropTypesModule.Int64Prop.jsonDecode(self.price_in_robux)
	end
	if self.priceInRobux ~= nil then
		NewModule.price_in_robux = PropTypesModule.Int64Prop.jsonDecode(self.priceInRobux)
	end
	if self.price_tier ~= nil then
		NewModule.price_tier = PropTypesModule.Int64Prop.jsonDecode(self.price_tier)
	end
	if self.priceTier ~= nil then
		NewModule.price_tier = PropTypesModule.Int64Prop.jsonDecode(self.priceTier)
	end
	if self.thumbnail_string ~= nil then
		NewModule.thumbnail_string = PropTypesModule.StringProp.jsonDecode(self.thumbnail_string)
	end
	if self.thumbnailString ~= nil then
		NewModule.thumbnail_string = PropTypesModule.StringProp.jsonDecode(self.thumbnailString)
	end
	return NewModule
end

Module76.descriptor = {
	name = "OpenSubscriptionPurchasePageAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSubscriptionPurchasePageAction_Params = Module76
TypeRegistryModule.default:register(t.OpenSubscriptionPurchasePageAction_Params)
local Module77 = {}
Module77.__index = Module77

function Module77.new(p1)
	-- upvalues: t (copy), Module77 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module77))
end

function Module77:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module77.decode(Buf)
	-- upvalues: Module77 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module77.new()
	local v78 = 0
	while v78 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1866 = ProtoModule.readTag(Buf, v78)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1866 = ProtoModule.readVarIntI32(Buf, v78)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1866 = ProtoModule.readVarInt(Buf, v78)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1866 = ProtoModule.readBuffer(Buf, v78)
				NewModule.action_params = t.RefreshGamePassesAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v78)
				v78 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1866 = ProtoModule.readFixed32(Buf, v78)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1866 = ProtoModule.readFixed64(Buf, v78)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module77:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module77:jsonDecode()
	-- upvalues: Module77 (copy), t (copy)
	local NewModule = Module77.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.RefreshGamePassesAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.RefreshGamePassesAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module77.descriptor = {
	name = "RefreshGamePassesAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshGamePassesAction"
}
t.RefreshGamePassesAction = Module77
TypeRegistryModule.default:register(t.RefreshGamePassesAction)
local Module78 = {}
Module78.__index = Module78

function Module78.new(p1)
	-- upvalues: Module78 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id
	}, Module78))
end

function Module78:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module78.decode(Buf)
	-- upvalues: Module78 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module78.new()
	local v79 = 0
	while v79 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1884 = ProtoModule.readTag(Buf, v79)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1884 = ProtoModule.readVarInt(Buf, v79)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1884 = ProtoModule.readBuffer(Buf, v79)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v79)
				v79 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1884 = ProtoModule.readFixed32(Buf, v79)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1884 = ProtoModule.readFixed64(Buf, v79)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module78:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function Module78:jsonDecode()
	-- upvalues: Module78 (copy), PropTypesModule (copy)
	local NewModule = Module78.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return NewModule
end

Module78.descriptor = {
	name = "RefreshGamePassesAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshGamePassesAction_Params = Module78
TypeRegistryModule.default:register(t.RefreshGamePassesAction_Params)
local Module79 = {}
Module79.__index = Module79

function Module79.new(p1)
	-- upvalues: t (copy), Module79 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module79))
end

function Module79:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module79.decode(Buf)
	-- upvalues: Module79 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module79.new()
	local v80 = 0
	while v80 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1903 = ProtoModule.readTag(Buf, v80)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1903 = ProtoModule.readVarIntI32(Buf, v80)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1903 = ProtoModule.readVarInt(Buf, v80)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1903 = ProtoModule.readBuffer(Buf, v80)
				NewModule.action_params = t.RefreshPlayabilityAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v80)
				v80 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1903 = ProtoModule.readFixed32(Buf, v80)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1903 = ProtoModule.readFixed64(Buf, v80)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module79:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module79:jsonDecode()
	-- upvalues: Module79 (copy), t (copy)
	local NewModule = Module79.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.RefreshPlayabilityAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.RefreshPlayabilityAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module79.descriptor = {
	name = "RefreshPlayabilityAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshPlayabilityAction"
}
t.RefreshPlayabilityAction = Module79
TypeRegistryModule.default:register(t.RefreshPlayabilityAction)
local Module80 = {}
Module80.__index = Module80

function Module80.new(p1)
	-- upvalues: Module80 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id
	}, Module80))
end

function Module80:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module80.decode(Buf)
	-- upvalues: Module80 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module80.new()
	local v81 = 0
	while v81 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1921 = ProtoModule.readTag(Buf, v81)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1921 = ProtoModule.readVarInt(Buf, v81)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1921 = ProtoModule.readBuffer(Buf, v81)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v81)
				v81 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1921 = ProtoModule.readFixed32(Buf, v81)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1921 = ProtoModule.readFixed64(Buf, v81)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module80:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function Module80:jsonDecode()
	-- upvalues: Module80 (copy), PropTypesModule (copy)
	local NewModule = Module80.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return NewModule
end

Module80.descriptor = {
	name = "RefreshPlayabilityAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshPlayabilityAction_Params = Module80
TypeRegistryModule.default:register(t.RefreshPlayabilityAction_Params)
local Module81 = {}
Module81.__index = Module81

function Module81.new(p1)
	-- upvalues: t (copy), Module81 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module81))
end

function Module81:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module81.decode(Buf)
	-- upvalues: Module81 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module81.new()
	local v82 = 0
	while v82 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1940 = ProtoModule.readTag(Buf, v82)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1940 = ProtoModule.readVarIntI32(Buf, v82)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1940 = ProtoModule.readVarInt(Buf, v82)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1940 = ProtoModule.readBuffer(Buf, v82)
				NewModule.action_params = t.RefreshDeveloperProductsAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v82)
				v82 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1940 = ProtoModule.readFixed32(Buf, v82)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1940 = ProtoModule.readFixed64(Buf, v82)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module81:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module81:jsonDecode()
	-- upvalues: Module81 (copy), t (copy)
	local NewModule = Module81.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.RefreshDeveloperProductsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.RefreshDeveloperProductsAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module81.descriptor = {
	name = "RefreshDeveloperProductsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RefreshDeveloperProductsAction"
}
t.RefreshDeveloperProductsAction = Module81
TypeRegistryModule.default:register(t.RefreshDeveloperProductsAction)
local Module82 = {}
Module82.__index = Module82

function Module82.new(p1)
	-- upvalues: Module82 (copy)
	return (setmetatable({
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id
	}, Module82))
end

function Module82:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.place_id ~= nil then
		local EncodeResult = self.place_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module82.decode(Buf)
	-- upvalues: Module82 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module82.new()
	local v83 = 0
	while v83 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1958 = ProtoModule.readTag(Buf, v83)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1958 = ProtoModule.readVarInt(Buf, v83)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1958 = ProtoModule.readBuffer(Buf, v83)
				NewModule.place_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v83)
				v83 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1958 = ProtoModule.readFixed32(Buf, v83)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1958 = ProtoModule.readFixed64(Buf, v83)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module82:jsonEncode()
	local t = {}
	
	if self.place_id ~= nil then
		t.placeId = self.place_id:jsonEncode()
	end
	return t
end

function Module82:jsonDecode()
	-- upvalues: Module82 (copy), PropTypesModule (copy)
	local NewModule = Module82.new()
	
	if self.place_id ~= nil then
		NewModule.place_id = PropTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		NewModule.place_id = PropTypesModule.StringProp.jsonDecode(self.placeId)
	end
	return NewModule
end

Module82.descriptor = {
	name = "RefreshDeveloperProductsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RefreshDeveloperProductsAction_Params = Module82
TypeRegistryModule.default:register(t.RefreshDeveloperProductsAction_Params)
local Module83 = {}
Module83.__index = Module83

function Module83.new(p1)
	-- upvalues: t (copy), Module83 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module83))
end

function Module83:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module83.decode(Buf)
	-- upvalues: Module83 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module83.new()
	local v84 = 0
	while v84 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1977 = ProtoModule.readTag(Buf, v84)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v1977 = ProtoModule.readVarIntI32(Buf, v84)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v1977 = ProtoModule.readVarInt(Buf, v84)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v1977 = ProtoModule.readBuffer(Buf, v84)
				NewModule.action_params = t.OpenFaeTrialUpsellAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v84)
				v84 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1977 = ProtoModule.readFixed32(Buf, v84)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1977 = ProtoModule.readFixed64(Buf, v84)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module83:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module83:jsonDecode()
	-- upvalues: Module83 (copy), t (copy)
	local NewModule = Module83.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenFaeTrialUpsellAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenFaeTrialUpsellAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module83.descriptor = {
	name = "OpenFaeTrialUpsellAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenFaeTrialUpsellAction"
}
t.OpenFaeTrialUpsellAction = Module83
TypeRegistryModule.default:register(t.OpenFaeTrialUpsellAction)
local Module84 = {}
Module84.__index = Module84

function Module84.new(p1)
	-- upvalues: Module84 (copy)
	return (setmetatable({
		source = if p1 == nil or p1.source == nil then nil else p1.source
	}, Module84))
end

function Module84:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.source ~= nil then
		local EncodeResult = self.source:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module84.decode(Buf)
	-- upvalues: Module84 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module84.new()
	local v85 = 0
	while v85 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1995 = ProtoModule.readTag(Buf, v85)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1995 = ProtoModule.readVarInt(Buf, v85)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1995 = ProtoModule.readBuffer(Buf, v85)
				NewModule.source = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v85)
				v85 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1995 = ProtoModule.readFixed32(Buf, v85)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1995 = ProtoModule.readFixed64(Buf, v85)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module84:jsonEncode()
	local t = {}
	
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function Module84:jsonDecode()
	-- upvalues: Module84 (copy), PropTypesModule (copy)
	local NewModule = Module84.new()
	
	if self.source ~= nil then
		NewModule.source = PropTypesModule.StringProp.jsonDecode(self.source)
	end
	return NewModule
end

Module84.descriptor = {
	name = "OpenFaeTrialUpsellAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenFaeTrialUpsellAction_Params = Module84
TypeRegistryModule.default:register(t.OpenFaeTrialUpsellAction_Params)
local Module85 = {}
Module85.__index = Module85

function Module85.new(p1)
	-- upvalues: t (copy), Module85 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module85))
end

function Module85:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module85.decode(Buf)
	-- upvalues: Module85 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module85.new()
	local v86 = 0
	while v86 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2014 = ProtoModule.readTag(Buf, v86)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2014 = ProtoModule.readVarIntI32(Buf, v86)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v2014 = ProtoModule.readVarInt(Buf, v86)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2014 = ProtoModule.readBuffer(Buf, v86)
				NewModule.action_params = t.OpenSduiOverlayAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v86)
				v86 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2014 = ProtoModule.readFixed32(Buf, v86)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2014 = ProtoModule.readFixed64(Buf, v86)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module85:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module85:jsonDecode()
	-- upvalues: Module85 (copy), t (copy)
	local NewModule = Module85.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenSduiOverlayAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenSduiOverlayAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module85.descriptor = {
	name = "OpenSduiOverlayAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSduiOverlayAction"
}
t.OpenSduiOverlayAction = Module85
TypeRegistryModule.default:register(t.OpenSduiOverlayAction)
local Module86 = {}
Module86.__index = Module86

function Module86.new(p1)
	-- upvalues: Module86 (copy)
	return (setmetatable({
		config_key = if p1 == nil or p1.config_key == nil then nil else p1.config_key,
		identifier = if p1 == nil or p1.identifier == nil then nil else p1.identifier
	}, Module86))
end

function Module86:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.config_key ~= nil then
		local EncodeResult = self.config_key:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.identifier ~= nil then
		local EncodeResult = self.identifier:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module86.decode(Buf)
	-- upvalues: Module86 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module86.new()
	local v87 = 0
	while v87 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2035 = ProtoModule.readTag(Buf, v87)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2035 = ProtoModule.readVarInt(Buf, v87)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2035 = ProtoModule.readBuffer(Buf, v87)
				NewModule.config_key = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2035 = ProtoModule.readBuffer(Buf, v87)
				NewModule.identifier = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v87)
				v87 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2035 = ProtoModule.readFixed32(Buf, v87)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2035 = ProtoModule.readFixed64(Buf, v87)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module86:jsonEncode()
	local t = {}
	
	if self.config_key ~= nil then
		t.configKey = self.config_key:jsonEncode()
	end
	if self.identifier ~= nil then
		t.identifier = self.identifier:jsonEncode()
	end
	return t
end

function Module86:jsonDecode()
	-- upvalues: Module86 (copy), PropTypesModule (copy)
	local NewModule = Module86.new()
	
	if self.config_key ~= nil then
		NewModule.config_key = PropTypesModule.StringProp.jsonDecode(self.config_key)
	end
	if self.configKey ~= nil then
		NewModule.config_key = PropTypesModule.StringProp.jsonDecode(self.configKey)
	end
	if self.identifier ~= nil then
		NewModule.identifier = PropTypesModule.StringProp.jsonDecode(self.identifier)
	end
	return NewModule
end

Module86.descriptor = {
	name = "OpenSduiOverlayAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSduiOverlayAction_Params = Module86
TypeRegistryModule.default:register(t.OpenSduiOverlayAction_Params)
local Module87 = {}
Module87.__index = Module87

function Module87.new(p1)
	-- upvalues: t (copy), Module87 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module87))
end

function Module87:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module87.decode(Buf)
	-- upvalues: Module87 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module87.new()
	local v88 = 0
	while v88 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2055 = ProtoModule.readTag(Buf, v88)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2055 = ProtoModule.readVarIntI32(Buf, v88)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v2055 = ProtoModule.readVarInt(Buf, v88)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2055 = ProtoModule.readBuffer(Buf, v88)
				NewModule.action_params = t.ApplyChartsFilterAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v88)
				v88 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2055 = ProtoModule.readFixed32(Buf, v88)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2055 = ProtoModule.readFixed64(Buf, v88)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module87:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module87:jsonDecode()
	-- upvalues: Module87 (copy), t (copy)
	local NewModule = Module87.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.ApplyChartsFilterAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.ApplyChartsFilterAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module87.descriptor = {
	name = "ApplyChartsFilterAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ApplyChartsFilterAction"
}
t.ApplyChartsFilterAction = Module87
TypeRegistryModule.default:register(t.ApplyChartsFilterAction)
local Module88 = {}
Module88.__index = Module88

function Module88.new(p1)
	-- upvalues: Module88 (copy)
	return (setmetatable({
		session_id = if p1 == nil or p1.session_id == nil then nil else p1.session_id
	}, Module88))
end

function Module88:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.session_id ~= nil then
		local EncodeResult = self.session_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module88.decode(Buf)
	-- upvalues: Module88 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module88.new()
	local v89 = 0
	while v89 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2073 = ProtoModule.readTag(Buf, v89)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2073 = ProtoModule.readVarInt(Buf, v89)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2073 = ProtoModule.readBuffer(Buf, v89)
				NewModule.session_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v89)
				v89 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2073 = ProtoModule.readFixed32(Buf, v89)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2073 = ProtoModule.readFixed64(Buf, v89)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module88:jsonEncode()
	local t = {}
	
	if self.session_id ~= nil then
		t.sessionId = self.session_id:jsonEncode()
	end
	return t
end

function Module88:jsonDecode()
	-- upvalues: Module88 (copy), PropTypesModule (copy)
	local NewModule = Module88.new()
	
	if self.session_id ~= nil then
		NewModule.session_id = PropTypesModule.StringProp.jsonDecode(self.session_id)
	end
	if self.sessionId ~= nil then
		NewModule.session_id = PropTypesModule.StringProp.jsonDecode(self.sessionId)
	end
	return NewModule
end

Module88.descriptor = {
	name = "ApplyChartsFilterAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ApplyChartsFilterAction_Params = Module88
TypeRegistryModule.default:register(t.ApplyChartsFilterAction_Params)
local Module89 = {}
Module89.__index = Module89

function Module89.new(p1)
	-- upvalues: t (copy), Module89 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module89))
end

function Module89:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module89.decode(Buf)
	-- upvalues: Module89 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module89.new()
	local v90 = 0
	while v90 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2092 = ProtoModule.readTag(Buf, v90)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2092 = ProtoModule.readVarIntI32(Buf, v90)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v2092 = ProtoModule.readVarInt(Buf, v90)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2092 = ProtoModule.readBuffer(Buf, v90)
				NewModule.action_params = t.AnalyticsEventAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v90)
				v90 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2092 = ProtoModule.readFixed32(Buf, v90)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2092 = ProtoModule.readFixed64(Buf, v90)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module89:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module89:jsonDecode()
	-- upvalues: Module89 (copy), t (copy)
	local NewModule = Module89.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.AnalyticsEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.AnalyticsEventAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module89.descriptor = {
	name = "AnalyticsEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.AnalyticsEventAction"
}
t.AnalyticsEventAction = Module89
TypeRegistryModule.default:register(t.AnalyticsEventAction)
local Module90 = {}
Module90.__index = Module90

function Module90.new(p1)
	-- upvalues: Module90 (copy)
	return (setmetatable({
		event_name = if p1 == nil or p1.event_name == nil then nil else p1.event_name,
		event_fields = if p1 == nil or p1.event_fields == nil then nil else p1.event_fields
	}, Module90))
end

function Module90:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.event_name ~= nil then
		local EncodeResult = self.event_name:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.event_fields ~= nil then
		local EncodeResult = self.event_fields:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module90.decode(Buf)
	-- upvalues: Module90 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module90.new()
	local v91 = 0
	while v91 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2113 = ProtoModule.readTag(Buf, v91)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2113 = ProtoModule.readVarInt(Buf, v91)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2113 = ProtoModule.readBuffer(Buf, v91)
				NewModule.event_name = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2113 = ProtoModule.readBuffer(Buf, v91)
				NewModule.event_fields = PropTypesModule.StructProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v91)
				v91 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2113 = ProtoModule.readFixed32(Buf, v91)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2113 = ProtoModule.readFixed64(Buf, v91)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module90:jsonEncode()
	local t = {}
	
	if self.event_name ~= nil then
		t.eventName = self.event_name:jsonEncode()
	end
	if self.event_fields ~= nil then
		t.eventFields = self.event_fields:jsonEncode()
	end
	return t
end

function Module90:jsonDecode()
	-- upvalues: Module90 (copy), PropTypesModule (copy)
	local NewModule = Module90.new()
	
	if self.event_name ~= nil then
		NewModule.event_name = PropTypesModule.StringProp.jsonDecode(self.event_name)
	end
	if self.eventName ~= nil then
		NewModule.event_name = PropTypesModule.StringProp.jsonDecode(self.eventName)
	end
	if self.event_fields ~= nil then
		NewModule.event_fields = PropTypesModule.StructProp.jsonDecode(self.event_fields)
	end
	if self.eventFields ~= nil then
		NewModule.event_fields = PropTypesModule.StructProp.jsonDecode(self.eventFields)
	end
	return NewModule
end

Module90.descriptor = {
	name = "AnalyticsEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.AnalyticsEventAction_Params = Module90
TypeRegistryModule.default:register(t.AnalyticsEventAction_Params)
local Module91 = {}
Module91.__index = Module91

function Module91.new(p1)
	-- upvalues: t (copy), Module91 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module91))
end

function Module91:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module91.decode(Buf)
	-- upvalues: Module91 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module91.new()
	local v92 = 0
	while v92 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2133 = ProtoModule.readTag(Buf, v92)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2133 = ProtoModule.readVarIntI32(Buf, v92)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v2133 = ProtoModule.readVarInt(Buf, v92)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2133 = ProtoModule.readBuffer(Buf, v92)
				NewModule.action_params = t.CustomAnalyticsEventAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v92)
				v92 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2133 = ProtoModule.readFixed32(Buf, v92)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2133 = ProtoModule.readFixed64(Buf, v92)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module91:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module91:jsonDecode()
	-- upvalues: Module91 (copy), t (copy)
	local NewModule = Module91.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.CustomAnalyticsEventAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.CustomAnalyticsEventAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module91.descriptor = {
	name = "CustomAnalyticsEventAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomAnalyticsEventAction"
}
t.CustomAnalyticsEventAction = Module91
TypeRegistryModule.default:register(t.CustomAnalyticsEventAction)
local Module92 = {}
Module92.__index = Module92

function Module92.new(p1)
	-- upvalues: Module92 (copy)
	return (setmetatable({
		event_name = if p1 == nil or p1.event_name == nil then nil else p1.event_name,
		event_fields = if p1 == nil or p1.event_fields == nil then nil else p1.event_fields
	}, Module92))
end

function Module92:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.event_name ~= nil then
		local EncodeResult = self.event_name:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.event_fields ~= nil then
		local EncodeResult = self.event_fields:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module92.decode(Buf)
	-- upvalues: Module92 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module92.new()
	local v93 = 0
	while v93 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2154 = ProtoModule.readTag(Buf, v93)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2154 = ProtoModule.readVarInt(Buf, v93)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2154 = ProtoModule.readBuffer(Buf, v93)
				NewModule.event_name = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2154 = ProtoModule.readBuffer(Buf, v93)
				NewModule.event_fields = PropTypesModule.StructProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v93)
				v93 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2154 = ProtoModule.readFixed32(Buf, v93)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2154 = ProtoModule.readFixed64(Buf, v93)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module92:jsonEncode()
	local t = {}
	
	if self.event_name ~= nil then
		t.eventName = self.event_name:jsonEncode()
	end
	if self.event_fields ~= nil then
		t.eventFields = self.event_fields:jsonEncode()
	end
	return t
end

function Module92:jsonDecode()
	-- upvalues: Module92 (copy), PropTypesModule (copy)
	local NewModule = Module92.new()
	
	if self.event_name ~= nil then
		NewModule.event_name = PropTypesModule.StringProp.jsonDecode(self.event_name)
	end
	if self.eventName ~= nil then
		NewModule.event_name = PropTypesModule.StringProp.jsonDecode(self.eventName)
	end
	if self.event_fields ~= nil then
		NewModule.event_fields = PropTypesModule.StructProp.jsonDecode(self.event_fields)
	end
	if self.eventFields ~= nil then
		NewModule.event_fields = PropTypesModule.StructProp.jsonDecode(self.eventFields)
	end
	return NewModule
end

Module92.descriptor = {
	name = "CustomAnalyticsEventAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.CustomAnalyticsEventAction_Params = Module92
TypeRegistryModule.default:register(t.CustomAnalyticsEventAction_Params)
local Module93 = {}
Module93.__index = Module93

function Module93.new(p1)
	-- upvalues: t (copy), Module93 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module93))
end

function Module93:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module93.decode(Buf)
	-- upvalues: Module93 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module93.new()
	local v94 = 0
	while v94 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2174 = ProtoModule.readTag(Buf, v94)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2174 = ProtoModule.readVarIntI32(Buf, v94)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v2174 = ProtoModule.readVarInt(Buf, v94)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2174 = ProtoModule.readBuffer(Buf, v94)
				NewModule.action_params = t.OpenGameInviteAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v94)
				v94 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2174 = ProtoModule.readFixed32(Buf, v94)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2174 = ProtoModule.readFixed64(Buf, v94)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module93:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module93:jsonDecode()
	-- upvalues: Module93 (copy), t (copy)
	local NewModule = Module93.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenGameInviteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenGameInviteAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module93.descriptor = {
	name = "OpenGameInviteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameInviteAction"
}
t.OpenGameInviteAction = Module93
TypeRegistryModule.default:register(t.OpenGameInviteAction)
local Module94 = {}
Module94.__index = Module94

function Module94.new(p1)
	-- upvalues: Module94 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		root_place_id = if p1 == nil or p1.root_place_id == nil then nil else p1.root_place_id,
		trigger = if p1 == nil or p1.trigger == nil then nil else p1.trigger,
		button_name = if p1 == nil or p1.button_name == nil then nil else p1.button_name
	}, Module94))
end

function Module94:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.root_place_id ~= nil then
		local EncodeResult = self.root_place_id:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.trigger ~= nil then
		local EncodeResult = self.trigger:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.button_name ~= nil then
		local EncodeResult = self.button_name:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module94.decode(Buf)
	-- upvalues: Module94 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module94.new()
	local v95 = 0
	while v95 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2201 = ProtoModule.readTag(Buf, v95)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2201 = ProtoModule.readVarInt(Buf, v95)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2201 = ProtoModule.readBuffer(Buf, v95)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2201 = ProtoModule.readBuffer(Buf, v95)
				NewModule.root_place_id = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2201 = ProtoModule.readBuffer(Buf, v95)
				NewModule.trigger = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2201 = ProtoModule.readBuffer(Buf, v95)
				NewModule.button_name = PropTypesModule.StringProp.decode(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v95)
				v95 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2201 = ProtoModule.readFixed32(Buf, v95)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2201 = ProtoModule.readFixed64(Buf, v95)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module94:jsonEncode()
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

function Module94:jsonDecode()
	-- upvalues: Module94 (copy), PropTypesModule (copy)
	local NewModule = Module94.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.root_place_id ~= nil then
		NewModule.root_place_id = PropTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		NewModule.root_place_id = PropTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	if self.trigger ~= nil then
		NewModule.trigger = PropTypesModule.StringProp.jsonDecode(self.trigger)
	end
	if self.button_name ~= nil then
		NewModule.button_name = PropTypesModule.StringProp.jsonDecode(self.button_name)
	end
	if self.buttonName ~= nil then
		NewModule.button_name = PropTypesModule.StringProp.jsonDecode(self.buttonName)
	end
	return NewModule
end

Module94.descriptor = {
	name = "OpenGameInviteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameInviteAction_Params = Module94
TypeRegistryModule.default:register(t.OpenGameInviteAction_Params)
local Module95 = {}
Module95.__index = Module95

function Module95.new(p1)
	-- upvalues: t (copy), Module95 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module95))
end

function Module95:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module95.decode(Buf)
	-- upvalues: Module95 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module95.new()
	local v96 = 0
	while v96 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2223 = ProtoModule.readTag(Buf, v96)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2223 = ProtoModule.readVarIntI32(Buf, v96)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v2223 = ProtoModule.readVarInt(Buf, v96)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2223 = ProtoModule.readBuffer(Buf, v96)
				NewModule.action_params = t.LaunchExperienceAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v96)
				v96 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2223 = ProtoModule.readFixed32(Buf, v96)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2223 = ProtoModule.readFixed64(Buf, v96)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module95:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module95:jsonDecode()
	-- upvalues: Module95 (copy), t (copy)
	local NewModule = Module95.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.LaunchExperienceAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.LaunchExperienceAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module95.descriptor = {
	name = "LaunchExperienceAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.LaunchExperienceAction"
}
t.LaunchExperienceAction = Module95
TypeRegistryModule.default:register(t.LaunchExperienceAction)
local Module96 = {}
Module96.__index = Module96

function Module96.new(p1)
	-- upvalues: Module96 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module96))
end

function Module96:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module96.decode(Buf)
	-- upvalues: Module96 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module96.new()
	local v97 = 0
	while v97 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2243 = ProtoModule.readTag(Buf, v97)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2243 = ProtoModule.readVarInt(Buf, v97)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2243 = ProtoModule.readBuffer(Buf, v97)
				NewModule.kind = {
					type = "literal",
					value = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2243 = ProtoModule.readBuffer(Buf, v97)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v97)
				v97 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2243 = ProtoModule.readFixed32(Buf, v97)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2243 = ProtoModule.readFixed64(Buf, v97)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module96:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module96:jsonDecode()
	-- upvalues: Module96 (copy), t (copy)
	local NewModule = Module96.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module96.descriptor = {
	name = "LaunchExperienceAction_ExperienceJoinData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceJoinData"
}
t.LaunchExperienceAction_ExperienceJoinData = Module96
TypeRegistryModule.default:register(t.LaunchExperienceAction_ExperienceJoinData)
local Module97 = {}
Module97.__index = Module97

function Module97.new(p1)
	-- upvalues: Module97 (copy)
	return (setmetatable({
		launch_data = if p1 == nil or p1.launch_data == nil then nil else p1.launch_data,
		event_id = if p1 == nil or p1.event_id == nil then nil else p1.event_id
	}, Module97))
end

function Module97:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.launch_data ~= nil then
		local EncodeResult = self.launch_data:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.event_id ~= nil then
		local EncodeResult = self.event_id:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module97.decode(Buf)
	-- upvalues: Module97 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module97.new()
	local v98 = 0
	while v98 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2264 = ProtoModule.readTag(Buf, v98)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2264 = ProtoModule.readVarInt(Buf, v98)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2264 = ProtoModule.readBuffer(Buf, v98)
				NewModule.launch_data = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2264 = ProtoModule.readBuffer(Buf, v98)
				NewModule.event_id = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v98)
				v98 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2264 = ProtoModule.readFixed32(Buf, v98)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2264 = ProtoModule.readFixed64(Buf, v98)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module97:jsonEncode()
	local t = {}
	
	if self.launch_data ~= nil then
		t.launchData = self.launch_data:jsonEncode()
	end
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function Module97:jsonDecode()
	-- upvalues: Module97 (copy), PropTypesModule (copy)
	local NewModule = Module97.new()
	
	if self.launch_data ~= nil then
		NewModule.launch_data = PropTypesModule.StringProp.jsonDecode(self.launch_data)
	end
	if self.launchData ~= nil then
		NewModule.launch_data = PropTypesModule.StringProp.jsonDecode(self.launchData)
	end
	if self.event_id ~= nil then
		NewModule.event_id = PropTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		NewModule.event_id = PropTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return NewModule
end

Module97.descriptor = {
	name = "LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceJoinDataLiteral"
}
t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral = Module97
TypeRegistryModule.default:register(t.LaunchExperienceAction_ExperienceJoinData_ExperienceJoinDataLiteral)
local Module98 = {}
Module98.__index = Module98

function Module98.new(p1)
	-- upvalues: Module98 (copy)
	return (setmetatable({
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id,
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		launch_source = if p1 == nil or p1.launch_source == nil then nil else p1.launch_source,
		experience_join_data = if p1 == nil or p1.experience_join_data == nil then nil else p1.experience_join_data
	}, Module98))
end

function Module98:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.place_id ~= nil then
		local EncodeResult = self.place_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.launch_source ~= nil then
		local EncodeResult = self.launch_source:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.experience_join_data ~= nil then
		local EncodeResult = self.experience_join_data:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module98.decode(Buf)
	-- upvalues: Module98 (copy), ProtoModule (copy), PropTypesModule (copy), t (copy)
	local NewModule = Module98.new()
	local v99 = 0
	while v99 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2291 = ProtoModule.readTag(Buf, v99)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2291 = ProtoModule.readVarInt(Buf, v99)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2291 = ProtoModule.readBuffer(Buf, v99)
				NewModule.place_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2291 = ProtoModule.readBuffer(Buf, v99)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2291 = ProtoModule.readBuffer(Buf, v99)
				NewModule.launch_source = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2291 = ProtoModule.readBuffer(Buf, v99)
				NewModule.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.decode(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v99)
				v99 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2291 = ProtoModule.readFixed32(Buf, v99)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2291 = ProtoModule.readFixed64(Buf, v99)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module98:jsonEncode()
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

function Module98:jsonDecode()
	-- upvalues: Module98 (copy), PropTypesModule (copy), t (copy)
	local NewModule = Module98.new()
	
	if self.place_id ~= nil then
		NewModule.place_id = PropTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		NewModule.place_id = PropTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.launch_source ~= nil then
		NewModule.launch_source = PropTypesModule.StringProp.jsonDecode(self.launch_source)
	end
	if self.launchSource ~= nil then
		NewModule.launch_source = PropTypesModule.StringProp.jsonDecode(self.launchSource)
	end
	if self.experience_join_data ~= nil then
		NewModule.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experience_join_data)
	end
	if self.experienceJoinData ~= nil then
		NewModule.experience_join_data = t.LaunchExperienceAction_ExperienceJoinData.jsonDecode(self.experienceJoinData)
	end
	return NewModule
end

Module98.descriptor = {
	name = "LaunchExperienceAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.LaunchExperienceAction_Params = Module98
TypeRegistryModule.default:register(t.LaunchExperienceAction_Params)
local Module99 = {}
Module99.__index = Module99

function Module99.new(p1)
	-- upvalues: t (copy), Module99 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module99))
end

function Module99:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module99.decode(Buf)
	-- upvalues: Module99 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module99.new()
	local v100 = 0
	while v100 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2313 = ProtoModule.readTag(Buf, v100)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2313 = ProtoModule.readVarIntI32(Buf, v100)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v2313 = ProtoModule.readVarInt(Buf, v100)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2313 = ProtoModule.readBuffer(Buf, v100)
				NewModule.action_params = t.ToggleExperienceFavoriteAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v100)
				v100 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2313 = ProtoModule.readFixed32(Buf, v100)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2313 = ProtoModule.readFixed64(Buf, v100)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module99:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module99:jsonDecode()
	-- upvalues: Module99 (copy), t (copy)
	local NewModule = Module99.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.ToggleExperienceFavoriteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.ToggleExperienceFavoriteAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module99.descriptor = {
	name = "ToggleExperienceFavoriteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceFavoriteAction"
}
t.ToggleExperienceFavoriteAction = Module99
TypeRegistryModule.default:register(t.ToggleExperienceFavoriteAction)
local Module100 = {}
Module100.__index = Module100

function Module100.new(p1)
	-- upvalues: Module100 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id,
		ctx = if p1 == nil or p1.ctx == nil then nil else p1.ctx
	}, Module100))
end

function Module100:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.place_id ~= nil then
		local EncodeResult = self.place_id:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.ctx ~= nil then
		local EncodeResult = self.ctx:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module100.decode(Buf)
	-- upvalues: Module100 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module100.new()
	local v101 = 0
	while v101 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2337 = ProtoModule.readTag(Buf, v101)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2337 = ProtoModule.readVarInt(Buf, v101)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2337 = ProtoModule.readBuffer(Buf, v101)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2337 = ProtoModule.readBuffer(Buf, v101)
				NewModule.place_id = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2337 = ProtoModule.readBuffer(Buf, v101)
				NewModule.ctx = PropTypesModule.StringProp.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v101)
				v101 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2337 = ProtoModule.readFixed32(Buf, v101)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2337 = ProtoModule.readFixed64(Buf, v101)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module100:jsonEncode()
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

function Module100:jsonDecode()
	-- upvalues: Module100 (copy), PropTypesModule (copy)
	local NewModule = Module100.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		NewModule.place_id = PropTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		NewModule.place_id = PropTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.ctx ~= nil then
		NewModule.ctx = PropTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return NewModule
end

Module100.descriptor = {
	name = "ToggleExperienceFavoriteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceFavoriteAction_Params = Module100
TypeRegistryModule.default:register(t.ToggleExperienceFavoriteAction_Params)
local Module101 = {}
Module101.__index = Module101

function Module101.new(p1)
	-- upvalues: t (copy), Module101 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module101))
end

function Module101:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module101.decode(Buf)
	-- upvalues: Module101 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module101.new()
	local v102 = 0
	while v102 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2358 = ProtoModule.readTag(Buf, v102)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2358 = ProtoModule.readVarIntI32(Buf, v102)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v2358 = ProtoModule.readVarInt(Buf, v102)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2358 = ProtoModule.readBuffer(Buf, v102)
				NewModule.action_params = t.ToggleExperienceFollowAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v102)
				v102 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2358 = ProtoModule.readFixed32(Buf, v102)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2358 = ProtoModule.readFixed64(Buf, v102)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module101:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module101:jsonDecode()
	-- upvalues: Module101 (copy), t (copy)
	local NewModule = Module101.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.ToggleExperienceFollowAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.ToggleExperienceFollowAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module101.descriptor = {
	name = "ToggleExperienceFollowAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceFollowAction"
}
t.ToggleExperienceFollowAction = Module101
TypeRegistryModule.default:register(t.ToggleExperienceFollowAction)
local Module102 = {}
Module102.__index = Module102

function Module102.new(p1)
	-- upvalues: Module102 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		game_name = if p1 == nil or p1.game_name == nil then nil else p1.game_name,
		ctx = if p1 == nil or p1.ctx == nil then nil else p1.ctx
	}, Module102))
end

function Module102:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.game_name ~= nil then
		local EncodeResult = self.game_name:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.ctx ~= nil then
		local EncodeResult = self.ctx:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module102.decode(Buf)
	-- upvalues: Module102 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module102.new()
	local v103 = 0
	while v103 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2382 = ProtoModule.readTag(Buf, v103)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2382 = ProtoModule.readVarInt(Buf, v103)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2382 = ProtoModule.readBuffer(Buf, v103)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2382 = ProtoModule.readBuffer(Buf, v103)
				NewModule.game_name = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2382 = ProtoModule.readBuffer(Buf, v103)
				NewModule.ctx = PropTypesModule.StringProp.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v103)
				v103 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2382 = ProtoModule.readFixed32(Buf, v103)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2382 = ProtoModule.readFixed64(Buf, v103)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module102:jsonEncode()
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

function Module102:jsonDecode()
	-- upvalues: Module102 (copy), PropTypesModule (copy)
	local NewModule = Module102.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.game_name ~= nil then
		NewModule.game_name = PropTypesModule.StringProp.jsonDecode(self.game_name)
	end
	if self.gameName ~= nil then
		NewModule.game_name = PropTypesModule.StringProp.jsonDecode(self.gameName)
	end
	if self.ctx ~= nil then
		NewModule.ctx = PropTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return NewModule
end

Module102.descriptor = {
	name = "ToggleExperienceFollowAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceFollowAction_Params = Module102
TypeRegistryModule.default:register(t.ToggleExperienceFollowAction_Params)
local Module103 = {}
Module103.__index = Module103

function Module103.new(p1)
	-- upvalues: t (copy), Module103 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module103))
end

function Module103:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module103.decode(Buf)
	-- upvalues: Module103 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module103.new()
	local v104 = 0
	while v104 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2403 = ProtoModule.readTag(Buf, v104)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2403 = ProtoModule.readVarIntI32(Buf, v104)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v2403 = ProtoModule.readVarInt(Buf, v104)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2403 = ProtoModule.readBuffer(Buf, v104)
				NewModule.action_params = t.ToggleExperienceVoteAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v104)
				v104 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2403 = ProtoModule.readFixed32(Buf, v104)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2403 = ProtoModule.readFixed64(Buf, v104)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module103:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module103:jsonDecode()
	-- upvalues: Module103 (copy), t (copy)
	local NewModule = Module103.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.ToggleExperienceVoteAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.ToggleExperienceVoteAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module103.descriptor = {
	name = "ToggleExperienceVoteAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ToggleExperienceVoteAction"
}
t.ToggleExperienceVoteAction = Module103
TypeRegistryModule.default:register(t.ToggleExperienceVoteAction)
local Module104 = {}
Module104.__index = Module104

function Module104.new(p1)
	-- upvalues: Module104 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		vote_direction = if p1 == nil or p1.vote_direction == nil then nil else p1.vote_direction,
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id,
		ctx = if p1 == nil or p1.ctx == nil then nil else p1.ctx
	}, Module104))
end

function Module104:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.vote_direction ~= nil then
		local EncodeResult = self.vote_direction:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.place_id ~= nil then
		local EncodeResult = self.place_id:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.ctx ~= nil then
		local EncodeResult = self.ctx:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module104.decode(Buf)
	-- upvalues: Module104 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module104.new()
	local v105 = 0
	while v105 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2430 = ProtoModule.readTag(Buf, v105)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2430 = ProtoModule.readVarInt(Buf, v105)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2430 = ProtoModule.readBuffer(Buf, v105)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2430 = ProtoModule.readBuffer(Buf, v105)
				NewModule.vote_direction = PropTypesModule.BoolProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2430 = ProtoModule.readBuffer(Buf, v105)
				NewModule.place_id = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2430 = ProtoModule.readBuffer(Buf, v105)
				NewModule.ctx = PropTypesModule.StringProp.decode(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v105)
				v105 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2430 = ProtoModule.readFixed32(Buf, v105)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2430 = ProtoModule.readFixed64(Buf, v105)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module104:jsonEncode()
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

function Module104:jsonDecode()
	-- upvalues: Module104 (copy), PropTypesModule (copy)
	local NewModule = Module104.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.vote_direction ~= nil then
		NewModule.vote_direction = PropTypesModule.BoolProp.jsonDecode(self.vote_direction)
	end
	if self.voteDirection ~= nil then
		NewModule.vote_direction = PropTypesModule.BoolProp.jsonDecode(self.voteDirection)
	end
	if self.place_id ~= nil then
		NewModule.place_id = PropTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		NewModule.place_id = PropTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.ctx ~= nil then
		NewModule.ctx = PropTypesModule.StringProp.jsonDecode(self.ctx)
	end
	return NewModule
end

Module104.descriptor = {
	name = "ToggleExperienceVoteAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ToggleExperienceVoteAction_Params = Module104
TypeRegistryModule.default:register(t.ToggleExperienceVoteAction_Params)
local Module105 = {}
Module105.__index = Module105

function Module105.new(p1)
	-- upvalues: t (copy), Module105 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module105))
end

function Module105:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module105.decode(Buf)
	-- upvalues: Module105 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module105.new()
	local v106 = 0
	while v106 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2452 = ProtoModule.readTag(Buf, v106)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2452 = ProtoModule.readVarIntI32(Buf, v106)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v2452 = ProtoModule.readVarInt(Buf, v106)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2452 = ProtoModule.readBuffer(Buf, v106)
				NewModule.action_params = t.OpenPurchasePromptAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v106)
				v106 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2452 = ProtoModule.readFixed32(Buf, v106)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2452 = ProtoModule.readFixed64(Buf, v106)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module105:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module105:jsonDecode()
	-- upvalues: Module105 (copy), t (copy)
	local NewModule = Module105.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenPurchasePromptAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenPurchasePromptAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module105.descriptor = {
	name = "OpenPurchasePromptAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenPurchasePromptAction"
}
t.OpenPurchasePromptAction = Module105
TypeRegistryModule.default:register(t.OpenPurchasePromptAction)
local Module106 = {}
Module106.__index = Module106

function Module106.new(p1)
	-- upvalues: Module106 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module106))
end

function Module106:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module106.decode(Buf)
	-- upvalues: Module106 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module106.new()
	local v107 = 0
	while v107 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2472 = ProtoModule.readTag(Buf, v107)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2472 = ProtoModule.readVarInt(Buf, v107)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2472 = ProtoModule.readBuffer(Buf, v107)
				NewModule.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2472 = ProtoModule.readBuffer(Buf, v107)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v107)
				v107 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2472 = ProtoModule.readFixed32(Buf, v107)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2472 = ProtoModule.readFixed64(Buf, v107)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module106:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module106:jsonDecode()
	-- upvalues: Module106 (copy), t (copy)
	local NewModule = Module106.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module106.descriptor = {
	name = "OpenPurchasePromptAction_ProductPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ProductPayload"
}
t.OpenPurchasePromptAction_ProductPayload = Module106
TypeRegistryModule.default:register(t.OpenPurchasePromptAction_ProductPayload)
local Module107 = {}
Module107.__index = Module107

function Module107.new(p1)
	-- upvalues: Module107 (copy)
	return (setmetatable({
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
	}, Module107))
end

function Module107:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		local EncodeResult = self.kind:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.id ~= nil then
		local EncodeResult = self.id:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.subscription_id ~= nil then
		local EncodeResult = self.subscription_id:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	if self.equip_if_purchased ~= nil then
		local EncodeResult = self.equip_if_purchased:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	if self.name ~= nil then
		local EncodeResult = self.name:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	if self.expected_price ~= nil then
		local EncodeResult = self.expected_price:encode()
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, EncodeResult, buffer.len(EncodeResult))
	end
	if self.icon_image_asset_id ~= nil then
		local EncodeResult = self.icon_image_asset_id:encode()
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, EncodeResult, buffer.len(EncodeResult))
	end
	if self.is_subscription_in_robux ~= nil then
		local EncodeResult = self.is_subscription_in_robux:encode()
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, EncodeResult, buffer.len(EncodeResult))
	end
	if self.display_price ~= nil then
		local EncodeResult = self.display_price:encode()
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult10, WriteTagResult2_9, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module107.decode(Buf)
	-- upvalues: Module107 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module107.new()
	local v108 = 0
	while v108 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2517 = ProtoModule.readTag(Buf, v108)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2517 = ProtoModule.readVarInt(Buf, v108)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2517 = ProtoModule.readBuffer(Buf, v108)
				NewModule.kind = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2517 = ProtoModule.readBuffer(Buf, v108)
				NewModule.id = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2517 = ProtoModule.readBuffer(Buf, v108)
				NewModule.subscription_id = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2517 = ProtoModule.readBuffer(Buf, v108)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v2517 = ProtoModule.readBuffer(Buf, v108)
				NewModule.equip_if_purchased = PropTypesModule.BoolProp.decode(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v2517 = ProtoModule.readBuffer(Buf, v108)
				NewModule.name = PropTypesModule.StringProp.decode(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v2517 = ProtoModule.readBuffer(Buf, v108)
				NewModule.expected_price = PropTypesModule.Int64Prop.decode(Buffer7)
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v2517 = ProtoModule.readBuffer(Buf, v108)
				NewModule.icon_image_asset_id = PropTypesModule.Int64Prop.decode(Buffer8)
			elseif Tag == 9 then
				local Buffer9
				Buffer9, v2517 = ProtoModule.readBuffer(Buf, v108)
				NewModule.is_subscription_in_robux = PropTypesModule.BoolProp.decode(Buffer9)
			elseif Tag == 10 then
				local Buffer10
				Buffer10, v2517 = ProtoModule.readBuffer(Buf, v108)
				NewModule.display_price = PropTypesModule.StringProp.decode(Buffer10)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v108)
				v108 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2517 = ProtoModule.readFixed32(Buf, v108)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2517 = ProtoModule.readFixed64(Buf, v108)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module107:jsonEncode()
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

function Module107:jsonDecode()
	-- upvalues: Module107 (copy), PropTypesModule (copy)
	local NewModule = Module107.new()
	
	if self.kind ~= nil then
		NewModule.kind = PropTypesModule.StringProp.jsonDecode(self.kind)
	end
	if self.id ~= nil then
		NewModule.id = PropTypesModule.StringProp.jsonDecode(self.id)
	end
	if self.subscription_id ~= nil then
		NewModule.subscription_id = PropTypesModule.StringProp.jsonDecode(self.subscription_id)
	end
	if self.subscriptionId ~= nil then
		NewModule.subscription_id = PropTypesModule.StringProp.jsonDecode(self.subscriptionId)
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.equip_if_purchased ~= nil then
		NewModule.equip_if_purchased = PropTypesModule.BoolProp.jsonDecode(self.equip_if_purchased)
	end
	if self.equipIfPurchased ~= nil then
		NewModule.equip_if_purchased = PropTypesModule.BoolProp.jsonDecode(self.equipIfPurchased)
	end
	if self.name ~= nil then
		NewModule.name = PropTypesModule.StringProp.jsonDecode(self.name)
	end
	if self.expected_price ~= nil then
		NewModule.expected_price = PropTypesModule.Int64Prop.jsonDecode(self.expected_price)
	end
	if self.expectedPrice ~= nil then
		NewModule.expected_price = PropTypesModule.Int64Prop.jsonDecode(self.expectedPrice)
	end
	if self.icon_image_asset_id ~= nil then
		NewModule.icon_image_asset_id = PropTypesModule.Int64Prop.jsonDecode(self.icon_image_asset_id)
	end
	if self.iconImageAssetId ~= nil then
		NewModule.icon_image_asset_id = PropTypesModule.Int64Prop.jsonDecode(self.iconImageAssetId)
	end
	if self.is_subscription_in_robux ~= nil then
		NewModule.is_subscription_in_robux = PropTypesModule.BoolProp.jsonDecode(self.is_subscription_in_robux)
	end
	if self.isSubscriptionInRobux ~= nil then
		NewModule.is_subscription_in_robux = PropTypesModule.BoolProp.jsonDecode(self.isSubscriptionInRobux)
	end
	if self.display_price ~= nil then
		NewModule.display_price = PropTypesModule.StringProp.jsonDecode(self.display_price)
	end
	if self.displayPrice ~= nil then
		NewModule.display_price = PropTypesModule.StringProp.jsonDecode(self.displayPrice)
	end
	return NewModule
end

Module107.descriptor = {
	name = "OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.ProductPayloadLiteral"
}
t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral = Module107
TypeRegistryModule.default:register(t.OpenPurchasePromptAction_ProductPayload_ProductPayloadLiteral)
local Module108 = {}
Module108.__index = Module108

function Module108.new(p1)
	-- upvalues: Module108 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module108))
end

function Module108:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module108.decode(Buf)
	-- upvalues: Module108 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module108.new()
	local v109 = 0
	while v109 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2545 = ProtoModule.readTag(Buf, v109)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2545 = ProtoModule.readVarInt(Buf, v109)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2545 = ProtoModule.readBuffer(Buf, v109)
				NewModule.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2545 = ProtoModule.readBuffer(Buf, v109)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v109)
				v109 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2545 = ProtoModule.readFixed32(Buf, v109)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2545 = ProtoModule.readFixed64(Buf, v109)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module108:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module108:jsonDecode()
	-- upvalues: Module108 (copy), t (copy)
	local NewModule = Module108.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module108.descriptor = {
	name = "OpenPurchasePromptAction_DisplayInfo",
	fullName = "roblox.apppageplatform.shared.v1beta1.DisplayInfo"
}
t.OpenPurchasePromptAction_DisplayInfo = Module108
TypeRegistryModule.default:register(t.OpenPurchasePromptAction_DisplayInfo)
local Module109 = {}
Module109.__index = Module109

function Module109.new(p1)
	-- upvalues: Module109 (copy)
	return (setmetatable({
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
	}, Module109))
end

function Module109:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.product_name ~= nil then
		local EncodeResult = self.product_name:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.description ~= nil then
		local EncodeResult = self.description:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.image_url ~= nil then
		local EncodeResult = self.image_url:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	if self.price_in_robux ~= nil then
		local EncodeResult = self.price_in_robux:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	if self.display_price ~= nil then
		local EncodeResult = self.display_price:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	if self.icon_image_asset_id ~= nil then
		local EncodeResult = self.icon_image_asset_id:encode()
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, EncodeResult, buffer.len(EncodeResult))
	end
	if self.product_id ~= nil then
		local EncodeResult = self.product_id:encode()
		local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, EncodeResult, buffer.len(EncodeResult))
	end
	if self.target_id ~= nil then
		local EncodeResult = self.target_id:encode()
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, EncodeResult, buffer.len(EncodeResult))
	end
	if self.is_for_sale ~= nil then
		local EncodeResult = self.is_for_sale:encode()
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult10, WriteTagResult2_9, EncodeResult, buffer.len(EncodeResult))
	end
	if self.product_type ~= nil then
		local EncodeResult = self.product_type:encode()
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult11, WriteTagResult2_10, EncodeResult, buffer.len(EncodeResult))
	end
	if self.base_price_in_robux ~= nil then
		local EncodeResult = self.base_price_in_robux:encode()
		local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult12, WriteTagResult2_11, EncodeResult, buffer.len(EncodeResult))
	end
	if self.price_discount_details ~= nil then
		local EncodeResult = self.price_discount_details:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module109.decode(Buf)
	-- upvalues: Module109 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module109.new()
	local v110 = 0
	while v110 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2596 = ProtoModule.readTag(Buf, v110)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2596 = ProtoModule.readVarInt(Buf, v110)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2596 = ProtoModule.readBuffer(Buf, v110)
				NewModule.product_name = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2596 = ProtoModule.readBuffer(Buf, v110)
				NewModule.description = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2596 = ProtoModule.readBuffer(Buf, v110)
				NewModule.image_url = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2596 = ProtoModule.readBuffer(Buf, v110)
				NewModule.price_in_robux = PropTypesModule.Int64Prop.decode(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v2596 = ProtoModule.readBuffer(Buf, v110)
				NewModule.display_price = PropTypesModule.StringProp.decode(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v2596 = ProtoModule.readBuffer(Buf, v110)
				NewModule.icon_image_asset_id = PropTypesModule.Int64Prop.decode(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v2596 = ProtoModule.readBuffer(Buf, v110)
				NewModule.product_id = PropTypesModule.Int64Prop.decode(Buffer7)
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v2596 = ProtoModule.readBuffer(Buf, v110)
				NewModule.target_id = PropTypesModule.StringProp.decode(Buffer8)
			elseif Tag == 9 then
				local Buffer9
				Buffer9, v2596 = ProtoModule.readBuffer(Buf, v110)
				NewModule.is_for_sale = PropTypesModule.BoolProp.decode(Buffer9)
			elseif Tag == 10 then
				local Buffer10
				Buffer10, v2596 = ProtoModule.readBuffer(Buf, v110)
				NewModule.product_type = PropTypesModule.StringProp.decode(Buffer10)
			elseif Tag == 11 then
				local Buffer11
				Buffer11, v2596 = ProtoModule.readBuffer(Buf, v110)
				NewModule.base_price_in_robux = PropTypesModule.Int64Prop.decode(Buffer11)
			elseif Tag == 12 then
				local Buffer12
				Buffer12, v2596 = ProtoModule.readBuffer(Buf, v110)
				NewModule.price_discount_details = PropTypesModule.ArrayOfStructProp.decode(Buffer12)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v110)
				v110 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2596 = ProtoModule.readFixed32(Buf, v110)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2596 = ProtoModule.readFixed64(Buf, v110)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module109:jsonEncode()
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

function Module109:jsonDecode()
	-- upvalues: Module109 (copy), PropTypesModule (copy)
	local NewModule = Module109.new()
	
	if self.product_name ~= nil then
		NewModule.product_name = PropTypesModule.StringProp.jsonDecode(self.product_name)
	end
	if self.productName ~= nil then
		NewModule.product_name = PropTypesModule.StringProp.jsonDecode(self.productName)
	end
	if self.description ~= nil then
		NewModule.description = PropTypesModule.StringProp.jsonDecode(self.description)
	end
	if self.image_url ~= nil then
		NewModule.image_url = PropTypesModule.StringProp.jsonDecode(self.image_url)
	end
	if self.imageUrl ~= nil then
		NewModule.image_url = PropTypesModule.StringProp.jsonDecode(self.imageUrl)
	end
	if self.price_in_robux ~= nil then
		NewModule.price_in_robux = PropTypesModule.Int64Prop.jsonDecode(self.price_in_robux)
	end
	if self.priceInRobux ~= nil then
		NewModule.price_in_robux = PropTypesModule.Int64Prop.jsonDecode(self.priceInRobux)
	end
	if self.display_price ~= nil then
		NewModule.display_price = PropTypesModule.StringProp.jsonDecode(self.display_price)
	end
	if self.displayPrice ~= nil then
		NewModule.display_price = PropTypesModule.StringProp.jsonDecode(self.displayPrice)
	end
	if self.icon_image_asset_id ~= nil then
		NewModule.icon_image_asset_id = PropTypesModule.Int64Prop.jsonDecode(self.icon_image_asset_id)
	end
	if self.iconImageAssetId ~= nil then
		NewModule.icon_image_asset_id = PropTypesModule.Int64Prop.jsonDecode(self.iconImageAssetId)
	end
	if self.product_id ~= nil then
		NewModule.product_id = PropTypesModule.Int64Prop.jsonDecode(self.product_id)
	end
	if self.productId ~= nil then
		NewModule.product_id = PropTypesModule.Int64Prop.jsonDecode(self.productId)
	end
	if self.target_id ~= nil then
		NewModule.target_id = PropTypesModule.StringProp.jsonDecode(self.target_id)
	end
	if self.targetId ~= nil then
		NewModule.target_id = PropTypesModule.StringProp.jsonDecode(self.targetId)
	end
	if self.is_for_sale ~= nil then
		NewModule.is_for_sale = PropTypesModule.BoolProp.jsonDecode(self.is_for_sale)
	end
	if self.isForSale ~= nil then
		NewModule.is_for_sale = PropTypesModule.BoolProp.jsonDecode(self.isForSale)
	end
	if self.product_type ~= nil then
		NewModule.product_type = PropTypesModule.StringProp.jsonDecode(self.product_type)
	end
	if self.productType ~= nil then
		NewModule.product_type = PropTypesModule.StringProp.jsonDecode(self.productType)
	end
	if self.base_price_in_robux ~= nil then
		NewModule.base_price_in_robux = PropTypesModule.Int64Prop.jsonDecode(self.base_price_in_robux)
	end
	if self.basePriceInRobux ~= nil then
		NewModule.base_price_in_robux = PropTypesModule.Int64Prop.jsonDecode(self.basePriceInRobux)
	end
	if self.price_discount_details ~= nil then
		NewModule.price_discount_details = PropTypesModule.ArrayOfStructProp.jsonDecode(self.price_discount_details)
	end
	if self.priceDiscountDetails ~= nil then
		NewModule.price_discount_details = PropTypesModule.ArrayOfStructProp.jsonDecode(self.priceDiscountDetails)
	end
	return NewModule
end

Module109.descriptor = {
	name = "OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.DisplayInfoLiteral"
}
t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral = Module109
TypeRegistryModule.default:register(t.OpenPurchasePromptAction_DisplayInfo_DisplayInfoLiteral)
local Module110 = {}
Module110.__index = Module110

function Module110.new(p1)
	-- upvalues: Module110 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module110))
end

function Module110:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module110.decode(Buf)
	-- upvalues: Module110 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module110.new()
	local v111 = 0
	while v111 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2626 = ProtoModule.readTag(Buf, v111)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2626 = ProtoModule.readVarInt(Buf, v111)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2626 = ProtoModule.readBuffer(Buf, v111)
				NewModule.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2626 = ProtoModule.readBuffer(Buf, v111)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v111)
				v111 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2626 = ProtoModule.readFixed32(Buf, v111)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2626 = ProtoModule.readFixed64(Buf, v111)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module110:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module110:jsonDecode()
	-- upvalues: Module110 (copy), t (copy)
	local NewModule = Module110.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module110.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseOptions"
}
t.OpenPurchasePromptAction_PurchaseOptions = Module110
TypeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseOptions)
local Module111 = {}
Module111.__index = Module111

function Module111.new(p1)
	-- upvalues: Module111 (copy)
	return (setmetatable({
		should_skip_ownership_check = if p1 == nil or p1.should_skip_ownership_check == nil then nil else p1.should_skip_ownership_check,
		enable_preloaded_purchase_ui = if p1 == nil or p1.enable_preloaded_purchase_ui == nil then nil else p1.enable_preloaded_purchase_ui,
		completion_message = if p1 == nil or p1.completion_message == nil then nil else p1.completion_message,
		completion_button_text = if p1 == nil or p1.completion_button_text == nil then nil else p1.completion_button_text,
		prevent_double_confirm = if p1 == nil or p1.prevent_double_confirm == nil then nil else p1.prevent_double_confirm,
		provided_robux_balance = if p1 == nil or p1.provided_robux_balance == nil then nil else p1.provided_robux_balance
	}, Module111))
end

function Module111:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.should_skip_ownership_check ~= nil then
		local EncodeResult = self.should_skip_ownership_check:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		local EncodeResult = self.enable_preloaded_purchase_ui:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.completion_message ~= nil then
		local EncodeResult = self.completion_message:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.completion_button_text ~= nil then
		local EncodeResult = self.completion_button_text:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	if self.prevent_double_confirm ~= nil then
		local EncodeResult = self.prevent_double_confirm:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	if self.provided_robux_balance ~= nil then
		local EncodeResult = self.provided_robux_balance:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module111.decode(Buf)
	-- upvalues: Module111 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module111.new()
	local v112 = 0
	while v112 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2659 = ProtoModule.readTag(Buf, v112)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2659 = ProtoModule.readVarInt(Buf, v112)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2659 = ProtoModule.readBuffer(Buf, v112)
				NewModule.should_skip_ownership_check = PropTypesModule.BoolProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2659 = ProtoModule.readBuffer(Buf, v112)
				NewModule.enable_preloaded_purchase_ui = PropTypesModule.BoolProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2659 = ProtoModule.readBuffer(Buf, v112)
				NewModule.completion_message = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2659 = ProtoModule.readBuffer(Buf, v112)
				NewModule.completion_button_text = PropTypesModule.StringProp.decode(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v2659 = ProtoModule.readBuffer(Buf, v112)
				NewModule.prevent_double_confirm = PropTypesModule.BoolProp.decode(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v2659 = ProtoModule.readBuffer(Buf, v112)
				NewModule.provided_robux_balance = PropTypesModule.Int64Prop.decode(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v112)
				v112 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2659 = ProtoModule.readFixed32(Buf, v112)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2659 = ProtoModule.readFixed64(Buf, v112)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module111:jsonEncode()
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

function Module111:jsonDecode()
	-- upvalues: Module111 (copy), PropTypesModule (copy)
	local NewModule = Module111.new()
	
	if self.should_skip_ownership_check ~= nil then
		NewModule.should_skip_ownership_check = PropTypesModule.BoolProp.jsonDecode(self.should_skip_ownership_check)
	end
	if self.shouldSkipOwnershipCheck ~= nil then
		NewModule.should_skip_ownership_check = PropTypesModule.BoolProp.jsonDecode(self.shouldSkipOwnershipCheck)
	end
	if self.enable_preloaded_purchase_ui ~= nil then
		NewModule.enable_preloaded_purchase_ui = PropTypesModule.BoolProp.jsonDecode(self.enable_preloaded_purchase_ui)
	end
	if self.enablePreloadedPurchaseUi ~= nil then
		NewModule.enable_preloaded_purchase_ui = PropTypesModule.BoolProp.jsonDecode(self.enablePreloadedPurchaseUi)
	end
	if self.completion_message ~= nil then
		NewModule.completion_message = PropTypesModule.StringProp.jsonDecode(self.completion_message)
	end
	if self.completionMessage ~= nil then
		NewModule.completion_message = PropTypesModule.StringProp.jsonDecode(self.completionMessage)
	end
	if self.completion_button_text ~= nil then
		NewModule.completion_button_text = PropTypesModule.StringProp.jsonDecode(self.completion_button_text)
	end
	if self.completionButtonText ~= nil then
		NewModule.completion_button_text = PropTypesModule.StringProp.jsonDecode(self.completionButtonText)
	end
	if self.prevent_double_confirm ~= nil then
		NewModule.prevent_double_confirm = PropTypesModule.BoolProp.jsonDecode(self.prevent_double_confirm)
	end
	if self.preventDoubleConfirm ~= nil then
		NewModule.prevent_double_confirm = PropTypesModule.BoolProp.jsonDecode(self.preventDoubleConfirm)
	end
	if self.provided_robux_balance ~= nil then
		NewModule.provided_robux_balance = PropTypesModule.Int64Prop.jsonDecode(self.provided_robux_balance)
	end
	if self.providedRobuxBalance ~= nil then
		NewModule.provided_robux_balance = PropTypesModule.Int64Prop.jsonDecode(self.providedRobuxBalance)
	end
	return NewModule
end

Module111.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseOptionsLiteral"
}
t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral = Module111
TypeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseOptions_PurchaseOptionsLiteral)
local Module112 = {}
Module112.__index = Module112

function Module112.new(p1)
	-- upvalues: Module112 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module112))
end

function Module112:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module112.decode(Buf)
	-- upvalues: Module112 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module112.new()
	local v113 = 0
	while v113 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2683 = ProtoModule.readTag(Buf, v113)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2683 = ProtoModule.readVarInt(Buf, v113)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2683 = ProtoModule.readBuffer(Buf, v113)
				NewModule.kind = {
					type = "literal",
					value = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2683 = ProtoModule.readBuffer(Buf, v113)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v113)
				v113 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2683 = ProtoModule.readFixed32(Buf, v113)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2683 = ProtoModule.readFixed64(Buf, v113)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module112:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module112:jsonDecode()
	-- upvalues: Module112 (copy), t (copy)
	local NewModule = Module112.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module112.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseAnalyticsMetadata",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseAnalyticsMetadata"
}
t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata = Module112
TypeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata)
local Module113 = {}
Module113.__index = Module113

function Module113.new(p1)
	-- upvalues: Module113 (copy)
	return (setmetatable({
		surface = if p1 == nil or p1.surface == nil then nil else p1.surface,
		product_universe_id = if p1 == nil or p1.product_universe_id == nil then nil else p1.product_universe_id
	}, Module113))
end

function Module113:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.surface ~= nil then
		local EncodeResult = self.surface:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.product_universe_id ~= nil then
		local EncodeResult = self.product_universe_id:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module113.decode(Buf)
	-- upvalues: Module113 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module113.new()
	local v114 = 0
	while v114 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2704 = ProtoModule.readTag(Buf, v114)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2704 = ProtoModule.readVarInt(Buf, v114)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2704 = ProtoModule.readBuffer(Buf, v114)
				NewModule.surface = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2704 = ProtoModule.readBuffer(Buf, v114)
				NewModule.product_universe_id = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v114)
				v114 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2704 = ProtoModule.readFixed32(Buf, v114)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2704 = ProtoModule.readFixed64(Buf, v114)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module113:jsonEncode()
	local t = {}
	
	if self.surface ~= nil then
		t.surface = self.surface:jsonEncode()
	end
	if self.product_universe_id ~= nil then
		t.productUniverseId = self.product_universe_id:jsonEncode()
	end
	return t
end

function Module113:jsonDecode()
	-- upvalues: Module113 (copy), PropTypesModule (copy)
	local NewModule = Module113.new()
	
	if self.surface ~= nil then
		NewModule.surface = PropTypesModule.StringProp.jsonDecode(self.surface)
	end
	if self.product_universe_id ~= nil then
		NewModule.product_universe_id = PropTypesModule.StringProp.jsonDecode(self.product_universe_id)
	end
	if self.productUniverseId ~= nil then
		NewModule.product_universe_id = PropTypesModule.StringProp.jsonDecode(self.productUniverseId)
	end
	return NewModule
end

Module113.descriptor = {
	name = "OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral",
	fullName = "roblox.apppageplatform.shared.v1beta1.PurchaseAnalyticsMetadataLiteral"
}
t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral = Module113
TypeRegistryModule.default:register(t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata_PurchaseAnalyticsMetadataLiteral)
local Module114 = {}
Module114.__index = Module114

function Module114.new(p1)
	-- upvalues: Module114 (copy)
	return (setmetatable({
		product_payload = if p1 == nil or p1.product_payload == nil then nil else p1.product_payload,
		display_info = if p1 == nil or p1.display_info == nil then nil else p1.display_info,
		purchase_options = if p1 == nil or p1.purchase_options == nil then nil else p1.purchase_options,
		purchase_analytics_metadata = if p1 == nil or p1.purchase_analytics_metadata == nil then nil else p1.purchase_analytics_metadata,
		root_place_id = if p1 == nil or p1.root_place_id == nil then nil else p1.root_place_id
	}, Module114))
end

function Module114:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.product_payload ~= nil then
		local EncodeResult = self.product_payload:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.display_info ~= nil then
		local EncodeResult = self.display_info:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.purchase_options ~= nil then
		local EncodeResult = self.purchase_options:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.purchase_analytics_metadata ~= nil then
		local EncodeResult = self.purchase_analytics_metadata:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	if self.root_place_id ~= nil then
		local EncodeResult = self.root_place_id:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module114.decode(Buf)
	-- upvalues: Module114 (copy), ProtoModule (copy), t (copy), PropTypesModule (copy)
	local NewModule = Module114.new()
	local v115 = 0
	while v115 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2734 = ProtoModule.readTag(Buf, v115)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2734 = ProtoModule.readVarInt(Buf, v115)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2734 = ProtoModule.readBuffer(Buf, v115)
				NewModule.product_payload = t.OpenPurchasePromptAction_ProductPayload.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2734 = ProtoModule.readBuffer(Buf, v115)
				NewModule.display_info = t.OpenPurchasePromptAction_DisplayInfo.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2734 = ProtoModule.readBuffer(Buf, v115)
				NewModule.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2734 = ProtoModule.readBuffer(Buf, v115)
				NewModule.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.decode(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v2734 = ProtoModule.readBuffer(Buf, v115)
				NewModule.root_place_id = PropTypesModule.StringProp.decode(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v115)
				v115 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2734 = ProtoModule.readFixed32(Buf, v115)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2734 = ProtoModule.readFixed64(Buf, v115)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module114:jsonEncode()
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

function Module114:jsonDecode()
	-- upvalues: Module114 (copy), t (copy), PropTypesModule (copy)
	local NewModule = Module114.new()
	
	if self.product_payload ~= nil then
		NewModule.product_payload = t.OpenPurchasePromptAction_ProductPayload.jsonDecode(self.product_payload)
	end
	if self.productPayload ~= nil then
		NewModule.product_payload = t.OpenPurchasePromptAction_ProductPayload.jsonDecode(self.productPayload)
	end
	if self.display_info ~= nil then
		NewModule.display_info = t.OpenPurchasePromptAction_DisplayInfo.jsonDecode(self.display_info)
	end
	if self.displayInfo ~= nil then
		NewModule.display_info = t.OpenPurchasePromptAction_DisplayInfo.jsonDecode(self.displayInfo)
	end
	if self.purchase_options ~= nil then
		NewModule.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.jsonDecode(self.purchase_options)
	end
	if self.purchaseOptions ~= nil then
		NewModule.purchase_options = t.OpenPurchasePromptAction_PurchaseOptions.jsonDecode(self.purchaseOptions)
	end
	if self.purchase_analytics_metadata ~= nil then
		NewModule.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.jsonDecode(self.purchase_analytics_metadata)
	end
	if self.purchaseAnalyticsMetadata ~= nil then
		NewModule.purchase_analytics_metadata = t.OpenPurchasePromptAction_PurchaseAnalyticsMetadata.jsonDecode(self.purchaseAnalyticsMetadata)
	end
	if self.root_place_id ~= nil then
		NewModule.root_place_id = PropTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		NewModule.root_place_id = PropTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return NewModule
end

Module114.descriptor = {
	name = "OpenPurchasePromptAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenPurchasePromptAction_Params = Module114
TypeRegistryModule.default:register(t.OpenPurchasePromptAction_Params)
local Module115 = {}
Module115.__index = Module115

function Module115.new(p1)
	-- upvalues: t (copy), Module115 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module115))
end

function Module115:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module115.decode(Buf)
	-- upvalues: Module115 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module115.new()
	local v116 = 0
	while v116 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2757 = ProtoModule.readTag(Buf, v116)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2757 = ProtoModule.readVarIntI32(Buf, v116)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v2757 = ProtoModule.readVarInt(Buf, v116)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2757 = ProtoModule.readBuffer(Buf, v116)
				NewModule.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v116)
				v116 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2757 = ProtoModule.readFixed32(Buf, v116)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2757 = ProtoModule.readFixed64(Buf, v116)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module115:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module115:jsonDecode()
	-- upvalues: Module115 (copy), t (copy)
	local NewModule = Module115.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.ReportSurfaceLoadTimeMilestoneAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module115.descriptor = {
	name = "ReportSurfaceLoadTimeMilestoneAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.ReportSurfaceLoadTimeMilestoneAction"
}
t.ReportSurfaceLoadTimeMilestoneAction = Module115
TypeRegistryModule.default:register(t.ReportSurfaceLoadTimeMilestoneAction)
local Module116 = {}
Module116.__index = Module116

function Module116.new(p1)
	-- upvalues: Module116 (copy)
	return (setmetatable({
		milestone = if p1 == nil or p1.milestone == nil then nil else p1.milestone,
		metadata = if p1 == nil or p1.metadata == nil then nil else p1.metadata
	}, Module116))
end

function Module116:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.milestone ~= nil then
		local EncodeResult = self.milestone:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.metadata ~= nil then
		local EncodeResult = self.metadata:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module116.decode(Buf)
	-- upvalues: Module116 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module116.new()
	local v117 = 0
	while v117 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2778 = ProtoModule.readTag(Buf, v117)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2778 = ProtoModule.readVarInt(Buf, v117)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2778 = ProtoModule.readBuffer(Buf, v117)
				NewModule.milestone = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v2778 = ProtoModule.readBuffer(Buf, v117)
				NewModule.metadata = PropTypesModule.StructProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v117)
				v117 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2778 = ProtoModule.readFixed32(Buf, v117)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2778 = ProtoModule.readFixed64(Buf, v117)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module116:jsonEncode()
	local t = {}
	
	if self.milestone ~= nil then
		t.milestone = self.milestone:jsonEncode()
	end
	if self.metadata ~= nil then
		t.metadata = self.metadata:jsonEncode()
	end
	return t
end

function Module116:jsonDecode()
	-- upvalues: Module116 (copy), PropTypesModule (copy)
	local NewModule = Module116.new()
	
	if self.milestone ~= nil then
		NewModule.milestone = PropTypesModule.StringProp.jsonDecode(self.milestone)
	end
	if self.metadata ~= nil then
		NewModule.metadata = PropTypesModule.StructProp.jsonDecode(self.metadata)
	end
	return NewModule
end

Module116.descriptor = {
	name = "ReportSurfaceLoadTimeMilestoneAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.ReportSurfaceLoadTimeMilestoneAction_Params = Module116
TypeRegistryModule.default:register(t.ReportSurfaceLoadTimeMilestoneAction_Params)
local Module117 = {}
Module117.__index = Module117

function Module117.new(p1)
	-- upvalues: t (copy), Module117 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module117))
end

function Module117:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module117.decode(Buf)
	-- upvalues: Module117 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module117.new()
	local v118 = 0
	while v118 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2798 = ProtoModule.readTag(Buf, v118)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2798 = ProtoModule.readVarIntI32(Buf, v118)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v2798 = ProtoModule.readVarInt(Buf, v118)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2798 = ProtoModule.readBuffer(Buf, v118)
				NewModule.action_params = t.DismissGameFeedbackAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v118)
				v118 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2798 = ProtoModule.readFixed32(Buf, v118)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2798 = ProtoModule.readFixed64(Buf, v118)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module117:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module117:jsonDecode()
	-- upvalues: Module117 (copy), t (copy)
	local NewModule = Module117.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.DismissGameFeedbackAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.DismissGameFeedbackAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module117.descriptor = {
	name = "DismissGameFeedbackAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissGameFeedbackAction"
}
t.DismissGameFeedbackAction = Module117
TypeRegistryModule.default:register(t.DismissGameFeedbackAction)
local Module118 = {}
Module118.__index = Module118

function Module118.new(p1)
	-- upvalues: Module118 (copy)
	return (setmetatable({
		root_place_id = if p1 == nil or p1.root_place_id == nil then nil else p1.root_place_id
	}, Module118))
end

function Module118:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.root_place_id ~= nil then
		local EncodeResult = self.root_place_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module118.decode(Buf)
	-- upvalues: Module118 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module118.new()
	local v119 = 0
	while v119 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2816 = ProtoModule.readTag(Buf, v119)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2816 = ProtoModule.readVarInt(Buf, v119)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2816 = ProtoModule.readBuffer(Buf, v119)
				NewModule.root_place_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v119)
				v119 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2816 = ProtoModule.readFixed32(Buf, v119)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2816 = ProtoModule.readFixed64(Buf, v119)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module118:jsonEncode()
	local t = {}
	
	if self.root_place_id ~= nil then
		t.rootPlaceId = self.root_place_id:jsonEncode()
	end
	return t
end

function Module118:jsonDecode()
	-- upvalues: Module118 (copy), PropTypesModule (copy)
	local NewModule = Module118.new()
	
	if self.root_place_id ~= nil then
		NewModule.root_place_id = PropTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		NewModule.root_place_id = PropTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return NewModule
end

Module118.descriptor = {
	name = "DismissGameFeedbackAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissGameFeedbackAction_Params = Module118
TypeRegistryModule.default:register(t.DismissGameFeedbackAction_Params)
local Module119 = {}
Module119.__index = Module119

function Module119.new(p1)
	-- upvalues: t (copy), Module119 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module119))
end

function Module119:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module119.decode(Buf)
	-- upvalues: Module119 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module119.new()
	local v120 = 0
	while v120 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2835 = ProtoModule.readTag(Buf, v120)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2835 = ProtoModule.readVarIntI32(Buf, v120)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v2835 = ProtoModule.readVarInt(Buf, v120)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2835 = ProtoModule.readBuffer(Buf, v120)
				NewModule.action_params = t.OpenGameFeedbackFormAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v120)
				v120 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2835 = ProtoModule.readFixed32(Buf, v120)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2835 = ProtoModule.readFixed64(Buf, v120)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module119:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module119:jsonDecode()
	-- upvalues: Module119 (copy), t (copy)
	local NewModule = Module119.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenGameFeedbackFormAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenGameFeedbackFormAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module119.descriptor = {
	name = "OpenGameFeedbackFormAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenGameFeedbackFormAction"
}
t.OpenGameFeedbackFormAction = Module119
TypeRegistryModule.default:register(t.OpenGameFeedbackFormAction)
local Module120 = {}
Module120.__index = Module120

function Module120.new(p1)
	-- upvalues: Module120 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		root_place_id = if p1 == nil or p1.root_place_id == nil then nil else p1.root_place_id
	}, Module120))
end

function Module120:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.root_place_id ~= nil then
		local EncodeResult = self.root_place_id:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module120.decode(Buf)
	-- upvalues: Module120 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module120.new()
	local v121 = 0
	while v121 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2856 = ProtoModule.readTag(Buf, v121)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2856 = ProtoModule.readVarInt(Buf, v121)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2856 = ProtoModule.readBuffer(Buf, v121)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2856 = ProtoModule.readBuffer(Buf, v121)
				NewModule.root_place_id = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v121)
				v121 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2856 = ProtoModule.readFixed32(Buf, v121)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2856 = ProtoModule.readFixed64(Buf, v121)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module120:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	if self.root_place_id ~= nil then
		t.rootPlaceId = self.root_place_id:jsonEncode()
	end
	return t
end

function Module120:jsonDecode()
	-- upvalues: Module120 (copy), PropTypesModule (copy)
	local NewModule = Module120.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.root_place_id ~= nil then
		NewModule.root_place_id = PropTypesModule.StringProp.jsonDecode(self.root_place_id)
	end
	if self.rootPlaceId ~= nil then
		NewModule.root_place_id = PropTypesModule.StringProp.jsonDecode(self.rootPlaceId)
	end
	return NewModule
end

Module120.descriptor = {
	name = "OpenGameFeedbackFormAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenGameFeedbackFormAction_Params = Module120
TypeRegistryModule.default:register(t.OpenGameFeedbackFormAction_Params)
local Module121 = {}
Module121.__index = Module121

function Module121.new(p1)
	-- upvalues: t (copy), Module121 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module121))
end

function Module121:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module121.decode(Buf)
	-- upvalues: Module121 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module121.new()
	local v122 = 0
	while v122 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2876 = ProtoModule.readTag(Buf, v122)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2876 = ProtoModule.readVarIntI32(Buf, v122)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v2876 = ProtoModule.readVarInt(Buf, v122)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2876 = ProtoModule.readBuffer(Buf, v122)
				NewModule.action_params = t.AiOverviewFeedbackAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v122)
				v122 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2876 = ProtoModule.readFixed32(Buf, v122)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2876 = ProtoModule.readFixed64(Buf, v122)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module121:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module121:jsonDecode()
	-- upvalues: Module121 (copy), t (copy)
	local NewModule = Module121.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.AiOverviewFeedbackAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.AiOverviewFeedbackAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module121.descriptor = {
	name = "AiOverviewFeedbackAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.AiOverviewFeedbackAction"
}
t.AiOverviewFeedbackAction = Module121
TypeRegistryModule.default:register(t.AiOverviewFeedbackAction)
local Module122 = {}
Module122.__index = Module122

function Module122.new(p1)
	-- upvalues: Module122 (copy)
	return (setmetatable({
		sentiment = if p1 == nil or p1.sentiment == nil then nil else p1.sentiment,
		dialog_title = if p1 == nil or p1.dialog_title == nil then nil else p1.dialog_title,
		dialog_text = if p1 == nil or p1.dialog_text == nil then nil else p1.dialog_text,
		placeholder_text = if p1 == nil or p1.placeholder_text == nil then nil else p1.placeholder_text
	}, Module122))
end

function Module122:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.sentiment ~= nil then
		local EncodeResult = self.sentiment:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.dialog_title ~= nil then
		local EncodeResult = self.dialog_title:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.dialog_text ~= nil then
		local EncodeResult = self.dialog_text:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.placeholder_text ~= nil then
		local EncodeResult = self.placeholder_text:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module122.decode(Buf)
	-- upvalues: Module122 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module122.new()
	local v123 = 0
	while v123 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2903 = ProtoModule.readTag(Buf, v123)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2903 = ProtoModule.readVarInt(Buf, v123)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2903 = ProtoModule.readBuffer(Buf, v123)
				NewModule.sentiment = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2903 = ProtoModule.readBuffer(Buf, v123)
				NewModule.dialog_title = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2903 = ProtoModule.readBuffer(Buf, v123)
				NewModule.dialog_text = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2903 = ProtoModule.readBuffer(Buf, v123)
				NewModule.placeholder_text = PropTypesModule.StringProp.decode(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v123)
				v123 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2903 = ProtoModule.readFixed32(Buf, v123)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2903 = ProtoModule.readFixed64(Buf, v123)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module122:jsonEncode()
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

function Module122:jsonDecode()
	-- upvalues: Module122 (copy), PropTypesModule (copy)
	local NewModule = Module122.new()
	
	if self.sentiment ~= nil then
		NewModule.sentiment = PropTypesModule.StringProp.jsonDecode(self.sentiment)
	end
	if self.dialog_title ~= nil then
		NewModule.dialog_title = PropTypesModule.StringProp.jsonDecode(self.dialog_title)
	end
	if self.dialogTitle ~= nil then
		NewModule.dialog_title = PropTypesModule.StringProp.jsonDecode(self.dialogTitle)
	end
	if self.dialog_text ~= nil then
		NewModule.dialog_text = PropTypesModule.StringProp.jsonDecode(self.dialog_text)
	end
	if self.dialogText ~= nil then
		NewModule.dialog_text = PropTypesModule.StringProp.jsonDecode(self.dialogText)
	end
	if self.placeholder_text ~= nil then
		NewModule.placeholder_text = PropTypesModule.StringProp.jsonDecode(self.placeholder_text)
	end
	if self.placeholderText ~= nil then
		NewModule.placeholder_text = PropTypesModule.StringProp.jsonDecode(self.placeholderText)
	end
	return NewModule
end

Module122.descriptor = {
	name = "AiOverviewFeedbackAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.AiOverviewFeedbackAction_Params = Module122
TypeRegistryModule.default:register(t.AiOverviewFeedbackAction_Params)
local Module123 = {}
Module123.__index = Module123

function Module123.new(p1)
	-- upvalues: t (copy), Module123 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module123))
end

function Module123:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module123.decode(Buf)
	-- upvalues: Module123 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module123.new()
	local v124 = 0
	while v124 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2925 = ProtoModule.readTag(Buf, v124)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2925 = ProtoModule.readVarIntI32(Buf, v124)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v2925 = ProtoModule.readVarInt(Buf, v124)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2925 = ProtoModule.readBuffer(Buf, v124)
				NewModule.action_params = t.EnableEventNotificationsAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v124)
				v124 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2925 = ProtoModule.readFixed32(Buf, v124)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2925 = ProtoModule.readFixed64(Buf, v124)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module123:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module123:jsonDecode()
	-- upvalues: Module123 (copy), t (copy)
	local NewModule = Module123.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.EnableEventNotificationsAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.EnableEventNotificationsAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module123.descriptor = {
	name = "EnableEventNotificationsAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.EnableEventNotificationsAction"
}
t.EnableEventNotificationsAction = Module123
TypeRegistryModule.default:register(t.EnableEventNotificationsAction)
local Module124 = {}
Module124.__index = Module124

function Module124.new(p1)
	-- upvalues: Module124 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then nil else p1.event_id,
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		channel = if p1 == nil or p1.channel == nil then nil else p1.channel
	}, Module124))
end

function Module124:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.event_id ~= nil then
		local EncodeResult = self.event_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.channel ~= nil then
		local EncodeResult = self.channel:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module124.decode(Buf)
	-- upvalues: Module124 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module124.new()
	local v125 = 0
	while v125 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2949 = ProtoModule.readTag(Buf, v125)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2949 = ProtoModule.readVarInt(Buf, v125)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2949 = ProtoModule.readBuffer(Buf, v125)
				NewModule.event_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2949 = ProtoModule.readBuffer(Buf, v125)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2949 = ProtoModule.readBuffer(Buf, v125)
				NewModule.channel = PropTypesModule.StringProp.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v125)
				v125 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2949 = ProtoModule.readFixed32(Buf, v125)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2949 = ProtoModule.readFixed64(Buf, v125)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module124:jsonEncode()
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

function Module124:jsonDecode()
	-- upvalues: Module124 (copy), PropTypesModule (copy)
	local NewModule = Module124.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = PropTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		NewModule.event_id = PropTypesModule.StringProp.jsonDecode(self.eventId)
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.channel ~= nil then
		NewModule.channel = PropTypesModule.StringProp.jsonDecode(self.channel)
	end
	return NewModule
end

Module124.descriptor = {
	name = "EnableEventNotificationsAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.EnableEventNotificationsAction_Params = Module124
TypeRegistryModule.default:register(t.EnableEventNotificationsAction_Params)
local Module125 = {}
Module125.__index = Module125

function Module125.new(p1)
	-- upvalues: t (copy), Module125 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module125))
end

function Module125:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module125.decode(Buf)
	-- upvalues: Module125 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module125.new()
	local v126 = 0
	while v126 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2970 = ProtoModule.readTag(Buf, v126)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2970 = ProtoModule.readVarIntI32(Buf, v126)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v2970 = ProtoModule.readVarInt(Buf, v126)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2970 = ProtoModule.readBuffer(Buf, v126)
				NewModule.action_params = t.DismissEventNotificationsModalAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v126)
				v126 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2970 = ProtoModule.readFixed32(Buf, v126)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2970 = ProtoModule.readFixed64(Buf, v126)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module125:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module125:jsonDecode()
	-- upvalues: Module125 (copy), t (copy)
	local NewModule = Module125.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.DismissEventNotificationsModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.DismissEventNotificationsModalAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module125.descriptor = {
	name = "DismissEventNotificationsModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissEventNotificationsModalAction"
}
t.DismissEventNotificationsModalAction = Module125
TypeRegistryModule.default:register(t.DismissEventNotificationsModalAction)
local Module126 = {}
Module126.__index = Module126

function Module126.new(p1)
	-- upvalues: Module126 (copy)
	return (setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then nil else p1.event_id
	}, Module126))
end

function Module126:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.event_id ~= nil then
		local EncodeResult = self.event_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module126.decode(Buf)
	-- upvalues: Module126 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module126.new()
	local v127 = 0
	while v127 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2988 = ProtoModule.readTag(Buf, v127)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2988 = ProtoModule.readVarInt(Buf, v127)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2988 = ProtoModule.readBuffer(Buf, v127)
				NewModule.event_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v127)
				v127 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2988 = ProtoModule.readFixed32(Buf, v127)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2988 = ProtoModule.readFixed64(Buf, v127)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module126:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function Module126:jsonDecode()
	-- upvalues: Module126 (copy), PropTypesModule (copy)
	local NewModule = Module126.new()
	
	if self.event_id ~= nil then
		NewModule.event_id = PropTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		NewModule.event_id = PropTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return NewModule
end

Module126.descriptor = {
	name = "DismissEventNotificationsModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissEventNotificationsModalAction_Params = Module126
TypeRegistryModule.default:register(t.DismissEventNotificationsModalAction_Params)
local Module127 = {}
Module127.__index = Module127

function Module127.new(p1)
	-- upvalues: t (copy), Module127 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module127))
end

function Module127:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module127.decode(Buf)
	-- upvalues: Module127 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module127.new()
	local v128 = 0
	while v128 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3007 = ProtoModule.readTag(Buf, v128)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v3007 = ProtoModule.readVarIntI32(Buf, v128)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v3007 = ProtoModule.readVarInt(Buf, v128)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v3007 = ProtoModule.readBuffer(Buf, v128)
				NewModule.action_params = t.OpenAmpWizardAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v128)
				v128 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3007 = ProtoModule.readFixed32(Buf, v128)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3007 = ProtoModule.readFixed64(Buf, v128)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module127:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module127:jsonDecode()
	-- upvalues: Module127 (copy), t (copy)
	local NewModule = Module127.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenAmpWizardAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenAmpWizardAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module127.descriptor = {
	name = "OpenAmpWizardAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenAmpWizardAction"
}
t.OpenAmpWizardAction = Module127
TypeRegistryModule.default:register(t.OpenAmpWizardAction)
local Module128 = {}
Module128.__index = Module128

function Module128.new(p1)
	-- upvalues: Module128 (copy)
	return (setmetatable({
		feature_name = if p1 == nil or p1.feature_name == nil then nil else p1.feature_name,
		name_space = if p1 == nil or p1.name_space == nil then nil else p1.name_space,
		entry_point_event_ctx = if p1 == nil or p1.entry_point_event_ctx == nil then nil else p1.entry_point_event_ctx,
		skip_facial_age_estimation_web_link_modal = if p1 == nil or p1.skip_facial_age_estimation_web_link_modal == nil then nil else p1.skip_facial_age_estimation_web_link_modal
	}, Module128))
end

function Module128:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.feature_name ~= nil then
		local EncodeResult = self.feature_name:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.name_space ~= nil then
		local EncodeResult = self.name_space:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.entry_point_event_ctx ~= nil then
		local EncodeResult = self.entry_point_event_ctx:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		local EncodeResult = self.skip_facial_age_estimation_web_link_modal:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module128.decode(Buf)
	-- upvalues: Module128 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module128.new()
	local v129 = 0
	while v129 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3034 = ProtoModule.readTag(Buf, v129)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3034 = ProtoModule.readVarInt(Buf, v129)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3034 = ProtoModule.readBuffer(Buf, v129)
				NewModule.feature_name = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3034 = ProtoModule.readBuffer(Buf, v129)
				NewModule.name_space = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3034 = ProtoModule.readBuffer(Buf, v129)
				NewModule.entry_point_event_ctx = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v3034 = ProtoModule.readBuffer(Buf, v129)
				NewModule.skip_facial_age_estimation_web_link_modal = PropTypesModule.BoolProp.decode(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v129)
				v129 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3034 = ProtoModule.readFixed32(Buf, v129)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3034 = ProtoModule.readFixed64(Buf, v129)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module128:jsonEncode()
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

function Module128:jsonDecode()
	-- upvalues: Module128 (copy), PropTypesModule (copy)
	local NewModule = Module128.new()
	
	if self.feature_name ~= nil then
		NewModule.feature_name = PropTypesModule.StringProp.jsonDecode(self.feature_name)
	end
	if self.featureName ~= nil then
		NewModule.feature_name = PropTypesModule.StringProp.jsonDecode(self.featureName)
	end
	if self.name_space ~= nil then
		NewModule.name_space = PropTypesModule.StringProp.jsonDecode(self.name_space)
	end
	if self.nameSpace ~= nil then
		NewModule.name_space = PropTypesModule.StringProp.jsonDecode(self.nameSpace)
	end
	if self.entry_point_event_ctx ~= nil then
		NewModule.entry_point_event_ctx = PropTypesModule.StringProp.jsonDecode(self.entry_point_event_ctx)
	end
	if self.entryPointEventCtx ~= nil then
		NewModule.entry_point_event_ctx = PropTypesModule.StringProp.jsonDecode(self.entryPointEventCtx)
	end
	if self.skip_facial_age_estimation_web_link_modal ~= nil then
		NewModule.skip_facial_age_estimation_web_link_modal = PropTypesModule.BoolProp.jsonDecode(self.skip_facial_age_estimation_web_link_modal)
	end
	if self.skipFacialAgeEstimationWebLinkModal ~= nil then
		NewModule.skip_facial_age_estimation_web_link_modal = PropTypesModule.BoolProp.jsonDecode(self.skipFacialAgeEstimationWebLinkModal)
	end
	return NewModule
end

Module128.descriptor = {
	name = "OpenAmpWizardAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenAmpWizardAction_Params = Module128
TypeRegistryModule.default:register(t.OpenAmpWizardAction_Params)
local Module129 = {}
Module129.__index = Module129

function Module129.new(p1)
	-- upvalues: t (copy), Module129 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module129))
end

function Module129:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module129.decode(Buf)
	-- upvalues: Module129 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module129.new()
	local v130 = 0
	while v130 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3056 = ProtoModule.readTag(Buf, v130)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v3056 = ProtoModule.readVarIntI32(Buf, v130)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v3056 = ProtoModule.readVarInt(Buf, v130)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v3056 = ProtoModule.readBuffer(Buf, v130)
				NewModule.action_params = t.OpenSocialProofUserListSheetAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v130)
				v130 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3056 = ProtoModule.readFixed32(Buf, v130)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3056 = ProtoModule.readFixed64(Buf, v130)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module129:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module129:jsonDecode()
	-- upvalues: Module129 (copy), t (copy)
	local NewModule = Module129.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenSocialProofUserListSheetAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenSocialProofUserListSheetAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module129.descriptor = {
	name = "OpenSocialProofUserListSheetAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSocialProofUserListSheetAction"
}
t.OpenSocialProofUserListSheetAction = Module129
TypeRegistryModule.default:register(t.OpenSocialProofUserListSheetAction)
local Module130 = {}
Module130.__index = Module130

function Module130.new(p1)
	-- upvalues: Module130 (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id,
		total_connections = if p1 == nil or p1.total_connections == nil then nil else p1.total_connections,
		user_ids = if p1 == nil or p1.user_ids == nil then nil else p1.user_ids,
		sheet_title = if p1 == nil or p1.sheet_title == nil then nil else p1.sheet_title
	}, Module130))
end

function Module130:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil then
		local EncodeResult = self.universe_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.place_id ~= nil then
		local EncodeResult = self.place_id:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.total_connections ~= nil then
		local EncodeResult = self.total_connections:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.user_ids ~= nil then
		local EncodeResult = self.user_ids:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	if self.sheet_title ~= nil then
		local EncodeResult = self.sheet_title:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module130.decode(Buf)
	-- upvalues: Module130 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module130.new()
	local v131 = 0
	while v131 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3086 = ProtoModule.readTag(Buf, v131)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3086 = ProtoModule.readVarInt(Buf, v131)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3086 = ProtoModule.readBuffer(Buf, v131)
				NewModule.universe_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3086 = ProtoModule.readBuffer(Buf, v131)
				NewModule.place_id = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3086 = ProtoModule.readBuffer(Buf, v131)
				NewModule.total_connections = PropTypesModule.Int32Prop.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v3086 = ProtoModule.readBuffer(Buf, v131)
				NewModule.user_ids = PropTypesModule.ArrayOfAvatarProp.decode(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v3086 = ProtoModule.readBuffer(Buf, v131)
				NewModule.sheet_title = PropTypesModule.StringProp.decode(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v131)
				v131 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3086 = ProtoModule.readFixed32(Buf, v131)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3086 = ProtoModule.readFixed64(Buf, v131)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module130:jsonEncode()
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

function Module130:jsonDecode()
	-- upvalues: Module130 (copy), PropTypesModule (copy)
	local NewModule = Module130.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		NewModule.universe_id = PropTypesModule.StringProp.jsonDecode(self.universeId)
	end
	if self.place_id ~= nil then
		NewModule.place_id = PropTypesModule.StringProp.jsonDecode(self.place_id)
	end
	if self.placeId ~= nil then
		NewModule.place_id = PropTypesModule.StringProp.jsonDecode(self.placeId)
	end
	if self.total_connections ~= nil then
		NewModule.total_connections = PropTypesModule.Int32Prop.jsonDecode(self.total_connections)
	end
	if self.totalConnections ~= nil then
		NewModule.total_connections = PropTypesModule.Int32Prop.jsonDecode(self.totalConnections)
	end
	if self.user_ids ~= nil then
		NewModule.user_ids = PropTypesModule.ArrayOfAvatarProp.jsonDecode(self.user_ids)
	end
	if self.userIds ~= nil then
		NewModule.user_ids = PropTypesModule.ArrayOfAvatarProp.jsonDecode(self.userIds)
	end
	if self.sheet_title ~= nil then
		NewModule.sheet_title = PropTypesModule.StringProp.jsonDecode(self.sheet_title)
	end
	if self.sheetTitle ~= nil then
		NewModule.sheet_title = PropTypesModule.StringProp.jsonDecode(self.sheetTitle)
	end
	return NewModule
end

Module130.descriptor = {
	name = "OpenSocialProofUserListSheetAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSocialProofUserListSheetAction_Params = Module130
TypeRegistryModule.default:register(t.OpenSocialProofUserListSheetAction_Params)
local Module131 = {}
Module131.__index = Module131

function Module131.new(p1)
	-- upvalues: t (copy), Module131 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module131))
end

function Module131:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module131.decode(Buf)
	-- upvalues: Module131 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module131.new()
	local v132 = 0
	while v132 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3109 = ProtoModule.readTag(Buf, v132)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v3109 = ProtoModule.readVarIntI32(Buf, v132)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v3109 = ProtoModule.readVarInt(Buf, v132)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v3109 = ProtoModule.readBuffer(Buf, v132)
				NewModule.action_params = t.OpenSearchResultsTabAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v132)
				v132 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3109 = ProtoModule.readFixed32(Buf, v132)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3109 = ProtoModule.readFixed64(Buf, v132)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module131:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module131:jsonDecode()
	-- upvalues: Module131 (copy), t (copy)
	local NewModule = Module131.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenSearchResultsTabAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenSearchResultsTabAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module131.descriptor = {
	name = "OpenSearchResultsTabAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSearchResultsTabAction"
}
t.OpenSearchResultsTabAction = Module131
TypeRegistryModule.default:register(t.OpenSearchResultsTabAction)
local Module132 = {}
Module132.__index = Module132

function Module132.new(p1)
	-- upvalues: Module132 (copy)
	return (setmetatable({
		search_type = if p1 == nil or p1.search_type == nil then nil else p1.search_type
	}, Module132))
end

function Module132:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.search_type ~= nil then
		local EncodeResult = self.search_type:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module132.decode(Buf)
	-- upvalues: Module132 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module132.new()
	local v133 = 0
	while v133 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3127 = ProtoModule.readTag(Buf, v133)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3127 = ProtoModule.readVarInt(Buf, v133)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3127 = ProtoModule.readBuffer(Buf, v133)
				NewModule.search_type = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v133)
				v133 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3127 = ProtoModule.readFixed32(Buf, v133)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3127 = ProtoModule.readFixed64(Buf, v133)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module132:jsonEncode()
	local t = {}
	
	if self.search_type ~= nil then
		t.searchType = self.search_type:jsonEncode()
	end
	return t
end

function Module132:jsonDecode()
	-- upvalues: Module132 (copy), PropTypesModule (copy)
	local NewModule = Module132.new()
	
	if self.search_type ~= nil then
		NewModule.search_type = PropTypesModule.StringProp.jsonDecode(self.search_type)
	end
	if self.searchType ~= nil then
		NewModule.search_type = PropTypesModule.StringProp.jsonDecode(self.searchType)
	end
	return NewModule
end

Module132.descriptor = {
	name = "OpenSearchResultsTabAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSearchResultsTabAction_Params = Module132
TypeRegistryModule.default:register(t.OpenSearchResultsTabAction_Params)
local Module133 = {}
Module133.__index = Module133

function Module133.new(p1)
	-- upvalues: t (copy), Module133 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module133))
end

function Module133:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module133.decode(Buf)
	-- upvalues: Module133 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module133.new()
	local v134 = 0
	while v134 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3146 = ProtoModule.readTag(Buf, v134)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v3146 = ProtoModule.readVarIntI32(Buf, v134)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v3146 = ProtoModule.readVarInt(Buf, v134)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v3146 = ProtoModule.readBuffer(Buf, v134)
				NewModule.action_params = t.DismissPromptAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v134)
				v134 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3146 = ProtoModule.readFixed32(Buf, v134)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3146 = ProtoModule.readFixed64(Buf, v134)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module133:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module133:jsonDecode()
	-- upvalues: Module133 (copy), t (copy)
	local NewModule = Module133.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.DismissPromptAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.DismissPromptAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module133.descriptor = {
	name = "DismissPromptAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DismissPromptAction"
}
t.DismissPromptAction = Module133
TypeRegistryModule.default:register(t.DismissPromptAction)
local Module134 = {}
Module134.__index = Module134

function Module134.new(p1)
	-- upvalues: Module134 (copy)
	return (setmetatable({
		prompt_type = if p1 == nil or p1.prompt_type == nil then nil else p1.prompt_type,
		prompt_id = if p1 == nil or p1.prompt_id == nil then nil else p1.prompt_id
	}, Module134))
end

function Module134:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.prompt_type ~= nil then
		local EncodeResult = self.prompt_type:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.prompt_id ~= nil then
		local EncodeResult = self.prompt_id:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module134.decode(Buf)
	-- upvalues: Module134 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module134.new()
	local v135 = 0
	while v135 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3167 = ProtoModule.readTag(Buf, v135)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3167 = ProtoModule.readVarInt(Buf, v135)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3167 = ProtoModule.readBuffer(Buf, v135)
				NewModule.prompt_type = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3167 = ProtoModule.readBuffer(Buf, v135)
				NewModule.prompt_id = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v135)
				v135 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3167 = ProtoModule.readFixed32(Buf, v135)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3167 = ProtoModule.readFixed64(Buf, v135)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module134:jsonEncode()
	local t = {}
	
	if self.prompt_type ~= nil then
		t.promptType = self.prompt_type:jsonEncode()
	end
	if self.prompt_id ~= nil then
		t.promptId = self.prompt_id:jsonEncode()
	end
	return t
end

function Module134:jsonDecode()
	-- upvalues: Module134 (copy), PropTypesModule (copy)
	local NewModule = Module134.new()
	
	if self.prompt_type ~= nil then
		NewModule.prompt_type = PropTypesModule.StringProp.jsonDecode(self.prompt_type)
	end
	if self.promptType ~= nil then
		NewModule.prompt_type = PropTypesModule.StringProp.jsonDecode(self.promptType)
	end
	if self.prompt_id ~= nil then
		NewModule.prompt_id = PropTypesModule.StringProp.jsonDecode(self.prompt_id)
	end
	if self.promptId ~= nil then
		NewModule.prompt_id = PropTypesModule.StringProp.jsonDecode(self.promptId)
	end
	return NewModule
end

Module134.descriptor = {
	name = "DismissPromptAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DismissPromptAction_Params = Module134
TypeRegistryModule.default:register(t.DismissPromptAction_Params)
local Module135 = {}
Module135.__index = Module135

function Module135.new(p1)
	-- upvalues: t (copy), Module135 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module135))
end

function Module135:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module135.decode(Buf)
	-- upvalues: Module135 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module135.new()
	local v136 = 0
	while v136 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3187 = ProtoModule.readTag(Buf, v136)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v3187 = ProtoModule.readVarIntI32(Buf, v136)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v3187 = ProtoModule.readVarInt(Buf, v136)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v3187 = ProtoModule.readBuffer(Buf, v136)
				NewModule.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v136)
				v136 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3187 = ProtoModule.readFixed32(Buf, v136)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3187 = ProtoModule.readFixed64(Buf, v136)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module135:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module135:jsonDecode()
	-- upvalues: Module135 (copy), t (copy)
	local NewModule = Module135.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.RecordPartyChatConversationUpsellAcknowledgementAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module135.descriptor = {
	name = "RecordPartyChatConversationUpsellAcknowledgementAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecordPartyChatConversationUpsellAcknowledgementAction"
}
t.RecordPartyChatConversationUpsellAcknowledgementAction = Module135
TypeRegistryModule.default:register(t.RecordPartyChatConversationUpsellAcknowledgementAction)
local Module136 = {}
Module136.__index = Module136

function Module136.new(p1)
	-- upvalues: Module136 (copy)
	return (setmetatable({
		modal_action = if p1 == nil or p1.modal_action == nil then nil else p1.modal_action,
		modal_variant = if p1 == nil or p1.modal_variant == nil then nil else p1.modal_variant,
		modal_sequence = if p1 == nil or p1.modal_sequence == nil then nil else p1.modal_sequence,
		conversation_id = if p1 == nil or p1.conversation_id == nil then nil else p1.conversation_id,
		friend_id = if p1 == nil or p1.friend_id == nil then nil else p1.friend_id
	}, Module136))
end

function Module136:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.modal_action ~= nil then
		local EncodeResult = self.modal_action:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.modal_variant ~= nil then
		local EncodeResult = self.modal_variant:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.modal_sequence ~= nil then
		local EncodeResult = self.modal_sequence:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.conversation_id ~= nil then
		local EncodeResult = self.conversation_id:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	if self.friend_id ~= nil then
		local EncodeResult = self.friend_id:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module136.decode(Buf)
	-- upvalues: Module136 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module136.new()
	local v137 = 0
	while v137 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3217 = ProtoModule.readTag(Buf, v137)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3217 = ProtoModule.readVarInt(Buf, v137)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3217 = ProtoModule.readBuffer(Buf, v137)
				NewModule.modal_action = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3217 = ProtoModule.readBuffer(Buf, v137)
				NewModule.modal_variant = PropTypesModule.StringProp.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3217 = ProtoModule.readBuffer(Buf, v137)
				NewModule.modal_sequence = PropTypesModule.StringProp.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v3217 = ProtoModule.readBuffer(Buf, v137)
				NewModule.conversation_id = PropTypesModule.StringProp.decode(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v3217 = ProtoModule.readBuffer(Buf, v137)
				NewModule.friend_id = PropTypesModule.StringProp.decode(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v137)
				v137 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3217 = ProtoModule.readFixed32(Buf, v137)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3217 = ProtoModule.readFixed64(Buf, v137)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module136:jsonEncode()
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

function Module136:jsonDecode()
	-- upvalues: Module136 (copy), PropTypesModule (copy)
	local NewModule = Module136.new()
	
	if self.modal_action ~= nil then
		NewModule.modal_action = PropTypesModule.StringProp.jsonDecode(self.modal_action)
	end
	if self.modalAction ~= nil then
		NewModule.modal_action = PropTypesModule.StringProp.jsonDecode(self.modalAction)
	end
	if self.modal_variant ~= nil then
		NewModule.modal_variant = PropTypesModule.StringProp.jsonDecode(self.modal_variant)
	end
	if self.modalVariant ~= nil then
		NewModule.modal_variant = PropTypesModule.StringProp.jsonDecode(self.modalVariant)
	end
	if self.modal_sequence ~= nil then
		NewModule.modal_sequence = PropTypesModule.StringProp.jsonDecode(self.modal_sequence)
	end
	if self.modalSequence ~= nil then
		NewModule.modal_sequence = PropTypesModule.StringProp.jsonDecode(self.modalSequence)
	end
	if self.conversation_id ~= nil then
		NewModule.conversation_id = PropTypesModule.StringProp.jsonDecode(self.conversation_id)
	end
	if self.conversationId ~= nil then
		NewModule.conversation_id = PropTypesModule.StringProp.jsonDecode(self.conversationId)
	end
	if self.friend_id ~= nil then
		NewModule.friend_id = PropTypesModule.StringProp.jsonDecode(self.friend_id)
	end
	if self.friendId ~= nil then
		NewModule.friend_id = PropTypesModule.StringProp.jsonDecode(self.friendId)
	end
	return NewModule
end

Module136.descriptor = {
	name = "RecordPartyChatConversationUpsellAcknowledgementAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RecordPartyChatConversationUpsellAcknowledgementAction_Params = Module136
TypeRegistryModule.default:register(t.RecordPartyChatConversationUpsellAcknowledgementAction_Params)
local Module137 = {}
Module137.__index = Module137

function Module137.new(p1)
	-- upvalues: t (copy), Module137 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module137))
end

function Module137:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module137.decode(Buf)
	-- upvalues: Module137 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module137.new()
	local v138 = 0
	while v138 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3240 = ProtoModule.readTag(Buf, v138)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v3240 = ProtoModule.readVarIntI32(Buf, v138)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v3240 = ProtoModule.readVarInt(Buf, v138)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v3240 = ProtoModule.readBuffer(Buf, v138)
				NewModule.action_params = t.RequestFriendshipAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v138)
				v138 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3240 = ProtoModule.readFixed32(Buf, v138)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3240 = ProtoModule.readFixed64(Buf, v138)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module137:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module137:jsonDecode()
	-- upvalues: Module137 (copy), t (copy)
	local NewModule = Module137.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.RequestFriendshipAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.RequestFriendshipAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module137.descriptor = {
	name = "RequestFriendshipAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.RequestFriendshipAction"
}
t.RequestFriendshipAction = Module137
TypeRegistryModule.default:register(t.RequestFriendshipAction)
local Module138 = {}
Module138.__index = Module138

function Module138.new(p1)
	-- upvalues: Module138 (copy)
	return (setmetatable({
		target_user_id = if p1 == nil or p1.target_user_id == nil then nil else p1.target_user_id,
		source = if p1 == nil or p1.source == nil then nil else p1.source
	}, Module138))
end

function Module138:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.target_user_id ~= nil then
		local EncodeResult = self.target_user_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.source ~= nil then
		local EncodeResult = self.source:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module138.decode(Buf)
	-- upvalues: Module138 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module138.new()
	local v139 = 0
	while v139 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3261 = ProtoModule.readTag(Buf, v139)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3261 = ProtoModule.readVarInt(Buf, v139)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3261 = ProtoModule.readBuffer(Buf, v139)
				NewModule.target_user_id = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3261 = ProtoModule.readBuffer(Buf, v139)
				NewModule.source = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v139)
				v139 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3261 = ProtoModule.readFixed32(Buf, v139)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3261 = ProtoModule.readFixed64(Buf, v139)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module138:jsonEncode()
	local t = {}
	
	if self.target_user_id ~= nil then
		t.targetUserId = self.target_user_id:jsonEncode()
	end
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	return t
end

function Module138:jsonDecode()
	-- upvalues: Module138 (copy), PropTypesModule (copy)
	local NewModule = Module138.new()
	
	if self.target_user_id ~= nil then
		NewModule.target_user_id = PropTypesModule.StringProp.jsonDecode(self.target_user_id)
	end
	if self.targetUserId ~= nil then
		NewModule.target_user_id = PropTypesModule.StringProp.jsonDecode(self.targetUserId)
	end
	if self.source ~= nil then
		NewModule.source = PropTypesModule.StringProp.jsonDecode(self.source)
	end
	return NewModule
end

Module138.descriptor = {
	name = "RequestFriendshipAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.RequestFriendshipAction_Params = Module138
TypeRegistryModule.default:register(t.RequestFriendshipAction_Params)
local Module139 = {}
Module139.__index = Module139

function Module139.new(p1)
	-- upvalues: t (copy), Module139 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module139))
end

function Module139:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module139.decode(Buf)
	-- upvalues: Module139 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module139.new()
	local v140 = 0
	while v140 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3281 = ProtoModule.readTag(Buf, v140)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v3281 = ProtoModule.readVarIntI32(Buf, v140)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v3281 = ProtoModule.readVarInt(Buf, v140)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v3281 = ProtoModule.readBuffer(Buf, v140)
				NewModule.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v140)
				v140 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3281 = ProtoModule.readFixed32(Buf, v140)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3281 = ProtoModule.readFixed64(Buf, v140)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module139:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module139:jsonDecode()
	-- upvalues: Module139 (copy), t (copy)
	local NewModule = Module139.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenTrustedFriendsUpsellModalAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module139.descriptor = {
	name = "OpenTrustedFriendsUpsellModalAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenTrustedFriendsUpsellModalAction"
}
t.OpenTrustedFriendsUpsellModalAction = Module139
TypeRegistryModule.default:register(t.OpenTrustedFriendsUpsellModalAction)
local Module140 = {}
Module140.__index = Module140

function Module140.new(p1)
	-- upvalues: Module140 (copy)
	return (setmetatable({
		target_user_id = if p1 == nil or p1.target_user_id == nil then nil else p1.target_user_id
	}, Module140))
end

function Module140:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.target_user_id ~= nil then
		local EncodeResult = self.target_user_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module140.decode(Buf)
	-- upvalues: Module140 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module140.new()
	local v141 = 0
	while v141 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3299 = ProtoModule.readTag(Buf, v141)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3299 = ProtoModule.readVarInt(Buf, v141)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3299 = ProtoModule.readBuffer(Buf, v141)
				NewModule.target_user_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v141)
				v141 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3299 = ProtoModule.readFixed32(Buf, v141)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3299 = ProtoModule.readFixed64(Buf, v141)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module140:jsonEncode()
	local t = {}
	
	if self.target_user_id ~= nil then
		t.targetUserId = self.target_user_id:jsonEncode()
	end
	return t
end

function Module140:jsonDecode()
	-- upvalues: Module140 (copy), PropTypesModule (copy)
	local NewModule = Module140.new()
	
	if self.target_user_id ~= nil then
		NewModule.target_user_id = PropTypesModule.StringProp.jsonDecode(self.target_user_id)
	end
	if self.targetUserId ~= nil then
		NewModule.target_user_id = PropTypesModule.StringProp.jsonDecode(self.targetUserId)
	end
	return NewModule
end

Module140.descriptor = {
	name = "OpenTrustedFriendsUpsellModalAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenTrustedFriendsUpsellModalAction_Params = Module140
TypeRegistryModule.default:register(t.OpenTrustedFriendsUpsellModalAction_Params)
local Module141 = {}
Module141.__index = Module141

function Module141.new(p1)
	-- upvalues: t (copy), Module141 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module141))
end

function Module141:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module141.decode(Buf)
	-- upvalues: Module141 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module141.new()
	local v142 = 0
	while v142 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3318 = ProtoModule.readTag(Buf, v142)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v3318 = ProtoModule.readVarIntI32(Buf, v142)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v3318 = ProtoModule.readVarInt(Buf, v142)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v3318 = ProtoModule.readBuffer(Buf, v142)
				NewModule.action_params = t.OpenSearchResultsWithQueryAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v142)
				v142 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3318 = ProtoModule.readFixed32(Buf, v142)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3318 = ProtoModule.readFixed64(Buf, v142)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module141:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module141:jsonDecode()
	-- upvalues: Module141 (copy), t (copy)
	local NewModule = Module141.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.OpenSearchResultsWithQueryAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.OpenSearchResultsWithQueryAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module141.descriptor = {
	name = "OpenSearchResultsWithQueryAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.OpenSearchResultsWithQueryAction"
}
t.OpenSearchResultsWithQueryAction = Module141
TypeRegistryModule.default:register(t.OpenSearchResultsWithQueryAction)
local Module142 = {}
Module142.__index = Module142

function Module142.new(p1)
	-- upvalues: Module142 (copy)
	return (setmetatable({
		search_query = if p1 == nil or p1.search_query == nil then nil else p1.search_query,
		search_type = if p1 == nil or p1.search_type == nil then nil else p1.search_type
	}, Module142))
end

function Module142:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.search_query ~= nil then
		local EncodeResult = self.search_query:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.search_type ~= nil then
		local EncodeResult = self.search_type:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module142.decode(Buf)
	-- upvalues: Module142 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module142.new()
	local v143 = 0
	while v143 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3339 = ProtoModule.readTag(Buf, v143)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3339 = ProtoModule.readVarInt(Buf, v143)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3339 = ProtoModule.readBuffer(Buf, v143)
				NewModule.search_query = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3339 = ProtoModule.readBuffer(Buf, v143)
				NewModule.search_type = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v143)
				v143 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3339 = ProtoModule.readFixed32(Buf, v143)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3339 = ProtoModule.readFixed64(Buf, v143)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module142:jsonEncode()
	local t = {}
	
	if self.search_query ~= nil then
		t.searchQuery = self.search_query:jsonEncode()
	end
	if self.search_type ~= nil then
		t.searchType = self.search_type:jsonEncode()
	end
	return t
end

function Module142:jsonDecode()
	-- upvalues: Module142 (copy), PropTypesModule (copy)
	local NewModule = Module142.new()
	
	if self.search_query ~= nil then
		NewModule.search_query = PropTypesModule.StringProp.jsonDecode(self.search_query)
	end
	if self.searchQuery ~= nil then
		NewModule.search_query = PropTypesModule.StringProp.jsonDecode(self.searchQuery)
	end
	if self.search_type ~= nil then
		NewModule.search_type = PropTypesModule.StringProp.jsonDecode(self.search_type)
	end
	if self.searchType ~= nil then
		NewModule.search_type = PropTypesModule.StringProp.jsonDecode(self.searchType)
	end
	return NewModule
end

Module142.descriptor = {
	name = "OpenSearchResultsWithQueryAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.OpenSearchResultsWithQueryAction_Params = Module142
TypeRegistryModule.default:register(t.OpenSearchResultsWithQueryAction_Params)
local Module143 = {}
Module143.__index = Module143

function Module143.new(p1)
	-- upvalues: t (copy), Module143 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module143))
end

function Module143:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module143.decode(Buf)
	-- upvalues: Module143 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module143.new()
	local v144 = 0
	while v144 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3359 = ProtoModule.readTag(Buf, v144)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v3359 = ProtoModule.readVarIntI32(Buf, v144)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v3359 = ProtoModule.readVarInt(Buf, v144)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v3359 = ProtoModule.readBuffer(Buf, v144)
				NewModule.action_params = t.SelectMarketplaceFavoritesCategory_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v144)
				v144 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3359 = ProtoModule.readFixed32(Buf, v144)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3359 = ProtoModule.readFixed64(Buf, v144)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module143:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module143:jsonDecode()
	-- upvalues: Module143 (copy), t (copy)
	local NewModule = Module143.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.SelectMarketplaceFavoritesCategory_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.SelectMarketplaceFavoritesCategory_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module143.descriptor = {
	name = "SelectMarketplaceFavoritesCategory",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectMarketplaceFavoritesCategory"
}
t.SelectMarketplaceFavoritesCategory = Module143
TypeRegistryModule.default:register(t.SelectMarketplaceFavoritesCategory)
local Module144 = {}
Module144.__index = Module144

function Module144.new(p1)
	-- upvalues: Module144 (copy)
	return (setmetatable({
		category_id = if p1 == nil or p1.category_id == nil then nil else p1.category_id
	}, Module144))
end

function Module144:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.category_id ~= nil then
		local EncodeResult = self.category_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module144.decode(Buf)
	-- upvalues: Module144 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module144.new()
	local v145 = 0
	while v145 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3377 = ProtoModule.readTag(Buf, v145)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3377 = ProtoModule.readVarInt(Buf, v145)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3377 = ProtoModule.readBuffer(Buf, v145)
				NewModule.category_id = PropTypesModule.StringProp.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v145)
				v145 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3377 = ProtoModule.readFixed32(Buf, v145)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3377 = ProtoModule.readFixed64(Buf, v145)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module144:jsonEncode()
	local t = {}
	
	if self.category_id ~= nil then
		t.categoryId = self.category_id:jsonEncode()
	end
	return t
end

function Module144:jsonDecode()
	-- upvalues: Module144 (copy), PropTypesModule (copy)
	local NewModule = Module144.new()
	
	if self.category_id ~= nil then
		NewModule.category_id = PropTypesModule.StringProp.jsonDecode(self.category_id)
	end
	if self.categoryId ~= nil then
		NewModule.category_id = PropTypesModule.StringProp.jsonDecode(self.categoryId)
	end
	return NewModule
end

Module144.descriptor = {
	name = "SelectMarketplaceFavoritesCategory_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.SelectMarketplaceFavoritesCategory_Params = Module144
TypeRegistryModule.default:register(t.SelectMarketplaceFavoritesCategory_Params)
local Module145 = {}
Module145.__index = Module145

function Module145.new(p1)
	-- upvalues: t (copy), Module145 (copy)
	return (setmetatable({
		action_type = if p1 == nil or p1.action_type == nil then assert(t.ActionType.fromNumber(0), "Enum has no 0 default") else p1.action_type,
		action_params = if p1 == nil or p1.action_params == nil then nil else p1.action_params
	}, Module145))
end

function Module145:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.ActionType.toNumber(self.action_type))
	end
	if self.action_params ~= nil then
		local EncodeResult = self.action_params:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module145.decode(Buf)
	-- upvalues: Module145 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module145.new()
	local v146 = 0
	while v146 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3396 = ProtoModule.readTag(Buf, v146)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v3396 = ProtoModule.readVarIntI32(Buf, v146)
				NewModule.action_type = t.ActionType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v3396 = ProtoModule.readVarInt(Buf, v146)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v3396 = ProtoModule.readBuffer(Buf, v146)
				NewModule.action_params = t.DownloadAppAction_Params.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v146)
				v146 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3396 = ProtoModule.readFixed32(Buf, v146)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3396 = ProtoModule.readFixed64(Buf, v146)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module145:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.action_type ~= nil and (self.action_type ~= nil and self.action_type ~= 0 or self.action_type ~= t.ActionType.fromNumber(0)) then
		t1.actionType = if typeof(self.action_type) == "number" then self.action_type else t.ActionType.toNumber(self.action_type)
	end
	if self.action_params ~= nil then
		t1.actionParams = self.action_params:jsonEncode()
	end
	return t1
end

function Module145:jsonDecode()
	-- upvalues: Module145 (copy), t (copy)
	local NewModule = Module145.new()
	
	if self.action_type ~= nil then
		NewModule.action_type = (if typeof(self.action_type) == "number" then t.ActionType.fromNumber(self.action_type) else t.ActionType.fromName(self.action_type)) or self.action_type
	end
	if self.actionType ~= nil then
		NewModule.action_type = (if typeof(self.actionType) == "number" then t.ActionType.fromNumber(self.actionType) else t.ActionType.fromName(self.actionType)) or self.actionType
	end
	if self.action_params ~= nil then
		NewModule.action_params = t.DownloadAppAction_Params.jsonDecode(self.action_params)
	end
	if self.actionParams ~= nil then
		NewModule.action_params = t.DownloadAppAction_Params.jsonDecode(self.actionParams)
	end
	return NewModule
end

Module145.descriptor = {
	name = "DownloadAppAction",
	fullName = "roblox.apppageplatform.shared.v1beta1.DownloadAppAction"
}
t.DownloadAppAction = Module145
TypeRegistryModule.default:register(t.DownloadAppAction)
local Module146 = {}
Module146.__index = Module146

function Module146.new(p1)
	-- upvalues: Module146 (copy)
	return (setmetatable({
		source = if p1 == nil or p1.source == nil then nil else p1.source,
		download_type = if p1 == nil or p1.download_type == nil then nil else p1.download_type
	}, Module146))
end

function Module146:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.source ~= nil then
		local EncodeResult = self.source:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.download_type ~= nil then
		local EncodeResult = self.download_type:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module146.decode(Buf)
	-- upvalues: Module146 (copy), ProtoModule (copy), PropTypesModule (copy)
	local NewModule = Module146.new()
	local v147 = 0
	while v147 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3417 = ProtoModule.readTag(Buf, v147)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3417 = ProtoModule.readVarInt(Buf, v147)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3417 = ProtoModule.readBuffer(Buf, v147)
				NewModule.source = PropTypesModule.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3417 = ProtoModule.readBuffer(Buf, v147)
				NewModule.download_type = PropTypesModule.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v147)
				v147 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3417 = ProtoModule.readFixed32(Buf, v147)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3417 = ProtoModule.readFixed64(Buf, v147)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module146:jsonEncode()
	local t = {}
	
	if self.source ~= nil then
		t.source = self.source:jsonEncode()
	end
	if self.download_type ~= nil then
		t.downloadType = self.download_type:jsonEncode()
	end
	return t
end

function Module146:jsonDecode()
	-- upvalues: Module146 (copy), PropTypesModule (copy)
	local NewModule = Module146.new()
	
	if self.source ~= nil then
		NewModule.source = PropTypesModule.StringProp.jsonDecode(self.source)
	end
	if self.download_type ~= nil then
		NewModule.download_type = PropTypesModule.StringProp.jsonDecode(self.download_type)
	end
	if self.downloadType ~= nil then
		NewModule.download_type = PropTypesModule.StringProp.jsonDecode(self.downloadType)
	end
	return NewModule
end

Module146.descriptor = {
	name = "DownloadAppAction_Params",
	fullName = "roblox.apppageplatform.shared.v1beta1.Params"
}
t.DownloadAppAction_Params = Module146
TypeRegistryModule.default:register(t.DownloadAppAction_Params)
local Module147 = {}
Module147.__index = Module147

function Module147.new(p1)
	-- upvalues: Module147 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind,
		telemetry_handler = if p1 == nil or p1.telemetry_handler == nil then nil else p1.telemetry_handler,
		accessibility_label = if p1 == nil or p1.accessibility_label == nil then nil else p1.accessibility_label
	}, Module147))
end

function Module147:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "dismiss_dialog_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "link_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_game_details_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_join_friends_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_marketplace_try_on_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_see_all_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult12, WriteTagResult2_11, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_sponsored_tooltip_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult14, WriteTagResult2_13 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult14, WriteTagResult2_13, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "play_button_click_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult16, WriteTagResult2_15 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult16, WriteTagResult2_15, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "update_user_settings_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult17, WriteTagResult2_16 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult17, WriteTagResult2_16, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_tooltip_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult18, WriteTagResult2_17 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult18, WriteTagResult2_17, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_badge_details_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult19, WriteTagResult2_18 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult19, WriteTagResult2_18, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "load_more_from_api_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult21, WriteTagResult2_20 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult21, WriteTagResult2_20, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "share_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult22, WriteTagResult2_21 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult22, WriteTagResult2_21, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_abuse_report_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult23, WriteTagResult2_22 = ProtoModule.writeTag(Buf, Count, 14, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult23, WriteTagResult2_22, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "remove_badge_from_inventory_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult24, WriteTagResult2_23 = ProtoModule.writeTag(Buf, Count, 15, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult24, WriteTagResult2_23, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_profile_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult26, WriteTagResult2_25 = ProtoModule.writeTag(Buf, Count, 16, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult26, WriteTagResult2_25, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_facial_age_estimation_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult27, WriteTagResult2_26 = ProtoModule.writeTag(Buf, Count, 17, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult27, WriteTagResult2_26, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_add_connections_page_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult28, WriteTagResult2_27 = ProtoModule.writeTag(Buf, Count, 18, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult28, WriteTagResult2_27, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_marketplace_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult30, WriteTagResult2_29 = ProtoModule.writeTag(Buf, Count, 19, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult30, WriteTagResult2_29, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "hide_profile_completion_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult32, WriteTagResult2_31 = ProtoModule.writeTag(Buf, Count, 20, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult32, WriteTagResult2_31, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "select_marketplace_catalog_category" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(Buf, Count, 21, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult13, WriteTagResult2_12, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "select_marketplace_catalog_subcategory" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult33, WriteTagResult2_32 = ProtoModule.writeTag(Buf, Count, 22, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult33, WriteTagResult2_32, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_marketplace_catalog_see_all" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult34, WriteTagResult2_33 = ProtoModule.writeTag(Buf, Count, 23, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult34, WriteTagResult2_33, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "close_marketplace_category_tooltip" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 24, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "resize_marketplace_catalog" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult35, WriteTagResult2_34 = ProtoModule.writeTag(Buf, Count, 25, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult35, WriteTagResult2_34, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_marketplace_catalog_filters" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult20, WriteTagResult2_19 = ProtoModule.writeTag(Buf, Count, 26, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult20, WriteTagResult2_19, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_social_link_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult37, WriteTagResult2_36 = ProtoModule.writeTag(Buf, Count, 27, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult37, WriteTagResult2_36, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_charts_sort_detail_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult38, WriteTagResult2_37 = ProtoModule.writeTag(Buf, Count, 28, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult38, WriteTagResult2_37, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_song_detail_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult15, WriteTagResult2_14 = ProtoModule.writeTag(Buf, Count, 29, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult15, WriteTagResult2_14, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "refresh_from_api_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult31, WriteTagResult2_30 = ProtoModule.writeTag(Buf, Count, 30, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult31, WriteTagResult2_30, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "rsvp_to_event_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult39, WriteTagResult2_38 = ProtoModule.writeTag(Buf, Count, 31, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult39, WriteTagResult2_38, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "apply_charts_filter_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 32, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "analytics_event_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult40, WriteTagResult2_39 = ProtoModule.writeTag(Buf, Count, 33, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult40, WriteTagResult2_39, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "custom_analytics_event_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 34, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult10, WriteTagResult2_9, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_game_invite_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult42, WriteTagResult2_41 = ProtoModule.writeTag(Buf, Count, 35, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult42, WriteTagResult2_41, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_event_details_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult43, WriteTagResult2_42 = ProtoModule.writeTag(Buf, Count, 36, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult43, WriteTagResult2_42, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "launch_experience_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult44, WriteTagResult2_43 = ProtoModule.writeTag(Buf, Count, 37, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult44, WriteTagResult2_43, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "toggle_experience_favorite_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult25, WriteTagResult2_24 = ProtoModule.writeTag(Buf, Count, 38, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult25, WriteTagResult2_24, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "toggle_experience_follow_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult45, WriteTagResult2_44 = ProtoModule.writeTag(Buf, Count, 39, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult45, WriteTagResult2_44, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "toggle_experience_vote_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult36, WriteTagResult2_35 = ProtoModule.writeTag(Buf, Count, 40, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult36, WriteTagResult2_35, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_purchase_prompt_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult47, WriteTagResult2_46 = ProtoModule.writeTag(Buf, Count, 41, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult47, WriteTagResult2_46, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_sdui_overlay_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult49, WriteTagResult2_48 = ProtoModule.writeTag(Buf, Count, 42, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult49, WriteTagResult2_48, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_badges_see_all_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 43, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_experience_store_see_all_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult41, WriteTagResult2_40 = ProtoModule.writeTag(Buf, Count, 44, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult41, WriteTagResult2_40, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "dismiss_game_feedback_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult50, WriteTagResult2_49 = ProtoModule.writeTag(Buf, Count, 45, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult50, WriteTagResult2_49, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_game_feedback_form_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult51, WriteTagResult2_50 = ProtoModule.writeTag(Buf, Count, 46, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult51, WriteTagResult2_50, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "enable_event_notifications_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 47, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "dismiss_event_notifications_modal_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult52, WriteTagResult2_51 = ProtoModule.writeTag(Buf, Count, 48, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult52, WriteTagResult2_51, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_amp_wizard_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult53, WriteTagResult2_52 = ProtoModule.writeTag(Buf, Count, 49, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult53, WriteTagResult2_52, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_subscription_purchase_page_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult54, WriteTagResult2_53 = ProtoModule.writeTag(Buf, Count, 50, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult54, WriteTagResult2_53, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "refresh_game_passes_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult55, WriteTagResult2_54 = ProtoModule.writeTag(Buf, Count, 51, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult55, WriteTagResult2_54, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "refresh_playability_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult29, WriteTagResult2_28 = ProtoModule.writeTag(Buf, Count, 52, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult29, WriteTagResult2_28, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_social_proof_user_list_sheet_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult56, WriteTagResult2_55 = ProtoModule.writeTag(Buf, Count, 53, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult56, WriteTagResult2_55, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "report_surface_load_time_milestone_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult57, WriteTagResult2_56 = ProtoModule.writeTag(Buf, Count, 54, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult57, WriteTagResult2_56, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_search_results_tab_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult58, WriteTagResult2_57 = ProtoModule.writeTag(Buf, Count, 55, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult58, WriteTagResult2_57, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_phone_upsell_modal_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult46, WriteTagResult2_45 = ProtoModule.writeTag(Buf, Count, 56, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult46, WriteTagResult2_45, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_email_upsell_modal_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult59, WriteTagResult2_58 = ProtoModule.writeTag(Buf, Count, 57, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult59, WriteTagResult2_58, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "dismiss_prompt_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult60, WriteTagResult2_59 = ProtoModule.writeTag(Buf, Count, 58, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult60, WriteTagResult2_59, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "request_friendship_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult61, WriteTagResult2_60 = ProtoModule.writeTag(Buf, Count, 59, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult61, WriteTagResult2_60, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "refresh_developer_products_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult63, WriteTagResult2_62 = ProtoModule.writeTag(Buf, Count, 60, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult63, WriteTagResult2_62, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_fae_trial_upsell_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult64, WriteTagResult2_63 = ProtoModule.writeTag(Buf, Count, 61, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult64, WriteTagResult2_63, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "refresh_omni_recommendation_feed_item_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult65, WriteTagResult2_64 = ProtoModule.writeTag(Buf, Count, 62, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult65, WriteTagResult2_64, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "ai_overview_feedback_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult66, WriteTagResult2_65 = ProtoModule.writeTag(Buf, Count, 63, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult66, WriteTagResult2_65, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_trusted_friends_upsell_modal_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 64, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult11, WriteTagResult2_10, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "record_party_chat_conversation_upsell_acknowledgement_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult67, WriteTagResult2_66 = ProtoModule.writeTag(Buf, Count, 65, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult67, WriteTagResult2_66, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "open_search_results_with_query_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult68, WriteTagResult2_67 = ProtoModule.writeTag(Buf, Count, 66, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult68, WriteTagResult2_67, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "select_marketplace_favorites_category" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult69, WriteTagResult2_68 = ProtoModule.writeTag(Buf, Count, 67, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult69, WriteTagResult2_68, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "download_app_action" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult62, WriteTagResult2_61 = ProtoModule.writeTag(Buf, Count, 68, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult62, WriteTagResult2_61, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.telemetry_handler ~= nil then
		local EncodeResult = self.telemetry_handler:encode()
		local WriteTagResult70, WriteTagResult2_69 = ProtoModule.writeTag(Buf, Count, 1000, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult70, WriteTagResult2_69, EncodeResult, buffer.len(EncodeResult))
	end
	if self.accessibility_label ~= nil then
		local EncodeResult = self.accessibility_label:encode()
		local WriteTagResult48, WriteTagResult2_47 = ProtoModule.writeTag(Buf, Count, 1001, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult48, WriteTagResult2_47, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module147.decode(Buf)
	-- upvalues: Module147 (copy), ProtoModule (copy), t (copy), PropTypesModule (copy)
	local NewModule = Module147.new()
	local v148 = 0
	while v148 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3642 = ProtoModule.readTag(Buf, v148)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3642 = ProtoModule.readVarInt(Buf, v148)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "dismiss_dialog_action",
					value = t.DismissDialogAction.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "link_action",
					value = t.LinkAction.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer4
				Buffer4, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_game_details_action",
					value = t.OpenGameDetailsAction.decode(Buffer4)
				}
			elseif Tag == 4 then
				local Buffer5
				Buffer5, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_join_friends_action",
					value = t.OpenJoinFriendsAction.decode(Buffer5)
				}
			elseif Tag == 5 then
				local Buffer6
				Buffer6, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_marketplace_try_on_action",
					value = t.OpenMarketplaceTryOnAction.decode(Buffer6)
				}
			elseif Tag == 6 then
				local Buffer8
				Buffer8, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_see_all_action",
					value = t.OpenSeeAllAction.decode(Buffer8)
				}
			elseif Tag == 7 then
				local Buffer11
				Buffer11, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_sponsored_tooltip_action",
					value = t.OpenSponsoredTooltipAction.decode(Buffer11)
				}
			elseif Tag == 8 then
				local Buffer14
				Buffer14, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "play_button_click_action",
					value = t.PlayButtonClickAction.decode(Buffer14)
				}
			elseif Tag == 9 then
				local Buffer15
				Buffer15, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "update_user_settings_action",
					value = t.UpdateUserSettingsAction.decode(Buffer15)
				}
			elseif Tag == 10 then
				local Buffer16
				Buffer16, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_tooltip_action",
					value = t.OpenTooltipAction.decode(Buffer16)
				}
			elseif Tag == 11 then
				local Buffer17
				Buffer17, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_badge_details_action",
					value = t.OpenBadgeDetailsAction.decode(Buffer17)
				}
			elseif Tag == 12 then
				local Buffer18
				Buffer18, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "load_more_from_api_action",
					value = t.LoadMoreFromApiAction.decode(Buffer18)
				}
			elseif Tag == 13 then
				local Buffer19
				Buffer19, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "share_action",
					value = t.ShareAction.decode(Buffer19)
				}
			elseif Tag == 14 then
				local Buffer20
				Buffer20, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_abuse_report_action",
					value = t.OpenAbuseReportAction.decode(Buffer20)
				}
			elseif Tag == 15 then
				local Buffer21
				Buffer21, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "remove_badge_from_inventory_action",
					value = t.RemoveBadgeFromInventoryAction.decode(Buffer21)
				}
			elseif Tag == 16 then
				local Buffer24
				Buffer24, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_profile_action",
					value = t.OpenProfileAction.decode(Buffer24)
				}
			elseif Tag == 17 then
				local Buffer26
				Buffer26, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_facial_age_estimation_action",
					value = t.OpenFacialAgeEstimationAction.decode(Buffer26)
				}
			elseif Tag == 18 then
				local Buffer28
				Buffer28, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_add_connections_page_action",
					value = t.OpenAddConnectionsPageAction.decode(Buffer28)
				}
			elseif Tag == 19 then
				local Buffer31
				Buffer31, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_marketplace_action",
					value = t.OpenMarketplaceAction.decode(Buffer31)
				}
			elseif Tag == 20 then
				local Buffer33
				Buffer33, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "hide_profile_completion_action",
					value = t.HideProfileCompletionAction.decode(Buffer33)
				}
			elseif Tag == 21 then
				local Buffer35
				Buffer35, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "select_marketplace_catalog_category",
					value = t.SelectMarketplaceCatalogCategory.decode(Buffer35)
				}
			elseif Tag == 22 then
				local Buffer36
				Buffer36, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "select_marketplace_catalog_subcategory",
					value = t.SelectMarketplaceCatalogSubcategory.decode(Buffer36)
				}
			elseif Tag == 23 then
				local Buffer37
				Buffer37, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_marketplace_catalog_see_all",
					value = t.OpenMarketplaceCatalogSeeAll.decode(Buffer37)
				}
			elseif Tag == 24 then
				local Buffer38
				Buffer38, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "close_marketplace_category_tooltip",
					value = t.CloseMarketplaceCategoryTooltip.decode(Buffer38)
				}
			elseif Tag == 25 then
				local Buffer39
				Buffer39, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "resize_marketplace_catalog",
					value = t.ResizeMarketplaceCatalog.decode(Buffer39)
				}
			elseif Tag == 26 then
				local Buffer40
				Buffer40, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_marketplace_catalog_filters",
					value = t.OpenMarketplaceCatalogFilters.decode(Buffer40)
				}
			elseif Tag == 27 then
				local Buffer41
				Buffer41, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_social_link_action",
					value = t.OpenSocialLinkAction.decode(Buffer41)
				}
			elseif Tag == 28 then
				local Buffer42
				Buffer42, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_charts_sort_detail_action",
					value = t.OpenChartsSortDetailAction.decode(Buffer42)
				}
			elseif Tag == 29 then
				local Buffer43
				Buffer43, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_song_detail_action",
					value = t.OpenSongDetailAction.decode(Buffer43)
				}
			elseif Tag == 30 then
				local Buffer44
				Buffer44, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "refresh_from_api_action",
					value = t.RefreshFromApiAction.decode(Buffer44)
				}
			elseif Tag == 31 then
				local Buffer45
				Buffer45, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "rsvp_to_event_action",
					value = t.RsvpToEventAction.decode(Buffer45)
				}
			elseif Tag == 32 then
				local Buffer46
				Buffer46, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "apply_charts_filter_action",
					value = t.ApplyChartsFilterAction.decode(Buffer46)
				}
			elseif Tag == 33 then
				local Buffer47
				Buffer47, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "analytics_event_action",
					value = t.AnalyticsEventAction.decode(Buffer47)
				}
			elseif Tag == 34 then
				local Buffer48
				Buffer48, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "custom_analytics_event_action",
					value = t.CustomAnalyticsEventAction.decode(Buffer48)
				}
			elseif Tag == 35 then
				local Buffer49
				Buffer49, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_game_invite_action",
					value = t.OpenGameInviteAction.decode(Buffer49)
				}
			elseif Tag == 36 then
				local Buffer50
				Buffer50, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_event_details_action",
					value = t.OpenEventDetailsAction.decode(Buffer50)
				}
			elseif Tag == 37 then
				local Buffer52
				Buffer52, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "launch_experience_action",
					value = t.LaunchExperienceAction.decode(Buffer52)
				}
			elseif Tag == 38 then
				local Buffer53
				Buffer53, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "toggle_experience_favorite_action",
					value = t.ToggleExperienceFavoriteAction.decode(Buffer53)
				}
			elseif Tag == 39 then
				local Buffer54
				Buffer54, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "toggle_experience_follow_action",
					value = t.ToggleExperienceFollowAction.decode(Buffer54)
				}
			elseif Tag == 40 then
				local Buffer56
				Buffer56, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "toggle_experience_vote_action",
					value = t.ToggleExperienceVoteAction.decode(Buffer56)
				}
			elseif Tag == 41 then
				local Buffer58
				Buffer58, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_purchase_prompt_action",
					value = t.OpenPurchasePromptAction.decode(Buffer58)
				}
			elseif Tag == 42 then
				local Buffer27
				Buffer27, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_sdui_overlay_action",
					value = t.OpenSduiOverlayAction.decode(Buffer27)
				}
			elseif Tag == 43 then
				local Buffer22
				Buffer22, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_badges_see_all_action",
					value = t.OpenBadgesSeeAllAction.decode(Buffer22)
				}
			elseif Tag == 44 then
				local Buffer25
				Buffer25, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_experience_store_see_all_action",
					value = t.OpenExperienceStoreSeeAllAction.decode(Buffer25)
				}
			elseif Tag == 45 then
				local Buffer34
				Buffer34, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "dismiss_game_feedback_action",
					value = t.DismissGameFeedbackAction.decode(Buffer34)
				}
			elseif Tag == 46 then
				local Buffer23
				Buffer23, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_game_feedback_form_action",
					value = t.OpenGameFeedbackFormAction.decode(Buffer23)
				}
			elseif Tag == 47 then
				local Buffer32
				Buffer32, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "enable_event_notifications_action",
					value = t.EnableEventNotificationsAction.decode(Buffer32)
				}
			elseif Tag == 48 then
				local Buffer60
				Buffer60, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "dismiss_event_notifications_modal_action",
					value = t.DismissEventNotificationsModalAction.decode(Buffer60)
				}
			elseif Tag == 49 then
				local Buffer30
				Buffer30, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_amp_wizard_action",
					value = t.OpenAmpWizardAction.decode(Buffer30)
				}
			elseif Tag == 50 then
				local Buffer61
				Buffer61, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_subscription_purchase_page_action",
					value = t.OpenSubscriptionPurchasePageAction.decode(Buffer61)
				}
			elseif Tag == 51 then
				local Buffer62
				Buffer62, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "refresh_game_passes_action",
					value = t.RefreshGamePassesAction.decode(Buffer62)
				}
			elseif Tag == 52 then
				local Buffer63
				Buffer63, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "refresh_playability_action",
					value = t.RefreshPlayabilityAction.decode(Buffer63)
				}
			elseif Tag == 53 then
				local Buffer10
				Buffer10, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_social_proof_user_list_sheet_action",
					value = t.OpenSocialProofUserListSheetAction.decode(Buffer10)
				}
			elseif Tag == 54 then
				local Buffer3
				Buffer3, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "report_surface_load_time_milestone_action",
					value = t.ReportSurfaceLoadTimeMilestoneAction.decode(Buffer3)
				}
			elseif Tag == 55 then
				local Buffer9
				Buffer9, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_search_results_tab_action",
					value = t.OpenSearchResultsTabAction.decode(Buffer9)
				}
			elseif Tag == 56 then
				local Buffer12
				Buffer12, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_phone_upsell_modal_action",
					value = t.OpenPhoneUpsellModalAction.decode(Buffer12)
				}
			elseif Tag == 57 then
				local Buffer7
				Buffer7, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_email_upsell_modal_action",
					value = t.OpenEmailUpsellModalAction.decode(Buffer7)
				}
			elseif Tag == 58 then
				local Buffer64
				Buffer64, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "dismiss_prompt_action",
					value = t.DismissPromptAction.decode(Buffer64)
				}
			elseif Tag == 59 then
				local Buffer65
				Buffer65, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "request_friendship_action",
					value = t.RequestFriendshipAction.decode(Buffer65)
				}
			elseif Tag == 60 then
				local Buffer66
				Buffer66, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "refresh_developer_products_action",
					value = t.RefreshDeveloperProductsAction.decode(Buffer66)
				}
			elseif Tag == 61 then
				local Buffer67
				Buffer67, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_fae_trial_upsell_action",
					value = t.OpenFaeTrialUpsellAction.decode(Buffer67)
				}
			elseif Tag == 62 then
				local Buffer68
				Buffer68, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "refresh_omni_recommendation_feed_item_action",
					value = t.RefreshOmniRecommendationFeedItemAction.decode(Buffer68)
				}
			elseif Tag == 63 then
				local Buffer69
				Buffer69, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "ai_overview_feedback_action",
					value = t.AiOverviewFeedbackAction.decode(Buffer69)
				}
			elseif Tag == 64 then
				local Buffer51
				Buffer51, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_trusted_friends_upsell_modal_action",
					value = t.OpenTrustedFriendsUpsellModalAction.decode(Buffer51)
				}
			elseif Tag == 65 then
				local Buffer13
				Buffer13, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "record_party_chat_conversation_upsell_acknowledgement_action",
					value = t.RecordPartyChatConversationUpsellAcknowledgementAction.decode(Buffer13)
				}
			elseif Tag == 66 then
				local Buffer59
				Buffer59, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "open_search_results_with_query_action",
					value = t.OpenSearchResultsWithQueryAction.decode(Buffer59)
				}
			elseif Tag == 67 then
				local Buffer55
				Buffer55, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "select_marketplace_favorites_category",
					value = t.SelectMarketplaceFavoritesCategory.decode(Buffer55)
				}
			elseif Tag == 68 then
				local Buffer57
				Buffer57, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.kind = {
					type = "download_app_action",
					value = t.DownloadAppAction.decode(Buffer57)
				}
			elseif Tag == 1000 then
				local Buffer70
				Buffer70, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.telemetry_handler = PropTypesModule.StringProp.decode(Buffer70)
			elseif Tag == 1001 then
				local Buffer29
				Buffer29, v3642 = ProtoModule.readBuffer(Buf, v148)
				NewModule.accessibility_label = PropTypesModule.StringFormat.decode(Buffer29)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v148)
				v148 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3642 = ProtoModule.readFixed32(Buf, v148)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3642 = ProtoModule.readFixed64(Buf, v148)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module147:jsonEncode()
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

function Module147:jsonDecode()
	-- upvalues: Module147 (copy), t (copy), PropTypesModule (copy)
	local NewModule = Module147.new()
	
	if self.dismiss_dialog_action ~= nil then
		NewModule.kind = {
			type = "dismiss_dialog_action",
			value = t.DismissDialogAction.jsonDecode(self.dismiss_dialog_action)
		}
	end
	if self.dismissDialogAction ~= nil then
		NewModule.kind = {
			type = "dismiss_dialog_action",
			value = t.DismissDialogAction.jsonDecode(self.dismissDialogAction)
		}
	end
	if self.link_action ~= nil then
		NewModule.kind = {
			type = "link_action",
			value = t.LinkAction.jsonDecode(self.link_action)
		}
	end
	if self.linkAction ~= nil then
		NewModule.kind = {
			type = "link_action",
			value = t.LinkAction.jsonDecode(self.linkAction)
		}
	end
	if self.open_game_details_action ~= nil then
		NewModule.kind = {
			type = "open_game_details_action",
			value = t.OpenGameDetailsAction.jsonDecode(self.open_game_details_action)
		}
	end
	if self.openGameDetailsAction ~= nil then
		NewModule.kind = {
			type = "open_game_details_action",
			value = t.OpenGameDetailsAction.jsonDecode(self.openGameDetailsAction)
		}
	end
	if self.open_join_friends_action ~= nil then
		NewModule.kind = {
			type = "open_join_friends_action",
			value = t.OpenJoinFriendsAction.jsonDecode(self.open_join_friends_action)
		}
	end
	if self.openJoinFriendsAction ~= nil then
		NewModule.kind = {
			type = "open_join_friends_action",
			value = t.OpenJoinFriendsAction.jsonDecode(self.openJoinFriendsAction)
		}
	end
	if self.open_marketplace_try_on_action ~= nil then
		NewModule.kind = {
			type = "open_marketplace_try_on_action",
			value = t.OpenMarketplaceTryOnAction.jsonDecode(self.open_marketplace_try_on_action)
		}
	end
	if self.openMarketplaceTryOnAction ~= nil then
		NewModule.kind = {
			type = "open_marketplace_try_on_action",
			value = t.OpenMarketplaceTryOnAction.jsonDecode(self.openMarketplaceTryOnAction)
		}
	end
	if self.open_see_all_action ~= nil then
		NewModule.kind = {
			type = "open_see_all_action",
			value = t.OpenSeeAllAction.jsonDecode(self.open_see_all_action)
		}
	end
	if self.openSeeAllAction ~= nil then
		NewModule.kind = {
			type = "open_see_all_action",
			value = t.OpenSeeAllAction.jsonDecode(self.openSeeAllAction)
		}
	end
	if self.open_sponsored_tooltip_action ~= nil then
		NewModule.kind = {
			type = "open_sponsored_tooltip_action",
			value = t.OpenSponsoredTooltipAction.jsonDecode(self.open_sponsored_tooltip_action)
		}
	end
	if self.openSponsoredTooltipAction ~= nil then
		NewModule.kind = {
			type = "open_sponsored_tooltip_action",
			value = t.OpenSponsoredTooltipAction.jsonDecode(self.openSponsoredTooltipAction)
		}
	end
	if self.play_button_click_action ~= nil then
		NewModule.kind = {
			type = "play_button_click_action",
			value = t.PlayButtonClickAction.jsonDecode(self.play_button_click_action)
		}
	end
	if self.playButtonClickAction ~= nil then
		NewModule.kind = {
			type = "play_button_click_action",
			value = t.PlayButtonClickAction.jsonDecode(self.playButtonClickAction)
		}
	end
	if self.update_user_settings_action ~= nil then
		NewModule.kind = {
			type = "update_user_settings_action",
			value = t.UpdateUserSettingsAction.jsonDecode(self.update_user_settings_action)
		}
	end
	if self.updateUserSettingsAction ~= nil then
		NewModule.kind = {
			type = "update_user_settings_action",
			value = t.UpdateUserSettingsAction.jsonDecode(self.updateUserSettingsAction)
		}
	end
	if self.open_tooltip_action ~= nil then
		NewModule.kind = {
			type = "open_tooltip_action",
			value = t.OpenTooltipAction.jsonDecode(self.open_tooltip_action)
		}
	end
	if self.openTooltipAction ~= nil then
		NewModule.kind = {
			type = "open_tooltip_action",
			value = t.OpenTooltipAction.jsonDecode(self.openTooltipAction)
		}
	end
	if self.open_badge_details_action ~= nil then
		NewModule.kind = {
			type = "open_badge_details_action",
			value = t.OpenBadgeDetailsAction.jsonDecode(self.open_badge_details_action)
		}
	end
	if self.openBadgeDetailsAction ~= nil then
		NewModule.kind = {
			type = "open_badge_details_action",
			value = t.OpenBadgeDetailsAction.jsonDecode(self.openBadgeDetailsAction)
		}
	end
	if self.load_more_from_api_action ~= nil then
		NewModule.kind = {
			type = "load_more_from_api_action",
			value = t.LoadMoreFromApiAction.jsonDecode(self.load_more_from_api_action)
		}
	end
	if self.loadMoreFromApiAction ~= nil then
		NewModule.kind = {
			type = "load_more_from_api_action",
			value = t.LoadMoreFromApiAction.jsonDecode(self.loadMoreFromApiAction)
		}
	end
	if self.share_action ~= nil then
		NewModule.kind = {
			type = "share_action",
			value = t.ShareAction.jsonDecode(self.share_action)
		}
	end
	if self.shareAction ~= nil then
		NewModule.kind = {
			type = "share_action",
			value = t.ShareAction.jsonDecode(self.shareAction)
		}
	end
	if self.open_abuse_report_action ~= nil then
		NewModule.kind = {
			type = "open_abuse_report_action",
			value = t.OpenAbuseReportAction.jsonDecode(self.open_abuse_report_action)
		}
	end
	if self.openAbuseReportAction ~= nil then
		NewModule.kind = {
			type = "open_abuse_report_action",
			value = t.OpenAbuseReportAction.jsonDecode(self.openAbuseReportAction)
		}
	end
	if self.remove_badge_from_inventory_action ~= nil then
		NewModule.kind = {
			type = "remove_badge_from_inventory_action",
			value = t.RemoveBadgeFromInventoryAction.jsonDecode(self.remove_badge_from_inventory_action)
		}
	end
	if self.removeBadgeFromInventoryAction ~= nil then
		NewModule.kind = {
			type = "remove_badge_from_inventory_action",
			value = t.RemoveBadgeFromInventoryAction.jsonDecode(self.removeBadgeFromInventoryAction)
		}
	end
	if self.open_profile_action ~= nil then
		NewModule.kind = {
			type = "open_profile_action",
			value = t.OpenProfileAction.jsonDecode(self.open_profile_action)
		}
	end
	if self.openProfileAction ~= nil then
		NewModule.kind = {
			type = "open_profile_action",
			value = t.OpenProfileAction.jsonDecode(self.openProfileAction)
		}
	end
	if self.open_facial_age_estimation_action ~= nil then
		NewModule.kind = {
			type = "open_facial_age_estimation_action",
			value = t.OpenFacialAgeEstimationAction.jsonDecode(self.open_facial_age_estimation_action)
		}
	end
	if self.openFacialAgeEstimationAction ~= nil then
		NewModule.kind = {
			type = "open_facial_age_estimation_action",
			value = t.OpenFacialAgeEstimationAction.jsonDecode(self.openFacialAgeEstimationAction)
		}
	end
	if self.open_add_connections_page_action ~= nil then
		NewModule.kind = {
			type = "open_add_connections_page_action",
			value = t.OpenAddConnectionsPageAction.jsonDecode(self.open_add_connections_page_action)
		}
	end
	if self.openAddConnectionsPageAction ~= nil then
		NewModule.kind = {
			type = "open_add_connections_page_action",
			value = t.OpenAddConnectionsPageAction.jsonDecode(self.openAddConnectionsPageAction)
		}
	end
	if self.open_marketplace_action ~= nil then
		NewModule.kind = {
			type = "open_marketplace_action",
			value = t.OpenMarketplaceAction.jsonDecode(self.open_marketplace_action)
		}
	end
	if self.openMarketplaceAction ~= nil then
		NewModule.kind = {
			type = "open_marketplace_action",
			value = t.OpenMarketplaceAction.jsonDecode(self.openMarketplaceAction)
		}
	end
	if self.hide_profile_completion_action ~= nil then
		NewModule.kind = {
			type = "hide_profile_completion_action",
			value = t.HideProfileCompletionAction.jsonDecode(self.hide_profile_completion_action)
		}
	end
	if self.hideProfileCompletionAction ~= nil then
		NewModule.kind = {
			type = "hide_profile_completion_action",
			value = t.HideProfileCompletionAction.jsonDecode(self.hideProfileCompletionAction)
		}
	end
	if self.select_marketplace_catalog_category ~= nil then
		NewModule.kind = {
			type = "select_marketplace_catalog_category",
			value = t.SelectMarketplaceCatalogCategory.jsonDecode(self.select_marketplace_catalog_category)
		}
	end
	if self.selectMarketplaceCatalogCategory ~= nil then
		NewModule.kind = {
			type = "select_marketplace_catalog_category",
			value = t.SelectMarketplaceCatalogCategory.jsonDecode(self.selectMarketplaceCatalogCategory)
		}
	end
	if self.select_marketplace_catalog_subcategory ~= nil then
		NewModule.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t.SelectMarketplaceCatalogSubcategory.jsonDecode(self.select_marketplace_catalog_subcategory)
		}
	end
	if self.selectMarketplaceCatalogSubcategory ~= nil then
		NewModule.kind = {
			type = "select_marketplace_catalog_subcategory",
			value = t.SelectMarketplaceCatalogSubcategory.jsonDecode(self.selectMarketplaceCatalogSubcategory)
		}
	end
	if self.open_marketplace_catalog_see_all ~= nil then
		NewModule.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t.OpenMarketplaceCatalogSeeAll.jsonDecode(self.open_marketplace_catalog_see_all)
		}
	end
	if self.openMarketplaceCatalogSeeAll ~= nil then
		NewModule.kind = {
			type = "open_marketplace_catalog_see_all",
			value = t.OpenMarketplaceCatalogSeeAll.jsonDecode(self.openMarketplaceCatalogSeeAll)
		}
	end
	if self.close_marketplace_category_tooltip ~= nil then
		NewModule.kind = {
			type = "close_marketplace_category_tooltip",
			value = t.CloseMarketplaceCategoryTooltip.jsonDecode(self.close_marketplace_category_tooltip)
		}
	end
	if self.closeMarketplaceCategoryTooltip ~= nil then
		NewModule.kind = {
			type = "close_marketplace_category_tooltip",
			value = t.CloseMarketplaceCategoryTooltip.jsonDecode(self.closeMarketplaceCategoryTooltip)
		}
	end
	if self.resize_marketplace_catalog ~= nil then
		NewModule.kind = {
			type = "resize_marketplace_catalog",
			value = t.ResizeMarketplaceCatalog.jsonDecode(self.resize_marketplace_catalog)
		}
	end
	if self.resizeMarketplaceCatalog ~= nil then
		NewModule.kind = {
			type = "resize_marketplace_catalog",
			value = t.ResizeMarketplaceCatalog.jsonDecode(self.resizeMarketplaceCatalog)
		}
	end
	if self.open_marketplace_catalog_filters ~= nil then
		NewModule.kind = {
			type = "open_marketplace_catalog_filters",
			value = t.OpenMarketplaceCatalogFilters.jsonDecode(self.open_marketplace_catalog_filters)
		}
	end
	if self.openMarketplaceCatalogFilters ~= nil then
		NewModule.kind = {
			type = "open_marketplace_catalog_filters",
			value = t.OpenMarketplaceCatalogFilters.jsonDecode(self.openMarketplaceCatalogFilters)
		}
	end
	if self.open_social_link_action ~= nil then
		NewModule.kind = {
			type = "open_social_link_action",
			value = t.OpenSocialLinkAction.jsonDecode(self.open_social_link_action)
		}
	end
	if self.openSocialLinkAction ~= nil then
		NewModule.kind = {
			type = "open_social_link_action",
			value = t.OpenSocialLinkAction.jsonDecode(self.openSocialLinkAction)
		}
	end
	if self.open_charts_sort_detail_action ~= nil then
		NewModule.kind = {
			type = "open_charts_sort_detail_action",
			value = t.OpenChartsSortDetailAction.jsonDecode(self.open_charts_sort_detail_action)
		}
	end
	if self.openChartsSortDetailAction ~= nil then
		NewModule.kind = {
			type = "open_charts_sort_detail_action",
			value = t.OpenChartsSortDetailAction.jsonDecode(self.openChartsSortDetailAction)
		}
	end
	if self.open_song_detail_action ~= nil then
		NewModule.kind = {
			type = "open_song_detail_action",
			value = t.OpenSongDetailAction.jsonDecode(self.open_song_detail_action)
		}
	end
	if self.openSongDetailAction ~= nil then
		NewModule.kind = {
			type = "open_song_detail_action",
			value = t.OpenSongDetailAction.jsonDecode(self.openSongDetailAction)
		}
	end
	if self.refresh_from_api_action ~= nil then
		NewModule.kind = {
			type = "refresh_from_api_action",
			value = t.RefreshFromApiAction.jsonDecode(self.refresh_from_api_action)
		}
	end
	if self.refreshFromApiAction ~= nil then
		NewModule.kind = {
			type = "refresh_from_api_action",
			value = t.RefreshFromApiAction.jsonDecode(self.refreshFromApiAction)
		}
	end
	if self.rsvp_to_event_action ~= nil then
		NewModule.kind = {
			type = "rsvp_to_event_action",
			value = t.RsvpToEventAction.jsonDecode(self.rsvp_to_event_action)
		}
	end
	if self.rsvpToEventAction ~= nil then
		NewModule.kind = {
			type = "rsvp_to_event_action",
			value = t.RsvpToEventAction.jsonDecode(self.rsvpToEventAction)
		}
	end
	if self.apply_charts_filter_action ~= nil then
		NewModule.kind = {
			type = "apply_charts_filter_action",
			value = t.ApplyChartsFilterAction.jsonDecode(self.apply_charts_filter_action)
		}
	end
	if self.applyChartsFilterAction ~= nil then
		NewModule.kind = {
			type = "apply_charts_filter_action",
			value = t.ApplyChartsFilterAction.jsonDecode(self.applyChartsFilterAction)
		}
	end
	if self.analytics_event_action ~= nil then
		NewModule.kind = {
			type = "analytics_event_action",
			value = t.AnalyticsEventAction.jsonDecode(self.analytics_event_action)
		}
	end
	if self.analyticsEventAction ~= nil then
		NewModule.kind = {
			type = "analytics_event_action",
			value = t.AnalyticsEventAction.jsonDecode(self.analyticsEventAction)
		}
	end
	if self.custom_analytics_event_action ~= nil then
		NewModule.kind = {
			type = "custom_analytics_event_action",
			value = t.CustomAnalyticsEventAction.jsonDecode(self.custom_analytics_event_action)
		}
	end
	if self.customAnalyticsEventAction ~= nil then
		NewModule.kind = {
			type = "custom_analytics_event_action",
			value = t.CustomAnalyticsEventAction.jsonDecode(self.customAnalyticsEventAction)
		}
	end
	if self.open_game_invite_action ~= nil then
		NewModule.kind = {
			type = "open_game_invite_action",
			value = t.OpenGameInviteAction.jsonDecode(self.open_game_invite_action)
		}
	end
	if self.openGameInviteAction ~= nil then
		NewModule.kind = {
			type = "open_game_invite_action",
			value = t.OpenGameInviteAction.jsonDecode(self.openGameInviteAction)
		}
	end
	if self.open_event_details_action ~= nil then
		NewModule.kind = {
			type = "open_event_details_action",
			value = t.OpenEventDetailsAction.jsonDecode(self.open_event_details_action)
		}
	end
	if self.openEventDetailsAction ~= nil then
		NewModule.kind = {
			type = "open_event_details_action",
			value = t.OpenEventDetailsAction.jsonDecode(self.openEventDetailsAction)
		}
	end
	if self.launch_experience_action ~= nil then
		NewModule.kind = {
			type = "launch_experience_action",
			value = t.LaunchExperienceAction.jsonDecode(self.launch_experience_action)
		}
	end
	if self.launchExperienceAction ~= nil then
		NewModule.kind = {
			type = "launch_experience_action",
			value = t.LaunchExperienceAction.jsonDecode(self.launchExperienceAction)
		}
	end
	if self.toggle_experience_favorite_action ~= nil then
		NewModule.kind = {
			type = "toggle_experience_favorite_action",
			value = t.ToggleExperienceFavoriteAction.jsonDecode(self.toggle_experience_favorite_action)
		}
	end
	if self.toggleExperienceFavoriteAction ~= nil then
		NewModule.kind = {
			type = "toggle_experience_favorite_action",
			value = t.ToggleExperienceFavoriteAction.jsonDecode(self.toggleExperienceFavoriteAction)
		}
	end
	if self.toggle_experience_follow_action ~= nil then
		NewModule.kind = {
			type = "toggle_experience_follow_action",
			value = t.ToggleExperienceFollowAction.jsonDecode(self.toggle_experience_follow_action)
		}
	end
	if self.toggleExperienceFollowAction ~= nil then
		NewModule.kind = {
			type = "toggle_experience_follow_action",
			value = t.ToggleExperienceFollowAction.jsonDecode(self.toggleExperienceFollowAction)
		}
	end
	if self.toggle_experience_vote_action ~= nil then
		NewModule.kind = {
			type = "toggle_experience_vote_action",
			value = t.ToggleExperienceVoteAction.jsonDecode(self.toggle_experience_vote_action)
		}
	end
	if self.toggleExperienceVoteAction ~= nil then
		NewModule.kind = {
			type = "toggle_experience_vote_action",
			value = t.ToggleExperienceVoteAction.jsonDecode(self.toggleExperienceVoteAction)
		}
	end
	if self.open_purchase_prompt_action ~= nil then
		NewModule.kind = {
			type = "open_purchase_prompt_action",
			value = t.OpenPurchasePromptAction.jsonDecode(self.open_purchase_prompt_action)
		}
	end
	if self.openPurchasePromptAction ~= nil then
		NewModule.kind = {
			type = "open_purchase_prompt_action",
			value = t.OpenPurchasePromptAction.jsonDecode(self.openPurchasePromptAction)
		}
	end
	if self.open_sdui_overlay_action ~= nil then
		NewModule.kind = {
			type = "open_sdui_overlay_action",
			value = t.OpenSduiOverlayAction.jsonDecode(self.open_sdui_overlay_action)
		}
	end
	if self.openSduiOverlayAction ~= nil then
		NewModule.kind = {
			type = "open_sdui_overlay_action",
			value = t.OpenSduiOverlayAction.jsonDecode(self.openSduiOverlayAction)
		}
	end
	if self.open_badges_see_all_action ~= nil then
		NewModule.kind = {
			type = "open_badges_see_all_action",
			value = t.OpenBadgesSeeAllAction.jsonDecode(self.open_badges_see_all_action)
		}
	end
	if self.openBadgesSeeAllAction ~= nil then
		NewModule.kind = {
			type = "open_badges_see_all_action",
			value = t.OpenBadgesSeeAllAction.jsonDecode(self.openBadgesSeeAllAction)
		}
	end
	if self.open_experience_store_see_all_action ~= nil then
		NewModule.kind = {
			type = "open_experience_store_see_all_action",
			value = t.OpenExperienceStoreSeeAllAction.jsonDecode(self.open_experience_store_see_all_action)
		}
	end
	if self.openExperienceStoreSeeAllAction ~= nil then
		NewModule.kind = {
			type = "open_experience_store_see_all_action",
			value = t.OpenExperienceStoreSeeAllAction.jsonDecode(self.openExperienceStoreSeeAllAction)
		}
	end
	if self.dismiss_game_feedback_action ~= nil then
		NewModule.kind = {
			type = "dismiss_game_feedback_action",
			value = t.DismissGameFeedbackAction.jsonDecode(self.dismiss_game_feedback_action)
		}
	end
	if self.dismissGameFeedbackAction ~= nil then
		NewModule.kind = {
			type = "dismiss_game_feedback_action",
			value = t.DismissGameFeedbackAction.jsonDecode(self.dismissGameFeedbackAction)
		}
	end
	if self.open_game_feedback_form_action ~= nil then
		NewModule.kind = {
			type = "open_game_feedback_form_action",
			value = t.OpenGameFeedbackFormAction.jsonDecode(self.open_game_feedback_form_action)
		}
	end
	if self.openGameFeedbackFormAction ~= nil then
		NewModule.kind = {
			type = "open_game_feedback_form_action",
			value = t.OpenGameFeedbackFormAction.jsonDecode(self.openGameFeedbackFormAction)
		}
	end
	if self.enable_event_notifications_action ~= nil then
		NewModule.kind = {
			type = "enable_event_notifications_action",
			value = t.EnableEventNotificationsAction.jsonDecode(self.enable_event_notifications_action)
		}
	end
	if self.enableEventNotificationsAction ~= nil then
		NewModule.kind = {
			type = "enable_event_notifications_action",
			value = t.EnableEventNotificationsAction.jsonDecode(self.enableEventNotificationsAction)
		}
	end
	if self.dismiss_event_notifications_modal_action ~= nil then
		NewModule.kind = {
			type = "dismiss_event_notifications_modal_action",
			value = t.DismissEventNotificationsModalAction.jsonDecode(self.dismiss_event_notifications_modal_action)
		}
	end
	if self.dismissEventNotificationsModalAction ~= nil then
		NewModule.kind = {
			type = "dismiss_event_notifications_modal_action",
			value = t.DismissEventNotificationsModalAction.jsonDecode(self.dismissEventNotificationsModalAction)
		}
	end
	if self.open_amp_wizard_action ~= nil then
		NewModule.kind = {
			type = "open_amp_wizard_action",
			value = t.OpenAmpWizardAction.jsonDecode(self.open_amp_wizard_action)
		}
	end
	if self.openAmpWizardAction ~= nil then
		NewModule.kind = {
			type = "open_amp_wizard_action",
			value = t.OpenAmpWizardAction.jsonDecode(self.openAmpWizardAction)
		}
	end
	if self.open_subscription_purchase_page_action ~= nil then
		NewModule.kind = {
			type = "open_subscription_purchase_page_action",
			value = t.OpenSubscriptionPurchasePageAction.jsonDecode(self.open_subscription_purchase_page_action)
		}
	end
	if self.openSubscriptionPurchasePageAction ~= nil then
		NewModule.kind = {
			type = "open_subscription_purchase_page_action",
			value = t.OpenSubscriptionPurchasePageAction.jsonDecode(self.openSubscriptionPurchasePageAction)
		}
	end
	if self.refresh_game_passes_action ~= nil then
		NewModule.kind = {
			type = "refresh_game_passes_action",
			value = t.RefreshGamePassesAction.jsonDecode(self.refresh_game_passes_action)
		}
	end
	if self.refreshGamePassesAction ~= nil then
		NewModule.kind = {
			type = "refresh_game_passes_action",
			value = t.RefreshGamePassesAction.jsonDecode(self.refreshGamePassesAction)
		}
	end
	if self.refresh_playability_action ~= nil then
		NewModule.kind = {
			type = "refresh_playability_action",
			value = t.RefreshPlayabilityAction.jsonDecode(self.refresh_playability_action)
		}
	end
	if self.refreshPlayabilityAction ~= nil then
		NewModule.kind = {
			type = "refresh_playability_action",
			value = t.RefreshPlayabilityAction.jsonDecode(self.refreshPlayabilityAction)
		}
	end
	if self.open_social_proof_user_list_sheet_action ~= nil then
		NewModule.kind = {
			type = "open_social_proof_user_list_sheet_action",
			value = t.OpenSocialProofUserListSheetAction.jsonDecode(self.open_social_proof_user_list_sheet_action)
		}
	end
	if self.openSocialProofUserListSheetAction ~= nil then
		NewModule.kind = {
			type = "open_social_proof_user_list_sheet_action",
			value = t.OpenSocialProofUserListSheetAction.jsonDecode(self.openSocialProofUserListSheetAction)
		}
	end
	if self.report_surface_load_time_milestone_action ~= nil then
		NewModule.kind = {
			type = "report_surface_load_time_milestone_action",
			value = t.ReportSurfaceLoadTimeMilestoneAction.jsonDecode(self.report_surface_load_time_milestone_action)
		}
	end
	if self.reportSurfaceLoadTimeMilestoneAction ~= nil then
		NewModule.kind = {
			type = "report_surface_load_time_milestone_action",
			value = t.ReportSurfaceLoadTimeMilestoneAction.jsonDecode(self.reportSurfaceLoadTimeMilestoneAction)
		}
	end
	if self.open_search_results_tab_action ~= nil then
		NewModule.kind = {
			type = "open_search_results_tab_action",
			value = t.OpenSearchResultsTabAction.jsonDecode(self.open_search_results_tab_action)
		}
	end
	if self.openSearchResultsTabAction ~= nil then
		NewModule.kind = {
			type = "open_search_results_tab_action",
			value = t.OpenSearchResultsTabAction.jsonDecode(self.openSearchResultsTabAction)
		}
	end
	if self.open_phone_upsell_modal_action ~= nil then
		NewModule.kind = {
			type = "open_phone_upsell_modal_action",
			value = t.OpenPhoneUpsellModalAction.jsonDecode(self.open_phone_upsell_modal_action)
		}
	end
	if self.openPhoneUpsellModalAction ~= nil then
		NewModule.kind = {
			type = "open_phone_upsell_modal_action",
			value = t.OpenPhoneUpsellModalAction.jsonDecode(self.openPhoneUpsellModalAction)
		}
	end
	if self.open_email_upsell_modal_action ~= nil then
		NewModule.kind = {
			type = "open_email_upsell_modal_action",
			value = t.OpenEmailUpsellModalAction.jsonDecode(self.open_email_upsell_modal_action)
		}
	end
	if self.openEmailUpsellModalAction ~= nil then
		NewModule.kind = {
			type = "open_email_upsell_modal_action",
			value = t.OpenEmailUpsellModalAction.jsonDecode(self.openEmailUpsellModalAction)
		}
	end
	if self.dismiss_prompt_action ~= nil then
		NewModule.kind = {
			type = "dismiss_prompt_action",
			value = t.DismissPromptAction.jsonDecode(self.dismiss_prompt_action)
		}
	end
	if self.dismissPromptAction ~= nil then
		NewModule.kind = {
			type = "dismiss_prompt_action",
			value = t.DismissPromptAction.jsonDecode(self.dismissPromptAction)
		}
	end
	if self.request_friendship_action ~= nil then
		NewModule.kind = {
			type = "request_friendship_action",
			value = t.RequestFriendshipAction.jsonDecode(self.request_friendship_action)
		}
	end
	if self.requestFriendshipAction ~= nil then
		NewModule.kind = {
			type = "request_friendship_action",
			value = t.RequestFriendshipAction.jsonDecode(self.requestFriendshipAction)
		}
	end
	if self.refresh_developer_products_action ~= nil then
		NewModule.kind = {
			type = "refresh_developer_products_action",
			value = t.RefreshDeveloperProductsAction.jsonDecode(self.refresh_developer_products_action)
		}
	end
	if self.refreshDeveloperProductsAction ~= nil then
		NewModule.kind = {
			type = "refresh_developer_products_action",
			value = t.RefreshDeveloperProductsAction.jsonDecode(self.refreshDeveloperProductsAction)
		}
	end
	if self.open_fae_trial_upsell_action ~= nil then
		NewModule.kind = {
			type = "open_fae_trial_upsell_action",
			value = t.OpenFaeTrialUpsellAction.jsonDecode(self.open_fae_trial_upsell_action)
		}
	end
	if self.openFaeTrialUpsellAction ~= nil then
		NewModule.kind = {
			type = "open_fae_trial_upsell_action",
			value = t.OpenFaeTrialUpsellAction.jsonDecode(self.openFaeTrialUpsellAction)
		}
	end
	if self.refresh_omni_recommendation_feed_item_action ~= nil then
		NewModule.kind = {
			type = "refresh_omni_recommendation_feed_item_action",
			value = t.RefreshOmniRecommendationFeedItemAction.jsonDecode(self.refresh_omni_recommendation_feed_item_action)
		}
	end
	if self.refreshOmniRecommendationFeedItemAction ~= nil then
		NewModule.kind = {
			type = "refresh_omni_recommendation_feed_item_action",
			value = t.RefreshOmniRecommendationFeedItemAction.jsonDecode(self.refreshOmniRecommendationFeedItemAction)
		}
	end
	if self.ai_overview_feedback_action ~= nil then
		NewModule.kind = {
			type = "ai_overview_feedback_action",
			value = t.AiOverviewFeedbackAction.jsonDecode(self.ai_overview_feedback_action)
		}
	end
	if self.aiOverviewFeedbackAction ~= nil then
		NewModule.kind = {
			type = "ai_overview_feedback_action",
			value = t.AiOverviewFeedbackAction.jsonDecode(self.aiOverviewFeedbackAction)
		}
	end
	if self.open_trusted_friends_upsell_modal_action ~= nil then
		NewModule.kind = {
			type = "open_trusted_friends_upsell_modal_action",
			value = t.OpenTrustedFriendsUpsellModalAction.jsonDecode(self.open_trusted_friends_upsell_modal_action)
		}
	end
	if self.openTrustedFriendsUpsellModalAction ~= nil then
		NewModule.kind = {
			type = "open_trusted_friends_upsell_modal_action",
			value = t.OpenTrustedFriendsUpsellModalAction.jsonDecode(self.openTrustedFriendsUpsellModalAction)
		}
	end
	if self.record_party_chat_conversation_upsell_acknowledgement_action ~= nil then
		NewModule.kind = {
			type = "record_party_chat_conversation_upsell_acknowledgement_action",
			value = t.RecordPartyChatConversationUpsellAcknowledgementAction.jsonDecode(self.record_party_chat_conversation_upsell_acknowledgement_action)
		}
	end
	if self.recordPartyChatConversationUpsellAcknowledgementAction ~= nil then
		NewModule.kind = {
			type = "record_party_chat_conversation_upsell_acknowledgement_action",
			value = t.RecordPartyChatConversationUpsellAcknowledgementAction.jsonDecode(self.recordPartyChatConversationUpsellAcknowledgementAction)
		}
	end
	if self.open_search_results_with_query_action ~= nil then
		NewModule.kind = {
			type = "open_search_results_with_query_action",
			value = t.OpenSearchResultsWithQueryAction.jsonDecode(self.open_search_results_with_query_action)
		}
	end
	if self.openSearchResultsWithQueryAction ~= nil then
		NewModule.kind = {
			type = "open_search_results_with_query_action",
			value = t.OpenSearchResultsWithQueryAction.jsonDecode(self.openSearchResultsWithQueryAction)
		}
	end
	if self.select_marketplace_favorites_category ~= nil then
		NewModule.kind = {
			type = "select_marketplace_favorites_category",
			value = t.SelectMarketplaceFavoritesCategory.jsonDecode(self.select_marketplace_favorites_category)
		}
	end
	if self.selectMarketplaceFavoritesCategory ~= nil then
		NewModule.kind = {
			type = "select_marketplace_favorites_category",
			value = t.SelectMarketplaceFavoritesCategory.jsonDecode(self.selectMarketplaceFavoritesCategory)
		}
	end
	if self.download_app_action ~= nil then
		NewModule.kind = {
			type = "download_app_action",
			value = t.DownloadAppAction.jsonDecode(self.download_app_action)
		}
	end
	if self.downloadAppAction ~= nil then
		NewModule.kind = {
			type = "download_app_action",
			value = t.DownloadAppAction.jsonDecode(self.downloadAppAction)
		}
	end
	if self.telemetry_handler ~= nil then
		NewModule.telemetry_handler = PropTypesModule.StringProp.jsonDecode(self.telemetry_handler)
	end
	if self.telemetryHandler ~= nil then
		NewModule.telemetry_handler = PropTypesModule.StringProp.jsonDecode(self.telemetryHandler)
	end
	if self.accessibility_label ~= nil then
		NewModule.accessibility_label = PropTypesModule.StringFormat.jsonDecode(self.accessibility_label)
	end
	if self.accessibilityLabel ~= nil then
		NewModule.accessibility_label = PropTypesModule.StringFormat.jsonDecode(self.accessibilityLabel)
	end
	return NewModule
end

Module147.descriptor = {
	name = "Action",
	fullName = "roblox.apppageplatform.shared.v1beta1.Action"
}
t.Action = Module147
TypeRegistryModule.default:register(t.Action)
local Module148 = {}
Module148.__index = Module148

function Module148.new(p1)
	-- upvalues: Module148 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module148))
end

function Module148:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "value" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module148.decode(Buf)
	-- upvalues: Module148 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module148.new()
	local v149 = 0
	while v149 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3731 = ProtoModule.readTag(Buf, v149)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3731 = ProtoModule.readVarInt(Buf, v149)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3731 = ProtoModule.readBuffer(Buf, v149)
				NewModule.kind = { type = "value", value = t.Action.decode(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3731 = ProtoModule.readBuffer(Buf, v149)
				NewModule.kind = {
					type = "conditional",
					value = t.ActionProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v149)
				v149 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3731 = ProtoModule.readFixed32(Buf, v149)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3731 = ProtoModule.readFixed64(Buf, v149)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module148:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "value" then
			t.value = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module148:jsonDecode()
	-- upvalues: Module148 (copy), t (copy)
	local NewModule = Module148.new()
	
	if self.value ~= nil then
		NewModule.kind = { type = "value", value = t.Action.jsonDecode(self.value) }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = t.ActionProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module148.descriptor = {
	name = "ActionProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionProp"
}
t.ActionProp = Module148
TypeRegistryModule.default:register(t.ActionProp)
local Module149 = {}
Module149.__index = Module149

function Module149.new(p1)
	-- upvalues: Module149 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module149))
end

function Module149:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil and self.kind.type == "value" then
		local EncodeResult = self.kind.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module149.decode(Buf)
	-- upvalues: Module149 (copy), ProtoModule (copy), PropConditionModule (copy), t (copy)
	local NewModule = Module149.new()
	local v150 = 0
	while v150 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3752 = ProtoModule.readTag(Buf, v150)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3752 = ProtoModule.readVarInt(Buf, v150)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3752 = ProtoModule.readBuffer(Buf, v150)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v3752 = ProtoModule.readBuffer(Buf, v150)
				NewModule.kind = { type = "value", value = t.Action.decode(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v150)
				v150 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3752 = ProtoModule.readFixed32(Buf, v150)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3752 = ProtoModule.readFixed64(Buf, v150)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module149:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "value" then
		t.value = self.kind.value:jsonEncode()
	end
	return t
end

function Module149:jsonDecode()
	-- upvalues: Module149 (copy), PropConditionModule (copy), t (copy)
	local NewModule = Module149.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.value ~= nil then
		NewModule.kind = { type = "value", value = t.Action.jsonDecode(self.value) }
	end
	return NewModule
end

Module149.descriptor = {
	name = "ActionProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ActionProp_ConditionalOption = Module149
TypeRegistryModule.default:register(t.ActionProp_ConditionalOption)
local Module150 = {}
Module150.__index = Module150

function Module150.new(p1)
	-- upvalues: Module150 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module150))
end

function Module150:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module150.decode(Buf)
	-- upvalues: Module150 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module150.new()
	local v151 = 0
	while v151 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3770 = ProtoModule.readTag(Buf, v151)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3770 = ProtoModule.readVarInt(Buf, v151)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3770 = ProtoModule.readBuffer(Buf, v151)
				table.insert(NewModule.options, t.ActionProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v151)
				v151 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3770 = ProtoModule.readFixed32(Buf, v151)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3770 = ProtoModule.readFixed64(Buf, v151)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module150:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module150:jsonDecode()
	-- upvalues: Module150 (copy), t (copy)
	local NewModule = Module150.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, t.ActionProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module150.descriptor = {
	name = "ActionProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ActionProp_ConditionalOptions = Module150
TypeRegistryModule.default:register(t.ActionProp_ConditionalOptions)
local Module151 = {}
Module151.__index = Module151

function Module151.new(p1)
	-- upvalues: Module151 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module151))
end

function Module151:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module151.decode(Buf)
	-- upvalues: Module151 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module151.new()
	local v152 = 0
	while v152 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3794 = ProtoModule.readTag(Buf, v152)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3794 = ProtoModule.readVarInt(Buf, v152)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3794 = ProtoModule.readBuffer(Buf, v152)
				NewModule.kind = {
					type = "literal",
					value = t.FocusNavActionsProp_FocusNavData.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3794 = ProtoModule.readBuffer(Buf, v152)
				NewModule.kind = {
					type = "conditional",
					value = t.FocusNavActionsProp_ConditionalOptions.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v3794 = ProtoModule.readBuffer(Buf, v152)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v152)
				v152 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3794 = ProtoModule.readFixed32(Buf, v152)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3794 = ProtoModule.readFixed64(Buf, v152)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module151:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module151:jsonDecode()
	-- upvalues: Module151 (copy), t (copy)
	local NewModule = Module151.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = t.FocusNavActionsProp_FocusNavData.jsonDecode(self.literal)
		}
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = t.FocusNavActionsProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module151.descriptor = {
	name = "FocusNavActionsProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavActionsProp"
}
t.FocusNavActionsProp = Module151
TypeRegistryModule.default:register(t.FocusNavActionsProp)
local Module152 = {}
Module152.__index = Module152

function Module152.new(p1)
	-- upvalues: Module152 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module152))
end

function Module152:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module152.decode(Buf)
	-- upvalues: Module152 (copy), ProtoModule (copy), PropConditionModule (copy), t (copy)
	local NewModule = Module152.new()
	local v153 = 0
	while v153 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3818 = ProtoModule.readTag(Buf, v153)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3818 = ProtoModule.readVarInt(Buf, v153)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3818 = ProtoModule.readBuffer(Buf, v153)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v3818 = ProtoModule.readBuffer(Buf, v153)
				NewModule.kind = {
					type = "literal",
					value = t.FocusNavActionsProp_FocusNavData.decode(Buffer2)
				}
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v3818 = ProtoModule.readBuffer(Buf, v153)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v153)
				v153 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3818 = ProtoModule.readFixed32(Buf, v153)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3818 = ProtoModule.readFixed64(Buf, v153)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module152:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module152:jsonDecode()
	-- upvalues: Module152 (copy), PropConditionModule (copy), t (copy)
	local NewModule = Module152.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = t.FocusNavActionsProp_FocusNavData.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module152.descriptor = {
	name = "FocusNavActionsProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FocusNavActionsProp_ConditionalOption = Module152
TypeRegistryModule.default:register(t.FocusNavActionsProp_ConditionalOption)
local Module153 = {}
Module153.__index = Module153

function Module153.new(p1)
	-- upvalues: Module153 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module153))
end

function Module153:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module153.decode(Buf)
	-- upvalues: Module153 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module153.new()
	local v154 = 0
	while v154 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3837 = ProtoModule.readTag(Buf, v154)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3837 = ProtoModule.readVarInt(Buf, v154)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3837 = ProtoModule.readBuffer(Buf, v154)
				table.insert(NewModule.options, t.FocusNavActionsProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v154)
				v154 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3837 = ProtoModule.readFixed32(Buf, v154)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3837 = ProtoModule.readFixed64(Buf, v154)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module153:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module153:jsonDecode()
	-- upvalues: Module153 (copy), t (copy)
	local NewModule = Module153.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, t.FocusNavActionsProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module153.descriptor = {
	name = "FocusNavActionsProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FocusNavActionsProp_ConditionalOptions = Module153
TypeRegistryModule.default:register(t.FocusNavActionsProp_ConditionalOptions)
local Module154 = {}
Module154.__index = Module154

function Module154.new(p1)
	-- upvalues: Module154 (copy)
	return (setmetatable({
		keys = if p1 == nil or p1.keys == nil then {} else p1.keys,
		events = if p1 == nil or p1.events == nil then {} else p1.events
	}, Module154))
end

function Module154:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.keys ~= nil and next(self.keys) ~= nil then
		for i, key in self.keys do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult, WriteTagResult2, i)
			local EncodeResult = key:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.events ~= nil and next(self.events) ~= nil then
		for i1, event in self.events do
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, i1)
			local EncodeResult = event:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(WriteStringResult1, WriteStringResult2_1, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult1, WriteBufferResult2_1 = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, WriteBufferResult1, WriteBufferResult2_1)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module154.decode(Buf)
	-- upvalues: Module154 (copy), ProtoModule (copy), t (copy), PropTypesEngineModule (copy)
	local NewModule = Module154.new()
	local v155 = 0
	while v155 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3875 = ProtoModule.readTag(Buf, v155)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3875 = ProtoModule.readVarInt(Buf, v155)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 3 then
				local Buffer1
				Buffer1, v3875 = ProtoModule.readBuffer(Buf, v155)
				local DecodeResult = t.FocusNavActionsProp_FocusNavData_KeysEntry.decode(Buffer1)
				local NewResult = PropTypesEngineModule.KeyCodeProp.new()
				NewModule.keys[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer2
				Buffer2, v3875 = ProtoModule.readBuffer(Buf, v155)
				local DecodeResult = t.FocusNavActionsProp_FocusNavData_EventsEntry.decode(Buffer2)
				local NewResult = t.ActionProp.new()
				NewModule.events[DecodeResult.key or ""] = DecodeResult.value or NewResult
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v155)
				v155 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3875 = ProtoModule.readFixed32(Buf, v155)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3875 = ProtoModule.readFixed64(Buf, v155)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module154:jsonEncode()
	local t = {}
	
	if self.keys ~= nil and next(self.keys) ~= nil then
		local Keys = {}
		
		for i, key in self.keys do
			Keys[i] = key:jsonEncode()
		end
		t.keys = Keys
	end
	if self.events ~= nil and next(self.events) ~= nil then
		local Events = {}
		
		for i1, event in self.events do
			Events[i1] = event:jsonEncode()
		end
		t.events = Events
	end
	return t
end

function Module154:jsonDecode()
	-- upvalues: Module154 (copy), PropTypesEngineModule (copy), t (copy)
	local NewModule = Module154.new()
	
	if self.keys ~= nil then
		local Keys = {}
		
		for i, key in self.keys do
			Keys[i] = PropTypesEngineModule.KeyCodeProp.jsonDecode(key)
		end
		NewModule.keys = Keys
	end
	if self.events ~= nil then
		local Events = {}
		
		for i1, event in self.events do
			Events[i1] = t.ActionProp.jsonDecode(event)
		end
		NewModule.events = Events
	end
	return NewModule
end

Module154.descriptor = {
	name = "FocusNavActionsProp_FocusNavData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FocusNavData"
}
t.FocusNavActionsProp_FocusNavData = Module154
TypeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData)
local Module155 = {}
Module155.__index = Module155

function Module155.new(p1)
	-- upvalues: Module155 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module155))
end

function Module155:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module155.decode(Buf)
	-- upvalues: Module155 (copy), ProtoModule (copy), PropTypesEngineModule (copy)
	local NewModule = Module155.new()
	local v156 = 0
	while v156 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3903 = ProtoModule.readTag(Buf, v156)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3903 = ProtoModule.readVarInt(Buf, v156)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3903 = ProtoModule.readBuffer(Buf, v156)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3903 = ProtoModule.readBuffer(Buf, v156)
				NewModule.value = PropTypesEngineModule.KeyCodeProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v156)
				v156 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3903 = ProtoModule.readFixed32(Buf, v156)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3903 = ProtoModule.readFixed64(Buf, v156)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module155:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module155:jsonDecode()
	-- upvalues: Module155 (copy), PropTypesEngineModule (copy)
	local NewModule = Module155.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = PropTypesEngineModule.KeyCodeProp.jsonDecode(self.value)
	end
	return NewModule
end

Module155.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_KeysEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.KeysEntry"
}
t.FocusNavActionsProp_FocusNavData_KeysEntry = Module155
TypeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData_KeysEntry)
local Module156 = {}
Module156.__index = Module156

function Module156.new(p1)
	-- upvalues: Module156 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module156))
end

function Module156:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module156.decode(Buf)
	-- upvalues: Module156 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module156.new()
	local v157 = 0
	while v157 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v3923 = ProtoModule.readTag(Buf, v157)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v3923 = ProtoModule.readVarInt(Buf, v157)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v3923 = ProtoModule.readBuffer(Buf, v157)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v3923 = ProtoModule.readBuffer(Buf, v157)
				NewModule.value = t.ActionProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v157)
				v157 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v3923 = ProtoModule.readFixed32(Buf, v157)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v3923 = ProtoModule.readFixed64(Buf, v157)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module156:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module156:jsonDecode()
	-- upvalues: Module156 (copy), t (copy)
	local NewModule = Module156.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.ActionProp.jsonDecode(self.value)
	end
	return NewModule
end

Module156.descriptor = {
	name = "FocusNavActionsProp_FocusNavData_EventsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsEntry"
}
t.FocusNavActionsProp_FocusNavData_EventsEntry = Module156
TypeRegistryModule.default:register(t.FocusNavActionsProp_FocusNavData_EventsEntry)
t.ActionType = {
	fromNumber = function(p1)
		return if p1 == 0 then "ACTION_TYPE_INVALID" elseif p1 == 1 then "ACTION_TYPE_DISMISS_DIALOG" elseif p1 == 2 then "ACTION_TYPE_LINK" elseif p1 == 3 then "ACTION_TYPE_OPEN_GAME_DETAILS" elseif p1 == 4 then "ACTION_TYPE_OPEN_JOIN_FRIENDS" elseif p1 == 5 then "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" elseif p1 == 6 then "ACTION_TYPE_OPEN_SEE_ALL" elseif p1 == 7 then "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" elseif p1 == 8 then "ACTION_TYPE_PLAY_BUTTON_CLICK" elseif p1 == 9 then "ACTION_TYPE_UPDATE_USER_SETTINGS" elseif p1 == 10 then "ACTION_TYPE_OPEN_TOOLTIP" elseif p1 == 11 then "ACTION_TYPE_OPEN_BADGE_DETAILS" elseif p1 == 12 then "ACTION_TYPE_LOAD_MORE_FROM_API" elseif p1 == 13 then "ACTION_TYPE_SHARE" elseif p1 == 14 then "ACTION_TYPE_OPEN_ABUSE_REPORT" elseif p1 == 15 then "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" elseif p1 == 16 then "ACTION_TYPE_OPEN_PROFILE" elseif p1 == 17 then "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" elseif p1 == 18 then "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" elseif p1 == 19 then "ACTION_TYPE_OPEN_MARKETPLACE" elseif p1 == 20 then "ACTION_TYPE_HIDE_PROFILE_COMPLETION" elseif p1 == 21 then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" elseif p1 == 22 then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" elseif p1 == 23 then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" elseif p1 == 24 then "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" elseif p1 == 25 then "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" elseif p1 == 26 then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" elseif p1 == 27 then "ACTION_TYPE_OPEN_SOCIAL_LINK" elseif p1 == 28 then "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" elseif p1 == 29 then "ACTION_TYPE_OPEN_SONG_DETAIL" elseif p1 == 30 then "ACTION_TYPE_REFRESH_FROM_API" elseif p1 == 31 then "ACTION_TYPE_RSVP_TO_EVENT" elseif p1 == 32 then "ACTION_TYPE_APPLY_CHARTS_FILTER" elseif p1 == 33 then "ACTION_TYPE_ANALYTICS_EVENT" elseif p1 == 34 then "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" elseif p1 == 35 then "ACTION_TYPE_OPEN_GAME_INVITE" elseif p1 == 36 then "ACTION_TYPE_OPEN_EVENT_DETAILS" elseif p1 == 37 then "ACTION_TYPE_LAUNCH_EXPERIENCE" elseif p1 == 38 then "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" elseif p1 == 39 then "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" elseif p1 == 40 then "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" elseif p1 == 41 then "ACTION_TYPE_OPEN_PURCHASE_PROMPT" elseif p1 == 42 then "ACTION_TYPE_OPEN_SDUI_OVERLAY" elseif p1 == 43 then "ACTION_TYPE_OPEN_BADGES_SEE_ALL" elseif p1 == 44 then "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" elseif p1 == 45 then "ACTION_TYPE_DISMISS_GAME_FEEDBACK" elseif p1 == 46 then "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" elseif p1 == 47 then "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" elseif p1 == 48 then "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" elseif p1 == 49 then "ACTION_TYPE_OPEN_AMP_WIZARD" elseif p1 == 50 then "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" elseif p1 == 51 then "ACTION_TYPE_REFRESH_GAME_PASSES" elseif p1 == 52 then "ACTION_TYPE_REFRESH_PLAYABILITY" elseif p1 == 53 then "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" elseif p1 == 54 then "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" elseif p1 == 55 then "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" elseif p1 == 56 then "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" elseif p1 == 57 then "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" elseif p1 == 58 then "ACTION_TYPE_DISMISS_PROMPT" elseif p1 == 59 then "ACTION_TYPE_REQUEST_FRIENDSHIP" elseif p1 == 60 then "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" elseif p1 == 61 then "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" elseif p1 == 62 then "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" elseif p1 == 63 then "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" elseif p1 == 64 then "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" elseif p1 == 65 then "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" elseif p1 == 66 then "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" elseif p1 == 67 then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" elseif p1 == 68 then "ACTION_TYPE_DOWNLOAD_APP" else nil
	end,
	toNumber = function(p1)
		return if p1 == "ACTION_TYPE_INVALID" then 0 elseif p1 == "ACTION_TYPE_DISMISS_DIALOG" then 1 elseif p1 == "ACTION_TYPE_LINK" then 2 elseif p1 == "ACTION_TYPE_OPEN_GAME_DETAILS" then 3 elseif p1 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then 4 elseif p1 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then 5 elseif p1 == "ACTION_TYPE_OPEN_SEE_ALL" then 6 elseif p1 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then 7 elseif p1 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then 8 elseif p1 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then 9 elseif p1 == "ACTION_TYPE_OPEN_TOOLTIP" then 10 elseif p1 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then 11 elseif p1 == "ACTION_TYPE_LOAD_MORE_FROM_API" then 12 elseif p1 == "ACTION_TYPE_SHARE" then 13 elseif p1 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then 14 elseif p1 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then 15 elseif p1 == "ACTION_TYPE_OPEN_PROFILE" then 16 elseif p1 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then 17 elseif p1 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then 18 elseif p1 == "ACTION_TYPE_OPEN_MARKETPLACE" then 19 elseif p1 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then 20 elseif p1 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then 21 elseif p1 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then 22 elseif p1 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then 23 elseif p1 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then 24 elseif p1 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then 25 elseif p1 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then 26 elseif p1 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then 27 elseif p1 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then 28 elseif p1 == "ACTION_TYPE_OPEN_SONG_DETAIL" then 29 elseif p1 == "ACTION_TYPE_REFRESH_FROM_API" then 30 elseif p1 == "ACTION_TYPE_RSVP_TO_EVENT" then 31 elseif p1 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then 32 elseif p1 == "ACTION_TYPE_ANALYTICS_EVENT" then 33 elseif p1 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then 34 elseif p1 == "ACTION_TYPE_OPEN_GAME_INVITE" then 35 elseif p1 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then 36 elseif p1 == "ACTION_TYPE_LAUNCH_EXPERIENCE" then 37 elseif p1 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" then 38 elseif p1 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" then 39 elseif p1 == "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" then 40 elseif p1 == "ACTION_TYPE_OPEN_PURCHASE_PROMPT" then 41 elseif p1 == "ACTION_TYPE_OPEN_SDUI_OVERLAY" then 42 elseif p1 == "ACTION_TYPE_OPEN_BADGES_SEE_ALL" then 43 elseif p1 == "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" then 44 elseif p1 == "ACTION_TYPE_DISMISS_GAME_FEEDBACK" then 45 elseif p1 == "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" then 46 elseif p1 == "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" then 47 elseif p1 == "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" then 48 elseif p1 == "ACTION_TYPE_OPEN_AMP_WIZARD" then 49 elseif p1 == "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" then 50 elseif p1 == "ACTION_TYPE_REFRESH_GAME_PASSES" then 51 elseif p1 == "ACTION_TYPE_REFRESH_PLAYABILITY" then 52 elseif p1 == "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" then 53 elseif p1 == "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" then 54 elseif p1 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" then 55 elseif p1 == "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" then 56 elseif p1 == "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" then 57 elseif p1 == "ACTION_TYPE_DISMISS_PROMPT" then 58 elseif p1 == "ACTION_TYPE_REQUEST_FRIENDSHIP" then 59 elseif p1 == "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" then 60 elseif p1 == "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" then 61 elseif p1 == "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" then 62 elseif p1 == "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" then 63 elseif p1 == "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" then 64 elseif p1 == "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" then 65 elseif p1 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" then 66 elseif p1 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" then 67 elseif p1 == "ACTION_TYPE_DOWNLOAD_APP" then 68 else p1
	end,
	fromName = function(p1)
		return if p1 == "ACTION_TYPE_INVALID" then "ACTION_TYPE_INVALID" elseif p1 == "ACTION_TYPE_DISMISS_DIALOG" then "ACTION_TYPE_DISMISS_DIALOG" elseif p1 == "ACTION_TYPE_LINK" then "ACTION_TYPE_LINK" elseif p1 == "ACTION_TYPE_OPEN_GAME_DETAILS" then "ACTION_TYPE_OPEN_GAME_DETAILS" elseif p1 == "ACTION_TYPE_OPEN_JOIN_FRIENDS" then "ACTION_TYPE_OPEN_JOIN_FRIENDS" elseif p1 == "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" then "ACTION_TYPE_OPEN_MARKETPLACE_TRY_ON" elseif p1 == "ACTION_TYPE_OPEN_SEE_ALL" then "ACTION_TYPE_OPEN_SEE_ALL" elseif p1 == "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" then "ACTION_TYPE_OPEN_SPONSORED_TOOLTIP" elseif p1 == "ACTION_TYPE_PLAY_BUTTON_CLICK" then "ACTION_TYPE_PLAY_BUTTON_CLICK" elseif p1 == "ACTION_TYPE_UPDATE_USER_SETTINGS" then "ACTION_TYPE_UPDATE_USER_SETTINGS" elseif p1 == "ACTION_TYPE_OPEN_TOOLTIP" then "ACTION_TYPE_OPEN_TOOLTIP" elseif p1 == "ACTION_TYPE_OPEN_BADGE_DETAILS" then "ACTION_TYPE_OPEN_BADGE_DETAILS" elseif p1 == "ACTION_TYPE_LOAD_MORE_FROM_API" then "ACTION_TYPE_LOAD_MORE_FROM_API" elseif p1 == "ACTION_TYPE_SHARE" then "ACTION_TYPE_SHARE" elseif p1 == "ACTION_TYPE_OPEN_ABUSE_REPORT" then "ACTION_TYPE_OPEN_ABUSE_REPORT" elseif p1 == "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" then "ACTION_TYPE_REMOVE_BADGE_FROM_INVENTORY" elseif p1 == "ACTION_TYPE_OPEN_PROFILE" then "ACTION_TYPE_OPEN_PROFILE" elseif p1 == "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" then "ACTION_TYPE_OPEN_FACIAL_AGE_ESTIMATION" elseif p1 == "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" then "ACTION_TYPE_OPEN_ADD_CONNECTIONS_PAGE" elseif p1 == "ACTION_TYPE_OPEN_MARKETPLACE" then "ACTION_TYPE_OPEN_MARKETPLACE" elseif p1 == "ACTION_TYPE_HIDE_PROFILE_COMPLETION" then "ACTION_TYPE_HIDE_PROFILE_COMPLETION" elseif p1 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_CATEGORY" elseif p1 == "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_CATALOG_SUBCATEGORY" elseif p1 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_SEE_ALL" elseif p1 == "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" then "ACTION_TYPE_CLOSE_MARKETPLACE_CATEGORY_TOOLTIP" elseif p1 == "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" then "ACTION_TYPE_RESIZE_MARKETPLACE_CATALOG" elseif p1 == "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" then "ACTION_TYPE_OPEN_MARKETPLACE_CATALOG_FILTERS" elseif p1 == "ACTION_TYPE_OPEN_SOCIAL_LINK" then "ACTION_TYPE_OPEN_SOCIAL_LINK" elseif p1 == "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" then "ACTION_TYPE_OPEN_CHARTS_SORT_DETAIL" elseif p1 == "ACTION_TYPE_OPEN_SONG_DETAIL" then "ACTION_TYPE_OPEN_SONG_DETAIL" elseif p1 == "ACTION_TYPE_REFRESH_FROM_API" then "ACTION_TYPE_REFRESH_FROM_API" elseif p1 == "ACTION_TYPE_RSVP_TO_EVENT" then "ACTION_TYPE_RSVP_TO_EVENT" elseif p1 == "ACTION_TYPE_APPLY_CHARTS_FILTER" then "ACTION_TYPE_APPLY_CHARTS_FILTER" elseif p1 == "ACTION_TYPE_ANALYTICS_EVENT" then "ACTION_TYPE_ANALYTICS_EVENT" elseif p1 == "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" then "ACTION_TYPE_CUSTOM_ANALYTICS_EVENT" elseif p1 == "ACTION_TYPE_OPEN_GAME_INVITE" then "ACTION_TYPE_OPEN_GAME_INVITE" elseif p1 == "ACTION_TYPE_OPEN_EVENT_DETAILS" then "ACTION_TYPE_OPEN_EVENT_DETAILS" elseif p1 == "ACTION_TYPE_LAUNCH_EXPERIENCE" then "ACTION_TYPE_LAUNCH_EXPERIENCE" elseif p1 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" then "ACTION_TYPE_TOGGLE_EXPERIENCE_FAVORITE" elseif p1 == "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" then "ACTION_TYPE_TOGGLE_EXPERIENCE_FOLLOW" elseif p1 == "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" then "ACTION_TYPE_TOGGLE_EXPERIENCE_VOTE" elseif p1 == "ACTION_TYPE_OPEN_PURCHASE_PROMPT" then "ACTION_TYPE_OPEN_PURCHASE_PROMPT" elseif p1 == "ACTION_TYPE_OPEN_SDUI_OVERLAY" then "ACTION_TYPE_OPEN_SDUI_OVERLAY" elseif p1 == "ACTION_TYPE_OPEN_BADGES_SEE_ALL" then "ACTION_TYPE_OPEN_BADGES_SEE_ALL" elseif p1 == "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" then "ACTION_TYPE_OPEN_EXPERIENCE_STORE_SEE_ALL" elseif p1 == "ACTION_TYPE_DISMISS_GAME_FEEDBACK" then "ACTION_TYPE_DISMISS_GAME_FEEDBACK" elseif p1 == "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" then "ACTION_TYPE_OPEN_GAME_FEEDBACK_FORM" elseif p1 == "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" then "ACTION_TYPE_ENABLE_EVENT_NOTIFICATIONS" elseif p1 == "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" then "ACTION_TYPE_DISMISS_EVENT_NOTIFICATIONS_MODAL" elseif p1 == "ACTION_TYPE_OPEN_AMP_WIZARD" then "ACTION_TYPE_OPEN_AMP_WIZARD" elseif p1 == "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" then "ACTION_TYPE_OPEN_SUBSCRIPTION_PURCHASE_PAGE" elseif p1 == "ACTION_TYPE_REFRESH_GAME_PASSES" then "ACTION_TYPE_REFRESH_GAME_PASSES" elseif p1 == "ACTION_TYPE_REFRESH_PLAYABILITY" then "ACTION_TYPE_REFRESH_PLAYABILITY" elseif p1 == "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" then "ACTION_TYPE_OPEN_SOCIAL_PROOF_USER_LIST_SHEET" elseif p1 == "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" then "ACTION_TYPE_REPORT_SURFACE_LOAD_TIME_MILESTONE" elseif p1 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" then "ACTION_TYPE_OPEN_SEARCH_RESULTS_TAB" elseif p1 == "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" then "ACTION_TYPE_OPEN_PHONE_UPSELL_MODAL" elseif p1 == "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" then "ACTION_TYPE_OPEN_EMAIL_UPSELL_MODAL" elseif p1 == "ACTION_TYPE_DISMISS_PROMPT" then "ACTION_TYPE_DISMISS_PROMPT" elseif p1 == "ACTION_TYPE_REQUEST_FRIENDSHIP" then "ACTION_TYPE_REQUEST_FRIENDSHIP" elseif p1 == "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" then "ACTION_TYPE_REFRESH_DEVELOPER_PRODUCTS" elseif p1 == "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" then "ACTION_TYPE_OPEN_FAE_TRIAL_UPSELL" elseif p1 == "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" then "ACTION_TYPE_REFRESH_OMNI_RECOMMENDATION_FEED_ITEM" elseif p1 == "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" then "ACTION_TYPE_AI_OVERVIEW_FEEDBACK" elseif p1 == "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" then "ACTION_TYPE_OPEN_TRUSTED_FRIENDS_UPSELL_MODAL" elseif p1 == "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" then "ACTION_TYPE_RECORD_PARTY_CHAT_CONVERSATION_UPSELL_ACKNOWLEDGEMENT" elseif p1 == "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" then "ACTION_TYPE_OPEN_SEARCH_RESULTS_WITH_QUERY" elseif p1 == "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" then "ACTION_TYPE_SELECT_MARKETPLACE_FAVORITES_CATEGORY" elseif p1 == "ACTION_TYPE_DOWNLOAD_APP" then "ACTION_TYPE_DOWNLOAD_APP" else nil
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
	SelectMarketplaceFavoritesCategory = t.SelectMarketplaceFavoritesCategory,
	SelectMarketplaceFavoritesCategory_Params = t.SelectMarketplaceFavoritesCategory_Params,
	DownloadAppAction = t.DownloadAppAction,
	DownloadAppAction_Params = t.DownloadAppAction_Params,
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