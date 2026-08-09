local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 300 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		feed_page_token = if p0 == nil or p0.feed_page_token == nil then "" else p0.feed_page_token,
		device = if p0 == nil or p0.device == nil then "" else p0.device,
		country = if p0 == nil or p0.country == nil then "" else p0.country,
		age_group = if p0 == nil or p0.age_group == nil then "" else p0.age_group,
		session_id = if p0 == nil or p0.session_id == nil then "" else p0.session_id,
		entry_pagination_key = if p0 == nil or p0.entry_pagination_key == nil then "" else p0.entry_pagination_key,
		entry_page_token = if p0 == nil or p0.entry_page_token == nil then "" else p0.entry_page_token,
		max_memory = if p0 == nil or p0.max_memory == nil then "" else p0.max_memory,
		page_type = if p0 == nil or p0.page_type == nil then "" else p0.page_type,
		include_placeholders = if p0 == nil or p0.include_placeholders == nil then nil else p0.include_placeholders
	}, t_1)
end

function t_1:encode() --[[ line: 319 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var15 = 0
	
	if self.feed_page_token ~= nil and self.feed_page_token ~= "" then
		local var16, var17 = protoModule.writeTag(buff, var15, 1, protoModule.wireTypes.lengthDelimited)
		var16, var17 = protoModule.writeString(var16, var17, self.feed_page_token)
		buff = var16
		var15 = var17
	end
	if self.device ~= nil and self.device ~= "" then
		local var18, var19 = protoModule.writeTag(buff, var15, 2, protoModule.wireTypes.lengthDelimited)
		var18, var19 = protoModule.writeString(var18, var19, self.device)
		buff = var18
		var15 = var19
	end
	if self.country ~= nil and self.country ~= "" then
		local var20, var21 = protoModule.writeTag(buff, var15, 3, protoModule.wireTypes.lengthDelimited)
		var20, var21 = protoModule.writeString(var20, var21, self.country)
		buff = var20
		var15 = var21
	end
	if self.age_group ~= nil and self.age_group ~= "" then
		local var22, var23 = protoModule.writeTag(buff, var15, 4, protoModule.wireTypes.lengthDelimited)
		var22, var23 = protoModule.writeString(var22, var23, self.age_group)
		buff = var22
		var15 = var23
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		local var24, var25 = protoModule.writeTag(buff, var15, 5, protoModule.wireTypes.lengthDelimited)
		var24, var25 = protoModule.writeString(var24, var25, self.session_id)
		buff = var24
		var15 = var25
	end
	if self.entry_pagination_key ~= nil and self.entry_pagination_key ~= "" then
		local var26, var27 = protoModule.writeTag(buff, var15, 6, protoModule.wireTypes.lengthDelimited)
		var26, var27 = protoModule.writeString(var26, var27, self.entry_pagination_key)
		buff = var26
		var15 = var27
	end
	if self.entry_page_token ~= nil and self.entry_page_token ~= "" then
		local var28, var29 = protoModule.writeTag(buff, var15, 7, protoModule.wireTypes.lengthDelimited)
		var28, var29 = protoModule.writeString(var28, var29, self.entry_page_token)
		buff = var28
		var15 = var29
	end
	if self.max_memory ~= nil and self.max_memory ~= "" then
		local var30, var31 = protoModule.writeTag(buff, var15, 8, protoModule.wireTypes.lengthDelimited)
		var30, var31 = protoModule.writeString(var30, var31, self.max_memory)
		buff = var30
		var15 = var31
	end
	if self.page_type ~= nil and self.page_type ~= "" then
		local var32, var33 = protoModule.writeTag(buff, var15, 9, protoModule.wireTypes.lengthDelimited)
		var32, var33 = protoModule.writeString(var32, var33, self.page_type)
		buff = var32
		var15 = var33
	end
	if self.include_placeholders ~= nil then
		local var34, var35 = protoModule.writeTag(buff, var15, 10, protoModule.wireTypes.varint)
		var34, var35 = protoModule.writeVarInt(var34, var35, if self.include_placeholders then 1 else 0)
		buff = var34
		var15 = var35
	end
	local buff_1 = buffer.create(var15)
	buffer.copy(buff_1, 0, buff, 0, var15)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 378 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var37 = t_1.new()
	local var38 = 0
	while var38 < buffer.len(p1) do
		local _ = nil
		local var39 = nil
		local var40, var41, var42 = protoModule.readTag(p1, var38)
		local var43 = var40
		var39 = var41
		var38 = var42
		
		if var39 == protoModule.wireTypes.varint then
			if var43 == 10 then
				local _ = nil
				local var44, var45 = protoModule.readVarInt(p1, var38)
				var38 = var45
				var37.include_placeholders = var44 ~= 0
			else
				local _ = nil
				local var46, var47 = protoModule.readVarInt(p1, var38)
				local _ = var46
				var38 = var47
			end
		end
		if var39 == protoModule.wireTypes.lengthDelimited then
			if var43 == 1 then
				local _ = nil
				local var48, var49 = protoModule.readBuffer(p1, var38)
				var38 = var49
				var37.feed_page_token = buffer.tostring(var48)
			elseif var43 == 2 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p1, var38)
				var38 = var51
				var37.device = buffer.tostring(var50)
			elseif var43 == 3 then
				local _ = nil
				local var52, var53 = protoModule.readBuffer(p1, var38)
				var38 = var53
				var37.country = buffer.tostring(var52)
			elseif var43 == 4 then
				local _ = nil
				local var54, var55 = protoModule.readBuffer(p1, var38)
				var38 = var55
				var37.age_group = buffer.tostring(var54)
			elseif var43 == 5 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p1, var38)
				var38 = var57
				var37.session_id = buffer.tostring(var56)
			elseif var43 == 6 then
				local _ = nil
				local var58, var59 = protoModule.readBuffer(p1, var38)
				var38 = var59
				var37.entry_pagination_key = buffer.tostring(var58)
			elseif var43 == 7 then
				local _ = nil
				local var60, var61 = protoModule.readBuffer(p1, var38)
				var38 = var61
				var37.entry_page_token = buffer.tostring(var60)
			elseif var43 == 8 then
				local _ = nil
				local var62, var63 = protoModule.readBuffer(p1, var38)
				var38 = var63
				var37.max_memory = buffer.tostring(var62)
			elseif var43 == 9 then
				local _ = nil
				local var64, var65 = protoModule.readBuffer(p1, var38)
				var38 = var65
				var37.page_type = buffer.tostring(var64)
			else
				local _ = nil
				local var66, var67 = protoModule.readVarInt(p1, var38)
				var38 = var67 + var66
			end
		elseif var39 == protoModule.wireTypes.i32 then
			local _ = nil
			local var68, var69 = protoModule.readFixed32(p1, var38)
			local _ = var68
			var38 = var69
		elseif var39 == protoModule.wireTypes.i64 then
			local _ = nil
			local var70, var71 = protoModule.readFixed64(p1, var38)
			local _ = var70
			var38 = var71
		else
			error("Unsupported wire type: " .. var39)
		end
	end
	return var37
