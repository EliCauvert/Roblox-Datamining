local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local propTypesModule = require(script.Parent.prop_types)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 274 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		kind = if p0 == nil or p0.kind == nil then nil else p0.kind
	}, t_1)
end

function t_1:encode() --[[ line: 280 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var14 = 0
	
	if self.kind ~= nil and self.kind.type == "literal" then
		local var15 = self.kind.value:encode()
		local var16, var17 = protoModule.writeTag(buff, var14, 1, protoModule.wireTypes.lengthDelimited)
		var16, var17 = protoModule.writeBuffer(var16, var17, var15, buffer.len(var15))
		buff = var16
		var14 = var17
	end
	local buff_1 = buffer.create(var14)
	buffer.copy(buff_1, 0, buff, 0, var14)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 297 ]]
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var19 = t_1.new()
	local var20 = 0
	while var20 < buffer.len(p1) do
		local _ = nil
		local var21 = nil
		local var22, var23, var24 = protoModule.readTag(p1, var20)
		local var25 = var22
		var21 = var23
		var20 = var24
		
		if var21 == protoModule.wireTypes.varint then
			local _ = nil
			local var26, var27 = protoModule.readVarInt(p1, var20)
			local _ = var26
			var20 = var27
			continue
		end
		if var21 == protoModule.wireTypes.lengthDelimited then
			if var25 == 1 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var20)
				var20 = var29
				var19.kind = {
					type = "literal",
					value = t.GenericShareLinkData_GenericShareLinkLiteralData.decode(var28)
				}
			else
				local _ = nil
				local var30, var31 = protoModule.readVarInt(p1, var20)
				var20 = var31 + var30
			end
		elseif var21 == protoModule.wireTypes.i32 then
			local _ = nil
			local var32, var33 = protoModule.readFixed32(p1, var20)
			local _ = var32
			var20 = var33
		elseif var21 == protoModule.wireTypes.i64 then
			local _ = nil
			local var34, var35 = protoModule.readFixed64(p1, var20)
			local _ = var34
			var20 = var35
		else
			error("Unsupported wire type: " .. var21)
		end
	end
	return var19
end

function t_1:jsonEncode() --[[ line: 343 ]]
	local t = {}
	
	if self.kind ~= nil and self.kind.type == "literal" then
		t.literal = self.kind.value:jsonEncode()
	end
	return t
end

function t_1:jsonDecode() --[[ line: 355 ]]
	-- upvalues: t_1 (ref), t (ref)
	local var37 = t_1.new()
	
	if self.literal ~= nil then
		var37.kind = {
			type = "literal",
			value = t.GenericShareLinkData_GenericShareLinkLiteralData.jsonDecode(self.literal)
		}
	end
	return var37
end

t_1.descriptor = {
	name = "GenericShareLinkData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GenericShareLinkData"
}
t.GenericShareLinkData = t_1
typeRegistryModule.default:register(t.GenericShareLinkData)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 383 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		url = if p2 == nil or p2.url == nil then nil else p2.url,
		share_url_context = if p2 == nil or p2.share_url_context == nil then nil else p2.share_url_context
	}, t_2)
end

function t_2:encode() --[[ line: 397 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var39 = 0
	
	if self.url ~= nil then
		local var40 = self.url:encode()
		local var41, var42 = protoModule.writeTag(buff, var39, 1, protoModule.wireTypes.lengthDelimited)
		var41, var42 = protoModule.writeBuffer(var41, var42, var40, buffer.len(var40))
		buff = var41
		var39 = var42
	end
	if self.share_url_context ~= nil then
		local var43 = self.share_url_context:encode()
		local var44, var45 = protoModule.writeTag(buff, var39, 2, protoModule.wireTypes.lengthDelimited)
		var44, var45 = protoModule.writeBuffer(var44, var45, var43, buffer.len(var43))
		buff = var44
		var39 = var45
	end
	local buff_1 = buffer.create(var39)
	buffer.copy(buff_1, 0, buff, 0, var39)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 420 ]]
	-- upvalues: t_2 (ref), protoModule (ref), propTypesModule (ref)
	local var47 = t_2.new()
	local var48 = 0
	while var48 < buffer.len(p3) do
		local _ = nil
		local var49 = nil
		local var50, var51, var52 = protoModule.readTag(p3, var48)
		local var53 = var50
		var49 = var51
		var48 = var52
		
		if var49 == protoModule.wireTypes.varint then
			local _ = nil
			local var54, var55 = protoModule.readVarInt(p3, var48)
			local _ = var54
			var48 = var55
			continue
		end
		if var49 == protoModule.wireTypes.lengthDelimited then
			if var53 == 1 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p3, var48)
				var48 = var57
				var47.url = propTypesModule.StringProp.decode(var56)
			elseif var53 == 2 then
				local _ = nil
				local var58, var59 = protoModule.readBuffer(p3, var48)
				var48 = var59
				var47.share_url_context = propTypesModule.StringProp.decode(var58)
			else
				local _ = nil
				local var60, var61 = protoModule.readVarInt(p3, var48)
				var48 = var61 + var60
			end
		elseif var49 == protoModule.wireTypes.i32 then
			local _ = nil
			local var62, var63 = protoModule.readFixed32(p3, var48)
			local _ = var62
			var48 = var63
		elseif var49 == protoModule.wireTypes.i64 then
			local _ = nil
			local var64, var65 = protoModule.readFixed64(p3, var48)
			local _ = var64
			var48 = var65
		else
			error("Unsupported wire type: " .. var49)
		end
	end
	return var47
