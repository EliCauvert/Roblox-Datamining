-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:12 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local pageEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 370 ]]
	-- upvalues: pageEntryContentModule (ref), t_1 (ref)
	return setmetatable({
		badge_id = if p0 == nil or p0.badge_id == nil then 0 else p0.badge_id,
		user_id = if p0 == nil or p0.user_id == nil then 0 else p0.user_id,
		page_entry_format = if p0 == nil or p0.page_entry_format == nil then assert(pageEntryContentModule.PageEntryFormat.fromNumber(0), "Enum has no 0 default") else p0.page_entry_format
	}, t_1)
end

function t_1:encode() --[[ line: 383 ]]
	-- upvalues: protoModule (ref), pageEntryContentModule (ref)
	local buff = buffer.create(0)
	local var19 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= 0 then
		local var20, var21 = protoModule.writeTag(buff, var19, 1, protoModule.wireTypes.varint)
		var20, var21 = protoModule.writeVarInt(var20, var21, self.badge_id)
		buff = var20
		var19 = var21
	end
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var22, var23 = protoModule.writeTag(buff, var19, 2, protoModule.wireTypes.varint)
		var22, var23 = protoModule.writeVarInt(var22, var23, self.user_id)
		buff = var22
		var19 = var23
	end
	if self.page_entry_format ~= nil and (self.page_entry_format ~= nil and self.page_entry_format ~= 0 or self.page_entry_format ~= pageEntryContentModule.PageEntryFormat.fromNumber(0)) then
		local var24, var25 = protoModule.writeTag(buff, var19, 3, protoModule.wireTypes.varint)
		var24, var25 = protoModule.writeVarInt(var24, var25, pageEntryContentModule.PageEntryFormat.toNumber(self.page_entry_format))
		buff = var24
		var19 = var25
	end
	local buff_1 = buffer.create(var19)
	buffer.copy(buff_1, 0, buff, 0, var19)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 420 ]]
	-- upvalues: t_1 (ref), protoModule (ref), pageEntryContentModule (ref)
	local var27 = t_1.new()
	local var28 = 0
	while var28 < buffer.len(p1) do
		local _ = nil
		local _ = nil
		local var29, var30, var31 = protoModule.readTag(p1, var28)
		local var32 = var29
		local var33 = var30
		var28 = var31
		
		if var33 == protoModule.wireTypes.varint then
			if var32 == 1 then
				local _ = nil
				local var34, var35 = protoModule.readVarIntI64(p1, var28)
				var28 = var35
				var27.badge_id = var34
			elseif var32 == 2 then
				local _ = nil
				local var36, var37 = protoModule.readVarIntI64(p1, var28)
				var28 = var37
				var27.user_id = var36
			elseif var32 == 3 then
				local _ = nil
				local var38, var39 = protoModule.readVarIntI32(p1, var28)
				local var40 = var38
				var28 = var39
				var27.page_entry_format = pageEntryContentModule.PageEntryFormat.fromNumber(var40) or var40
			else
				local _ = nil
				local var41, var42 = protoModule.readVarInt(p1, var28)
				local _ = var41
				var28 = var42
			end
		elseif var33 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var43, var44 = protoModule.readVarInt(p1, var28)
			var28 = var44 + var43
		elseif var33 == protoModule.wireTypes.i32 then
			local _ = nil
			local var45, var46 = protoModule.readFixed32(p1, var28)
			local _ = var45
			var28 = var46
		elseif var33 == protoModule.wireTypes.i64 then
			local _ = nil
			local var47, var48 = protoModule.readFixed64(p1, var28)
			local _ = var47
			var28 = var48
		else
			error("Unsupported wire type: " .. var33)
		end
	end
	return var27
end

function t_1:jsonEncode() --[[ line: 476 ]]
	-- upvalues: pageEntryContentModule (ref)
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= 0 then
		t.badgeId = self.badge_id
	end
	if self.user_id ~= nil and self.user_id ~= 0 then
		t.userId = self.user_id
	end
	if self.page_entry_format ~= nil and (self.page_entry_format ~= nil and self.page_entry_format ~= 0 or self.page_entry_format ~= pageEntryContentModule.PageEntryFormat.fromNumber(0)) then
		t.pageEntryFormat = if typeof(self.page_entry_format) == "number" then self.page_entry_format else pageEntryContentModule.PageEntryFormat.toNumber(self.page_entry_format)
	end
	return t
end

function t_1:jsonDecode() --[[ line: 505 ]]
	-- upvalues: t_1 (ref), pageEntryContentModule (ref)
	local var50 = t_1.new()
	
	if self.badge_id ~= nil then
		var50.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var50.badge_id = self.badgeId
	end
	if self.user_id ~= nil then
		var50.user_id = self.user_id
	end
	if self.userId ~= nil then
		var50.user_id = self.userId
	end
	if self.page_entry_format ~= nil then
		var50.page_entry_format = if typeof(self.page_entry_format) == "number" then pageEntryContentModule.PageEntryFormat.fromNumber(self.page_entry_format) or self.page_entry_format else pageEntryContentModule.PageEntryFormat.fromName(self.page_entry_format) or self.page_entry_format
	end
	if self.pageEntryFormat ~= nil then
		var50.page_entry_format = if typeof(self.pageEntryFormat) == "number" then pageEntryContentModule.PageEntryFormat.fromNumber(self.pageEntryFormat) or self.pageEntryFormat else pageEntryContentModule.PageEntryFormat.fromName(self.pageEntryFormat) or self.pageEntryFormat
	end
	return var50
end

t_1.descriptor = {
	name = "BadgeDetailsPageRequest",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageRequest"
}
t.BadgeDetailsPageRequest = t_1
typeRegistryModule.default:register(t.BadgeDetailsPageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 561 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		page_entries = if p2 == nil or p2.page_entries == nil then {} else p2.page_entries,
		hydration_data = if p2 == nil or p2.hydration_data == nil then nil else p2.hydration_data,
		templates = if p2 == nil or p2.templates == nil then {} else p2.templates
	}, t_2)
end