end

function t_1:jsonEncode() --[[ line: 466 ]]
	local t = {}
	
	if self.feed_page_token ~= nil and self.feed_page_token ~= "" then
		t.feedPageToken = self.feed_page_token
	end
	if self.device ~= nil and self.device ~= "" then
		t.device = self.device
	end
	if self.country ~= nil and self.country ~= "" then
		t.country = self.country
	end
	if self.age_group ~= nil and self.age_group ~= "" then
		t.ageGroup = self.age_group
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		t.sessionId = self.session_id
	end
	if self.entry_pagination_key ~= nil and self.entry_pagination_key ~= "" then
		t.entryPaginationKey = self.entry_pagination_key
	end
	if self.entry_page_token ~= nil and self.entry_page_token ~= "" then
		t.entryPageToken = self.entry_page_token
	end
	if self.max_memory ~= nil and self.max_memory ~= "" then
		t.maxMemory = self.max_memory
	end
	if self.page_type ~= nil and self.page_type ~= "" then
		t.pageType = self.page_type
	end
	if self.include_placeholders ~= nil then
		t.includePlaceholders = self.include_placeholders
	end
	return t
end

function t_1:jsonDecode() --[[ line: 512 ]]
	-- upvalues: t_1 (ref)
	local var73 = t_1.new()
	
	if self.feed_page_token ~= nil then
		var73.feed_page_token = self.feed_page_token
	end
	if self.feedPageToken ~= nil then
		var73.feed_page_token = self.feedPageToken
	end
	if self.device ~= nil then
		var73.device = self.device
	end
	if self.country ~= nil then
		var73.country = self.country
	end
	if self.age_group ~= nil then
		var73.age_group = self.age_group
	end
	if self.ageGroup ~= nil then
		var73.age_group = self.ageGroup
	end
	if self.session_id ~= nil then
		var73.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		var73.session_id = self.sessionId
	end
	if self.entry_pagination_key ~= nil then
		var73.entry_pagination_key = self.entry_pagination_key
	end
	if self.entryPaginationKey ~= nil then
		var73.entry_pagination_key = self.entryPaginationKey
	end
	if self.entry_page_token ~= nil then
		var73.entry_page_token = self.entry_page_token
	end
	if self.entryPageToken ~= nil then
		var73.entry_page_token = self.entryPageToken
	end
	if self.max_memory ~= nil then
		var73.max_memory = self.max_memory
	end
	if self.maxMemory ~= nil then
		var73.max_memory = self.maxMemory
	end
	if self.page_type ~= nil then
		var73.page_type = self.page_type
	end
	if self.pageType ~= nil then
		var73.page_type = self.pageType
	end
	if self.include_placeholders ~= nil then
		var73.include_placeholders = self.include_placeholders
	end
	if self.includePlaceholders ~= nil then
		var73.include_placeholders = self.includePlaceholders
	end
	return var73
end

t_1.descriptor = {
	name = "GetChartsPageRequest",
	fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsPageRequest"
}
t.GetChartsPageRequest = t_1
typeRegistryModule.default:register(t.GetChartsPageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 604 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		page_entries = if p2 == nil or p2.page_entries == nil then {} else p2.page_entries,
		hydration_data = if p2 == nil or p2.hydration_data == nil then nil else p2.hydration_data,
		templates = if p2 == nil or p2.templates == nil then {} else p2.templates,
		localized_literals = if p2 == nil or p2.localized_literals == nil then {} else p2.localized_literals
	}, t_2)