end

function t_2:jsonEncode() --[[ line: 470 ]]
	local t = {}
	
	if self.url ~= nil then
		t.url = self.url:jsonEncode()
	end
	if self.share_url_context ~= nil then
		t.shareUrlContext = self.share_url_context:jsonEncode()
	end
	return t
end

function t_2:jsonDecode() --[[ line: 486 ]]
	-- upvalues: t_2 (ref), propTypesModule (ref)
	local var67 = t_2.new()
	
	if self.url ~= nil then
		var67.url = propTypesModule.StringProp.jsonDecode(self.url)
	end
	if self.share_url_context ~= nil then
		var67.share_url_context = propTypesModule.StringProp.jsonDecode(self.share_url_context)
	end
	if self.shareUrlContext ~= nil then
		var67.share_url_context = propTypesModule.StringProp.jsonDecode(self.shareUrlContext)
	end
	return var67
end

t_2.descriptor = {
	name = "GenericShareLinkData_GenericShareLinkLiteralData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GenericShareLinkLiteralData"
}
t.GenericShareLinkData_GenericShareLinkLiteralData = t_2
typeRegistryModule.default:register(t.GenericShareLinkData_GenericShareLinkLiteralData)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 523 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		kind = if p4 == nil or p4.kind == nil then nil else p4.kind
	}, t_3)
end

function t_3:encode() --[[ line: 529 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var69 = 0
	
	if self.kind ~= nil and self.kind.type == "literal" then
		local var70 = self.kind.value:encode()
		local var71, var72 = protoModule.writeTag(buff, var69, 1, protoModule.wireTypes.lengthDelimited)
		var71, var72 = protoModule.writeBuffer(var71, var72, var70, buffer.len(var70))
		buff = var71
		var69 = var72
	end
	local buff_1 = buffer.create(var69)
	buffer.copy(buff_1, 0, buff, 0, var69)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 546 ]]
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var74 = t_3.new()
	local var75 = 0
	while var75 < buffer.len(p5) do
		local _ = nil
		local var76 = nil
		local var77, var78, var79 = protoModule.readTag(p5, var75)
		local var80 = var77
		var76 = var78
		var75 = var79
		
		if var76 == protoModule.wireTypes.varint then
			local _ = nil
			local var81, var82 = protoModule.readVarInt(p5, var75)
			local _ = var81
			var75 = var82
			continue
		end
		if var76 == protoModule.wireTypes.lengthDelimited then
			if var80 == 1 then
				local _ = nil
				local var83, var84 = protoModule.readBuffer(p5, var75)
				var75 = var84
				var74.kind = {
					type = "literal",
					value = t.ShareLinkFetchData_ShareLinkFetchLiteralData.decode(var83)
				}
			else
				local _ = nil
				local var85, var86 = protoModule.readVarInt(p5, var75)
				var75 = var86 + var85
			end
		elseif var76 == protoModule.wireTypes.i32 then
			local _ = nil
			local var87, var88 = protoModule.readFixed32(p5, var75)
			local _ = var87
			var75 = var88
		elseif var76 == protoModule.wireTypes.i64 then
			local _ = nil
			local var89, var90 = protoModule.readFixed64(p5, var75)
			local _ = var89
			var75 = var90
		else
			error("Unsupported wire type: " .. var76)
		end
	end
	return var74