function t_2:encode() --[[ line: 569 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var52 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var53 = v:encode()
			local var54, var55 = protoModule.writeTag(buff, var52, 1, protoModule.wireTypes.lengthDelimited)
			var54, var55 = protoModule.writeBuffer(var54, var55, var53, buffer.len(var53))
			buff = var54
			var52 = var55
		end
	end
	if self.hydration_data ~= nil then
		local var56 = self.hydration_data:encode()
		local var57, var58 = protoModule.writeTag(buff, var52, 2, protoModule.wireTypes.lengthDelimited)
		var57, var58 = protoModule.writeBuffer(var57, var58, var56, buffer.len(var56))
		buff = var57
		var52 = var58
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var59, var60 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var59, var60 = protoModule.writeString(var59, var60, i)
			local var61 = v:encode()
			var60, var62 = protoModule.writeTag(var59, var60, 2, protoModule.wireTypes.lengthDelimited)
			var60, var62 = protoModule.writeBuffer(var60, var62, var61, buffer.len(var61))
			local var63 = var60
			local var64 = var62
			local var65, var66 = protoModule.writeTag(buff, var52, 3, protoModule.wireTypes.lengthDelimited)
			var65, var66 = protoModule.writeBuffer(var65, var66, var63, var64)
			buff = var65
			var52 = var66
		end
	end
	local buff_1 = buffer.create(var52)
	buffer.copy(buff_1, 0, buff, 0, var52)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 606 ]]
	-- upvalues: t_2 (ref), protoModule (ref), t (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var68 = t_2.new()
	local var69 = 0
	while var69 < buffer.len(p3) do
		local _ = nil
		local var70 = nil
		local var71, var72, var73 = protoModule.readTag(p3, var69)
		local var74 = var71
		var70 = var72
		var69 = var73
		
		if var70 == protoModule.wireTypes.varint then
			local _ = nil
			local var75, var76 = protoModule.readVarInt(p3, var69)
			local _ = var75
			var69 = var76
			continue
		end
		if var70 == protoModule.wireTypes.lengthDelimited then
			if var74 == 1 then
				local _ = nil
				local var77, var78 = protoModule.readBuffer(p3, var69)
				var69 = var78
				table.insert(var68.page_entries, t.BadgeDetailsPageEntry.decode(var77))
			elseif var74 == 2 then
				local _ = nil
				local var79, var80 = protoModule.readBuffer(p3, var69)
				var69 = var80
				var68.hydration_data = hydrationContentModule.HydrationContent.decode(var79)
			elseif var74 == 3 then
				local _ = nil
				local var81, var82 = protoModule.readBuffer(p3, var69)
				var69 = var82
				var81 = t.BadgeDetailsPageResponse_TemplatesEntry.decode(var81)
				var68.templates[var81.key or ""] = var81.value or templateEntryModule.TemplateEntry.new()
			else
				local _ = nil
				local var83, var84 = protoModule.readVarInt(p3, var69)
				var69 = var84 + var83
			end
		elseif var70 == protoModule.wireTypes.i32 then
			local _ = nil
			local var85, var86 = protoModule.readFixed32(p3, var69)
			local _ = var85
			var69 = var86
		elseif var70 == protoModule.wireTypes.i64 then
			local _ = nil
			local var87, var88 = protoModule.readFixed64(p3, var69)
			local _ = var87
			var69 = var88
		else
			error("Unsupported wire type: " .. var70)
		end
	end
	return var68
end

function t_2:jsonEncode() --[[ line: 667 ]]
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
	return t
end

function t_2:jsonDecode() --[[ line: 693 ]]
	-- upvalues: t_2 (ref), t (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var92 = t_2.new()
	
	if self.page_entries ~= nil then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, t.BadgeDetailsPageEntry.jsonDecode(v))
		end
		var92.page_entries = t_1
	end
	if self.pageEntries ~= nil then
		local t_1 = {}
		
		for i, v in self.pageEntries do
			table.insert(t_1, t.BadgeDetailsPageEntry.jsonDecode(v))
		end
		var92.page_entries = t_1
	end
	if self.hydration_data ~= nil then
		var92.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var92.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var92.templates = t_1
	end
	return var92
end

t_2.descriptor = {
	name = "BadgeDetailsPageResponse",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageResponse"
}
t.BadgeDetailsPageResponse = t_2
typeRegistryModule.default:register(t.BadgeDetailsPageResponse)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 752 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then nil else p4.value
	}, t_3)
end

function t_3:encode() --[[ line: 761 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var97 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var98, var99 = protoModule.writeTag(buff, var97, 1, protoModule.wireTypes.lengthDelimited)
		var98, var99 = protoModule.writeString(var98, var99, self.key)
		buff = var98
		var97 = var99
	end
	if self.value ~= nil then
		local var100 = self.value:encode()
		local var101, var102 = protoModule.writeTag(buff, var97, 2, protoModule.wireTypes.lengthDelimited)
		var101, var102 = protoModule.writeBuffer(var101, var102, var100, buffer.len(var100))
		buff = var101
		var97 = var102
	end
	local buff_1 = buffer.create(var97)
	buffer.copy(buff_1, 0, buff, 0, var97)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 781 ]]
	-- upvalues: t_3 (ref), protoModule (ref), templateEntryModule (ref)
	local var104 = t_3.new()
	local var105 = 0
	while var105 < buffer.len(p5) do
		local _ = nil
		local var106 = nil
		local var107, var108, var109 = protoModule.readTag(p5, var105)
		local var110 = var107
		var106 = var108
		var105 = var109
		
		if var106 == protoModule.wireTypes.varint then
			local _ = nil
			local var111, var112 = protoModule.readVarInt(p5, var105)
			local _ = var111
			var105 = var112
			continue
		end
		if var106 == protoModule.wireTypes.lengthDelimited then
			if var110 == 1 then
				local _ = nil
				local var113, var114 = protoModule.readBuffer(p5, var105)
				var105 = var114
				var104.key = buffer.tostring(var113)
			elseif var110 == 2 then
				local _ = nil
				local var115, var116 = protoModule.readBuffer(p5, var105)
				var105 = var116
				var104.value = templateEntryModule.TemplateEntry.decode(var115)
			else
				local _ = nil
				local var117, var118 = protoModule.readVarInt(p5, var105)
				var105 = var118 + var117
			end
		elseif var106 == protoModule.wireTypes.i32 then
			local _ = nil
			local var119, var120 = protoModule.readFixed32(p5, var105)
			local _ = var119
			var105 = var120
		elseif var106 == protoModule.wireTypes.i64 then
			local _ = nil
			local var121, var122 = protoModule.readFixed64(p5, var105)
			local _ = var121
			var105 = var122
		else
			error("Unsupported wire type: " .. var106)
		end
	end
	return var104