end

function t_2:encode() --[[ line: 613 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var75 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var76 = v:encode()
			local var77, var78 = protoModule.writeTag(buff, var75, 1, protoModule.wireTypes.lengthDelimited)
			var77, var78 = protoModule.writeBuffer(var77, var78, var76, buffer.len(var76))
			buff = var77
			var75 = var78
		end
	end
	if self.hydration_data ~= nil then
		local var79 = self.hydration_data:encode()
		local var80, var81 = protoModule.writeTag(buff, var75, 2, protoModule.wireTypes.lengthDelimited)
		var80, var81 = protoModule.writeBuffer(var80, var81, var79, buffer.len(var79))
		buff = var80
		var75 = var81
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var82, var83 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var82, var83 = protoModule.writeString(var82, var83, i)
			local var84 = v:encode()
			var83, var85 = protoModule.writeTag(var82, var83, 2, protoModule.wireTypes.lengthDelimited)
			var83, var85 = protoModule.writeBuffer(var83, var85, var84, buffer.len(var84))
			local var86 = var83
			local var87 = var85
			local var88, var89 = protoModule.writeTag(buff, var75, 3, protoModule.wireTypes.lengthDelimited)
			var88, var89 = protoModule.writeBuffer(var88, var89, var86, var87)
			buff = var88
			var75 = var89
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var90, var91 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var90, var91 = protoModule.writeString(var90, var91, i)
			var90, var91 = protoModule.writeTag(var90, var91, 2, protoModule.wireTypes.lengthDelimited)
			var90, var91 = protoModule.writeString(var90, var91, v)
			local var92 = var90
			local var93 = var91
			local var94, var95 = protoModule.writeTag(buff, var75, 4, protoModule.wireTypes.lengthDelimited)
			var94, var95 = protoModule.writeBuffer(var94, var95, var92, var93)
			buff = var94
			var75 = var95
		end
	end
	local buff_1 = buffer.create(var75)
	buffer.copy(buff_1, 0, buff, 0, var75)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 663 ]]
	-- upvalues: t_2 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var97 = t_2.new()
	local var98 = 0
	while var98 < buffer.len(p3) do
		local _ = nil
		local var99 = nil
		local var100, var101, var102 = protoModule.readTag(p3, var98)
		local var103 = var100
		var99 = var101
		var98 = var102
		
		if var99 == protoModule.wireTypes.varint then
			local _ = nil
			local var104, var105 = protoModule.readVarInt(p3, var98)
			local _ = var104
			var98 = var105
			continue
		end
		if var99 == protoModule.wireTypes.lengthDelimited then
			if var103 == 1 then
				local _ = nil
				local var106, var107 = protoModule.readBuffer(p3, var98)
				var98 = var107
				table.insert(var97.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var106))
			elseif var103 == 2 then
				local _ = nil
				local var108, var109 = protoModule.readBuffer(p3, var98)
				var98 = var109
				var97.hydration_data = hydrationContentModule.HydrationContent.decode(var108)
			elseif var103 == 3 then
				local _ = nil
				local var110, var111 = protoModule.readBuffer(p3, var98)
				var98 = var111
				var110 = t.GetChartsPageResponse_TemplatesEntry.decode(var110)
				var97.templates[var110.key or ""] = var110.value or templateEntryModule.TemplateEntry.new()
			elseif var103 == 4 then
				local _ = nil
				local var112, var113 = protoModule.readBuffer(p3, var98)
				var98 = var113
				var112 = t.GetChartsPageResponse_LocalizedLiteralsEntry.decode(var112)
				var97.localized_literals[var112.key or ""] = var112.value or ""
			else
				local _ = nil
				local var114, var115 = protoModule.readVarInt(p3, var98)
				var98 = var115 + var114
			end
		elseif var99 == protoModule.wireTypes.i32 then
			local _ = nil
			local var116, var117 = protoModule.readFixed32(p3, var98)
			local _ = var116
			var98 = var117
		elseif var99 == protoModule.wireTypes.i64 then
			local _ = nil
			local var118, var119 = protoModule.readFixed64(p3, var98)
			local _ = var118
			var98 = var119
		else
			error("Unsupported wire type: " .. var99)
		end
	end
	return var97
end

function t_2:jsonEncode() --[[ line: 739 ]]
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

function t_2:jsonDecode() --[[ line: 773 ]]
	-- upvalues: t_2 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var124 = t_2.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var124.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var124.page_entries = t
	end
	if self.hydration_data ~= nil then
		var124.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var124.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var124.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var124.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var124.localized_literals = t
	end
	return var124
end

t_2.descriptor = {
	name = "GetChartsPageResponse",
	fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsPageResponse"
}
t.GetChartsPageResponse = t_2
typeRegistryModule.default:register(t.GetChartsPageResponse)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 856 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then nil else p4.value
	}, t_3)
end

