local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local pageEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: pageEntryContentModule (ref), t_1 (ref)
	return setmetatable({
		badge_id = if p1 == nil or p1.badge_id == nil then 0 else p1.badge_id,
		user_id = if p1 == nil or p1.user_id == nil then 0 else p1.user_id,
		page_entry_format = if p1 == nil or p1.page_entry_format == nil then assert(pageEntryContentModule.PageEntryFormat.fromNumber(0), "Enum has no 0 default") else p1.page_entry_format
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref), pageEntryContentModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= 0 then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var21 = protoModule.writeVarInt(var2, var3, self.badge_id)
		buff = var2
		var1 = var3
	end
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var23 = protoModule.writeVarInt(var4, var5, self.user_id)
		buff = var4
		var1 = var5
	end
	if self.page_entry_format ~= nil and (self.page_entry_format ~= nil and self.page_entry_format ~= 0 or self.page_entry_format ~= pageEntryContentModule.PageEntryFormat.fromNumber(0)) then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var25 = protoModule.writeVarInt(var6, var7, pageEntryContentModule.PageEntryFormat.toNumber(self.page_entry_format))
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), pageEntryContentModule (ref)
	local var1 = t_1.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local _ = nil
		local var3, var4, var5 = protoModule.readTag(p1, var2)
		local var6 = var3
		local var7 = var4
		var2 = var5
		
		if var7 == protoModule.wireTypes.varint then
			if var6 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.badge_id = var8
			elseif var6 == 2 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI64(p1, var2)
				var2 = var11
				var1.user_id = var10
			elseif var6 == 3 then
				local _ = nil
				local var12, var13 = protoModule.readVarIntI32(p1, var2)
				local var14 = var12
				var2 = var13
				var1.page_entry_format = pageEntryContentModule.PageEntryFormat.fromNumber(var14) or var14
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				local _ = var15
				var2 = var16
			end
		elseif var7 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var17, var18 = protoModule.readVarInt(p1, var2)
			var2 = var18 + var17
		elseif var7 == protoModule.wireTypes.i32 then
			local _ = nil
			local var19, var20 = protoModule.readFixed32(p1, var2)
			local _ = var19
			var2 = var20
		elseif var7 == protoModule.wireTypes.i64 then
			local _ = nil
			local var21, var22 = protoModule.readFixed64(p1, var2)
			local _ = var21
			var2 = var22
		else
			error("Unsupported wire type: " .. var33)
		end
	end
	return var1
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), pageEntryContentModule (ref)
	local var23 = t_1.new()
	
	if self.badge_id ~= nil then
		var23.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var23.badge_id = self.badgeId
	end
	if self.user_id ~= nil then
		var23.user_id = self.user_id
	end
	if self.userId ~= nil then
		var23.user_id = self.userId
	end
	if self.page_entry_format ~= nil then
		var23.page_entry_format = if typeof(self.page_entry_format) == "number" then pageEntryContentModule.PageEntryFormat.fromNumber(self.page_entry_format) or self.page_entry_format else pageEntryContentModule.PageEntryFormat.fromName(self.page_entry_format) or self.page_entry_format
	end
	if self.pageEntryFormat ~= nil then
		var23.page_entry_format = if typeof(self.pageEntryFormat) == "number" then pageEntryContentModule.PageEntryFormat.fromNumber(self.pageEntryFormat) or self.pageEntryFormat else pageEntryContentModule.PageEntryFormat.fromName(self.pageEntryFormat) or self.pageEntryFormat
	end
	return var23
end