end

function t_3:jsonEncode() --[[ line: 592 ]]
	local t = {}
	
	if self.kind ~= nil and self.kind.type == "literal" then
		t.literal = self.kind.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode() --[[ line: 604 ]]
	-- upvalues: t_3 (ref), t (ref)
	local var92 = t_3.new()
	
	if self.literal ~= nil then
		var92.kind = {
			type = "literal",
			value = t.ShareLinkFetchData_ShareLinkFetchLiteralData.jsonDecode(self.literal)
		}
	end
	return var92
end

t_3.descriptor = {
	name = "ShareLinkFetchData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkFetchData"
}
t.ShareLinkFetchData = t_3
typeRegistryModule.default:register(t.ShareLinkFetchData)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 631 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		share_url_context = if p6 == nil or p6.share_url_context == nil then nil else p6.share_url_context,
		link_type = if p6 == nil or p6.link_type == nil then nil else p6.link_type,
		link_data = if p6 == nil or p6.link_data == nil then nil else p6.link_data
	}, t_4)
end

function t_4:encode() --[[ line: 641 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var94 = 0
	
	if self.share_url_context ~= nil then
		local var95 = self.share_url_context:encode()
		local var96, var97 = protoModule.writeTag(buff, var94, 1, protoModule.wireTypes.lengthDelimited)
		var96, var97 = protoModule.writeBuffer(var96, var97, var95, buffer.len(var95))
		buff = var96
		var94 = var97
	end
	if self.link_type ~= nil then
		local var98 = self.link_type:encode()
		local var99, var100 = protoModule.writeTag(buff, var94, 2, protoModule.wireTypes.lengthDelimited)
		var99, var100 = protoModule.writeBuffer(var99, var100, var98, buffer.len(var98))
		buff = var99
		var94 = var100
	end
	if self.link_data ~= nil then
		local var101 = self.link_data:encode()
		local var102, var103 = protoModule.writeTag(buff, var94, 3, protoModule.wireTypes.lengthDelimited)
		var102, var103 = protoModule.writeBuffer(var102, var103, var101, buffer.len(var101))
		buff = var102
		var94 = var103
	end
	local buff_1 = buffer.create(var94)
	buffer.copy(buff_1, 0, buff, 0, var94)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 670 ]]
	-- upvalues: t_4 (ref), protoModule (ref), propTypesModule (ref), t (ref)
	local var105 = t_4.new()
	local var106 = 0
	while var106 < buffer.len(p7) do
		local _ = nil
		local var107 = nil
		local var108, var109, var110 = protoModule.readTag(p7, var106)
		local var111 = var108
		var107 = var109
		var106 = var110
		
		if var107 == protoModule.wireTypes.varint then
			local _ = nil
			local var112, var113 = protoModule.readVarInt(p7, var106)
			local _ = var112
			var106 = var113
			continue
		end
		if var107 == protoModule.wireTypes.lengthDelimited then
			if var111 == 1 then
				local _ = nil
				local var114, var115 = protoModule.readBuffer(p7, var106)
				var106 = var115
				var105.share_url_context = propTypesModule.StringProp.decode(var114)
			elseif var111 == 2 then
				local _ = nil
				local var116, var117 = protoModule.readBuffer(p7, var106)
				var106 = var117
				var105.link_type = propTypesModule.StringProp.decode(var116)
			elseif var111 == 3 then
				local _ = nil
				local var118, var119 = protoModule.readBuffer(p7, var106)
				var106 = var119
				var105.link_data = t.ShareLinkPayload.decode(var118)
			else
				local _ = nil
				local var120, var121 = protoModule.readVarInt(p7, var106)
				var106 = var121 + var120
			end
		elseif var107 == protoModule.wireTypes.i32 then
			local _ = nil
			local var122, var123 = protoModule.readFixed32(p7, var106)
			local _ = var122
			var106 = var123
		elseif var107 == protoModule.wireTypes.i64 then
			local _ = nil
			local var124, var125 = protoModule.readFixed64(p7, var106)
			local _ = var124
			var106 = var125
		else
			error("Unsupported wire type: " .. var107)
		end
	end
	return var105
end