function t_3:encode() --[[ line: 865 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var131 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var132, var133 = protoModule.writeTag(buff, var131, 1, protoModule.wireTypes.lengthDelimited)
		var132, var133 = protoModule.writeString(var132, var133, self.key)
		buff = var132
		var131 = var133
	end
	if self.value ~= nil then
		local var134 = self.value:encode()
		local var135, var136 = protoModule.writeTag(buff, var131, 2, protoModule.wireTypes.lengthDelimited)
		var135, var136 = protoModule.writeBuffer(var135, var136, var134, buffer.len(var134))
		buff = var135
		var131 = var136
	end
	local buff_1 = buffer.create(var131)
	buffer.copy(buff_1, 0, buff, 0, var131)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 885 ]]
	-- upvalues: t_3 (ref), protoModule (ref), templateEntryModule (ref)
	local var138 = t_3.new()
	local var139 = 0
	while var139 < buffer.len(p5) do
		local _ = nil
		local var140 = nil
		local var141, var142, var143 = protoModule.readTag(p5, var139)
		local var144 = var141
		var140 = var142
		var139 = var143
		
		if var140 == protoModule.wireTypes.varint then
			local _ = nil
			local var145, var146 = protoModule.readVarInt(p5, var139)
			local _ = var145
			var139 = var146
			continue
		end
		if var140 == protoModule.wireTypes.lengthDelimited then
			if var144 == 1 then
				local _ = nil
				local var147, var148 = protoModule.readBuffer(p5, var139)
				var139 = var148
				var138.key = buffer.tostring(var147)
			elseif var144 == 2 then
				local _ = nil
				local var149, var150 = protoModule.readBuffer(p5, var139)
				var139 = var150
				var138.value = templateEntryModule.TemplateEntry.decode(var149)
			else
				local _ = nil
				local var151, var152 = protoModule.readVarInt(p5, var139)
				var139 = var152 + var151
			end
		elseif var140 == protoModule.wireTypes.i32 then
			local _ = nil
			local var153, var154 = protoModule.readFixed32(p5, var139)
			local _ = var153
			var139 = var154
		elseif var140 == protoModule.wireTypes.i64 then
			local _ = nil
			local var155, var156 = protoModule.readFixed64(p5, var139)
			local _ = var155
			var139 = var156
		else
			error("Unsupported wire type: " .. var140)
		end
	end
	return var138
end