end

function t_3:jsonEncode() --[[ line: 829 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode() --[[ line: 843 ]]
	-- upvalues: t_3 (ref), templateEntryModule (ref)
	local var124 = t_3.new()
	
	if self.key ~= nil then
		var124.key = self.key
	end
	if self.value ~= nil then
		var124.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var124
end

t_3.descriptor = {
	name = "BadgeDetailsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
}
t.BadgeDetailsPageResponse_TemplatesEntry = t_3
typeRegistryModule.default:register(t.BadgeDetailsPageResponse_TemplatesEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 873 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		page_entries = if p6 == nil or p6.page_entries == nil then {} else p6.page_entries,
		hydration_data = if p6 == nil or p6.hydration_data == nil then nil else p6.hydration_data,
		templates = if p6 == nil or p6.templates == nil then {} else p6.templates
	}, t_4)
end

function t_4:encode() --[[ line: 883 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var126 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var127 = v:encode()
			local var128, var129 = protoModule.writeTag(buff, var126, 1, protoModule.wireTypes.lengthDelimited)
			var128, var129 = protoModule.writeBuffer(var128, var129, var127, buffer.len(var127))
			buff = var128
			var126 = var129
		end
	end
	if self.hydration_data ~= nil then
		local var130 = self.hydration_data:encode()
		local var131, var132 = protoModule.writeTag(buff, var126, 2, protoModule.wireTypes.lengthDelimited)
		var131, var132 = protoModule.writeBuffer(var131, var132, var130, buffer.len(var130))
		buff = var131
		var126 = var132
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var133, var134 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var133, var134 = protoModule.writeString(var133, var134, i)
			local var135 = v:encode()
			var134, var136 = protoModule.writeTag(var133, var134, 2, protoModule.wireTypes.lengthDelimited)
			var134, var136 = protoModule.writeBuffer(var134, var136, var135, buffer.len(var135))
			local var137 = var134
			local var138 = var136
			local var139, var140 = protoModule.writeTag(buff, var126, 3, protoModule.wireTypes.lengthDelimited)
			var139, var140 = protoModule.writeBuffer(var139, var140, var137, var138)
			buff = var139
			var126 = var140
		end
	end
	local buff_1 = buffer.create(var126)
	buffer.copy(buff_1, 0, buff, 0, var126)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 920 ]]
	-- upvalues: t_4 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var142 = t_4.new()
	local var143 = 0
	while var143 < buffer.len(p7) do
		local _ = nil
		local var144 = nil
		local var145, var146, var147 = protoModule.readTag(p7, var143)
		local var148 = var145
		var144 = var146
		var143 = var147
		
		if var144 == protoModule.wireTypes.varint then
			local _ = nil
			local var149, var150 = protoModule.readVarInt(p7, var143)
			local _ = var149
			var143 = var150
			continue
		end
		if var144 == protoModule.wireTypes.lengthDelimited then
			if var148 == 1 then
				local _ = nil
				local var151, var152 = protoModule.readBuffer(p7, var143)
				var143 = var152
				table.insert(var142.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var151))
			elseif var148 == 2 then
				local _ = nil
				local var153, var154 = protoModule.readBuffer(p7, var143)
				var143 = var154
				var142.hydration_data = hydrationContentModule.HydrationContent.decode(var153)
			elseif var148 == 3 then
				local _ = nil
				local var155, var156 = protoModule.readBuffer(p7, var143)
				var143 = var156
				var155 = t.BadgeDetailsPageV2Response_TemplatesEntry.decode(var155)
				var142.templates[var155.key or ""] = var155.value or templateEntryModule.TemplateEntry.new()
			else
				local _ = nil
				local var157, var158 = protoModule.readVarInt(p7, var143)
				var143 = var158 + var157
			end
		elseif var144 == protoModule.wireTypes.i32 then
			local _ = nil
			local var159, var160 = protoModule.readFixed32(p7, var143)
			local _ = var159
			var143 = var160
		elseif var144 == protoModule.wireTypes.i64 then
			local _ = nil
			local var161, var162 = protoModule.readFixed64(p7, var143)
			local _ = var161
			var143 = var162
		else
			error("Unsupported wire type: " .. var144)
		end
	end
	return var142
end

function t_4:jsonEncode() --[[ line: 984 ]]
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
	return t
end

function t_4:jsonDecode() --[[ line: 1010 ]]
	-- upvalues: t_4 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var166 = t_4.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var166.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var166.page_entries = t
	end
	if self.hydration_data ~= nil then
		var166.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var166.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var166.templates = t
	end
	return var166
end

t_4.descriptor = {
	name = "BadgeDetailsPageV2Response",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageV2Response"
}
t.BadgeDetailsPageV2Response = t_4
typeRegistryModule.default:register(t.BadgeDetailsPageV2Response)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 1075 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		key = if p8 == nil or p8.key == nil then "" else p8.key,
		value = if p8 == nil or p8.value == nil then nil else p8.value
	}, t_5)
end