function t_4:jsonEncode() --[[ line: 725 ]]
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

function t_4:jsonDecode() --[[ line: 745 ]]
	-- upvalues: t_4 (ref), propTypesModule (ref), t (ref)
	local var127 = t_4.new()
	
	if self.share_url_context ~= nil then
		var127.share_url_context = propTypesModule.StringProp.jsonDecode(self.share_url_context)
	end
	if self.shareUrlContext ~= nil then
		var127.share_url_context = propTypesModule.StringProp.jsonDecode(self.shareUrlContext)
	end
	if self.link_type ~= nil then
		var127.link_type = propTypesModule.StringProp.jsonDecode(self.link_type)
	end
	if self.linkType ~= nil then
		var127.link_type = propTypesModule.StringProp.jsonDecode(self.linkType)
	end
	if self.link_data ~= nil then
		var127.link_data = t.ShareLinkPayload.jsonDecode(self.link_data)
	end
	if self.linkData ~= nil then
		var127.link_data = t.ShareLinkPayload.jsonDecode(self.linkData)
	end
	return var127
end

t_4.descriptor = {
	name = "ShareLinkFetchData_ShareLinkFetchLiteralData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkFetchLiteralData"
}
t.ShareLinkFetchData_ShareLinkFetchLiteralData = t_4
typeRegistryModule.default:register(t.ShareLinkFetchData_ShareLinkFetchLiteralData)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 793 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		oneof_prop = if p8 == nil or p8.oneof_prop == nil then nil else p8.oneof_prop
	}, t_5)
end

function t_5:encode() --[[ line: 799 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var129 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "experience_share_link_payload" then
			local var130 = self.oneof_prop.value:encode()
			local var131, var132 = protoModule.writeTag(buff, var129, 1, protoModule.wireTypes.lengthDelimited)
			var131, var132 = protoModule.writeBuffer(var131, var132, var130, buffer.len(var130))
			buff = var131
			var129 = var132
		elseif self.oneof_prop.type == "event_share_link_payload" then
			local var133 = self.oneof_prop.value:encode()
			local var134, var135 = protoModule.writeTag(buff, var129, 2, protoModule.wireTypes.lengthDelimited)
			var134, var135 = protoModule.writeBuffer(var134, var135, var133, buffer.len(var133))
			buff = var134
			var129 = var135
		end
	end
	local buff_1 = buffer.create(var129)
	buffer.copy(buff_1, 0, buff, 0, var129)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 820 ]]
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var137 = t_5.new()
	local var138 = 0
	while var138 < buffer.len(p9) do
		local _ = nil
		local var139 = nil
		local var140, var141, var142 = protoModule.readTag(p9, var138)
		local var143 = var140
		var139 = var141
		var138 = var142
		
		if var139 == protoModule.wireTypes.varint then
			local _ = nil
			local var144, var145 = protoModule.readVarInt(p9, var138)
			local _ = var144
			var138 = var145
			continue
		end
		if var139 == protoModule.wireTypes.lengthDelimited then
			if var143 == 1 then
				local _ = nil
				local var146, var147 = protoModule.readBuffer(p9, var138)
				var138 = var147
				var137.oneof_prop = {
					type = "experience_share_link_payload",
					value = t.ExperienceShareLinkPayload.decode(var146)
				}
			elseif var143 == 2 then
				local _ = nil
				local var148, var149 = protoModule.readBuffer(p9, var138)
				var138 = var149
				var137.oneof_prop = {
					type = "event_share_link_payload",
					value = t.EventShareLinkPayload.decode(var148)
				}
			else
				local _ = nil
				local var150, var151 = protoModule.readVarInt(p9, var138)
				var138 = var151 + var150
			end
		elseif var139 == protoModule.wireTypes.i32 then
			local _ = nil
			local var152, var153 = protoModule.readFixed32(p9, var138)
			local _ = var152
			var138 = var153
		elseif var139 == protoModule.wireTypes.i64 then
			local _ = nil
			local var154, var155 = protoModule.readFixed64(p9, var138)
			local _ = var154
			var138 = var155
		else
			error("Unsupported wire type: " .. var139)
		end
	end
	return var137
end

function t_5:jsonEncode() --[[ line: 872 ]]
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