function t_3:jsonEncode() --[[ line: 933 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode() --[[ line: 947 ]]
	-- upvalues: t_3 (ref), templateEntryModule (ref)
	local var158 = t_3.new()
	
	if self.key ~= nil then
		var158.key = self.key
	end
	if self.value ~= nil then
		var158.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var158
end

t_3.descriptor = {
	name = "GetChartsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.TemplatesEntry"
}
t.GetChartsPageResponse_TemplatesEntry = t_3
typeRegistryModule.default:register(t.GetChartsPageResponse_TemplatesEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 977 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		key = if p6 == nil or p6.key == nil then "" else p6.key,
		value = if p6 == nil or p6.value == nil then "" else p6.value
	}, t_4)
end

function t_4:encode() --[[ line: 986 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var160 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var161, var162 = protoModule.writeTag(buff, var160, 1, protoModule.wireTypes.lengthDelimited)
		var161, var162 = protoModule.writeString(var161, var162, self.key)
		buff = var161
		var160 = var162
	end
	if self.value ~= nil and self.value ~= "" then
		local var163, var164 = protoModule.writeTag(buff, var160, 2, protoModule.wireTypes.lengthDelimited)
		var163, var164 = protoModule.writeString(var163, var164, self.value)
		buff = var163
		var160 = var164
	end
	local buff_1 = buffer.create(var160)
	buffer.copy(buff_1, 0, buff, 0, var160)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 1007 ]]
	-- upvalues: t_4 (ref), protoModule (ref)
	local var166 = t_4.new()
	local var167 = 0
	while var167 < buffer.len(p7) do
		local _ = nil
		local var168 = nil
		local var169, var170, var171 = protoModule.readTag(p7, var167)
		local var172 = var169
		var168 = var170
		var167 = var171
		
		if var168 == protoModule.wireTypes.varint then
			local _ = nil
			local var173, var174 = protoModule.readVarInt(p7, var167)
			local _ = var173
			var167 = var174
			continue
		end
		if var168 == protoModule.wireTypes.lengthDelimited then
			if var172 == 1 then
				local _ = nil
				local var175, var176 = protoModule.readBuffer(p7, var167)
				var167 = var176
				var166.key = buffer.tostring(var175)
			elseif var172 == 2 then
				local _ = nil
				local var177, var178 = protoModule.readBuffer(p7, var167)
				var167 = var178
				var166.value = buffer.tostring(var177)
			else
				local _ = nil
				local var179, var180 = protoModule.readVarInt(p7, var167)
				var167 = var180 + var179
			end
		elseif var168 == protoModule.wireTypes.i32 then
			local _ = nil
			local var181, var182 = protoModule.readFixed32(p7, var167)
			local _ = var181
			var167 = var182
		elseif var168 == protoModule.wireTypes.i64 then
			local _ = nil
			local var183, var184 = protoModule.readFixed64(p7, var167)
			local _ = var183
			var167 = var184
		else
			error("Unsupported wire type: " .. var168)
		end
	end
	return var166
end

function t_4:jsonEncode() --[[ line: 1057 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_4:jsonDecode() --[[ line: 1073 ]]
	-- upvalues: t_4 (ref)
	local var186 = t_4.new()
	
	if self.key ~= nil then
		var186.key = self.key
	end
	if self.value ~= nil then
		var186.value = self.value
	end
	return var186
end

t_4.descriptor = {
	name = "GetChartsPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.LocalizedLiteralsEntry"
}
t.GetChartsPageResponse_LocalizedLiteralsEntry = t_4
typeRegistryModule.default:register(t.GetChartsPageResponse_LocalizedLiteralsEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 1103 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		sort_id = if p8 == nil or p8.sort_id == nil then "" else p8.sort_id,
		content_page_token = if p8 == nil or p8.content_page_token == nil then "" else p8.content_page_token,
		device = if p8 == nil or p8.device == nil then "" else p8.device,
		country = if p8 == nil or p8.country == nil then "" else p8.country,
		session_id = if p8 == nil or p8.session_id == nil then "" else p8.session_id,
		age_group = if p8 == nil or p8.age_group == nil then "" else p8.age_group,
		max_memory = if p8 == nil or p8.max_memory == nil then "" else p8.max_memory
	}, t_5)
end

function t_5:encode() --[[ line: 1117 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var188 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var189, var190 = protoModule.writeTag(buff, var188, 1, protoModule.wireTypes.lengthDelimited)
		var189, var190 = protoModule.writeString(var189, var190, self.sort_id)
		buff = var189
		var188 = var190
	end
	if self.content_page_token ~= nil and self.content_page_token ~= "" then
		local var191, var192 = protoModule.writeTag(buff, var188, 2, protoModule.wireTypes.lengthDelimited)
		var191, var192 = protoModule.writeString(var191, var192, self.content_page_token)
		buff = var191
		var188 = var192
	end
	if self.device ~= nil and self.device ~= "" then
		local var193, var194 = protoModule.writeTag(buff, var188, 3, protoModule.wireTypes.lengthDelimited)
		var193, var194 = protoModule.writeString(var193, var194, self.device)
		buff = var193
		var188 = var194
	end
	if self.country ~= nil and self.country ~= "" then
		local var195, var196 = protoModule.writeTag(buff, var188, 4, protoModule.wireTypes.lengthDelimited)
		var195, var196 = protoModule.writeString(var195, var196, self.country)
		buff = var195
		var188 = var196
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		local var197, var198 = protoModule.writeTag(buff, var188, 5, protoModule.wireTypes.lengthDelimited)
		var197, var198 = protoModule.writeString(var197, var198, self.session_id)
		buff = var197
		var188 = var198
	end
	if self.age_group ~= nil and self.age_group ~= "" then
		local var199, var200 = protoModule.writeTag(buff, var188, 6, protoModule.wireTypes.lengthDelimited)
		var199, var200 = protoModule.writeString(var199, var200, self.age_group)
		buff = var199
		var188 = var200
	end
	if self.max_memory ~= nil and self.max_memory ~= "" then
		local var201, var202 = protoModule.writeTag(buff, var188, 7, protoModule.wireTypes.lengthDelimited)
		var201, var202 = protoModule.writeString(var201, var202, self.max_memory)
		buff = var201
		var188 = var202
	end
	local buff_1 = buffer.create(var188)
	buffer.copy(buff_1, 0, buff, 0, var188)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 1161 ]]
	-- upvalues: t_5 (ref), protoModule (ref)
	local var204 = t_5.new()
	local var205 = 0
	while var205 < buffer.len(p9) do
		local _ = nil
		local var206 = nil
		local var207, var208, var209 = protoModule.readTag(p9, var205)
		local var210 = var207
		var206 = var208
		var205 = var209
		
		if var206 == protoModule.wireTypes.varint then
			local _ = nil
			local var211, var212 = protoModule.readVarInt(p9, var205)
			local _ = var211
			var205 = var212
			continue
		end
		if var206 == protoModule.wireTypes.lengthDelimited then
			if var210 == 1 then
				local _ = nil
				local var213, var214 = protoModule.readBuffer(p9, var205)
				var205 = var214
				var204.sort_id = buffer.tostring(var213)
			elseif var210 == 2 then
				local _ = nil
				local var215, var216 = protoModule.readBuffer(p9, var205)
				var205 = var216
				var204.content_page_token = buffer.tostring(var215)
			elseif var210 == 3 then
				local _ = nil
				local var217, var218 = protoModule.readBuffer(p9, var205)
				var205 = var218
				var204.device = buffer.tostring(var217)
			elseif var210 == 4 then
				local _ = nil
				local var219, var220 = protoModule.readBuffer(p9, var205)
				var205 = var220
				var204.country = buffer.tostring(var219)
			elseif var210 == 5 then
				local _ = nil
				local var221, var222 = protoModule.readBuffer(p9, var205)
				var205 = var222
				var204.session_id = buffer.tostring(var221)
			elseif var210 == 6 then
				local _ = nil
				local var223, var224 = protoModule.readBuffer(p9, var205)
				var205 = var224
				var204.age_group = buffer.tostring(var223)
			elseif var210 == 7 then
				local _ = nil
				local var225, var226 = protoModule.readBuffer(p9, var205)
				var205 = var226
				var204.max_memory = buffer.tostring(var225)
			else
				local _ = nil
				local var227, var228 = protoModule.readVarInt(p9, var205)
				var205 = var228 + var227
			end
		elseif var206 == protoModule.wireTypes.i32 then
			local _ = nil
			local var229, var230 = protoModule.readFixed32(p9, var205)
			local _ = var229
			var205 = var230
		elseif var206 == protoModule.wireTypes.i64 then
			local _ = nil
			local var231, var232 = protoModule.readFixed64(p9, var205)
			local _ = var231
			var205 = var232
		else
			error("Unsupported wire type: " .. var206)
		end
	end
	return var204
end

function t_5:jsonEncode() --[[ line: 1234 ]]
	local t = {}
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.content_page_token ~= nil and self.content_page_token ~= "" then
		t.contentPageToken = self.content_page_token
	end
	if self.device ~= nil and self.device ~= "" then
		t.device = self.device
	end
	if self.country ~= nil and self.country ~= "" then
		t.country = self.country
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		t.sessionId = self.session_id
	end
	if self.age_group ~= nil and self.age_group ~= "" then
		t.ageGroup = self.age_group
	end
	if self.max_memory ~= nil and self.max_memory ~= "" then
		t.maxMemory = self.max_memory
	end
	return t
end

function t_5:jsonDecode() --[[ line: 1268 ]]
	-- upvalues: t_5 (ref)
	local var234 = t_5.new()
	
	if self.sort_id ~= nil then
		var234.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var234.sort_id = self.sortId
	end
	if self.content_page_token ~= nil then
		var234.content_page_token = self.content_page_token
	end
	if self.contentPageToken ~= nil then
		var234.content_page_token = self.contentPageToken
	end
	if self.device ~= nil then
		var234.device = self.device
	end
	if self.country ~= nil then
		var234.country = self.country
	end
	if self.session_id ~= nil then
		var234.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		var234.session_id = self.sessionId
	end
	if self.age_group ~= nil then
		var234.age_group = self.age_group
	end
	if self.ageGroup ~= nil then
		var234.age_group = self.ageGroup
	end
	if self.max_memory ~= nil then
		var234.max_memory = self.max_memory
	end
	if self.maxMemory ~= nil then
		var234.max_memory = self.maxMemory
	end
	return var234
end

t_5.descriptor = {
	name = "GetChartsSortDetailRequest",
	fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsSortDetailRequest"
}
t.GetChartsSortDetailRequest = t_5
typeRegistryModule.default:register(t.GetChartsSortDetailRequest)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 1336 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		page_entries = if p10 == nil or p10.page_entries == nil then {} else p10.page_entries,
		hydration_data = if p10 == nil or p10.hydration_data == nil then nil else p10.hydration_data,
		templates = if p10 == nil or p10.templates == nil then {} else p10.templates,
		next_content_page_token = if p10 == nil or p10.next_content_page_token == nil then "" else p10.next_content_page_token,
		localized_literals = if p10 == nil or p10.localized_literals == nil then {} else p10.localized_literals
	}, t_6)
