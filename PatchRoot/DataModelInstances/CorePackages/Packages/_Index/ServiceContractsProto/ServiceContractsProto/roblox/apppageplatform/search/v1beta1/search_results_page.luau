-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:16 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 165 ]]
	-- upvalues: t (ref), t_1 (ref)
	return setmetatable({
		search_query = if p0 == nil or p0.search_query == nil then "" else p0.search_query,
		session_id = if p0 == nil or p0.session_id == nil then "" else p0.session_id,
		vertical_type = if p0 == nil or p0.vertical_type == nil then assert(t.SearchResultsPageVerticalType.fromNumber(0), "Enum has no 0 default") else p0.vertical_type,
		global_session_id = if p0 == nil or p0.global_session_id == nil then "" else p0.global_session_id
	}, t_1)
end

function t_1:encode() --[[ line: 178 ]]
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var11 = 0
	
	if self.search_query ~= nil and self.search_query ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var11, 1, protoModule.wireTypes.lengthDelimited)
		var12, var13 = protoModule.writeString(var12, var13, self.search_query)
		buff = var12
		var11 = var13
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		local var14, var15 = protoModule.writeTag(buff, var11, 2, protoModule.wireTypes.lengthDelimited)
		var14, var15 = protoModule.writeString(var14, var15, self.session_id)
		buff = var14
		var11 = var15
	end
	if self.vertical_type ~= nil and (self.vertical_type ~= nil and self.vertical_type ~= 0 or self.vertical_type ~= t.SearchResultsPageVerticalType.fromNumber(0)) then
		local var16, var17 = protoModule.writeTag(buff, var11, 3, protoModule.wireTypes.varint)
		var16, var17 = protoModule.writeVarInt(var16, var17, t.SearchResultsPageVerticalType.toNumber(self.vertical_type))
		buff = var16
		var11 = var17
	end
	if self.global_session_id ~= nil and self.global_session_id ~= "" then
		local var18, var19 = protoModule.writeTag(buff, var11, 4, protoModule.wireTypes.lengthDelimited)
		var18, var19 = protoModule.writeString(var18, var19, self.global_session_id)
		buff = var18
		var11 = var19
	end
	local buff_1 = buffer.create(var11)
	buffer.copy(buff_1, 0, buff, 0, var11)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 217 ]]
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var21 = t_1.new()
	local var22 = 0
	while var22 < buffer.len(p1) do
		local _ = nil
		local var23 = nil
		local var24, var25, var26 = protoModule.readTag(p1, var22)
		local var27 = var24
		var23 = var25
		var22 = var26
		
		if var23 == protoModule.wireTypes.varint then
			if var27 == 3 then
				local _ = nil
				local var28, var29 = protoModule.readVarIntI32(p1, var22)
				local var30 = var28
				var22 = var29
				var21.vertical_type = t.SearchResultsPageVerticalType.fromNumber(var30) or var30
			else
				local _ = nil
				local var31, var32 = protoModule.readVarInt(p1, var22)
				local _ = var31
				var22 = var32
			end
		end
		if var23 == protoModule.wireTypes.lengthDelimited then
			if var27 == 1 then
				local _ = nil
				local var33, var34 = protoModule.readBuffer(p1, var22)
				var22 = var34
				var21.search_query = buffer.tostring(var33)
			elseif var27 == 2 then
				local _ = nil
				local var35, var36 = protoModule.readBuffer(p1, var22)
				var22 = var36
				var21.session_id = buffer.tostring(var35)
			elseif var27 == 4 then
				local _ = nil
				local var37, var38 = protoModule.readBuffer(p1, var22)
				var22 = var38
				var21.global_session_id = buffer.tostring(var37)
			else
				local _ = nil
				local var39, var40 = protoModule.readVarInt(p1, var22)
				var22 = var40 + var39
			end
		elseif var23 == protoModule.wireTypes.i32 then
			local _ = nil
			local var41, var42 = protoModule.readFixed32(p1, var22)
			local _ = var41
			var22 = var42
		elseif var23 == protoModule.wireTypes.i64 then
			local _ = nil
			local var43, var44 = protoModule.readFixed64(p1, var22)
			local _ = var43
			var22 = var44
		else
			error("Unsupported wire type: " .. var23)
		end
	end
	return var21
end