t_1.descriptor = {
	name = "BadgeDetailsPageRequest",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageRequest"
}
t.BadgeDetailsPageRequest = t_1
typeRegistryModule.default:register(t.BadgeDetailsPageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		page_entries = if p2 == nil or p2.page_entries == nil then {} else p2.page_entries,
		hydration_data = if p2 == nil or p2.hydration_data == nil then nil else p2.hydration_data,
		templates = if p2 == nil or p2.templates == nil then {} else p2.templates
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var23 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var24 = v:encode()
			local var25, var26 = protoModule.writeTag(buff, var23, 1, protoModule.wireTypes.lengthDelimited)
			var25, var55 = protoModule.writeBuffer(var25, var26, var24, buffer.len(var24))
			buff = var25
			var23 = var26
		end
	end
	if self.hydration_data ~= nil then
		local var27 = self.hydration_data:encode()
		local var28, var29 = protoModule.writeTag(buff, var23, 2, protoModule.wireTypes.lengthDelimited)
		var28, var58 = protoModule.writeBuffer(var28, var29, var27, buffer.len(var27))
		buff = var28
		var23 = var29
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var30, var31 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var30, var60 = protoModule.writeString(var30, var31, i)
			local var32 = v:encode()
			var31, var62 = protoModule.writeTag(var30, var31, 2, protoModule.wireTypes.lengthDelimited)
			var31, var62 = protoModule.writeBuffer(var31, var62, var32, buffer.len(var32))
			local var33 = var31
			local var34 = var62
			local var35, var36 = protoModule.writeTag(buff, var23, 3, protoModule.wireTypes.lengthDelimited)
			var35, var66 = protoModule.writeBuffer(var35, var36, var33, var34)
			buff = var35
			var23 = var36
		end
	end
	local buff_1 = buffer.create(var23)
	buffer.copy(buff_1, 0, buff, 0, var23)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var37 = t_2.new()
	local var38 = 0
	while var38 < buffer.len(p2) do
		local _ = nil
		local var39 = nil
		local var40, var41, var42 = protoModule.readTag(p2, var38)
		local var43 = var40
		var39 = var41
		var38 = var42
		
		if var39 == protoModule.wireTypes.varint then
			local _ = nil
			local var44, var45 = protoModule.readVarInt(p2, var38)
			local _ = var44
			var38 = var45
			continue
		end
		if var39 == protoModule.wireTypes.lengthDelimited then
			if var43 == 1 then
				local _ = nil
				local var46, var47 = protoModule.readBuffer(p2, var38)
				var38 = var47
				table.insert(var37.page_entries, t.BadgeDetailsPageEntry.decode(var46))
			elseif var43 == 2 then
				local _ = nil
				local var48, var49 = protoModule.readBuffer(p2, var38)
				var38 = var49
				var37.hydration_data = hydrationContentModule.HydrationContent.decode(var48)
			elseif var43 == 3 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p2, var38)
				var38 = var51
				var50 = t.BadgeDetailsPageResponse_TemplatesEntry.decode(var50)
				var37.templates[var50.key or ""] = var50.value or templateEntryModule.TemplateEntry.new()
			else
				local _ = nil
				local var52, var53 = protoModule.readVarInt(p2, var38)
				var38 = var53 + var52
			end
		elseif var39 == protoModule.wireTypes.i32 then
			local _ = nil
			local var54, var55 = protoModule.readFixed32(p2, var38)
			local _ = var54
			var38 = var55
		elseif var39 == protoModule.wireTypes.i64 then
			local _ = nil
			local var56, var57 = protoModule.readFixed64(p2, var38)
			local _ = var56
			var38 = var57
		else
			error("Unsupported wire type: " .. var70)
		end
	end
	return var37
end

function t_2:jsonEncode()
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

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), t (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var58 = t_2.new()
	
	if self.page_entries ~= nil then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, t.BadgeDetailsPageEntry.jsonDecode(v))
		end
		var58.page_entries = t_1
	end
	if self.pageEntries ~= nil then
		local t_1 = {}
		
		for i, v in self.pageEntries do
			table.insert(t_1, t.BadgeDetailsPageEntry.jsonDecode(v))
		end
		var58.page_entries = t_1
	end
	if self.hydration_data ~= nil then
		var58.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var58.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var58.templates = t_1
	end
	return var58
end

t_2.descriptor = {
	name = "BadgeDetailsPageResponse",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageResponse"
}
t.BadgeDetailsPageResponse = t_2
typeRegistryModule.default:register(t.BadgeDetailsPageResponse)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p3 == nil or p3.key == nil then "" else p3.key,
		value = if p3 == nil or p3.value == nil then nil else p3.value
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var59 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var60, var61 = protoModule.writeTag(buff, var59, 1, protoModule.wireTypes.lengthDelimited)
		var60, var99 = protoModule.writeString(var60, var61, self.key)
		buff = var60
		var59 = var61
	end
	if self.value ~= nil then
		local var62 = self.value:encode()
		local var63, var64 = protoModule.writeTag(buff, var59, 2, protoModule.wireTypes.lengthDelimited)
		var63, var102 = protoModule.writeBuffer(var63, var64, var62, buffer.len(var62))
		buff = var63
		var59 = var64
	end
	local buff_1 = buffer.create(var59)
	buffer.copy(buff_1, 0, buff, 0, var59)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), templateEntryModule (ref)
	local var59 = t_3.new()
	local var60 = 0
	while var60 < buffer.len(p3) do
		local _ = nil
		local var61 = nil
		local var62, var63, var64 = protoModule.readTag(p3, var60)
		local var65 = var62
		var61 = var63
		var60 = var64
		
		if var61 == protoModule.wireTypes.varint then
			local _ = nil
			local var66, var67 = protoModule.readVarInt(p3, var60)
			local _ = var66
			var60 = var67
			continue
		end
		if var61 == protoModule.wireTypes.lengthDelimited then
			if var65 == 1 then
				local _ = nil
				local var68, var69 = protoModule.readBuffer(p3, var60)
				var60 = var69
				var59.key = buffer.tostring(var68)
			elseif var65 == 2 then
				local _ = nil
				local var70, var71 = protoModule.readBuffer(p3, var60)
				var60 = var71
				var59.value = templateEntryModule.TemplateEntry.decode(var70)
			else
				local _ = nil
				local var72, var73 = protoModule.readVarInt(p3, var60)
				var60 = var73 + var72
			end
		elseif var61 == protoModule.wireTypes.i32 then
			local _ = nil
			local var74, var75 = protoModule.readFixed32(p3, var60)
			local _ = var74
			var60 = var75
		elseif var61 == protoModule.wireTypes.i64 then
			local _ = nil
			local var76, var77 = protoModule.readFixed64(p3, var60)
			local _ = var76
			var60 = var77
		else
			error("Unsupported wire type: " .. var106)
		end
	end
	return var59
