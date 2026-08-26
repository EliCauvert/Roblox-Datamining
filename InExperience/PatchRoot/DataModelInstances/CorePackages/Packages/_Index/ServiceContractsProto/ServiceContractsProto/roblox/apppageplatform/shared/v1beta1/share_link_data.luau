local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local propTypesModule = require(script.Parent.prop_types)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil and self.kind.type == "literal" then
		local var2 = self.kind.value:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var17 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
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
					value = t.GenericShareLinkData_GenericShareLinkLiteralData.decode(var10)
				}
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
			error("Unsupported wire type: " .. var21)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.kind ~= nil and self.kind.type == "literal" then
		t.literal = self.kind.value:jsonEncode()
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref)
	local var18 = t_1.new()
	
	if self.literal ~= nil then
		var18.kind = {
			type = "literal",
			value = t.GenericShareLinkData_GenericShareLinkLiteralData.jsonDecode(self.literal)
		}
	end
	return var18
end

t_1.descriptor = {
	name = "GenericShareLinkData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GenericShareLinkData"
}
t.GenericShareLinkData = t_1
typeRegistryModule.default:register(t.GenericShareLinkData)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		url = if p2 == nil or p2.url == nil then nil else p2.url,
		share_url_context = if p2 == nil or p2.share_url_context == nil then nil else p2.share_url_context
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var18 = 0
	
	if self.url ~= nil then
		local var19 = self.url:encode()
		local var20, var21 = protoModule.writeTag(buff, var18, 1, protoModule.wireTypes.lengthDelimited)
		var20, var42 = protoModule.writeBuffer(var20, var21, var19, buffer.len(var19))
		buff = var20
		var18 = var21
	end
	if self.share_url_context ~= nil then
		local var22 = self.share_url_context:encode()
		local var23, var24 = protoModule.writeTag(buff, var18, 2, protoModule.wireTypes.lengthDelimited)
		var23, var45 = protoModule.writeBuffer(var23, var24, var22, buffer.len(var22))
		buff = var23
		var18 = var24
	end
	local buff_1 = buffer.create(var18)
	buffer.copy(buff_1, 0, buff, 0, var18)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), propTypesModule (ref)
	local var18 = t_2.new()
	local var19 = 0
	while var19 < buffer.len(p2) do
		local _ = nil
		local var20 = nil
		local var21, var22, var23 = protoModule.readTag(p2, var19)
		local var24 = var21
		var20 = var22
		var19 = var23
		
		if var20 == protoModule.wireTypes.varint then
			local _ = nil
			local var25, var26 = protoModule.readVarInt(p2, var19)
			local _ = var25
			var19 = var26
			continue
		end
		if var20 == protoModule.wireTypes.lengthDelimited then
			if var24 == 1 then
				local _ = nil
				local var27, var28 = protoModule.readBuffer(p2, var19)
				var19 = var28
				var18.url = propTypesModule.StringProp.decode(var27)
			elseif var24 == 2 then
				local _ = nil
				local var29, var30 = protoModule.readBuffer(p2, var19)
				var19 = var30
				var18.share_url_context = propTypesModule.StringProp.decode(var29)
			else
				local _ = nil
				local var31, var32 = protoModule.readVarInt(p2, var19)
				var19 = var32 + var31
			end
		elseif var20 == protoModule.wireTypes.i32 then
			local _ = nil
			local var33, var34 = protoModule.readFixed32(p2, var19)
			local _ = var33
			var19 = var34
		elseif var20 == protoModule.wireTypes.i64 then
			local _ = nil
			local var35, var36 = protoModule.readFixed64(p2, var19)
			local _ = var35
			var19 = var36
		else
			error("Unsupported wire type: " .. var49)
		end
	end
	return var18
end