function t_1:jsonEncode() --[[ line: 275 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.search_query ~= nil and self.search_query ~= "" then
		t_1.searchQuery = self.search_query
	end
	if self.session_id ~= nil and self.session_id ~= "" then
		t_1.sessionId = self.session_id
	end
	if self.vertical_type ~= nil and (self.vertical_type ~= nil and self.vertical_type ~= 0 or self.vertical_type ~= t.SearchResultsPageVerticalType.fromNumber(0)) then
		t_1.verticalType = if typeof(self.vertical_type) == "number" then self.vertical_type else t.SearchResultsPageVerticalType.toNumber(self.vertical_type)
	end
	if self.global_session_id ~= nil and self.global_session_id ~= "" then
		t_1.globalSessionId = self.global_session_id
	end
	return t_1
end

function t_1:jsonDecode() --[[ line: 305 ]]
	-- upvalues: t_1 (ref), t (ref)
	local var46 = t_1.new()
	
	if self.search_query ~= nil then
		var46.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var46.search_query = self.searchQuery
	end
	if self.session_id ~= nil then
		var46.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		var46.session_id = self.sessionId
	end
	if self.vertical_type ~= nil then
		var46.vertical_type = if typeof(self.vertical_type) == "number" then t.SearchResultsPageVerticalType.fromNumber(self.vertical_type) or self.vertical_type else t.SearchResultsPageVerticalType.fromName(self.vertical_type) or self.vertical_type
	end
	if self.verticalType ~= nil then
		var46.vertical_type = if typeof(self.verticalType) == "number" then t.SearchResultsPageVerticalType.fromNumber(self.verticalType) or self.verticalType else t.SearchResultsPageVerticalType.fromName(self.verticalType) or self.verticalType
	end
	if self.global_session_id ~= nil then
		var46.global_session_id = self.global_session_id
	end
	if self.globalSessionId ~= nil then
		var46.global_session_id = self.globalSessionId
	end
	return var46
end

t_1.descriptor = {
	name = "GetSearchResultsPageRequest",
	fullName = "roblox.apppageplatform.search.v1beta1.GetSearchResultsPageRequest"
}
t.GetSearchResultsPageRequest = t_1
typeRegistryModule.default:register(t.GetSearchResultsPageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 361 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		page_entries = if p2 == nil or p2.page_entries == nil then {} else p2.page_entries,
		hydration_data = if p2 == nil or p2.hydration_data == nil then nil else p2.hydration_data,
		templates = if p2 == nil or p2.templates == nil then {} else p2.templates,
		localized_literals = if p2 == nil or p2.localized_literals == nil then {} else p2.localized_literals
	}, t_2)
end

function t_2:encode() --[[ line: 372 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var48 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var49 = v:encode()
			local var50, var51 = protoModule.writeTag(buff, var48, 1, protoModule.wireTypes.lengthDelimited)
			var50, var51 = protoModule.writeBuffer(var50, var51, var49, buffer.len(var49))
			buff = var50
			var48 = var51
		end
	end
	if self.hydration_data ~= nil then
		local var52 = self.hydration_data:encode()
		local var53, var54 = protoModule.writeTag(buff, var48, 2, protoModule.wireTypes.lengthDelimited)
		var53, var54 = protoModule.writeBuffer(var53, var54, var52, buffer.len(var52))
		buff = var53
		var48 = var54
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var55, var56 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var55, var56 = protoModule.writeString(var55, var56, i)
			local var57 = v:encode()
			var56, var58 = protoModule.writeTag(var55, var56, 2, protoModule.wireTypes.lengthDelimited)
			var56, var58 = protoModule.writeBuffer(var56, var58, var57, buffer.len(var57))
			local var59 = var56
			local var60 = var58
			local var61, var62 = protoModule.writeTag(buff, var48, 3, protoModule.wireTypes.lengthDelimited)
			var61, var62 = protoModule.writeBuffer(var61, var62, var59, var60)
			buff = var61
			var48 = var62
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var63, var64 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var63, var64 = protoModule.writeString(var63, var64, i)
			var63, var64 = protoModule.writeTag(var63, var64, 2, protoModule.wireTypes.lengthDelimited)
			var63, var64 = protoModule.writeString(var63, var64, v)
			local var65 = var63
			local var66 = var64
			local var67, var68 = protoModule.writeTag(buff, var48, 4, protoModule.wireTypes.lengthDelimited)
			var67, var68 = protoModule.writeBuffer(var67, var68, var65, var66)
			buff = var67
			var48 = var68
		end
	end
	local buff_1 = buffer.create(var48)
	buffer.copy(buff_1, 0, buff, 0, var48)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 422 ]]
	-- upvalues: t_2 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var70 = t_2.new()
	local var71 = 0
	while var71 < buffer.len(p3) do
		local _ = nil
		local var72 = nil
		local var73, var74, var75 = protoModule.readTag(p3, var71)
		local var76 = var73
		var72 = var74
		var71 = var75
		
		if var72 == protoModule.wireTypes.varint then
			local _ = nil
			local var77, var78 = protoModule.readVarInt(p3, var71)
			local _ = var77
			var71 = var78
			continue
		end
		if var72 == protoModule.wireTypes.lengthDelimited then
			if var76 == 1 then
				local _ = nil
				local var79, var80 = protoModule.readBuffer(p3, var71)
				var71 = var80
				table.insert(var70.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var79))
			elseif var76 == 2 then
				local _ = nil
				local var81, var82 = protoModule.readBuffer(p3, var71)
				var71 = var82
				var70.hydration_data = hydrationContentModule.HydrationContent.decode(var81)
			elseif var76 == 3 then
				local _ = nil
				local var83, var84 = protoModule.readBuffer(p3, var71)
				var71 = var84
				var83 = t.GetSearchResultsPageResponse_TemplatesEntry.decode(var83)
				var70.templates[var83.key or ""] = var83.value or templateEntryModule.TemplateEntry.new()
			elseif var76 == 4 then
				local _ = nil
				local var85, var86 = protoModule.readBuffer(p3, var71)
				var71 = var86
				var85 = t.GetSearchResultsPageResponse_LocalizedLiteralsEntry.decode(var85)
				var70.localized_literals[var85.key or ""] = var85.value or ""
			else
				local _ = nil
				local var87, var88 = protoModule.readVarInt(p3, var71)
				var71 = var88 + var87
			end
		elseif var72 == protoModule.wireTypes.i32 then
			local _ = nil
			local var89, var90 = protoModule.readFixed32(p3, var71)
			local _ = var89
			var71 = var90
		elseif var72 == protoModule.wireTypes.i64 then
			local _ = nil
			local var91, var92 = protoModule.readFixed64(p3, var71)
			local _ = var91
			var71 = var92
		else
			error("Unsupported wire type: " .. var72)
		end
	end
	return var70