end

function t_3:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), templateEntryModule (ref)
	local var78 = t_3.new()
	
	if self.key ~= nil then
		var78.key = self.key
	end
	if self.value ~= nil then
		var78.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var78
end

t_3.descriptor = {
	name = "BadgeDetailsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
}
t.BadgeDetailsPageResponse_TemplatesEntry = t_3
typeRegistryModule.default:register(t.BadgeDetailsPageResponse_TemplatesEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		page_entries = if p4 == nil or p4.page_entries == nil then {} else p4.page_entries,
		hydration_data = if p4 == nil or p4.hydration_data == nil then nil else p4.hydration_data,
		templates = if p4 == nil or p4.templates == nil then {} else p4.templates
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var78 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var79 = v:encode()
			local var80, var81 = protoModule.writeTag(buff, var78, 1, protoModule.wireTypes.lengthDelimited)
			var80, var129 = protoModule.writeBuffer(var80, var81, var79, buffer.len(var79))
			buff = var80
			var78 = var81
		end
	end
	if self.hydration_data ~= nil then
		local var82 = self.hydration_data:encode()
		local var83, var84 = protoModule.writeTag(buff, var78, 2, protoModule.wireTypes.lengthDelimited)
		var83, var132 = protoModule.writeBuffer(var83, var84, var82, buffer.len(var82))
		buff = var83
		var78 = var84
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var85, var86 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var85, var134 = protoModule.writeString(var85, var86, i)
			local var87 = v:encode()
			var86, var136 = protoModule.writeTag(var85, var86, 2, protoModule.wireTypes.lengthDelimited)
			var86, var136 = protoModule.writeBuffer(var86, var136, var87, buffer.len(var87))
			local var88 = var86
			local var89 = var136
			local var90, var91 = protoModule.writeTag(buff, var78, 3, protoModule.wireTypes.lengthDelimited)
			var90, var140 = protoModule.writeBuffer(var90, var91, var88, var89)
			buff = var90
			var78 = var91
		end
	end
	local buff_1 = buffer.create(var78)
	buffer.copy(buff_1, 0, buff, 0, var78)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var92 = t_4.new()
	local var93 = 0
	while var93 < buffer.len(p4) do
		local _ = nil
		local var94 = nil
		local var95, var96, var97 = protoModule.readTag(p4, var93)
		local var98 = var95
		var94 = var96
		var93 = var97
		
		if var94 == protoModule.wireTypes.varint then
			local _ = nil
			local var99, var100 = protoModule.readVarInt(p4, var93)
			local _ = var99
			var93 = var100
			continue
		end
		if var94 == protoModule.wireTypes.lengthDelimited then
			if var98 == 1 then
				local _ = nil
				local var101, var102 = protoModule.readBuffer(p4, var93)
				var93 = var102
				table.insert(var92.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var101))
			elseif var98 == 2 then
				local _ = nil
				local var103, var104 = protoModule.readBuffer(p4, var93)
				var93 = var104
				var92.hydration_data = hydrationContentModule.HydrationContent.decode(var103)
			elseif var98 == 3 then
				local _ = nil
				local var105, var106 = protoModule.readBuffer(p4, var93)
				var93 = var106
				var105 = t.BadgeDetailsPageV2Response_TemplatesEntry.decode(var105)
				var92.templates[var105.key or ""] = var105.value or templateEntryModule.TemplateEntry.new()
			else
				local _ = nil
				local var107, var108 = protoModule.readVarInt(p4, var93)
				var93 = var108 + var107
			end
		elseif var94 == protoModule.wireTypes.i32 then
			local _ = nil
			local var109, var110 = protoModule.readFixed32(p4, var93)
			local _ = var109
			var93 = var110
		elseif var94 == protoModule.wireTypes.i64 then
			local _ = nil
			local var111, var112 = protoModule.readFixed64(p4, var93)
			local _ = var111
			var93 = var112
		else
			error("Unsupported wire type: " .. var144)
		end
	end
	return var92
end

function t_4:jsonEncode()
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

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var113 = t_4.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var113.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var113.page_entries = t
	end
	if self.hydration_data ~= nil then
		var113.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var113.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var113.templates = t
	end
	return var113
end