function t_2:jsonEncode()
	local t = {}
	
	if self.url ~= nil then
		t.url = self.url:jsonEncode()
	end
	if self.share_url_context ~= nil then
		t.shareUrlContext = self.share_url_context:jsonEncode()
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), propTypesModule (ref)
	local var37 = t_2.new()
	
	if self.url ~= nil then
		var37.url = propTypesModule.StringProp.jsonDecode(self.url)
	end
	if self.share_url_context ~= nil then
		var37.share_url_context = propTypesModule.StringProp.jsonDecode(self.share_url_context)
	end
	if self.shareUrlContext ~= nil then
		var37.share_url_context = propTypesModule.StringProp.jsonDecode(self.shareUrlContext)
	end
	return var37
end

t_2.descriptor = {
	name = "GenericShareLinkData_GenericShareLinkLiteralData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GenericShareLinkLiteralData"
}
t.GenericShareLinkData_GenericShareLinkLiteralData = t_2
typeRegistryModule.default:register(t.GenericShareLinkData_GenericShareLinkLiteralData)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		kind = if p3 == nil or p3.kind == nil then nil else p3.kind
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var37 = 0
	
	if self.kind ~= nil and self.kind.type == "literal" then
		local var38 = self.kind.value:encode()
		local var39, var40 = protoModule.writeTag(buff, var37, 1, protoModule.wireTypes.lengthDelimited)
		var39, var72 = protoModule.writeBuffer(var39, var40, var38, buffer.len(var38))
		buff = var39
		var37 = var40
	end
	local buff_1 = buffer.create(var37)
	buffer.copy(buff_1, 0, buff, 0, var37)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var37 = t_3.new()
	local var38 = 0
	while var38 < buffer.len(p3) do
		local _ = nil
		local var39 = nil
		local var40, var41, var42 = protoModule.readTag(p3, var38)
		local var43 = var40
		var39 = var41
		var38 = var42
		
		if var39 == protoModule.wireTypes.varint then
			local _ = nil
			local var44, var45 = protoModule.readVarInt(p3, var38)
			local _ = var44
			var38 = var45
			continue
		end
		if var39 == protoModule.wireTypes.lengthDelimited then
			if var43 == 1 then
				local _ = nil
				local var46, var47 = protoModule.readBuffer(p3, var38)
				var38 = var47
				var37.kind = {
					type = "literal",
					value = t.ShareLinkFetchData_ShareLinkFetchLiteralData.decode(var46)
				}
			else
				local _ = nil
				local var48, var49 = protoModule.readVarInt(p3, var38)
				var38 = var49 + var48
			end
		elseif var39 == protoModule.wireTypes.i32 then
			local _ = nil
			local var50, var51 = protoModule.readFixed32(p3, var38)
			local _ = var50
			var38 = var51
		elseif var39 == protoModule.wireTypes.i64 then
			local _ = nil
			local var52, var53 = protoModule.readFixed64(p3, var38)
			local _ = var52
			var38 = var53
		else
			error("Unsupported wire type: " .. var76)
		end
	end
	return var37
end

function t_3:jsonEncode()
	local t = {}
	
	if self.kind ~= nil and self.kind.type == "literal" then
		t.literal = self.kind.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), t (ref)
	local var54 = t_3.new()
	
	if self.literal ~= nil then
		var54.kind = {
			type = "literal",
			value = t.ShareLinkFetchData_ShareLinkFetchLiteralData.jsonDecode(self.literal)
		}
	end
	return var54
end