end

function t_6:encode() --[[ line: 1350 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var236 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var237 = v:encode()
			local var238, var239 = protoModule.writeTag(buff, var236, 1, protoModule.wireTypes.lengthDelimited)
			var238, var239 = protoModule.writeBuffer(var238, var239, var237, buffer.len(var237))
			buff = var238
			var236 = var239
		end
	end
	if self.hydration_data ~= nil then
		local var240 = self.hydration_data:encode()
		local var241, var242 = protoModule.writeTag(buff, var236, 2, protoModule.wireTypes.lengthDelimited)
		var241, var242 = protoModule.writeBuffer(var241, var242, var240, buffer.len(var240))
		buff = var241
		var236 = var242
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var243, var244 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var243, var244 = protoModule.writeString(var243, var244, i)
			local var245 = v:encode()
			var244, var246 = protoModule.writeTag(var243, var244, 2, protoModule.wireTypes.lengthDelimited)
			var244, var246 = protoModule.writeBuffer(var244, var246, var245, buffer.len(var245))
			local var247 = var244
			local var248 = var246
			local var249, var250 = protoModule.writeTag(buff, var236, 3, protoModule.wireTypes.lengthDelimited)
			var249, var250 = protoModule.writeBuffer(var249, var250, var247, var248)
			buff = var249
			var236 = var250
		end
	end
	if self.next_content_page_token ~= nil and self.next_content_page_token ~= "" then
		local var251, var252 = protoModule.writeTag(buff, var236, 4, protoModule.wireTypes.lengthDelimited)
		var251, var252 = protoModule.writeString(var251, var252, self.next_content_page_token)
		buff = var251
		var236 = var252
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var253, var254 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var253, var254 = protoModule.writeString(var253, var254, i)
			var253, var254 = protoModule.writeTag(var253, var254, 2, protoModule.wireTypes.lengthDelimited)
			var253, var254 = protoModule.writeString(var253, var254, v)
			local var255 = var253
			local var256 = var254
			local var257, var258 = protoModule.writeTag(buff, var236, 5, protoModule.wireTypes.lengthDelimited)
			var257, var258 = protoModule.writeBuffer(var257, var258, var255, var256)
			buff = var257
			var236 = var258
		end
	end
	local buff_1 = buffer.create(var236)
	buffer.copy(buff_1, 0, buff, 0, var236)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 1405 ]]
	-- upvalues: t_6 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var260 = t_6.new()
	local var261 = 0
	while var261 < buffer.len(p11) do
		local _ = nil
		local var262 = nil
		local var263, var264, var265 = protoModule.readTag(p11, var261)
		local var266 = var263
		var262 = var264
		var261 = var265
		
		if var262 == protoModule.wireTypes.varint then
			local _ = nil
			local var267, var268 = protoModule.readVarInt(p11, var261)
			local _ = var267
			var261 = var268
			continue
		end
		if var262 == protoModule.wireTypes.lengthDelimited then
			if var266 == 1 then
				local _ = nil
				local var269, var270 = protoModule.readBuffer(p11, var261)
				var261 = var270
				table.insert(var260.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var269))
			elseif var266 == 2 then
				local _ = nil
				local var271, var272 = protoModule.readBuffer(p11, var261)
				var261 = var272
				var260.hydration_data = hydrationContentModule.HydrationContent.decode(var271)
			elseif var266 == 3 then
				local _ = nil
				local var273, var274 = protoModule.readBuffer(p11, var261)
				var261 = var274
				var273 = t.GetChartsSortDetailResponse_TemplatesEntry.decode(var273)
				var260.templates[var273.key or ""] = var273.value or templateEntryModule.TemplateEntry.new()
			elseif var266 == 4 then
				local _ = nil
				local var275, var276 = protoModule.readBuffer(p11, var261)
				var261 = var276
				var260.next_content_page_token = buffer.tostring(var275)
			elseif var266 == 5 then
				local _ = nil
				local var277, var278 = protoModule.readBuffer(p11, var261)
				var261 = var278
				var277 = t.GetChartsSortDetailResponse_LocalizedLiteralsEntry.decode(var277)
				var260.localized_literals[var277.key or ""] = var277.value or ""
			else
				local _ = nil
				local var279, var280 = protoModule.readVarInt(p11, var261)
				var261 = var280 + var279
			end
		elseif var262 == protoModule.wireTypes.i32 then
			local _ = nil
			local var281, var282 = protoModule.readFixed32(p11, var261)
			local _ = var281
			var261 = var282
		elseif var262 == protoModule.wireTypes.i64 then
			local _ = nil
			local var283, var284 = protoModule.readFixed64(p11, var261)
			local _ = var283
			var261 = var284
		else
			error("Unsupported wire type: " .. var262)
		end
	end
	return var260