function t_5:jsonDecode() --[[ line: 886 ]]
	-- upvalues: t_5 (ref), t (ref)
	local var157 = t_5.new()
	
	if self.experience_share_link_payload ~= nil then
		var157.oneof_prop = {
			type = "experience_share_link_payload",
			value = t.ExperienceShareLinkPayload.jsonDecode(self.experience_share_link_payload)
		}
	end
	if self.experienceShareLinkPayload ~= nil then
		var157.oneof_prop = {
			type = "experience_share_link_payload",
			value = t.ExperienceShareLinkPayload.jsonDecode(self.experienceShareLinkPayload)
		}
	end
	if self.event_share_link_payload ~= nil then
		var157.oneof_prop = {
			type = "event_share_link_payload",
			value = t.EventShareLinkPayload.jsonDecode(self.event_share_link_payload)
		}
	end
	if self.eventShareLinkPayload ~= nil then
		var157.oneof_prop = {
			type = "event_share_link_payload",
			value = t.EventShareLinkPayload.jsonDecode(self.eventShareLinkPayload)
		}
	end
	return var157
end

t_5.descriptor = {
	name = "ShareLinkPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ShareLinkPayload"
}
t.ShareLinkPayload = t_5
typeRegistryModule.default:register(t.ShareLinkPayload)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 934 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		kind = if p10 == nil or p10.kind == nil then nil else p10.kind
	}, t_6)
end

function t_6:encode() --[[ line: 942 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var159 = 0
	
	if self.kind ~= nil and self.kind.type == "literal" then
		local var160 = self.kind.value:encode()
		local var161, var162 = protoModule.writeTag(buff, var159, 1, protoModule.wireTypes.lengthDelimited)
		var161, var162 = protoModule.writeBuffer(var161, var162, var160, buffer.len(var160))
		buff = var161
		var159 = var162
	end
	local buff_1 = buffer.create(var159)
	buffer.copy(buff_1, 0, buff, 0, var159)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 959 ]]
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var164 = t_6.new()
	local var165 = 0
	while var165 < buffer.len(p11) do
		local _ = nil
		local var166 = nil
		local var167, var168, var169 = protoModule.readTag(p11, var165)
		local var170 = var167
		var166 = var168
		var165 = var169
		
		if var166 == protoModule.wireTypes.varint then
			local _ = nil
			local var171, var172 = protoModule.readVarInt(p11, var165)
			local _ = var171
			var165 = var172
			continue
		end
		if var166 == protoModule.wireTypes.lengthDelimited then
			if var170 == 1 then
				local _ = nil
				local var173, var174 = protoModule.readBuffer(p11, var165)
				var165 = var174
				var164.kind = {
					type = "literal",
					value = t.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload.decode(var173)
				}
			else
				local _ = nil
				local var175, var176 = protoModule.readVarInt(p11, var165)
				var165 = var176 + var175
			end
		elseif var166 == protoModule.wireTypes.i32 then
			local _ = nil
			local var177, var178 = protoModule.readFixed32(p11, var165)
			local _ = var177
			var165 = var178
		elseif var166 == protoModule.wireTypes.i64 then
			local _ = nil
			local var179, var180 = protoModule.readFixed64(p11, var165)
			local _ = var179
			var165 = var180
		else
			error("Unsupported wire type: " .. var166)
		end
	end
	return var164
end

function t_6:jsonEncode() --[[ line: 1005 ]]
	local t = {}
	
	if self.kind ~= nil and self.kind.type == "literal" then
		t.literal = self.kind.value:jsonEncode()
	end
	return t
end

function t_6:jsonDecode() --[[ line: 1017 ]]
	-- upvalues: t_6 (ref), t (ref)
	local var182 = t_6.new()
	
	if self.literal ~= nil then
		var182.kind = {
			type = "literal",
			value = t.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload.jsonDecode(self.literal)
		}
	end
	return var182
end

t_6.descriptor = {
	name = "ExperienceShareLinkPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceShareLinkPayload"
}
t.ExperienceShareLinkPayload = t_6
typeRegistryModule.default:register(t.ExperienceShareLinkPayload)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12) --[[ line: 1045 ]]
	-- upvalues: t_7 (ref)
	return setmetatable({
		universe_id = if p12 == nil or p12.universe_id == nil then nil else p12.universe_id
	}, t_7)
end