t_3.descriptor = {
	name = "ShareLinkFetchData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkFetchData"
}
t.ShareLinkFetchData = t_3
typeRegistryModule.default:register(t.ShareLinkFetchData)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		share_url_context = if p4 == nil or p4.share_url_context == nil then nil else p4.share_url_context,
		link_type = if p4 == nil or p4.link_type == nil then nil else p4.link_type,
		link_data = if p4 == nil or p4.link_data == nil then nil else p4.link_data
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var54 = 0
	
	if self.share_url_context ~= nil then
		local var55 = self.share_url_context:encode()
		local var56, var57 = protoModule.writeTag(buff, var54, 1, protoModule.wireTypes.lengthDelimited)
		var56, var97 = protoModule.writeBuffer(var56, var57, var55, buffer.len(var55))
		buff = var56
		var54 = var57
	end
	if self.link_type ~= nil then
		local var58 = self.link_type:encode()
		local var59, var60 = protoModule.writeTag(buff, var54, 2, protoModule.wireTypes.lengthDelimited)
		var59, var100 = protoModule.writeBuffer(var59, var60, var58, buffer.len(var58))
		buff = var59
		var54 = var60
	end
	if self.link_data ~= nil then
		local var61 = self.link_data:encode()
		local var62, var63 = protoModule.writeTag(buff, var54, 3, protoModule.wireTypes.lengthDelimited)
		var62, var103 = protoModule.writeBuffer(var62, var63, var61, buffer.len(var61))
		buff = var62
		var54 = var63
	end
	local buff_1 = buffer.create(var54)
	buffer.copy(buff_1, 0, buff, 0, var54)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var54 = t_4.new()
	local var55 = 0
	while var55 < buffer.len(p4) do
		local _ = nil
		local var56 = nil
		local var57, var58, var59 = protoModule.readTag(p4, var55)
		local var60 = var57
		var56 = var58
		var55 = var59
		
		if var56 == protoModule.wireTypes.varint then
			local _ = nil
			local var61, var62 = protoModule.readVarInt(p4, var55)
			local _ = var61
			var55 = var62
			continue
		end
		if var56 == protoModule.wireTypes.lengthDelimited then
			if var60 == 1 then
				local _ = nil
				local var63, var64 = protoModule.readBuffer(p4, var55)
				var55 = var64
				var54.share_url_context = propTypesModule.StringProp.decode(var63)
			elseif var60 == 2 then
				local _ = nil
				local var65, var66 = protoModule.readBuffer(p4, var55)
				var55 = var66
				var54.link_type = propTypesModule.StringProp.decode(var65)
			elseif var60 == 3 then
				local _ = nil
				local var67, var68 = protoModule.readBuffer(p4, var55)
				var55 = var68
				var54.link_data = t.ShareLinkPayload.decode(var67)
			else
				local _ = nil
				local var69, var70 = protoModule.readVarInt(p4, var55)
				var55 = var70 + var69
			end
		elseif var56 == protoModule.wireTypes.i32 then
			local _ = nil
			local var71, var72 = protoModule.readFixed32(p4, var55)
			local _ = var71
			var55 = var72
		elseif var56 == protoModule.wireTypes.i64 then
			local _ = nil
			local var73, var74 = protoModule.readFixed64(p4, var55)
			local _ = var73
			var55 = var74
		else
			error("Unsupported wire type: " .. var107)
		end
	end
	return var54
end

function t_4:jsonEncode()
	local t = {}
	
	if self.share_url_context ~= nil then
		t.shareUrlContext = self.share_url_context:jsonEncode()
	end
	if self.link_type ~= nil then
		t.linkType = self.link_type:jsonEncode()
	end
	if self.link_data ~= nil then
		t.linkData = self.link_data:jsonEncode()
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), propTypesModule (ref), t (ref)
	local var75 = t_4.new()
	
	if self.share_url_context ~= nil then
		var75.share_url_context = propTypesModule.StringProp.jsonDecode(self.share_url_context)
	end
	if self.shareUrlContext ~= nil then
		var75.share_url_context = propTypesModule.StringProp.jsonDecode(self.shareUrlContext)
	end
	if self.link_type ~= nil then
		var75.link_type = propTypesModule.StringProp.jsonDecode(self.link_type)
	end
	if self.linkType ~= nil then
		var75.link_type = propTypesModule.StringProp.jsonDecode(self.linkType)
	end
	if self.link_data ~= nil then
		var75.link_data = t.ShareLinkPayload.jsonDecode(self.link_data)
	end
	if self.linkData ~= nil then
		var75.link_data = t.ShareLinkPayload.jsonDecode(self.linkData)
	end
	return var75