end

function t_6:jsonEncode() --[[ line: 1486 ]]
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
	if self.next_content_page_token ~= nil and self.next_content_page_token ~= "" then
		t.nextContentPageToken = self.next_content_page_token
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

function t_6:jsonDecode() --[[ line: 1524 ]]
	-- upvalues: t_6 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var289 = t_6.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var289.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var289.page_entries = t
	end
	if self.hydration_data ~= nil then
		var289.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var289.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var289.templates = t
	end
	if self.next_content_page_token ~= nil then
		var289.next_content_page_token = self.next_content_page_token
	end
	if self.nextContentPageToken ~= nil then
		var289.next_content_page_token = self.nextContentPageToken
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var289.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var289.localized_literals = t
	end
	return var289
end

t_6.descriptor = {
	name = "GetChartsSortDetailResponse",
	fullName = "roblox.apppageplatform.charts.v1beta1.GetChartsSortDetailResponse"
}
t.GetChartsSortDetailResponse = t_6
typeRegistryModule.default:register(t.GetChartsSortDetailResponse)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12) --[[ line: 1615 ]]
	-- upvalues: t_7 (ref)
	return setmetatable({
		key = if p12 == nil or p12.key == nil then "" else p12.key,
		value = if p12 == nil or p12.value == nil then nil else p12.value
	}, t_7)
end