t_4.descriptor = {
	name = "BadgeDetailsPageV2Response",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageV2Response"
}
t.BadgeDetailsPageV2Response = t_4
typeRegistryModule.default:register(t.BadgeDetailsPageV2Response)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		key = if p5 == nil or p5.key == nil then "" else p5.key,
		value = if p5 == nil or p5.value == nil then nil else p5.value
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var114 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var115, var116 = protoModule.writeTag(buff, var114, 1, protoModule.wireTypes.lengthDelimited)
		var115, var173 = protoModule.writeString(var115, var116, self.key)
		buff = var115
		var114 = var116
	end
	if self.value ~= nil then
		local var117 = self.value:encode()
		local var118, var119 = protoModule.writeTag(buff, var114, 2, protoModule.wireTypes.lengthDelimited)
		var118, var176 = protoModule.writeBuffer(var118, var119, var117, buffer.len(var117))
		buff = var118
		var114 = var119
	end
	local buff_1 = buffer.create(var114)
	buffer.copy(buff_1, 0, buff, 0, var114)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), templateEntryModule (ref)
	local var114 = t_5.new()
	local var115 = 0
	while var115 < buffer.len(p5) do
		local _ = nil
		local var116 = nil
		local var117, var118, var119 = protoModule.readTag(p5, var115)
		local var120 = var117
		var116 = var118
		var115 = var119
		
		if var116 == protoModule.wireTypes.varint then
			local _ = nil
			local var121, var122 = protoModule.readVarInt(p5, var115)
			local _ = var121
			var115 = var122
			continue
		end
		if var116 == protoModule.wireTypes.lengthDelimited then
			if var120 == 1 then
				local _ = nil
				local var123, var124 = protoModule.readBuffer(p5, var115)
				var115 = var124
				var114.key = buffer.tostring(var123)
			elseif var120 == 2 then
				local _ = nil
				local var125, var126 = protoModule.readBuffer(p5, var115)
				var115 = var126
				var114.value = templateEntryModule.TemplateEntry.decode(var125)
			else
				local _ = nil
				local var127, var128 = protoModule.readVarInt(p5, var115)
				var115 = var128 + var127
			end
		elseif var116 == protoModule.wireTypes.i32 then
			local _ = nil
			local var129, var130 = protoModule.readFixed32(p5, var115)
			local _ = var129
			var115 = var130
		elseif var116 == protoModule.wireTypes.i64 then
			local _ = nil
			local var131, var132 = protoModule.readFixed64(p5, var115)
			local _ = var131
			var115 = var132
		else
			error("Unsupported wire type: " .. var180)
		end
	end
	return var114
end

function t_5:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), templateEntryModule (ref)
	local var133 = t_5.new()
	
	if self.key ~= nil then
		var133.key = self.key
	end
	if self.value ~= nil then
		var133.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var133
end

t_5.descriptor = {
	name = "BadgeDetailsPageV2Response_TemplatesEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
}
t.BadgeDetailsPageV2Response_TemplatesEntry = t_5
typeRegistryModule.default:register(t.BadgeDetailsPageV2Response_TemplatesEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		page_entry = if p6 == nil or p6.page_entry == nil then nil else p6.page_entry,
		kind = if p6 == nil or p6.kind == nil then nil else p6.kind
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var133 = 0
	
	if self.page_entry ~= nil then
		local var134 = self.page_entry:encode()
		local var135, var136 = protoModule.writeTag(buff, var133, 1, protoModule.wireTypes.lengthDelimited)
		var135, var203 = protoModule.writeBuffer(var135, var136, var134, buffer.len(var134))
		buff = var135
		var133 = var136
	end
	if self.kind ~= nil and self.kind.type == "badge_details" then
		local var137 = self.kind.value:encode()
		local var138, var139 = protoModule.writeTag(buff, var133, 2, protoModule.wireTypes.lengthDelimited)
		var138, var206 = protoModule.writeBuffer(var138, var139, var137, buffer.len(var137))
		buff = var138
		var133 = var139
	end
	local buff_1 = buffer.create(var133)
	buffer.copy(buff_1, 0, buff, 0, var133)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), pageEntryModule (ref), t (ref)
	local var133 = t_6.new()
	local var134 = 0
	while var134 < buffer.len(p6) do
		local _ = nil
		local var135 = nil
		local var136, var137, var138 = protoModule.readTag(p6, var134)
		local var139 = var136
		var135 = var137
		var134 = var138
		
		if var135 == protoModule.wireTypes.varint then
			local _ = nil
			local var140, var141 = protoModule.readVarInt(p6, var134)
			local _ = var140
			var134 = var141
			continue
		end
		if var135 == protoModule.wireTypes.lengthDelimited then
			if var139 == 1 then
				local _ = nil
				local var142, var143 = protoModule.readBuffer(p6, var134)
				var134 = var143
				var133.page_entry = pageEntryModule.PageEntry.decode(var142)
			elseif var139 == 2 then
				local _ = nil
				local var144, var145 = protoModule.readBuffer(p6, var134)
				var134 = var145
				var133.kind = {
					type = "badge_details",
					value = t.BadgeDetailsContent.decode(var144)
				}
			else
				local _ = nil
				local var146, var147 = protoModule.readVarInt(p6, var134)
				var134 = var147 + var146
			end
		elseif var135 == protoModule.wireTypes.i32 then
			local _ = nil
			local var148, var149 = protoModule.readFixed32(p6, var134)
			local _ = var148
			var134 = var149
		elseif var135 == protoModule.wireTypes.i64 then
			local _ = nil
			local var150, var151 = protoModule.readFixed64(p6, var134)
			local _ = var150
			var134 = var151
		else
			error("Unsupported wire type: " .. var210)
		end
	end
	return var133
end