end

t_4.descriptor = {
	name = "ShareLinkFetchData_ShareLinkFetchLiteralData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkFetchLiteralData"
}
t.ShareLinkFetchData_ShareLinkFetchLiteralData = t_4
typeRegistryModule.default:register(t.ShareLinkFetchData_ShareLinkFetchLiteralData)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		oneof_prop = if p5 == nil or p5.oneof_prop == nil then nil else p5.oneof_prop
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var75 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "experience_share_link_payload" then
			local var76 = self.oneof_prop.value:encode()
			local var77, var78 = protoModule.writeTag(buff, var75, 1, protoModule.wireTypes.lengthDelimited)
			var77, var132 = protoModule.writeBuffer(var77, var78, var76, buffer.len(var76))
			buff = var77
			var75 = var78
		elseif self.oneof_prop.type == "event_share_link_payload" then
			local var79 = self.oneof_prop.value:encode()
			local var80, var81 = protoModule.writeTag(buff, var75, 2, protoModule.wireTypes.lengthDelimited)
			var80, var135 = protoModule.writeBuffer(var80, var81, var79, buffer.len(var79))
			buff = var80
			var75 = var81
		end
	end
	local buff_1 = buffer.create(var75)
	buffer.copy(buff_1, 0, buff, 0, var75)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var75 = t_5.new()
	local var76 = 0
	while var76 < buffer.len(p5) do
		local _ = nil
		local var77 = nil
		local var78, var79, var80 = protoModule.readTag(p5, var76)
		local var81 = var78
		var77 = var79
		var76 = var80
		
		if var77 == protoModule.wireTypes.varint then
			local _ = nil
			local var82, var83 = protoModule.readVarInt(p5, var76)
			local _ = var82
			var76 = var83
			continue
		end
		if var77 == protoModule.wireTypes.lengthDelimited then
			if var81 == 1 then
				local _ = nil
				local var84, var85 = protoModule.readBuffer(p5, var76)
				var76 = var85
				var75.oneof_prop = {
					type = "experience_share_link_payload",
					value = t.ExperienceShareLinkPayload.decode(var84)
				}
			elseif var81 == 2 then
				local _ = nil
				local var86, var87 = protoModule.readBuffer(p5, var76)
				var76 = var87
				var75.oneof_prop = {
					type = "event_share_link_payload",
					value = t.EventShareLinkPayload.decode(var86)
				}
			else
				local _ = nil
				local var88, var89 = protoModule.readVarInt(p5, var76)
				var76 = var89 + var88
			end
		elseif var77 == protoModule.wireTypes.i32 then
			local _ = nil
			local var90, var91 = protoModule.readFixed32(p5, var76)
			local _ = var90
			var76 = var91
		elseif var77 == protoModule.wireTypes.i64 then
			local _ = nil
			local var92, var93 = protoModule.readFixed64(p5, var76)
			local _ = var92
			var76 = var93
		else
			error("Unsupported wire type: " .. var139)
		end
	end
	return var75
end

function t_5:jsonEncode()
	local t = {}
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "experience_share_link_payload" then
			t.experienceShareLinkPayload = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "event_share_link_payload" then
			t.eventShareLinkPayload = self.oneof_prop.value:jsonEncode()
		end
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), t (ref)
	local var94 = t_5.new()
	
	if self.experience_share_link_payload ~= nil then
		var94.oneof_prop = {
			type = "experience_share_link_payload",
			value = t.ExperienceShareLinkPayload.jsonDecode(self.experience_share_link_payload)
		}
	end
	if self.experienceShareLinkPayload ~= nil then
		var94.oneof_prop = {
			type = "experience_share_link_payload",
			value = t.ExperienceShareLinkPayload.jsonDecode(self.experienceShareLinkPayload)
		}
	end
	if self.event_share_link_payload ~= nil then
		var94.oneof_prop = {
			type = "event_share_link_payload",
			value = t.EventShareLinkPayload.jsonDecode(self.event_share_link_payload)
		}
	end
	if self.eventShareLinkPayload ~= nil then
		var94.oneof_prop = {
			type = "event_share_link_payload",
			value = t.EventShareLinkPayload.jsonDecode(self.eventShareLinkPayload)
		}
	end
	return var94
