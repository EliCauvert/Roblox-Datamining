-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:14 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 153 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		event_id = if p0 == nil or p0.event_id == nil then 0 else p0.event_id,
		user_id = if p0 == nil or p0.user_id == nil then 0 else p0.user_id
	}, t_1)
end

function t_1:encode() --[[ line: 162 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var11 = 0
	
	if self.event_id ~= nil and self.event_id ~= 0 then
		local var12, var13 = protoModule.writeTag(buff, var11, 1, protoModule.wireTypes.varint)
		var12, var13 = protoModule.writeVarInt(var12, var13, self.event_id)
		buff = var12
		var11 = var13
	end
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var14, var15 = protoModule.writeTag(buff, var11, 2, protoModule.wireTypes.varint)
		var14, var15 = protoModule.writeVarInt(var14, var15, self.user_id)
		buff = var14
		var11 = var15
	end
	local buff_1 = buffer.create(var11)
	buffer.copy(buff_1, 0, buff, 0, var11)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 181 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var17 = t_1.new()
	local var18 = 0
	while var18 < buffer.len(p1) do
		local _ = nil
		local _ = nil
		local var19, var20, var21 = protoModule.readTag(p1, var18)
		local var22 = var19
		local var23 = var20
		var18 = var21
		
		if var23 == protoModule.wireTypes.varint then
			if var22 == 1 then
				local _ = nil
				local var24, var25 = protoModule.readVarIntI64(p1, var18)
				var18 = var25
				var17.event_id = var24
			elseif var22 == 2 then
				local _ = nil
				local var26, var27 = protoModule.readVarIntI64(p1, var18)
				var18 = var27
				var17.user_id = var26
			else
				local _ = nil
				local var28, var29 = protoModule.readVarInt(p1, var18)
				local _ = var28
				var18 = var29
			end
		elseif var23 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var30, var31 = protoModule.readVarInt(p1, var18)
			var18 = var31 + var30
		elseif var23 == protoModule.wireTypes.i32 then
			local _ = nil
			local var32, var33 = protoModule.readFixed32(p1, var18)
			local _ = var32
			var18 = var33
		elseif var23 == protoModule.wireTypes.i64 then
			local _ = nil
			local var34, var35 = protoModule.readFixed64(p1, var18)
			local _ = var34
			var18 = var35
		else
			error("Unsupported wire type: " .. var23)
		end
	end
	return var17
end

function t_1:jsonEncode() --[[ line: 229 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= 0 then
		t.eventId = self.event_id
	end
	if self.user_id ~= nil and self.user_id ~= 0 then
		t.userId = self.user_id
	end
	return t
end

function t_1:jsonDecode() --[[ line: 243 ]]
	-- upvalues: t_1 (ref)
	local var37 = t_1.new()
	
	if self.event_id ~= nil then
		var37.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var37.event_id = self.eventId
	end
	if self.user_id ~= nil then
		var37.user_id = self.user_id
	end
	if self.userId ~= nil then
		var37.user_id = self.userId
	end
	return var37
end

t_1.descriptor = {
	name = "ExperienceEventDetailsPageRequest",
	fullName = "roblox.apppageplatform.experienceevents.v1beta1.ExperienceEventDetailsPageRequest"
}
t.ExperienceEventDetailsPageRequest = t_1
typeRegistryModule.default:register(t.ExperienceEventDetailsPageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 281 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		page_entries = if p2 == nil or p2.page_entries == nil then {} else p2.page_entries,
		hydration_data = if p2 == nil or p2.hydration_data == nil then nil else p2.hydration_data,
		templates = if p2 == nil or p2.templates == nil then {} else p2.templates,
		localized_literals = if p2 == nil or p2.localized_literals == nil then {} else p2.localized_literals
	}, t_2)
end

function t_2:encode() --[[ line: 292 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var39 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var40 = v:encode()
			local var41, var42 = protoModule.writeTag(buff, var39, 1, protoModule.wireTypes.lengthDelimited)
			var41, var42 = protoModule.writeBuffer(var41, var42, var40, buffer.len(var40))
			buff = var41
			var39 = var42
		end
	end
	if self.hydration_data ~= nil then
		local var43 = self.hydration_data:encode()
		local var44, var45 = protoModule.writeTag(buff, var39, 2, protoModule.wireTypes.lengthDelimited)
		var44, var45 = protoModule.writeBuffer(var44, var45, var43, buffer.len(var43))
		buff = var44
		var39 = var45
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var46, var47 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var46, var47 = protoModule.writeString(var46, var47, i)
			local var48 = v:encode()
			var47, var49 = protoModule.writeTag(var46, var47, 2, protoModule.wireTypes.lengthDelimited)
			var47, var49 = protoModule.writeBuffer(var47, var49, var48, buffer.len(var48))
			local var50 = var47
			local var51 = var49
			local var52, var53 = protoModule.writeTag(buff, var39, 3, protoModule.wireTypes.lengthDelimited)
			var52, var53 = protoModule.writeBuffer(var52, var53, var50, var51)
			buff = var52
			var39 = var53
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var54, var55 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var54, var55 = protoModule.writeString(var54, var55, i)
			var54, var55 = protoModule.writeTag(var54, var55, 2, protoModule.wireTypes.lengthDelimited)
			var54, var55 = protoModule.writeString(var54, var55, v)
			local var56 = var54
			local var57 = var55
			local var58, var59 = protoModule.writeTag(buff, var39, 4, protoModule.wireTypes.lengthDelimited)
			var58, var59 = protoModule.writeBuffer(var58, var59, var56, var57)
			buff = var58
			var39 = var59
		end
	end
	local buff_1 = buffer.create(var39)
	buffer.copy(buff_1, 0, buff, 0, var39)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 342 ]]
	-- upvalues: t_2 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var61 = t_2.new()
	local var62 = 0
	while var62 < buffer.len(p3) do
		local _ = nil
		local var63 = nil
		local var64, var65, var66 = protoModule.readTag(p3, var62)
		local var67 = var64
		var63 = var65
		var62 = var66
		
		if var63 == protoModule.wireTypes.varint then
			local _ = nil
			local var68, var69 = protoModule.readVarInt(p3, var62)
			local _ = var68
			var62 = var69
			continue
		end
		if var63 == protoModule.wireTypes.lengthDelimited then
			if var67 == 1 then
				local _ = nil
				local var70, var71 = protoModule.readBuffer(p3, var62)
				var62 = var71
				table.insert(var61.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var70))
			elseif var67 == 2 then
				local _ = nil
				local var72, var73 = protoModule.readBuffer(p3, var62)
				var62 = var73
				var61.hydration_data = hydrationContentModule.HydrationContent.decode(var72)
			elseif var67 == 3 then
				local _ = nil
				local var74, var75 = protoModule.readBuffer(p3, var62)
				var62 = var75
				var74 = t.ExperienceEventDetailsPageResponse_TemplatesEntry.decode(var74)
				var61.templates[var74.key or ""] = var74.value or templateEntryModule.TemplateEntry.new()
			elseif var67 == 4 then
				local _ = nil
				local var76, var77 = protoModule.readBuffer(p3, var62)
				var62 = var77
				var76 = t.ExperienceEventDetailsPageResponse_LocalizedLiteralsEntry.decode(var76)
				var61.localized_literals[var76.key or ""] = var76.value or ""
			else
				local _ = nil
				local var78, var79 = protoModule.readVarInt(p3, var62)
				var62 = var79 + var78
			end
		elseif var63 == protoModule.wireTypes.i32 then
			local _ = nil
			local var80, var81 = protoModule.readFixed32(p3, var62)
			local _ = var80
			var62 = var81
		elseif var63 == protoModule.wireTypes.i64 then
			local _ = nil
			local var82, var83 = protoModule.readFixed64(p3, var62)
			local _ = var82
			var62 = var83
		else
			error("Unsupported wire type: " .. var63)
		end
	end
	return var61
end

function t_2:jsonEncode() --[[ line: 418 ]]
	local t = {}
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, v:jsonEncode())
		end
		t.pageEntries = t_1
	end
	if self.hydration_data ~= nil then
		t.hydrationData = self.hydration_data:jsonEncode()
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = v:jsonEncode()
		end
		t.templates = t_1
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		local t_1 = {}
		
		for i, v in self.localized_literals do
			t_1[i] = v
		end
		t.localizedLiterals = t_1
	end
	return t
end

function t_2:jsonDecode() --[[ line: 452 ]]
	-- upvalues: t_2 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var88 = t_2.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var88.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var88.page_entries = t
	end
	if self.hydration_data ~= nil then
		var88.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var88.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var88.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var88.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var88.localized_literals = t
	end
	return var88
end

t_2.descriptor = {
	name = "ExperienceEventDetailsPageResponse",
	fullName = "roblox.apppageplatform.experienceevents.v1beta1.ExperienceEventDetailsPageResponse"
}
t.ExperienceEventDetailsPageResponse = t_2
typeRegistryModule.default:register(t.ExperienceEventDetailsPageResponse)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 538 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then nil else p4.value
	}, t_3)