function t_7:encode() --[[ line: 1056 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var184 = 0
	
	if self.universe_id ~= nil then
		local var185 = self.universe_id:encode()
		local var186, var187 = protoModule.writeTag(buff, var184, 1, protoModule.wireTypes.lengthDelimited)
		var186, var187 = protoModule.writeBuffer(var186, var187, var185, buffer.len(var185))
		buff = var186
		var184 = var187
	end
	local buff_1 = buffer.create(var184)
	buffer.copy(buff_1, 0, buff, 0, var184)
	
	return buff_1
end

function t_7.decode(p13) --[[ line: 1073 ]]
	-- upvalues: t_7 (ref), protoModule (ref), propTypesModule (ref)
	local var189 = t_7.new()
	local var190 = 0
	while var190 < buffer.len(p13) do
		local _ = nil
		local var191 = nil
		local var192, var193, var194 = protoModule.readTag(p13, var190)
		local var195 = var192
		var191 = var193
		var190 = var194
		
		if var191 == protoModule.wireTypes.varint then
			local _ = nil
			local var196, var197 = protoModule.readVarInt(p13, var190)
			local _ = var196
			var190 = var197
			continue
		end
		if var191 == protoModule.wireTypes.lengthDelimited then
			if var195 == 1 then
				local _ = nil
				local var198, var199 = protoModule.readBuffer(p13, var190)
				var190 = var199
				var189.universe_id = propTypesModule.StringProp.decode(var198)
			else
				local _ = nil
				local var200, var201 = protoModule.readVarInt(p13, var190)
				var190 = var201 + var200
			end
		elseif var191 == protoModule.wireTypes.i32 then
			local _ = nil
			local var202, var203 = protoModule.readFixed32(p13, var190)
			local _ = var202
			var190 = var203
		elseif var191 == protoModule.wireTypes.i64 then
			local _ = nil
			local var204, var205 = protoModule.readFixed64(p13, var190)
			local _ = var204
			var190 = var205
		else
			error("Unsupported wire type: " .. var191)
		end
	end
	return var189
end

function t_7:jsonEncode() --[[ line: 1118 ]]
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id:jsonEncode()
	end
	return t
end

function t_7:jsonDecode() --[[ line: 1130 ]]
	-- upvalues: t_7 (ref), propTypesModule (ref)
	local var207 = t_7.new()
	
	if self.universe_id ~= nil then
		var207.universe_id = propTypesModule.StringProp.jsonDecode(self.universe_id)
	end
	if self.universeId ~= nil then
		var207.universe_id = propTypesModule.StringProp.jsonDecode(self.universeId)
	end
	return var207
end

t_7.descriptor = {
	name = "ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceShareLinkLiteralPayload"
}
t.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload = t_7
typeRegistryModule.default:register(t.ExperienceShareLinkPayload_ExperienceShareLinkLiteralPayload)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14) --[[ line: 1162 ]]
	-- upvalues: t_8 (ref)
	return setmetatable({
		kind = if p14 == nil or p14.kind == nil then nil else p14.kind
	}, t_8)
end

function t_8:encode() --[[ line: 1168 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var209 = 0
	
	if self.kind ~= nil and self.kind.type == "literal" then
		local var210 = self.kind.value:encode()
		local var211, var212 = protoModule.writeTag(buff, var209, 1, protoModule.wireTypes.lengthDelimited)
		var211, var212 = protoModule.writeBuffer(var211, var212, var210, buffer.len(var210))
		buff = var211
		var209 = var212
	end
	local buff_1 = buffer.create(var209)
	buffer.copy(buff_1, 0, buff, 0, var209)
	
	return buff_1
end

function t_8.decode(p15) --[[ line: 1185 ]]
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var214 = t_8.new()
	local var215 = 0
	while var215 < buffer.len(p15) do
		local _ = nil
		local var216 = nil
		local var217, var218, var219 = protoModule.readTag(p15, var215)
		local var220 = var217
		var216 = var218
		var215 = var219
		
		if var216 == protoModule.wireTypes.varint then
			local _ = nil
			local var221, var222 = protoModule.readVarInt(p15, var215)
			local _ = var221
			var215 = var222
			continue
		end
		if var216 == protoModule.wireTypes.lengthDelimited then
			if var220 == 1 then
				local _ = nil
				local var223, var224 = protoModule.readBuffer(p15, var215)
				var215 = var224
				var214.kind = {
					type = "literal",
					value = t.EventShareLinkPayload_EventShareLinkLiteralPayload.decode(var223)
				}
			else
				local _ = nil
				local var225, var226 = protoModule.readVarInt(p15, var215)
				var215 = var226 + var225
			end
		elseif var216 == protoModule.wireTypes.i32 then
			local _ = nil
			local var227, var228 = protoModule.readFixed32(p15, var215)
			local _ = var227
			var215 = var228
		elseif var216 == protoModule.wireTypes.i64 then
			local _ = nil
			local var229, var230 = protoModule.readFixed64(p15, var215)
			local _ = var229
			var215 = var230
		else
			error("Unsupported wire type: " .. var216)
		end
	end
	return var214
end

function t_8:jsonEncode() --[[ line: 1231 ]]
	local t = {}
	
	if self.kind ~= nil and self.kind.type == "literal" then
		t.literal = self.kind.value:jsonEncode()
	end
	return t
end

function t_8:jsonDecode() --[[ line: 1243 ]]
	-- upvalues: t_8 (ref), t (ref)
	local var232 = t_8.new()
	
	if self.literal ~= nil then
		var232.kind = {
			type = "literal",
			value = t.EventShareLinkPayload_EventShareLinkLiteralPayload.jsonDecode(self.literal)
		}
	end
	return var232
end

t_8.descriptor = {
	name = "EventShareLinkPayload",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventShareLinkPayload"
}
t.EventShareLinkPayload = t_8
typeRegistryModule.default:register(t.EventShareLinkPayload)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p16) --[[ line: 1271 ]]
	-- upvalues: t_9 (ref)
	return setmetatable({
		event_id = if p16 == nil or p16.event_id == nil then nil else p16.event_id
	}, t_9)
end

function t_9:encode() --[[ line: 1282 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var234 = 0
	
	if self.event_id ~= nil then
		local var235 = self.event_id:encode()
		local var236, var237 = protoModule.writeTag(buff, var234, 1, protoModule.wireTypes.lengthDelimited)
		var236, var237 = protoModule.writeBuffer(var236, var237, var235, buffer.len(var235))
		buff = var236
		var234 = var237
	end
	local buff_1 = buffer.create(var234)
	buffer.copy(buff_1, 0, buff, 0, var234)
	
	return buff_1
end

function t_9.decode(p17) --[[ line: 1299 ]]
	-- upvalues: t_9 (ref), protoModule (ref), propTypesModule (ref)
	local var239 = t_9.new()
	local var240 = 0
	while var240 < buffer.len(p17) do
		local _ = nil
		local var241 = nil
		local var242, var243, var244 = protoModule.readTag(p17, var240)
		local var245 = var242
		var241 = var243
		var240 = var244
		
		if var241 == protoModule.wireTypes.varint then
			local _ = nil
			local var246, var247 = protoModule.readVarInt(p17, var240)
			local _ = var246
			var240 = var247
			continue
		end
		if var241 == protoModule.wireTypes.lengthDelimited then
			if var245 == 1 then
				local _ = nil
				local var248, var249 = protoModule.readBuffer(p17, var240)
				var240 = var249
				var239.event_id = propTypesModule.StringProp.decode(var248)
			else
				local _ = nil
				local var250, var251 = protoModule.readVarInt(p17, var240)
				var240 = var251 + var250
			end
		elseif var241 == protoModule.wireTypes.i32 then
			local _ = nil
			local var252, var253 = protoModule.readFixed32(p17, var240)
			local _ = var252
			var240 = var253
		elseif var241 == protoModule.wireTypes.i64 then
			local _ = nil
			local var254, var255 = protoModule.readFixed64(p17, var240)
			local _ = var254
			var240 = var255
		else
			error("Unsupported wire type: " .. var241)
		end
	end
	return var239
end

function t_9:jsonEncode() --[[ line: 1344 ]]
	local t = {}
	
	if self.event_id ~= nil then
		t.eventId = self.event_id:jsonEncode()
	end
	return t
end

function t_9:jsonDecode() --[[ line: 1356 ]]
	-- upvalues: t_9 (ref), propTypesModule (ref)
	local var257 = t_9.new()
	
	if self.event_id ~= nil then
		var257.event_id = propTypesModule.StringProp.jsonDecode(self.event_id)
	end
	if self.eventId ~= nil then
		var257.event_id = propTypesModule.StringProp.jsonDecode(self.eventId)
	end
	return var257
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