end

t_5.descriptor = {
	name = "ShareLinkPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkPayload"
}
t.ShareLinkPayload = t_5
typeRegistryModule.default:register(t.ShareLinkPayload)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		kind = if p6 == nil or p6.kind == nil then nil else p6.kind
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var94 = 0
	
	if self.kind ~= nil and self.kind.type == "literal" then
		local var95 = self.kind.value:encode()
		local var96, var97 = protoModule.writeTag(buff, var94, 1, protoModule.wireTypes.lengthDelimited)
		var96, var162 = protoModule.writeBuffer(var96, var97, var95, buffer.len(var95))
		buff = var96
		var94 = var97
	end
	local buff_1 = buffer.create(var94)
	buffer.copy(buff_1, 0, buff, 0, var94)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var94 = t_6.new()
	local var95 = 0
	while var95 < buffer.len(p6) do
		local _ = nil
		local var96 = nil
		local var97, var98, var99 = protoModule.readTag(p6, var95)
		local var100 = var97
		var96 = var98
		var95 = var99
		
		if var96 == protoModule.wireTypes.varint then
			local _ = nil
			local var101, var102 = protoModule.readVarInt(p6, var95)
			local _ = var101
			var95 = var102
			continue
		end
		if var96 == protoModule.wireTypes.lengthDelimited then
			if var100 == 1 then
				local _ = nil
				local var103, var104 = protoModule.readBuffer(p6, var95)
				var95 = var104
				var94.kind = {
					type = "literal",
					value = t.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload.decode(var103)
				}
			else
				local _ = nil
				local var105, var106 = protoModule.readVarInt(p6, var95)
				var95 = var106 + var105
			end
		elseif var96 == protoModule.wireTypes.i32 then
			local _ = nil
			local var107, var108 = protoModule.readFixed32(p6, var95)
			local _ = var107
			var95 = var108
		elseif var96 == protoModule.wireTypes.i64 then
			local _ = nil
			local var109, var110 = protoModule.readFixed64(p6, var95)
			local _ = var109
			var95 = var110
		else
			error("Unsupported wire type: " .. var166)
		end
	end
	return var94
end

function t_6:jsonEncode()
	local t = {}
	
	if self.kind ~= nil and self.kind.type == "literal" then
		t.literal = self.kind.value:jsonEncode()
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), t (ref)
	local var111 = t_6.new()
	
	if self.literal ~= nil then
		var111.kind = {
			type = "literal",
			value = t.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload.jsonDecode(self.literal)
		}
	end
	return var111
end