end

function t_3:encode() --[[ line: 550 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var95 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var96, var97 = protoModule.writeTag(buff, var95, 1, protoModule.wireTypes.lengthDelimited)
		var96, var97 = protoModule.writeString(var96, var97, self.key)
		buff = var96
		var95 = var97
	end
	if self.value ~= nil then
		local var98 = self.value:encode()
		local var99, var100 = protoModule.writeTag(buff, var95, 2, protoModule.wireTypes.lengthDelimited)
		var99, var100 = protoModule.writeBuffer(var99, var100, var98, buffer.len(var98))
		buff = var99
		var95 = var100
	end
	local buff_1 = buffer.create(var95)
	buffer.copy(buff_1, 0, buff, 0, var95)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 572 ]]
	-- upvalues: t_3 (ref), protoModule (ref), templateEntryModule (ref)
	local var102 = t_3.new()
	local var103 = 0
	while var103 < buffer.len(p5) do
		local _ = nil
		local var104 = nil
		local var105, var106, var107 = protoModule.readTag(p5, var103)
		local var108 = var105
		var104 = var106
		var103 = var107
		
		if var104 == protoModule.wireTypes.varint then
			local _ = nil
			local var109, var110 = protoModule.readVarInt(p5, var103)
			local _ = var109
			var103 = var110
			continue
		end
		if var104 == protoModule.wireTypes.lengthDelimited then
			if var108 == 1 then
				local _ = nil
				local var111, var112 = protoModule.readBuffer(p5, var103)
				var103 = var112
				var102.key = buffer.tostring(var111)
			elseif var108 == 2 then
				local _ = nil
				local var113, var114 = protoModule.readBuffer(p5, var103)
				var103 = var114
				var102.value = templateEntryModule.TemplateEntry.decode(var113)
			else
				local _ = nil
				local var115, var116 = protoModule.readVarInt(p5, var103)
				var103 = var116 + var115
			end
		elseif var104 == protoModule.wireTypes.i32 then
			local _ = nil
			local var117, var118 = protoModule.readFixed32(p5, var103)
			local _ = var117
			var103 = var118
		elseif var104 == protoModule.wireTypes.i64 then
			local _ = nil
			local var119, var120 = protoModule.readFixed64(p5, var103)
			local _ = var119
			var103 = var120
		else
			error("Unsupported wire type: " .. var104)
		end
	end
	return var102