end

function t_2:jsonEncode() --[[ line: 498 ]]
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

function t_2:jsonDecode() --[[ line: 532 ]]
	-- upvalues: t_2 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var97 = t_2.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var97.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var97.page_entries = t
	end
	if self.hydration_data ~= nil then
		var97.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var97.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var97.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var97.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var97.localized_literals = t
	end
	return var97
end

t_2.descriptor = {
	name = "GetSearchResultsPageResponse",
	fullName = "roblox.apppageplatform.search.v1beta1.GetSearchResultsPageResponse"
}
t.GetSearchResultsPageResponse = t_2
typeRegistryModule.default:register(t.GetSearchResultsPageResponse)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 615 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then nil else p4.value
	}, t_3)
end

function t_3:encode() --[[ line: 624 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var104 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var105, var106 = protoModule.writeTag(buff, var104, 1, protoModule.wireTypes.lengthDelimited)
		var105, var106 = protoModule.writeString(var105, var106, self.key)
		buff = var105
		var104 = var106
	end
	if self.value ~= nil then
		local var107 = self.value:encode()
		local var108, var109 = protoModule.writeTag(buff, var104, 2, protoModule.wireTypes.lengthDelimited)
		var108, var109 = protoModule.writeBuffer(var108, var109, var107, buffer.len(var107))
		buff = var108
		var104 = var109
	end
	local buff_1 = buffer.create(var104)
	buffer.copy(buff_1, 0, buff, 0, var104)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 646 ]]
	-- upvalues: t_3 (ref), protoModule (ref), templateEntryModule (ref)
	local var111 = t_3.new()
	local var112 = 0
	while var112 < buffer.len(p5) do
		local _ = nil
		local var113 = nil
		local var114, var115, var116 = protoModule.readTag(p5, var112)
		local var117 = var114
		var113 = var115
		var112 = var116
		
		if var113 == protoModule.wireTypes.varint then
			local _ = nil
			local var118, var119 = protoModule.readVarInt(p5, var112)
			local _ = var118
			var112 = var119
			continue
		end
		if var113 == protoModule.wireTypes.lengthDelimited then
			if var117 == 1 then
				local _ = nil
				local var120, var121 = protoModule.readBuffer(p5, var112)
				var112 = var121
				var111.key = buffer.tostring(var120)
			elseif var117 == 2 then
				local _ = nil
				local var122, var123 = protoModule.readBuffer(p5, var112)
				var112 = var123
				var111.value = templateEntryModule.TemplateEntry.decode(var122)
			else
				local _ = nil
				local var124, var125 = protoModule.readVarInt(p5, var112)
				var112 = var125 + var124
			end
		elseif var113 == protoModule.wireTypes.i32 then
			local _ = nil
			local var126, var127 = protoModule.readFixed32(p5, var112)
			local _ = var126
			var112 = var127
		elseif var113 == protoModule.wireTypes.i64 then
			local _ = nil
			local var128, var129 = protoModule.readFixed64(p5, var112)
			local _ = var128
			var112 = var129
		else
			error("Unsupported wire type: " .. var113)
		end
	end
	return var111
end