t_6.descriptor = {
	name = "ExperienceShareLinkPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceShareLinkPayload"
}
t.ExperienceShareLinkPayload = t_6
typeRegistryModule.default:register(t.ExperienceShareLinkPayload)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		universe_id = if p7 == nil or p7.universe_id == nil then nil else p7.universe_id
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var111 = 0
	
	if self.universe_id ~= nil then
		local var112 = self.universe_id:encode()
		local var113, var114 = protoModule.writeTag(buff, var111, 1, protoModule.wireTypes.lengthDelimited)
		var113, var187 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
		buff = var113
		var111 = var114
	end
	local buff_1 = buffer.create(var111)
	buffer.copy(buff_1, 0, buff, 0, var111)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref), propTypesModule (ref)
	local var111 = t_7.new()
	local var112 = 0
	while var112 < buffer.len(p7) do
		local _ = nil
		local var113 = nil
		local var114, var115, var116 = protoModule.readTag(p7, var112)
		local var117 = var114
		var113 = var115
		var112 = var116
		
		if var113 == protoModule.wireTypes.varint then
			local _ = nil
			local var118, var119 = protoModule.readVarInt(p7, var112)
			local _ = var118
			var112 = var119
			continue
		end
		if var113 == protoModule.wireTypes.lengthDelimited then
			if var117 == 1 then
				local _ = nil
				local var120, var121 = protoModule.readBuffer(p7, var112)
				var112 = var121
				var111.universe_id = propTypesModule.StringProp.decode(var120)
			else
				local _ = nil
				local var122, var123 = protoModule.readVarInt(p7, var112)
				var112 = var123 + var122
			end
		elseif var113 == protoModule.wireTypes.i32 then
			local _ = nil
			local var124, var125 = protoModule.readFixed32(p7, var112)
			local _ = var124
			var112 = var125
		elseif var113 == protoModule.wireTypes.i64 then
			local _ = nil
			local var126, var127 = protoModule.readFixed64(p7, var112)
			local _ = var126
			var112 = var127
		else
			error("Unsupported wire type: " .. var191)
		end
	end
	return var111
end

function t_7:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref), propTypesModule (ref)
	local var128 = t_7.new()
	
	if self.universe_id ~= nil then
		var128.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var128.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var128
end