function t_5:encode() --[[ line: 1084 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var171 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var172, var173 = protoModule.writeTag(buff, var171, 1, protoModule.wireTypes.lengthDelimited)
		var172, var173 = protoModule.writeString(var172, var173, self.key)
		buff = var172
		var171 = var173
	end
	if self.value ~= nil then
		local var174 = self.value:encode()
		local var175, var176 = protoModule.writeTag(buff, var171, 2, protoModule.wireTypes.lengthDelimited)
		var175, var176 = protoModule.writeBuffer(var175, var176, var174, buffer.len(var174))
		buff = var175
		var171 = var176
	end
	local buff_1 = buffer.create(var171)
	buffer.copy(buff_1, 0, buff, 0, var171)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 1106 ]]
	-- upvalues: t_5 (ref), protoModule (ref), templateEntryModule (ref)
	local var178 = t_5.new()
	local var179 = 0
	while var179 < buffer.len(p9) do
		local _ = nil
		local var180 = nil
		local var181, var182, var183 = protoModule.readTag(p9, var179)
		local var184 = var181
		var180 = var182
		var179 = var183
		
		if var180 == protoModule.wireTypes.varint then
			local _ = nil
			local var185, var186 = protoModule.readVarInt(p9, var179)
			local _ = var185
			var179 = var186
			continue
		end
		if var180 == protoModule.wireTypes.lengthDelimited then
			if var184 == 1 then
				local _ = nil
				local var187, var188 = protoModule.readBuffer(p9, var179)
				var179 = var188
				var178.key = buffer.tostring(var187)
			elseif var184 == 2 then
				local _ = nil
				local var189, var190 = protoModule.readBuffer(p9, var179)
				var179 = var190
				var178.value = templateEntryModule.TemplateEntry.decode(var189)
			else
				local _ = nil
				local var191, var192 = protoModule.readVarInt(p9, var179)
				var179 = var192 + var191
			end
		elseif var180 == protoModule.wireTypes.i32 then
			local _ = nil
			local var193, var194 = protoModule.readFixed32(p9, var179)
			local _ = var193
			var179 = var194
		elseif var180 == protoModule.wireTypes.i64 then
			local _ = nil
			local var195, var196 = protoModule.readFixed64(p9, var179)
			local _ = var195
			var179 = var196
		else
			error("Unsupported wire type: " .. var180)
		end
	end
	return var178
end