function t_7:encode() --[[ line: 1624 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var296 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var297, var298 = protoModule.writeTag(buff, var296, 1, protoModule.wireTypes.lengthDelimited)
		var297, var298 = protoModule.writeString(var297, var298, self.key)
		buff = var297
		var296 = var298
	end
	if self.value ~= nil then
		local var299 = self.value:encode()
		local var300, var301 = protoModule.writeTag(buff, var296, 2, protoModule.wireTypes.lengthDelimited)
		var300, var301 = protoModule.writeBuffer(var300, var301, var299, buffer.len(var299))
		buff = var300
		var296 = var301
	end
	local buff_1 = buffer.create(var296)
	buffer.copy(buff_1, 0, buff, 0, var296)
	
	return buff_1
end

function t_7.decode(p13) --[[ line: 1646 ]]
	-- upvalues: t_7 (ref), protoModule (ref), templateEntryModule (ref)
	local var303 = t_7.new()
	local var304 = 0
	while var304 < buffer.len(p13) do
		local _ = nil
		local var305 = nil
		local var306, var307, var308 = protoModule.readTag(p13, var304)
		local var309 = var306
		var305 = var307
		var304 = var308
		
		if var305 == protoModule.wireTypes.varint then
			local _ = nil
			local var310, var311 = protoModule.readVarInt(p13, var304)
			local _ = var310
			var304 = var311
			continue
		end
		if var305 == protoModule.wireTypes.lengthDelimited then
			if var309 == 1 then
				local _ = nil
				local var312, var313 = protoModule.readBuffer(p13, var304)
				var304 = var313
				var303.key = buffer.tostring(var312)
			elseif var309 == 2 then
				local _ = nil
				local var314, var315 = protoModule.readBuffer(p13, var304)
				var304 = var315
				var303.value = templateEntryModule.TemplateEntry.decode(var314)
			else
				local _ = nil
				local var316, var317 = protoModule.readVarInt(p13, var304)
				var304 = var317 + var316
			end
		elseif var305 == protoModule.wireTypes.i32 then
			local _ = nil
			local var318, var319 = protoModule.readFixed32(p13, var304)
			local _ = var318
			var304 = var319
		elseif var305 == protoModule.wireTypes.i64 then
			local _ = nil
			local var320, var321 = protoModule.readFixed64(p13, var304)
			local _ = var320
			var304 = var321
		else
			error("Unsupported wire type: " .. var305)
		end
	end
	return var303
end

function t_7:jsonEncode() --[[ line: 1696 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_7:jsonDecode() --[[ line: 1712 ]]
	-- upvalues: t_7 (ref), templateEntryModule (ref)
	local var323 = t_7.new()
	
	if self.key ~= nil then
		var323.key = self.key
	end
	if self.value ~= nil then
		var323.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var323
end

t_7.descriptor = {
	name = "GetChartsSortDetailResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.TemplatesEntry"
}
t.GetChartsSortDetailResponse_TemplatesEntry = t_7
typeRegistryModule.default:register(t.GetChartsSortDetailResponse_TemplatesEntry)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14) --[[ line: 1743 ]]
	-- upvalues: t_8 (ref)
	return setmetatable({
		key = if p14 == nil or p14.key == nil then "" else p14.key,
		value = if p14 == nil or p14.value == nil then "" else p14.value
	}, t_8)
end

function t_8:encode() --[[ line: 1755 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var325 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var326, var327 = protoModule.writeTag(buff, var325, 1, protoModule.wireTypes.lengthDelimited)
		var326, var327 = protoModule.writeString(var326, var327, self.key)
		buff = var326
		var325 = var327
	end
	if self.value ~= nil and self.value ~= "" then
		local var328, var329 = protoModule.writeTag(buff, var325, 2, protoModule.wireTypes.lengthDelimited)
		var328, var329 = protoModule.writeString(var328, var329, self.value)
		buff = var328
		var325 = var329
	end
	local buff_1 = buffer.create(var325)
	buffer.copy(buff_1, 0, buff, 0, var325)
	
	return buff_1
end

function t_8.decode(p15) --[[ line: 1776 ]]
	-- upvalues: t_8 (ref), protoModule (ref)
	local var331 = t_8.new()
	local var332 = 0
	while var332 < buffer.len(p15) do
		local _ = nil
		local var333 = nil
		local var334, var335, var336 = protoModule.readTag(p15, var332)
		local var337 = var334
		var333 = var335
		var332 = var336
		
		if var333 == protoModule.wireTypes.varint then
			local _ = nil
			local var338, var339 = protoModule.readVarInt(p15, var332)
			local _ = var338
			var332 = var339
			continue
		end
		if var333 == protoModule.wireTypes.lengthDelimited then
			if var337 == 1 then
				local _ = nil
				local var340, var341 = protoModule.readBuffer(p15, var332)
				var332 = var341
				var331.key = buffer.tostring(var340)
			elseif var337 == 2 then
				local _ = nil
				local var342, var343 = protoModule.readBuffer(p15, var332)
				var332 = var343
				var331.value = buffer.tostring(var342)
			else
				local _ = nil
				local var344, var345 = protoModule.readVarInt(p15, var332)
				var332 = var345 + var344
			end
		elseif var333 == protoModule.wireTypes.i32 then
			local _ = nil
			local var346, var347 = protoModule.readFixed32(p15, var332)
			local _ = var346
			var332 = var347
		elseif var333 == protoModule.wireTypes.i64 then
			local _ = nil
			local var348, var349 = protoModule.readFixed64(p15, var332)
			local _ = var348
			var332 = var349
		else
			error("Unsupported wire type: " .. var333)
		end
	end
	return var331
end

function t_8:jsonEncode() --[[ line: 1826 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_8:jsonDecode() --[[ line: 1842 ]]
	-- upvalues: t_8 (ref)
	local var351 = t_8.new()
	
	if self.key ~= nil then
		var351.key = self.key
	end
	if self.value ~= nil then
		var351.value = self.value
	end
	return var351
end

t_8.descriptor = {
	name = "GetChartsSortDetailResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.charts.v1beta1.LocalizedLiteralsEntry"
}
t.GetChartsSortDetailResponse_LocalizedLiteralsEntry = t_8
typeRegistryModule.default:register(t.GetChartsSortDetailResponse_LocalizedLiteralsEntry)

return {
	GetChartsPageRequest = t.GetChartsPageRequest,
	GetChartsPageResponse = t.GetChartsPageResponse,
	GetChartsSortDetailRequest = t.GetChartsSortDetailRequest,
	GetChartsSortDetailResponse = t.GetChartsSortDetailResponse
}