t_7.descriptor = {
	name = "ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceShareLinkLiteralPayload"
}
t.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload = t_7
typeRegistryModule.default:register(t.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t_8 (ref)
	return setmetatable({
		kind = if p8 == nil or p8.kind == nil then nil else p8.kind
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var128 = 0
	
	if self.kind ~= nil and self.kind.type == "literal" then
		local var129 = self.kind.value:encode()
		local var130, var131 = protoModule.writeTag(buff, var128, 1, protoModule.wireTypes.lengthDelimited)
		var130, var212 = protoModule.writeBuffer(var130, var131, var129, buffer.len(var129))
		buff = var130
		var128 = var131
	end
	local buff_1 = buffer.create(var128)
	buffer.copy(buff_1, 0, buff, 0, var128)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var128 = t_8.new()
	local var129 = 0
	while var129 < buffer.len(p8) do
		local _ = nil
		local var130 = nil
		local var131, var132, var133 = protoModule.readTag(p8, var129)
		local var134 = var131
		var130 = var132
		var129 = var133
		
		if var130 == protoModule.wireTypes.varint then
			local _ = nil
			local var135, var136 = protoModule.readVarInt(p8, var129)
			local _ = var135
			var129 = var136
			continue
		end
		if var130 == protoModule.wireTypes.lengthDelimited then
			if var134 == 1 then
				local _ = nil
				local var137, var138 = protoModule.readBuffer(p8, var129)
				var129 = var138
				var128.kind = {
					type = "literal",
					value = t.EventShareLinkPayload_EventShareLinkLiteralPayload.decode(var137)
				}
			else
				local _ = nil
				local var139, var140 = protoModule.readVarInt(p8, var129)
				var129 = var140 + var139
			end
		elseif var130 == protoModule.wireTypes.i32 then
			local _ = nil
			local var141, var142 = protoModule.readFixed32(p8, var129)
			local _ = var141
			var129 = var142
		elseif var130 == protoModule.wireTypes.i64 then
			local _ = nil
			local var143, var144 = protoModule.readFixed64(p8, var129)
			local _ = var143
			var129 = var144
		else
			error("Unsupported wire type: " .. var216)
		end
	end
	return var128
end

function t_8:jsonEncode()
	local t = {}
	
	if self.kind ~= nil and self.kind.type == "literal" then
		t.literal = self.kind.value:jsonEncode()
	end
	return t
end

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), t (ref)
	local var145 = t_8.new()
	
	if self.literal ~= nil then
		var145.kind = {
			type = "literal",
			value = t.EventShareLinkPayload_EventShareLinkLiteralPayload.jsonDecode(self.literal)
		}
	end
	return var145
end

t_8.descriptor = {
	name = "EventShareLinkPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventShareLinkPayload"
}
t.EventShareLinkPayload = t_8
typeRegistryModule.default:register(t.EventShareLinkPayload)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p9)
	-- upvalues: t_9 (ref)
	return setmetatable({
		event_id = if p9 == nil or p9.event_id == nil then nil else p9.event_id
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var145 = 0
	
	if self.event_id ~= nil then
		local var146 = self.event_id:encode()
		local var147, var148 = protoModule.writeTag(buff, var145, 1, protoModule.wireTypes.lengthDelimited)
		var147, var237 = protoModule.writeBuffer(var147, var148, var146, buffer.len(var146))
		buff = var147
		var145 = var148
	end
	local buff_1 = buffer.create(var145)
	buffer.copy(buff_1, 0, buff, 0, var145)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), propTypesModule (ref)
	local var145 = t_9.new()
	local var146 = 0
	while var146 < buffer.len(p9) do
		local _ = nil
		local var147 = nil
		local var148, var149, var150 = protoModule.readTag(p9, var146)
		local var151 = var148
		var147 = var149
		var146 = var150
		
		if var147 == protoModule.wireTypes.varint then
			local _ = nil
			local var152, var153 = protoModule.readVarInt(p9, var146)
			local _ = var152
			var146 = var153
			continue
		end
		if var147 == protoModule.wireTypes.lengthDelimited then
			if var151 == 1 then
				local _ = nil
				local var154, var155 = protoModule.readBuffer(p9, var146)
				var146 = var155
				var145.event_id = propTypesModule.StringProp.decode(var154)
			else
				local _ = nil
				local var156, var157 = protoModule.readVarInt(p9, var146)
				var146 = var157 + var156
			end
		elseif var147 == protoModule.wireTypes.i32 then
			local _ = nil
			local var158, var159 = protoModule.readFixed32(p9, var146)
			local _ = var158
			var146 = var159
		elseif var147 == protoModule.wireTypes.i64 then
			local _ = nil
			local var160, var161 = protoModule.readFixed64(p9, var146)
			local _ = var160
			var146 = var161
		else
			error("Unsupported wire type: " .. var241)
		end
	end
	return var145
end

function t_9:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_9:jsonDecode()
	-- upvalues: t_9 (ref), propTypesModule (ref)
	local var162 = t_9.new()
	
	if self.event_id ~= nil then
		var162.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var162.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var162
end

t_9.descriptor = {
	name = "EventShareLinkPayload_EventShareLinkLiteralPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventShareLinkLiteralPayload"
}
t.EventShareLinkPayload_EventShareLinkLiteralPayload = t_9
typeRegistryModule.default:register(t.EventShareLinkPayload_EventShareLinkLiteralPayload)

return {
	GenericShareLinkData = t.GenericShareLinkData,
	GenericShareLinkData_GenericShareLinkLiteralData = t.GenericShareLinkData_GenericShareLinkLiteralData,
	ShareLinkFetchData = t.ShareLinkFetchData,
	ShareLinkFetchData_ShareLinkFetchLiteralData = t.ShareLinkFetchData_ShareLinkFetchLiteralData,
	ShareLinkPayload = t.ShareLinkPayload,
	ExperienceShareLinkPayload = t.ExperienceShareLinkPayload,
	ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload = t.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload,
	EventShareLinkPayload = t.EventShareLinkPayload,
	EventShareLinkPayload_EventShareLinkLiteralPayload = t.EventShareLinkPayload_EventShareLinkLiteralPayload
}