function t_6:jsonEncode()
	local t = {}
	
	if self.page_entry ~= nil then
		t.pageEntry = self.page_entry:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "badge_details" then
		t.badgeDetails = self.kind.value:jsonEncode()
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), pageEntryModule (ref), t (ref)
	local var152 = t_6.new()
	
	if self.page_entry ~= nil then
		var152.page_entry = pageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		var152.page_entry = pageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.badge_details ~= nil then
		var152.kind = {
			type = "badge_details",
			value = t.BadgeDetailsContent.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var152.kind = {
			type = "badge_details",
			value = t.BadgeDetailsContent.jsonDecode(self.badgeDetails)
		}
	end
	return var152
end

t_6.descriptor = {
	name = "BadgeDetailsPageEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageEntry"
}
t.BadgeDetailsPageEntry = t_6
typeRegistryModule.default:register(t.BadgeDetailsPageEntry)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		badge_id = if p7 == nil or p7.badge_id == nil then "" else p7.badge_id,
		universe_id = if p7 == nil or p7.universe_id == nil then "" else p7.universe_id,
		localized_literals = if p7 == nil or p7.localized_literals == nil then nil else p7.localized_literals,
		creator_key = if p7 == nil or p7.creator_key == nil then "" else p7.creator_key
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var152 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var153, var154 = protoModule.writeTag(buff, var152, 1, protoModule.wireTypes.lengthDelimited)
		var153, var232 = protoModule.writeString(var153, var154, self.badge_id)
		buff = var153
		var152 = var154
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var155, var156 = protoModule.writeTag(buff, var152, 2, protoModule.wireTypes.lengthDelimited)
		var155, var234 = protoModule.writeString(var155, var156, self.universe_id)
		buff = var155
		var152 = var156
	end
	if self.localized_literals ~= nil then
		local var157 = self.localized_literals:encode()
		local var158, var159 = protoModule.writeTag(buff, var152, 3, protoModule.wireTypes.lengthDelimited)
		var158, var237 = protoModule.writeBuffer(var158, var159, var157, buffer.len(var157))
		buff = var158
		var152 = var159
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var160, var161 = protoModule.writeTag(buff, var152, 4, protoModule.wireTypes.lengthDelimited)
		var160, var239 = protoModule.writeString(var160, var161, self.creator_key)
		buff = var160
		var152 = var161
	end
	local buff_1 = buffer.create(var152)
	buffer.copy(buff_1, 0, buff, 0, var152)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref), t (ref)
	local var152 = t_7.new()
	local var153 = 0
	while var153 < buffer.len(p7) do
		local _ = nil
		local var154 = nil
		local var155, var156, var157 = protoModule.readTag(p7, var153)
		local var158 = var155
		var154 = var156
		var153 = var157
		
		if var154 == protoModule.wireTypes.varint then
			local _ = nil
			local var159, var160 = protoModule.readVarInt(p7, var153)
			local _ = var159
			var153 = var160
			continue
		end
		if var154 == protoModule.wireTypes.lengthDelimited then
			if var158 == 1 then
				local _ = nil
				local var161, var162 = protoModule.readBuffer(p7, var153)
				var153 = var162
				var152.badge_id = buffer.tostring(var161)
			elseif var158 == 2 then
				local _ = nil
				local var163, var164 = protoModule.readBuffer(p7, var153)
				var153 = var164
				var152.universe_id = buffer.tostring(var163)
			elseif var158 == 3 then
				local _ = nil
				local var165, var166 = protoModule.readBuffer(p7, var153)
				var153 = var166
				var152.localized_literals = t.BadgeDetailsContent_LocalizedLiterals.decode(var165)
			elseif var158 == 4 then
				local _ = nil
				local var167, var168 = protoModule.readBuffer(p7, var153)
				var153 = var168
				var152.creator_key = buffer.tostring(var167)
			else
				local _ = nil
				local var169, var170 = protoModule.readVarInt(p7, var153)
				var153 = var170 + var169
			end
		elseif var154 == protoModule.wireTypes.i32 then
			local _ = nil
			local var171, var172 = protoModule.readFixed32(p7, var153)
			local _ = var171
			var153 = var172
		elseif var154 == protoModule.wireTypes.i64 then
			local _ = nil
			local var173, var174 = protoModule.readFixed64(p7, var153)
			local _ = var173
			var153 = var174
		else
			error("Unsupported wire type: " .. var243)
		end
	end
	return var152
end

function t_7:jsonEncode()
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

function t_7:jsonDecode()
	-- upvalues: t_7 (ref), t (ref)
	local var175 = t_7.new()
	
	if self.badge_id ~= nil then
		var175.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var175.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var175.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var175.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var175.localized_literals = t.BadgeDetailsContent_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var175.localized_literals = t.BadgeDetailsContent_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var175.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var175.creator_key = self.creatorKey
	end
	return var175
end