function t_3:jsonEncode() --[[ line: 696 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode() --[[ line: 712 ]]
	-- upvalues: t_3 (ref), templateEntryModule (ref)
	local var131 = t_3.new()
	
	if self.key ~= nil then
		var131.key = self.key
	end
	if self.value ~= nil then
		var131.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var131
end

t_3.descriptor = {
	name = "GetSearchResultsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.search.v1beta1.TemplatesEntry"
}
t.GetSearchResultsPageResponse_TemplatesEntry = t_3
typeRegistryModule.default:register(t.GetSearchResultsPageResponse_TemplatesEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 743 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		key = if p6 == nil or p6.key == nil then "" else p6.key,
		value = if p6 == nil or p6.value == nil then "" else p6.value
	}, t_4)
end

function t_4:encode() --[[ line: 755 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var133 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var134, var135 = protoModule.writeTag(buff, var133, 1, protoModule.wireTypes.lengthDelimited)
		var134, var135 = protoModule.writeString(var134, var135, self.key)
		buff = var134
		var133 = var135
	end
	if self.value ~= nil and self.value ~= "" then
		local var136, var137 = protoModule.writeTag(buff, var133, 2, protoModule.wireTypes.lengthDelimited)
		var136, var137 = protoModule.writeString(var136, var137, self.value)
		buff = var136
		var133 = var137
	end
	local buff_1 = buffer.create(var133)
	buffer.copy(buff_1, 0, buff, 0, var133)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 776 ]]
	-- upvalues: t_4 (ref), protoModule (ref)
	local var139 = t_4.new()
	local var140 = 0
	while var140 < buffer.len(p7) do
		local _ = nil
		local var141 = nil
		local var142, var143, var144 = protoModule.readTag(p7, var140)
		local var145 = var142
		var141 = var143
		var140 = var144
		
		if var141 == protoModule.wireTypes.varint then
			local _ = nil
			local var146, var147 = protoModule.readVarInt(p7, var140)
			local _ = var146
			var140 = var147
			continue
		end
		if var141 == protoModule.wireTypes.lengthDelimited then
			if var145 == 1 then
				local _ = nil
				local var148, var149 = protoModule.readBuffer(p7, var140)
				var140 = var149
				var139.key = buffer.tostring(var148)
			elseif var145 == 2 then
				local _ = nil
				local var150, var151 = protoModule.readBuffer(p7, var140)
				var140 = var151
				var139.value = buffer.tostring(var150)
			else
				local _ = nil
				local var152, var153 = protoModule.readVarInt(p7, var140)
				var140 = var153 + var152
			end
		elseif var141 == protoModule.wireTypes.i32 then
			local _ = nil
			local var154, var155 = protoModule.readFixed32(p7, var140)
			local _ = var154
			var140 = var155
		elseif var141 == protoModule.wireTypes.i64 then
			local _ = nil
			local var156, var157 = protoModule.readFixed64(p7, var140)
			local _ = var156
			var140 = var157
		else
			error("Unsupported wire type: " .. var141)
		end
	end
	return var139
end

function t_4:jsonEncode() --[[ line: 826 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_4:jsonDecode() --[[ line: 842 ]]
	-- upvalues: t_4 (ref)
	local var159 = t_4.new()
	
	if self.key ~= nil then
		var159.key = self.key
	end
	if self.value ~= nil then
		var159.value = self.value
	end
	return var159
end

t_4.descriptor = {
	name = "GetSearchResultsPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.search.v1beta1.LocalizedLiteralsEntry"
}
t.GetSearchResultsPageResponse_LocalizedLiteralsEntry = t_4
typeRegistryModule.default:register(t.GetSearchResultsPageResponse_LocalizedLiteralsEntry)
t.SearchResultsPageVerticalType = {
	fromNumber = function(p8) --[[ line: 870 ]]
		return if p8 == 0 then "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_INVALID" elseif p8 == 1 then "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_BLENDED" elseif p8 == 2 then "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_GAME" elseif p8 == 3 then "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_USER" else nil
	end,
	toNumber = function(p9) --[[ line: 884 ]]
		return if p9 == "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_INVALID" then 0 elseif p9 == "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_BLENDED" then 1 elseif p9 == "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_GAME" then 2 elseif p9 == "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_USER" then 3 else p9
	end,
	fromName = function(p10) --[[ line: 898 ]]
		return if p10 == "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_INVALID" then "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_INVALID" elseif p10 == "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_BLENDED" then "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_BLENDED" elseif p10 == "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_GAME" then "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_GAME" elseif p10 == "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_USER" then "SEARCH_RESULTS_PAGE_VERTICAL_TYPE_USER" else nil
	end
}

return {
	GetSearchResultsPageRequest = t.GetSearchResultsPageRequest,
	GetSearchResultsPageResponse = t.GetSearchResultsPageResponse,
	SearchResultsPageVerticalType = t.SearchResultsPageVerticalType
}