function t_5:jsonEncode() --[[ line: 1156 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_5:jsonDecode() --[[ line: 1172 ]]
	-- upvalues: t_5 (ref), templateEntryModule (ref)
	local var198 = t_5.new()
	
	if self.key ~= nil then
		var198.key = self.key
	end
	if self.value ~= nil then
		var198.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var198
end

t_5.descriptor = {
	name = "BadgeDetailsPageV2Response_TemplatesEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
}
t.BadgeDetailsPageV2Response_TemplatesEntry = t_5
typeRegistryModule.default:register(t.BadgeDetailsPageV2Response_TemplatesEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 1202 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		page_entry = if p10 == nil or p10.page_entry == nil then nil else p10.page_entry,
		kind = if p10 == nil or p10.kind == nil then nil else p10.kind
	}, t_6)
end

function t_6:encode() --[[ line: 1209 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var200 = 0
	
	if self.page_entry ~= nil then
		local var201 = self.page_entry:encode()
		local var202, var203 = protoModule.writeTag(buff, var200, 1, protoModule.wireTypes.lengthDelimited)
		var202, var203 = protoModule.writeBuffer(var202, var203, var201, buffer.len(var201))
		buff = var202
		var200 = var203
	end
	if self.kind ~= nil and self.kind.type == "badge_details" then
		local var204 = self.kind.value:encode()
		local var205, var206 = protoModule.writeTag(buff, var200, 2, protoModule.wireTypes.lengthDelimited)
		var205, var206 = protoModule.writeBuffer(var205, var206, var204, buffer.len(var204))
		buff = var205
		var200 = var206
	end
	local buff_1 = buffer.create(var200)
	buffer.copy(buff_1, 0, buff, 0, var200)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 1232 ]]
	-- upvalues: t_6 (ref), protoModule (ref), pageEntryModule (ref), t (ref)
	local var208 = t_6.new()
	local var209 = 0
	while var209 < buffer.len(p11) do
		local _ = nil
		local var210 = nil
		local var211, var212, var213 = protoModule.readTag(p11, var209)
		local var214 = var211
		var210 = var212
		var209 = var213
		
		if var210 == protoModule.wireTypes.varint then
			local _ = nil
			local var215, var216 = protoModule.readVarInt(p11, var209)
			local _ = var215
			var209 = var216
			continue
		end
		if var210 == protoModule.wireTypes.lengthDelimited then
			if var214 == 1 then
				local _ = nil
				local var217, var218 = protoModule.readBuffer(p11, var209)
				var209 = var218
				var208.page_entry = pageEntryModule.PageEntry.decode(var217)
			elseif var214 == 2 then
				local _ = nil
				local var219, var220 = protoModule.readBuffer(p11, var209)
				var209 = var220
				var208.kind = {
					type = "badge_details",
					value = t.BadgeDetailsContent.decode(var219)
				}
			else
				local _ = nil
				local var221, var222 = protoModule.readVarInt(p11, var209)
				var209 = var222 + var221
			end
		elseif var210 == protoModule.wireTypes.i32 then
			local _ = nil
			local var223, var224 = protoModule.readFixed32(p11, var209)
			local _ = var223
			var209 = var224
		elseif var210 == protoModule.wireTypes.i64 then
			local _ = nil
			local var225, var226 = protoModule.readFixed64(p11, var209)
			local _ = var225
			var209 = var226
		else
			error("Unsupported wire type: " .. var210)
		end
	end
	return var208
end

function t_6:jsonEncode() --[[ line: 1280 ]]
	local t = {}
	
	if self.page_entry ~= nil then
		t.pageEntry = self.page_entry:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "badge_details" then
		t.badgeDetails = self.kind.value:jsonEncode()
	end
	return t
end

function t_6:jsonDecode() --[[ line: 1296 ]]
	-- upvalues: t_6 (ref), pageEntryModule (ref), t (ref)
	local var228 = t_6.new()
	
	if self.page_entry ~= nil then
		var228.page_entry = pageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		var228.page_entry = pageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.badge_details ~= nil then
		var228.kind = {
			type = "badge_details",
			value = t.BadgeDetailsContent.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var228.kind = {
			type = "badge_details",
			value = t.BadgeDetailsContent.jsonDecode(self.badgeDetails)
		}
	end
	return var228
end

t_6.descriptor = {
	name = "BadgeDetailsPageEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageEntry"
}
t.BadgeDetailsPageEntry = t_6
typeRegistryModule.default:register(t.BadgeDetailsPageEntry)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12) --[[ line: 1332 ]]
	-- upvalues: t_7 (ref)
	return setmetatable({
		badge_id = if p12 == nil or p12.badge_id == nil then "" else p12.badge_id,
		universe_id = if p12 == nil or p12.universe_id == nil then "" else p12.universe_id,
		localized_literals = if p12 == nil or p12.localized_literals == nil then nil else p12.localized_literals,
		creator_key = if p12 == nil or p12.creator_key == nil then "" else p12.creator_key
	}, t_7)
end

function t_7:encode() --[[ line: 1341 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var230 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var231, var232 = protoModule.writeTag(buff, var230, 1, protoModule.wireTypes.lengthDelimited)
		var231, var232 = protoModule.writeString(var231, var232, self.badge_id)
		buff = var231
		var230 = var232
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var233, var234 = protoModule.writeTag(buff, var230, 2, protoModule.wireTypes.lengthDelimited)
		var233, var234 = protoModule.writeString(var233, var234, self.universe_id)
		buff = var233
		var230 = var234
	end
	if self.localized_literals ~= nil then
		local var235 = self.localized_literals:encode()
		local var236, var237 = protoModule.writeTag(buff, var230, 3, protoModule.wireTypes.lengthDelimited)
		var236, var237 = protoModule.writeBuffer(var236, var237, var235, buffer.len(var235))
		buff = var236
		var230 = var237
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var238, var239 = protoModule.writeTag(buff, var230, 4, protoModule.wireTypes.lengthDelimited)
		var238, var239 = protoModule.writeString(var238, var239, self.creator_key)
		buff = var238
		var230 = var239
	end
	local buff_1 = buffer.create(var230)
	buffer.copy(buff_1, 0, buff, 0, var230)
	
	return buff_1
end

function t_7.decode(p13) --[[ line: 1371 ]]
	-- upvalues: t_7 (ref), protoModule (ref), t (ref)
	local var241 = t_7.new()
	local var242 = 0
	while var242 < buffer.len(p13) do
		local _ = nil
		local var243 = nil
		local var244, var245, var246 = protoModule.readTag(p13, var242)
		local var247 = var244
		var243 = var245
		var242 = var246
		
		if var243 == protoModule.wireTypes.varint then
			local _ = nil
			local var248, var249 = protoModule.readVarInt(p13, var242)
			local _ = var248
			var242 = var249
			continue
		end
		if var243 == protoModule.wireTypes.lengthDelimited then
			if var247 == 1 then
				local _ = nil
				local var250, var251 = protoModule.readBuffer(p13, var242)
				var242 = var251
				var241.badge_id = buffer.tostring(var250)
			elseif var247 == 2 then
				local _ = nil
				local var252, var253 = protoModule.readBuffer(p13, var242)
				var242 = var253
				var241.universe_id = buffer.tostring(var252)
			elseif var247 == 3 then
				local _ = nil
				local var254, var255 = protoModule.readBuffer(p13, var242)
				var242 = var255
				var241.localized_literals = t.BadgeDetailsContent_LocalizedLiterals.decode(var254)
			elseif var247 == 4 then
				local _ = nil
				local var256, var257 = protoModule.readBuffer(p13, var242)
				var242 = var257
				var241.creator_key = buffer.tostring(var256)
			else
				local _ = nil
				local var258, var259 = protoModule.readVarInt(p13, var242)
				var242 = var259 + var258
			end
		elseif var243 == protoModule.wireTypes.i32 then
			local _ = nil
			local var260, var261 = protoModule.readFixed32(p13, var242)
			local _ = var260
			var242 = var261
		elseif var243 == protoModule.wireTypes.i64 then
			local _ = nil
			local var262, var263 = protoModule.readFixed64(p13, var242)
			local _ = var262
			var242 = var263
		else
			error("Unsupported wire type: " .. var243)
		end
	end
	return var241
end

function t_7:jsonEncode() --[[ line: 1429 ]]
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		t.badgeId = self.badge_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.localized_literals ~= nil then
		t.localizedLiterals = self.localized_literals:jsonEncode()
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function t_7:jsonDecode() --[[ line: 1451 ]]
	-- upvalues: t_7 (ref), t (ref)
	local var265 = t_7.new()
	
	if self.badge_id ~= nil then
		var265.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var265.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var265.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var265.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var265.localized_literals = t.BadgeDetailsContent_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var265.localized_literals = t.BadgeDetailsContent_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var265.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var265.creator_key = self.creatorKey
	end
	return var265
end

t_7.descriptor = {
	name = "BadgeDetailsContent",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsContent"
}
t.BadgeDetailsContent = t_7
typeRegistryModule.default:register(t.BadgeDetailsContent)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14) --[[ line: 1504 ]]
	-- upvalues: t_8 (ref)
	return setmetatable({
		info_table = if p14 == nil or p14.info_table == nil then nil else p14.info_table,
		action_module = if p14 == nil or p14.action_module == nil then nil else p14.action_module,
		overflow_menu = if p14 == nil or p14.overflow_menu == nil then nil else p14.overflow_menu
	}, t_8)
end

function t_8:encode() --[[ line: 1514 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var267 = 0
	
	if self.info_table ~= nil then
		local var268 = self.info_table:encode()
		local var269, var270 = protoModule.writeTag(buff, var267, 1, protoModule.wireTypes.lengthDelimited)
		var269, var270 = protoModule.writeBuffer(var269, var270, var268, buffer.len(var268))
		buff = var269
		var267 = var270
	end
	if self.action_module ~= nil then
		local var271 = self.action_module:encode()
		local var272, var273 = protoModule.writeTag(buff, var267, 2, protoModule.wireTypes.lengthDelimited)
		var272, var273 = protoModule.writeBuffer(var272, var273, var271, buffer.len(var271))
		buff = var272
		var267 = var273
	end
	if self.overflow_menu ~= nil then
		local var274 = self.overflow_menu:encode()
		local var275, var276 = protoModule.writeTag(buff, var267, 3, protoModule.wireTypes.lengthDelimited)
		var275, var276 = protoModule.writeBuffer(var275, var276, var274, buffer.len(var274))
		buff = var275
		var267 = var276
	end
	local buff_1 = buffer.create(var267)
	buffer.copy(buff_1, 0, buff, 0, var267)
	
	return buff_1
end

function t_8.decode(p15) --[[ line: 1541 ]]
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var278 = t_8.new()
	local var279 = 0
	while var279 < buffer.len(p15) do
		local _ = nil
		local var280 = nil
		local var281, var282, var283 = protoModule.readTag(p15, var279)
		local var284 = var281
		var280 = var282
		var279 = var283
		
		if var280 == protoModule.wireTypes.varint then
			local _ = nil
			local var285, var286 = protoModule.readVarInt(p15, var279)
			local _ = var285
			var279 = var286
			continue
		end
		if var280 == protoModule.wireTypes.lengthDelimited then
			if var284 == 1 then
				local _ = nil
				local var287, var288 = protoModule.readBuffer(p15, var279)
				var279 = var288
				var278.info_table = t.BadgeDetailsContent_LocalizedLiterals_InfoTable.decode(var287)
			elseif var284 == 2 then
				local _ = nil
				local var289, var290 = protoModule.readBuffer(p15, var279)
				var279 = var290
				var278.action_module = t.BadgeDetailsContent_LocalizedLiterals_ActionModule.decode(var289)
			elseif var284 == 3 then
				local _ = nil
				local var291, var292 = protoModule.readBuffer(p15, var279)
				var279 = var292
				var278.overflow_menu = t.BadgeDetailsContent_LocalizedLiterals_OverflowMenu.decode(var291)
			else
				local _ = nil
				local var293, var294 = protoModule.readVarInt(p15, var279)
				var279 = var294 + var293
			end
		elseif var280 == protoModule.wireTypes.i32 then
			local _ = nil
			local var295, var296 = protoModule.readFixed32(p15, var279)
			local _ = var295
			var279 = var296
		elseif var280 == protoModule.wireTypes.i64 then
			local _ = nil
			local var297, var298 = protoModule.readFixed64(p15, var279)
			local _ = var297
			var279 = var298
		else
			error("Unsupported wire type: " .. var280)
		end
	end
	return var278
end

function t_8:jsonEncode() --[[ line: 1594 ]]
	local t = {}
	
	if self.info_table ~= nil then
		t.infoTable = self.info_table:jsonEncode()
	end
	if self.action_module ~= nil then
		t.actionModule = self.action_module:jsonEncode()
	end
	if self.overflow_menu ~= nil then
		t.overflowMenu = self.overflow_menu:jsonEncode()
	end
	return t
end

function t_8:jsonDecode() --[[ line: 1612 ]]
	-- upvalues: t_8 (ref), t (ref)
	local var300 = t_8.new()
	
	if self.info_table ~= nil then
		var300.info_table = t.BadgeDetailsContent_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var300.info_table = t.BadgeDetailsContent_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var300.action_module = t.BadgeDetailsContent_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var300.action_module = t.BadgeDetailsContent_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var300.overflow_menu = t.BadgeDetailsContent_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var300.overflow_menu = t.BadgeDetailsContent_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var300
end

t_8.descriptor = {
	name = "BadgeDetailsContent_LocalizedLiterals",
	fullName = "roblox.apppageplatform.badges.v1beta1.LocalizedLiterals"
}
t.BadgeDetailsContent_LocalizedLiterals = t_8
typeRegistryModule.default:register(t.BadgeDetailsContent_LocalizedLiterals)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p16) --[[ line: 1662 ]]
	-- upvalues: t_9 (ref)
	return setmetatable({
		type_label = if p16 == nil or p16.type_label == nil then "" else p16.type_label,
		earned_label = if p16 == nil or p16.earned_label == nil then "" else p16.earned_label,
		updated_label = if p16 == nil or p16.updated_label == nil then "" else p16.updated_label,
		experience_label = if p16 == nil or p16.experience_label == nil then "" else p16.experience_label,
		rarity_label = if p16 == nil or p16.rarity_label == nil then "" else p16.rarity_label,
		won_yesterday_label = if p16 == nil or p16.won_yesterday_label == nil then "" else p16.won_yesterday_label,
		won_ever_label = if p16 == nil or p16.won_ever_label == nil then "" else p16.won_ever_label
	}, t_9)
end

function t_9:encode() --[[ line: 1678 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var302 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var303, var304 = protoModule.writeTag(buff, var302, 1, protoModule.wireTypes.lengthDelimited)
		var303, var304 = protoModule.writeString(var303, var304, self.type_label)
		buff = var303
		var302 = var304
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var305, var306 = protoModule.writeTag(buff, var302, 2, protoModule.wireTypes.lengthDelimited)
		var305, var306 = protoModule.writeString(var305, var306, self.earned_label)
		buff = var305
		var302 = var306
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var307, var308 = protoModule.writeTag(buff, var302, 3, protoModule.wireTypes.lengthDelimited)
		var307, var308 = protoModule.writeString(var307, var308, self.updated_label)
		buff = var307
		var302 = var308
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var309, var310 = protoModule.writeTag(buff, var302, 4, protoModule.wireTypes.lengthDelimited)
		var309, var310 = protoModule.writeString(var309, var310, self.experience_label)
		buff = var309
		var302 = var310
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var311, var312 = protoModule.writeTag(buff, var302, 5, protoModule.wireTypes.lengthDelimited)
		var311, var312 = protoModule.writeString(var311, var312, self.rarity_label)
		buff = var311
		var302 = var312
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var313, var314 = protoModule.writeTag(buff, var302, 6, protoModule.wireTypes.lengthDelimited)
		var313, var314 = protoModule.writeString(var313, var314, self.won_yesterday_label)
		buff = var313
		var302 = var314
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var315, var316 = protoModule.writeTag(buff, var302, 7, protoModule.wireTypes.lengthDelimited)
		var315, var316 = protoModule.writeString(var315, var316, self.won_ever_label)
		buff = var315
		var302 = var316
	end
	local buff_1 = buffer.create(var302)
	buffer.copy(buff_1, 0, buff, 0, var302)
	
	return buff_1
end

function t_9.decode(p17) --[[ line: 1724 ]]
	-- upvalues: t_9 (ref), protoModule (ref)
	local var318 = t_9.new()
	local var319 = 0
	while var319 < buffer.len(p17) do
		local _ = nil
		local var320 = nil
		local var321, var322, var323 = protoModule.readTag(p17, var319)
		local var324 = var321
		var320 = var322
		var319 = var323
		
		if var320 == protoModule.wireTypes.varint then
			local _ = nil
			local var325, var326 = protoModule.readVarInt(p17, var319)
			local _ = var325
			var319 = var326
			continue
		end
		if var320 == protoModule.wireTypes.lengthDelimited then
			if var324 == 1 then
				local _ = nil
				local var327, var328 = protoModule.readBuffer(p17, var319)
				var319 = var328
				var318.type_label = buffer.tostring(var327)
			elseif var324 == 2 then
				local _ = nil
				local var329, var330 = protoModule.readBuffer(p17, var319)
				var319 = var330
				var318.earned_label = buffer.tostring(var329)
			elseif var324 == 3 then
				local _ = nil
				local var331, var332 = protoModule.readBuffer(p17, var319)
				var319 = var332
				var318.updated_label = buffer.tostring(var331)
			elseif var324 == 4 then
				local _ = nil
				local var333, var334 = protoModule.readBuffer(p17, var319)
				var319 = var334
				var318.experience_label = buffer.tostring(var333)
			elseif var324 == 5 then
				local _ = nil
				local var335, var336 = protoModule.readBuffer(p17, var319)
				var319 = var336
				var318.rarity_label = buffer.tostring(var335)
			elseif var324 == 6 then
				local _ = nil
				local var337, var338 = protoModule.readBuffer(p17, var319)
				var319 = var338
				var318.won_yesterday_label = buffer.tostring(var337)
			elseif var324 == 7 then
				local _ = nil
				local var339, var340 = protoModule.readBuffer(p17, var319)
				var319 = var340
				var318.won_ever_label = buffer.tostring(var339)
			else
				local _ = nil
				local var341, var342 = protoModule.readVarInt(p17, var319)
				var319 = var342 + var341
			end
		elseif var320 == protoModule.wireTypes.i32 then
			local _ = nil
			local var343, var344 = protoModule.readFixed32(p17, var319)
			local _ = var343
			var319 = var344
		elseif var320 == protoModule.wireTypes.i64 then
			local _ = nil
			local var345, var346 = protoModule.readFixed64(p17, var319)
			local _ = var345
			var319 = var346
		else
			error("Unsupported wire type: " .. var320)
		end
	end
	return var318
end

function t_9:jsonEncode() --[[ line: 1799 ]]
	local t = {}
	
	if self.type_label ~= nil and self.type_label ~= "" then
		t.typeLabel = self.type_label
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		t.earnedLabel = self.earned_label
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		t.updatedLabel = self.updated_label
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		t.experienceLabel = self.experience_label
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		t.rarityLabel = self.rarity_label
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		t.wonYesterdayLabel = self.won_yesterday_label
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		t.wonEverLabel = self.won_ever_label
	end
	return t
end

function t_9:jsonDecode() --[[ line: 1835 ]]
	-- upvalues: t_9 (ref)
	local var348 = t_9.new()
	
	if self.type_label ~= nil then
		var348.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var348.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var348.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var348.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var348.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var348.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var348.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var348.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var348.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var348.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var348.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var348.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var348.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var348.won_ever_label = self.wonEverLabel
	end
	return var348
end

t_9.descriptor = {
	name = "BadgeDetailsContent_LocalizedLiterals_InfoTable",
	fullName = "roblox.apppageplatform.badges.v1beta1.InfoTable"
}
t.BadgeDetailsContent_LocalizedLiterals_InfoTable = t_9
typeRegistryModule.default:register(t.BadgeDetailsContent_LocalizedLiterals_InfoTable)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p18) --[[ line: 1915 ]]
	-- upvalues: t_10 (ref)
	return setmetatable({
		share = if p18 == nil or p18.share == nil then "" else p18.share,
		report = if p18 == nil or p18.report == nil then "" else p18.report
	}, t_10)
end

function t_10:encode() --[[ line: 1927 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var350 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var351, var352 = protoModule.writeTag(buff, var350, 1, protoModule.wireTypes.lengthDelimited)
		var351, var352 = protoModule.writeString(var351, var352, self.share)
		buff = var351
		var350 = var352
	end
	if self.report ~= nil and self.report ~= "" then
		local var353, var354 = protoModule.writeTag(buff, var350, 2, protoModule.wireTypes.lengthDelimited)
		var353, var354 = protoModule.writeString(var353, var354, self.report)
		buff = var353
		var350 = var354
	end
	local buff_1 = buffer.create(var350)
	buffer.copy(buff_1, 0, buff, 0, var350)
	
	return buff_1
end

function t_10.decode(p19) --[[ line: 1948 ]]
	-- upvalues: t_10 (ref), protoModule (ref)
	local var356 = t_10.new()
	local var357 = 0
	while var357 < buffer.len(p19) do
		local _ = nil
		local var358 = nil
		local var359, var360, var361 = protoModule.readTag(p19, var357)
		local var362 = var359
		var358 = var360
		var357 = var361
		
		if var358 == protoModule.wireTypes.varint then
			local _ = nil
			local var363, var364 = protoModule.readVarInt(p19, var357)
			local _ = var363
			var357 = var364
			continue
		end
		if var358 == protoModule.wireTypes.lengthDelimited then
			if var362 == 1 then
				local _ = nil
				local var365, var366 = protoModule.readBuffer(p19, var357)
				var357 = var366
				var356.share = buffer.tostring(var365)
			elseif var362 == 2 then
				local _ = nil
				local var367, var368 = protoModule.readBuffer(p19, var357)
				var357 = var368
				var356.report = buffer.tostring(var367)
			else
				local _ = nil
				local var369, var370 = protoModule.readVarInt(p19, var357)
				var357 = var370 + var369
			end
		elseif var358 == protoModule.wireTypes.i32 then
			local _ = nil
			local var371, var372 = protoModule.readFixed32(p19, var357)
			local _ = var371
			var357 = var372
		elseif var358 == protoModule.wireTypes.i64 then
			local _ = nil
			local var373, var374 = protoModule.readFixed64(p19, var357)
			local _ = var373
			var357 = var374
		else
			error("Unsupported wire type: " .. var358)
		end
	end
	return var356
end

function t_10:jsonEncode() --[[ line: 1998 ]]
	local t = {}
	
	if self.share ~= nil and self.share ~= "" then
		t.share = self.share
	end
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	return t
end

function t_10:jsonDecode() --[[ line: 2014 ]]
	-- upvalues: t_10 (ref)
	local var376 = t_10.new()
	
	if self.share ~= nil then
		var376.share = self.share
	end
	if self.report ~= nil then
		var376.report = self.report
	end
	return var376
end

t_10.descriptor = {
	name = "BadgeDetailsContent_LocalizedLiterals_ActionModule",
	fullName = "roblox.apppageplatform.badges.v1beta1.ActionModule"
}
t.BadgeDetailsContent_LocalizedLiterals_ActionModule = t_10
typeRegistryModule.default:register(t.BadgeDetailsContent_LocalizedLiterals_ActionModule)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p20) --[[ line: 2046 ]]
	-- upvalues: t_11 (ref)
	return setmetatable({
		report = if p20 == nil or p20.report == nil then "" else p20.report,
		remove = if p20 == nil or p20.remove == nil then "" else p20.remove
	}, t_11)
end

function t_11:encode() --[[ line: 2058 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var378 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var379, var380 = protoModule.writeTag(buff, var378, 1, protoModule.wireTypes.lengthDelimited)
		var379, var380 = protoModule.writeString(var379, var380, self.report)
		buff = var379
		var378 = var380
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var381, var382 = protoModule.writeTag(buff, var378, 2, protoModule.wireTypes.lengthDelimited)
		var381, var382 = protoModule.writeString(var381, var382, self.remove)
		buff = var381
		var378 = var382
	end
	local buff_1 = buffer.create(var378)
	buffer.copy(buff_1, 0, buff, 0, var378)
	
	return buff_1
end

function t_11.decode(p21) --[[ line: 2079 ]]
	-- upvalues: t_11 (ref), protoModule (ref)
	local var384 = t_11.new()
	local var385 = 0
	while var385 < buffer.len(p21) do
		local _ = nil
		local var386 = nil
		local var387, var388, var389 = protoModule.readTag(p21, var385)
		local var390 = var387
		var386 = var388
		var385 = var389
		
		if var386 == protoModule.wireTypes.varint then
			local _ = nil
			local var391, var392 = protoModule.readVarInt(p21, var385)
			local _ = var391
			var385 = var392
			continue
		end
		if var386 == protoModule.wireTypes.lengthDelimited then
			if var390 == 1 then
				local _ = nil
				local var393, var394 = protoModule.readBuffer(p21, var385)
				var385 = var394
				var384.report = buffer.tostring(var393)
			elseif var390 == 2 then
				local _ = nil
				local var395, var396 = protoModule.readBuffer(p21, var385)
				var385 = var396
				var384.remove = buffer.tostring(var395)
			else
				local _ = nil
				local var397, var398 = protoModule.readVarInt(p21, var385)
				var385 = var398 + var397
			end
		elseif var386 == protoModule.wireTypes.i32 then
			local _ = nil
			local var399, var400 = protoModule.readFixed32(p21, var385)
			local _ = var399
			var385 = var400
		elseif var386 == protoModule.wireTypes.i64 then
			local _ = nil
			local var401, var402 = protoModule.readFixed64(p21, var385)
			local _ = var401
			var385 = var402
		else
			error("Unsupported wire type: " .. var386)
		end
	end
	return var384
end

function t_11:jsonEncode() --[[ line: 2129 ]]
	local t = {}
	
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	if self.remove ~= nil and self.remove ~= "" then
		t.remove = self.remove
	end
	return t
end

function t_11:jsonDecode() --[[ line: 2145 ]]
	-- upvalues: t_11 (ref)
	local var404 = t_11.new()
	
	if self.report ~= nil then
		var404.report = self.report
	end
	if self.remove ~= nil then
		var404.remove = self.remove
	end
	return var404
end

t_11.descriptor = {
	name = "BadgeDetailsContent_LocalizedLiterals_OverflowMenu",
	fullName = "roblox.apppageplatform.badges.v1beta1.OverflowMenu"
}
t.BadgeDetailsContent_LocalizedLiterals_OverflowMenu = t_11
typeRegistryModule.default:register(t.BadgeDetailsContent_LocalizedLiterals_OverflowMenu)

return {
	BadgeDetailsPageRequest = t.BadgeDetailsPageRequest,
	BadgeDetailsPageResponse = t.BadgeDetailsPageResponse,
	BadgeDetailsPageV2Response = t.BadgeDetailsPageV2Response,
	BadgeDetailsPageEntry = t.BadgeDetailsPageEntry,
	BadgeDetailsContent = t.BadgeDetailsContent,
	BadgeDetailsContent_LocalizedLiterals = t.BadgeDetailsContent_LocalizedLiterals,
	BadgeDetailsContent_LocalizedLiterals_InfoTable = t.BadgeDetailsContent_LocalizedLiterals_InfoTable,
	BadgeDetailsContent_LocalizedLiterals_ActionModule = t.BadgeDetailsContent_LocalizedLiterals_ActionModule,
	BadgeDetailsContent_LocalizedLiterals_OverflowMenu = t.BadgeDetailsContent_LocalizedLiterals_OverflowMenu
}