t_7.descriptor = {
	name = "BadgeDetailsContent",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsContent"
}
t.BadgeDetailsContent = t_7
typeRegistryModule.default:register(t.BadgeDetailsContent)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t_8 (ref)
	return setmetatable({
		info_table = if p8 == nil or p8.info_table == nil then nil else p8.info_table,
		action_module = if p8 == nil or p8.action_module == nil then nil else p8.action_module,
		overflow_menu = if p8 == nil or p8.overflow_menu == nil then nil else p8.overflow_menu
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var175 = 0
	
	if self.info_table ~= nil then
		local var176 = self.info_table:encode()
		local var177, var178 = protoModule.writeTag(buff, var175, 1, protoModule.wireTypes.lengthDelimited)
		var177, var270 = protoModule.writeBuffer(var177, var178, var176, buffer.len(var176))
		buff = var177
		var175 = var178
	end
	if self.action_module ~= nil then
		local var179 = self.action_module:encode()
		local var180, var181 = protoModule.writeTag(buff, var175, 2, protoModule.wireTypes.lengthDelimited)
		var180, var273 = protoModule.writeBuffer(var180, var181, var179, buffer.len(var179))
		buff = var180
		var175 = var181
	end
	if self.overflow_menu ~= nil then
		local var182 = self.overflow_menu:encode()
		local var183, var184 = protoModule.writeTag(buff, var175, 3, protoModule.wireTypes.lengthDelimited)
		var183, var276 = protoModule.writeBuffer(var183, var184, var182, buffer.len(var182))
		buff = var183
		var175 = var184
	end
	local buff_1 = buffer.create(var175)
	buffer.copy(buff_1, 0, buff, 0, var175)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var175 = t_8.new()
	local var176 = 0
	while var176 < buffer.len(p8) do
		local _ = nil
		local var177 = nil
		local var178, var179, var180 = protoModule.readTag(p8, var176)
		local var181 = var178
		var177 = var179
		var176 = var180
		
		if var177 == protoModule.wireTypes.varint then
			local _ = nil
			local var182, var183 = protoModule.readVarInt(p8, var176)
			local _ = var182
			var176 = var183
			continue
		end
		if var177 == protoModule.wireTypes.lengthDelimited then
			if var181 == 1 then
				local _ = nil
				local var184, var185 = protoModule.readBuffer(p8, var176)
				var176 = var185
				var175.info_table = t.BadgeDetailsContent_LocalizedLiterals_InfoTable.decode(var184)
			elseif var181 == 2 then
				local _ = nil
				local var186, var187 = protoModule.readBuffer(p8, var176)
				var176 = var187
				var175.action_module = t.BadgeDetailsContent_LocalizedLiterals_ActionModule.decode(var186)
			elseif var181 == 3 then
				local _ = nil
				local var188, var189 = protoModule.readBuffer(p8, var176)
				var176 = var189
				var175.overflow_menu = t.BadgeDetailsContent_LocalizedLiterals_OverflowMenu.decode(var188)
			else
				local _ = nil
				local var190, var191 = protoModule.readVarInt(p8, var176)
				var176 = var191 + var190
			end
		elseif var177 == protoModule.wireTypes.i32 then
			local _ = nil
			local var192, var193 = protoModule.readFixed32(p8, var176)
			local _ = var192
			var176 = var193
		elseif var177 == protoModule.wireTypes.i64 then
			local _ = nil
			local var194, var195 = protoModule.readFixed64(p8, var176)
			local _ = var194
			var176 = var195
		else
			error("Unsupported wire type: " .. var280)
		end
	end
	return var175
end

function t_8:jsonEncode()
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

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), t (ref)
	local var196 = t_8.new()
	
	if self.info_table ~= nil then
		var196.info_table = t.BadgeDetailsContent_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var196.info_table = t.BadgeDetailsContent_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var196.action_module = t.BadgeDetailsContent_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var196.action_module = t.BadgeDetailsContent_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var196.overflow_menu = t.BadgeDetailsContent_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var196.overflow_menu = t.BadgeDetailsContent_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var196
end

t_8.descriptor = {
	name = "BadgeDetailsContent_LocalizedLiterals",
	fullName = "roblox.apppageplatform.badges.v1beta1.LocalizedLiterals"
}
t.BadgeDetailsContent_LocalizedLiterals = t_8
typeRegistryModule.default:register(t.BadgeDetailsContent_LocalizedLiterals)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p9)
	-- upvalues: t_9 (ref)
	return setmetatable({
		type_label = if p9 == nil or p9.type_label == nil then "" else p9.type_label,
		earned_label = if p9 == nil or p9.earned_label == nil then "" else p9.earned_label,
		updated_label = if p9 == nil or p9.updated_label == nil then "" else p9.updated_label,
		experience_label = if p9 == nil or p9.experience_label == nil then "" else p9.experience_label,
		rarity_label = if p9 == nil or p9.rarity_label == nil then "" else p9.rarity_label,
		won_yesterday_label = if p9 == nil or p9.won_yesterday_label == nil then "" else p9.won_yesterday_label,
		won_ever_label = if p9 == nil or p9.won_ever_label == nil then "" else p9.won_ever_label
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var196 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var197, var198 = protoModule.writeTag(buff, var196, 1, protoModule.wireTypes.lengthDelimited)
		var197, var304 = protoModule.writeString(var197, var198, self.type_label)
		buff = var197
		var196 = var198
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var199, var200 = protoModule.writeTag(buff, var196, 2, protoModule.wireTypes.lengthDelimited)
		var199, var306 = protoModule.writeString(var199, var200, self.earned_label)
		buff = var199
		var196 = var200
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var201, var202 = protoModule.writeTag(buff, var196, 3, protoModule.wireTypes.lengthDelimited)
		var201, var308 = protoModule.writeString(var201, var202, self.updated_label)
		buff = var201
		var196 = var202
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var203, var204 = protoModule.writeTag(buff, var196, 4, protoModule.wireTypes.lengthDelimited)
		var203, var310 = protoModule.writeString(var203, var204, self.experience_label)
		buff = var203
		var196 = var204
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var205, var206 = protoModule.writeTag(buff, var196, 5, protoModule.wireTypes.lengthDelimited)
		var205, var312 = protoModule.writeString(var205, var206, self.rarity_label)
		buff = var205
		var196 = var206
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var207, var208 = protoModule.writeTag(buff, var196, 6, protoModule.wireTypes.lengthDelimited)
		var207, var314 = protoModule.writeString(var207, var208, self.won_yesterday_label)
		buff = var207
		var196 = var208
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var209, var210 = protoModule.writeTag(buff, var196, 7, protoModule.wireTypes.lengthDelimited)
		var209, var316 = protoModule.writeString(var209, var210, self.won_ever_label)
		buff = var209
		var196 = var210
	end
	local buff_1 = buffer.create(var196)
	buffer.copy(buff_1, 0, buff, 0, var196)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref)
	local var196 = t_9.new()
	local var197 = 0
	while var197 < buffer.len(p9) do
		local _ = nil
		local var198 = nil
		local var199, var200, var201 = protoModule.readTag(p9, var197)
		local var202 = var199
		var198 = var200
		var197 = var201
		
		if var198 == protoModule.wireTypes.varint then
			local _ = nil
			local var203, var204 = protoModule.readVarInt(p9, var197)
			local _ = var203
			var197 = var204
			continue
		end
		if var198 == protoModule.wireTypes.lengthDelimited then
			if var202 == 1 then
				local _ = nil
				local var205, var206 = protoModule.readBuffer(p9, var197)
				var197 = var206
				var196.type_label = buffer.tostring(var205)
			elseif var202 == 2 then
				local _ = nil
				local var207, var208 = protoModule.readBuffer(p9, var197)
				var197 = var208
				var196.earned_label = buffer.tostring(var207)
			elseif var202 == 3 then
				local _ = nil
				local var209, var210 = protoModule.readBuffer(p9, var197)
				var197 = var210
				var196.updated_label = buffer.tostring(var209)
			elseif var202 == 4 then
				local _ = nil
				local var211, var212 = protoModule.readBuffer(p9, var197)
				var197 = var212
				var196.experience_label = buffer.tostring(var211)
			elseif var202 == 5 then
				local _ = nil
				local var213, var214 = protoModule.readBuffer(p9, var197)
				var197 = var214
				var196.rarity_label = buffer.tostring(var213)
			elseif var202 == 6 then
				local _ = nil
				local var215, var216 = protoModule.readBuffer(p9, var197)
				var197 = var216
				var196.won_yesterday_label = buffer.tostring(var215)
			elseif var202 == 7 then
				local _ = nil
				local var217, var218 = protoModule.readBuffer(p9, var197)
				var197 = var218
				var196.won_ever_label = buffer.tostring(var217)
			else
				local _ = nil
				local var219, var220 = protoModule.readVarInt(p9, var197)
				var197 = var220 + var219
			end
		elseif var198 == protoModule.wireTypes.i32 then
			local _ = nil
			local var221, var222 = protoModule.readFixed32(p9, var197)
			local _ = var221
			var197 = var222
		elseif var198 == protoModule.wireTypes.i64 then
			local _ = nil
			local var223, var224 = protoModule.readFixed64(p9, var197)
			local _ = var223
			var197 = var224
		else
			error("Unsupported wire type: " .. var320)
		end
	end
	return var196
end

function t_9:jsonEncode()
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

function t_9:jsonDecode()
	-- upvalues: t_9 (ref)
	local var225 = t_9.new()
	
	if self.type_label ~= nil then
		var225.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var225.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var225.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var225.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var225.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var225.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var225.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var225.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var225.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var225.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var225.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var225.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var225.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var225.won_ever_label = self.wonEverLabel
	end
	return var225
end

t_9.descriptor = {
	name = "BadgeDetailsContent_LocalizedLiterals_InfoTable",
	fullName = "roblox.apppageplatform.badges.v1beta1.InfoTable"
}
t.BadgeDetailsContent_LocalizedLiterals_InfoTable = t_9
typeRegistryModule.default:register(t.BadgeDetailsContent_LocalizedLiterals_InfoTable)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p10)
	-- upvalues: t_10 (ref)
	return setmetatable({
		share = if p10 == nil or p10.share == nil then "" else p10.share,
		report = if p10 == nil or p10.report == nil then "" else p10.report
	}, t_10)