end

function t_3:jsonEncode() --[[ line: 622 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode() --[[ line: 638 ]]
	-- upvalues: t_3 (ref), templateEntryModule (ref)
	local var122 = t_3.new()
	
	if self.key ~= nil then
		var122.key = self.key
	end
	if self.value ~= nil then
		var122.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var122
end

t_3.descriptor = {
	name = "ExperienceEventDetailsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.experienceevents.v1beta1.TemplatesEntry"
}
t.ExperienceEventDetailsPageResponse_TemplatesEntry = t_3
typeRegistryModule.default:register(t.ExperienceEventDetailsPageResponse_TemplatesEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 670 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		key = if p6 == nil or p6.key == nil then "" else p6.key,
		value = if p6 == nil or p6.value == nil then "" else p6.value
	}, t_4)
end

function t_4:encode() --[[ line: 682 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var124 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var125, var126 = protoModule.writeTag(buff, var124, 1, protoModule.wireTypes.lengthDelimited)
		var125, var126 = protoModule.writeString(var125, var126, self.key)
		buff = var125
		var124 = var126
	end
	if self.value ~= nil and self.value ~= "" then
		local var127, var128 = protoModule.writeTag(buff, var124, 2, protoModule.wireTypes.lengthDelimited)
		var127, var128 = protoModule.writeString(var127, var128, self.value)
		buff = var127
		var124 = var128
	end
	local buff_1 = buffer.create(var124)
	buffer.copy(buff_1, 0, buff, 0, var124)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 703 ]]
	-- upvalues: t_4 (ref), protoModule (ref)
	local var130 = t_4.new()
	local var131 = 0
	while var131 < buffer.len(p7) do
		local _ = nil
		local var132 = nil
		local var133, var134, var135 = protoModule.readTag(p7, var131)
		local var136 = var133
		var132 = var134
		var131 = var135
		
		if var132 == protoModule.wireTypes.varint then
			local _ = nil
			local var137, var138 = protoModule.readVarInt(p7, var131)
			local _ = var137
			var131 = var138
			continue
		end
		if var132 == protoModule.wireTypes.lengthDelimited then
			if var136 == 1 then
				local _ = nil
				local var139, var140 = protoModule.readBuffer(p7, var131)
				var131 = var140
				var130.key = buffer.tostring(var139)
			elseif var136 == 2 then
				local _ = nil
				local var141, var142 = protoModule.readBuffer(p7, var131)
				var131 = var142
				var130.value = buffer.tostring(var141)
			else
				local _ = nil
				local var143, var144 = protoModule.readVarInt(p7, var131)
				var131 = var144 + var143
			end
		elseif var132 == protoModule.wireTypes.i32 then
			local _ = nil
			local var145, var146 = protoModule.readFixed32(p7, var131)
			local _ = var145
			var131 = var146
		elseif var132 == protoModule.wireTypes.i64 then
			local _ = nil
			local var147, var148 = protoModule.readFixed64(p7, var131)
			local _ = var147
			var131 = var148
		else
			error("Unsupported wire type: " .. var132)
		end
	end
	return var130
end

function t_4:jsonEncode() --[[ line: 753 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_4:jsonDecode() --[[ line: 769 ]]
	-- upvalues: t_4 (ref)
	local var150 = t_4.new()
	
	if self.key ~= nil then
		var150.key = self.key
	end
	if self.value ~= nil then
		var150.value = self.value
	end
	return var150
end

t_4.descriptor = {
	name = "ExperienceEventDetailsPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.experienceevents.v1beta1.LocalizedLiteralsEntry"
}
t.ExperienceEventDetailsPageResponse_LocalizedLiteralsEntry = t_4
typeRegistryModule.default:register(t.ExperienceEventDetailsPageResponse_LocalizedLiteralsEntry)

return {
	ExperienceEventDetailsPageRequest = t.ExperienceEventDetailsPageRequest,
	ExperienceEventDetailsPageResponse = t.ExperienceEventDetailsPageResponse
}