end

function t_10:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var225 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var226, var227 = protoModule.writeTag(buff, var225, 1, protoModule.wireTypes.lengthDelimited)
		var226, var352 = protoModule.writeString(var226, var227, self.share)
		buff = var226
		var225 = var227
	end
	if self.report ~= nil and self.report ~= "" then
		local var228, var229 = protoModule.writeTag(buff, var225, 2, protoModule.wireTypes.lengthDelimited)
		var228, var354 = protoModule.writeString(var228, var229, self.report)
		buff = var228
		var225 = var229
	end
	local buff_1 = buffer.create(var225)
	buffer.copy(buff_1, 0, buff, 0, var225)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref)
	local var225 = t_10.new()
	local var226 = 0
	while var226 < buffer.len(p10) do
		local _ = nil
		local var227 = nil
		local var228, var229, var230 = protoModule.readTag(p10, var226)
		local var231 = var228
		var227 = var229
		var226 = var230
		
		if var227 == protoModule.wireTypes.varint then
			local _ = nil
			local var232, var233 = protoModule.readVarInt(p10, var226)
			local _ = var232
			var226 = var233
			continue
		end
		if var227 == protoModule.wireTypes.lengthDelimited then
			if var231 == 1 then
				local _ = nil
				local var234, var235 = protoModule.readBuffer(p10, var226)
				var226 = var235
				var225.share = buffer.tostring(var234)
			elseif var231 == 2 then
				local _ = nil
				local var236, var237 = protoModule.readBuffer(p10, var226)
				var226 = var237
				var225.report = buffer.tostring(var236)
			else
				local _ = nil
				local var238, var239 = protoModule.readVarInt(p10, var226)
				var226 = var239 + var238
			end
		elseif var227 == protoModule.wireTypes.i32 then
			local _ = nil
			local var240, var241 = protoModule.readFixed32(p10, var226)
			local _ = var240
			var226 = var241
		elseif var227 == protoModule.wireTypes.i64 then
			local _ = nil
			local var242, var243 = protoModule.readFixed64(p10, var226)
			local _ = var242
			var226 = var243
		else
			error("Unsupported wire type: " .. var358)
		end
	end
	return var225
end

function t_10:jsonEncode()
	local t = {}
	
	if self.share ~= nil and self.share ~= "" then
		t.share = self.share
	end
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	return t
end

function t_10:jsonDecode()
	-- upvalues: t_10 (ref)
	local var244 = t_10.new()
	
	if self.share ~= nil then
		var244.share = self.share
	end
	if self.report ~= nil then
		var244.report = self.report
	end
	return var244
end

t_10.descriptor = {
	name = "BadgeDetailsContent_LocalizedLiterals_ActionModule",
	fullName = "roblox.apppageplatform.badges.v1beta1.ActionModule"
}
t.BadgeDetailsContent_LocalizedLiterals_ActionModule = t_10
typeRegistryModule.default:register(t.BadgeDetailsContent_LocalizedLiterals_ActionModule)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p11)
	-- upvalues: t_11 (ref)
	return setmetatable({
		report = if p11 == nil or p11.report == nil then "" else p11.report,
		remove = if p11 == nil or p11.remove == nil then "" else p11.remove
	}, t_11)
end

function t_11:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var244 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var245, var246 = protoModule.writeTag(buff, var244, 1, protoModule.wireTypes.lengthDelimited)
		var245, var380 = protoModule.writeString(var245, var246, self.report)
		buff = var245
		var244 = var246
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var247, var248 = protoModule.writeTag(buff, var244, 2, protoModule.wireTypes.lengthDelimited)
		var247, var382 = protoModule.writeString(var247, var248, self.remove)
		buff = var247
		var244 = var248
	end
	local buff_1 = buffer.create(var244)
	buffer.copy(buff_1, 0, buff, 0, var244)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref)
	local var244 = t_11.new()
	local var245 = 0
	while var245 < buffer.len(p11) do
		local _ = nil
		local var246 = nil
		local var247, var248, var249 = protoModule.readTag(p11, var245)
		local var250 = var247
		var246 = var248
		var245 = var249
		
		if var246 == protoModule.wireTypes.varint then
			local _ = nil
			local var251, var252 = protoModule.readVarInt(p11, var245)
			local _ = var251
			var245 = var252
			continue
		end
		if var246 == protoModule.wireTypes.lengthDelimited then
			if var250 == 1 then
				local _ = nil
				local var253, var254 = protoModule.readBuffer(p11, var245)
				var245 = var254
				var244.report = buffer.tostring(var253)
			elseif var250 == 2 then
				local _ = nil
				local var255, var256 = protoModule.readBuffer(p11, var245)
				var245 = var256
				var244.remove = buffer.tostring(var255)
			else
				local _ = nil
				local var257, var258 = protoModule.readVarInt(p11, var245)
				var245 = var258 + var257
			end
		elseif var246 == protoModule.wireTypes.i32 then
			local _ = nil
			local var259, var260 = protoModule.readFixed32(p11, var245)
			local _ = var259
			var245 = var260
		elseif var246 == protoModule.wireTypes.i64 then
			local _ = nil
			local var261, var262 = protoModule.readFixed64(p11, var245)
			local _ = var261
			var245 = var262
		else
			error("Unsupported wire type: " .. var386)
		end
	end
	return var244
end

function t_11:jsonEncode()
	local t = {}
	
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	if self.remove ~= nil and self.remove ~= "" then
		t.remove = self.remove
	end
	return t
end

function t_11:jsonDecode()
	-- upvalues: t_11 (ref)
	local var263 = t_11.new()
	
	if self.report ~= nil then
		var263.report = self.report
	end
	if self.remove ~= nil then
		var263.remove = self.remove
	end
	return var263
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