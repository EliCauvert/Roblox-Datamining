local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	return setmetatable({
		request_id = if p0 == nil or p0.request_id == nil then "" else p0.request_id,
		context = if p0 == nil or p0.context == nil then "" else p0.context,
		screen_size = if p0 == nil or p0.screen_size == nil then "" else p0.screen_size,
		pagination = if p0 == nil or p0.pagination == nil then nil else p0.pagination
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var13 = 0
	
	if self.request_id ~= nil and self.request_id ~= "" then
		local var14, var15 = protoModule.writeTag(buff, var13, 1, protoModule.wireTypes.lengthDelimited)
		var14, var15 = protoModule.writeString(var14, var15, self.request_id)
		buff = var14
		var13 = var15
	end
	if self.context ~= nil and self.context ~= "" then
		local var16, var17 = protoModule.writeTag(buff, var13, 2, protoModule.wireTypes.lengthDelimited)
		var16, var17 = protoModule.writeString(var16, var17, self.context)
		buff = var16
		var13 = var17
	end
	if self.screen_size ~= nil and self.screen_size ~= "" then
		local var18, var19 = protoModule.writeTag(buff, var13, 3, protoModule.wireTypes.lengthDelimited)
		var18, var19 = protoModule.writeString(var18, var19, self.screen_size)
		buff = var18
		var13 = var19
	end
	if self.pagination ~= nil then
		local var20 = self.pagination:encode()
		local var21, var22 = protoModule.writeTag(buff, var13, 4, protoModule.wireTypes.lengthDelimited)
		var21, var22 = protoModule.writeBuffer(var21, var22, var20, buffer.len(var20))
		buff = var21
		var13 = var22
	end
	local buff_1 = buffer.create(var13)
	buffer.copy(buff_1, 0, buff, 0, var13)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var24 = t_1.new()
	local var25 = 0
	while var25 < buffer.len(p1) do
		local _ = nil
		local var26 = nil
		local var27, var28, var29 = protoModule.readTag(p1, var25)
		local var30 = var27
		var26 = var28
		var25 = var29
		
		if var26 == protoModule.wireTypes.varint then
			local _ = nil
			local var31, var32 = protoModule.readVarInt(p1, var25)
			local _ = var31
			var25 = var32
			continue
		end
		if var26 == protoModule.wireTypes.lengthDelimited then
			if var30 == 1 then
				local _ = nil
				local var33, var34 = protoModule.readBuffer(p1, var25)
				var25 = var34
				var24.request_id = buffer.tostring(var33)
			elseif var30 == 2 then
				local _ = nil
				local var35, var36 = protoModule.readBuffer(p1, var25)
				var25 = var36
				var24.context = buffer.tostring(var35)
			elseif var30 == 3 then
				local _ = nil
				local var37, var38 = protoModule.readBuffer(p1, var25)
				var25 = var38
				var24.screen_size = buffer.tostring(var37)
			elseif var30 == 4 then
				local _ = nil
				local var39, var40 = protoModule.readBuffer(p1, var25)
				var25 = var40
				var24.pagination = t.RequestPagination.decode(var39)
			else
				local _ = nil
				local var41, var42 = protoModule.readVarInt(p1, var25)
				var25 = var42 + var41
			end
		elseif var26 == protoModule.wireTypes.i32 then
			local _ = nil
			local var43, var44 = protoModule.readFixed32(p1, var25)
			local _ = var43
			var25 = var44
		elseif var26 == protoModule.wireTypes.i64 then
			local _ = nil
			local var45, var46 = protoModule.readFixed64(p1, var25)
			local _ = var45
			var25 = var46
		else
			error("Unsupported wire type: " .. var26)
		end
	end
	return var24
end

function t_1:jsonEncode()
	local t = {}
	
	if self.request_id ~= nil and self.request_id ~= "" then
		t.requestId = self.request_id
	end
	if self.context ~= nil and self.context ~= "" then
		t.context = self.context
	end
	if self.screen_size ~= nil and self.screen_size ~= "" then
		t.screenSize = self.screen_size
	end
	if self.pagination ~= nil then
		t.pagination = self.pagination:jsonEncode()
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref)
	local var48 = t_1.new()
	
	if self.request_id ~= nil then
		var48.request_id = self.request_id
	end
	if self.requestId ~= nil then
		var48.request_id = self.requestId
	end
	if self.context ~= nil then
		var48.context = self.context
	end
	if self.screen_size ~= nil then
		var48.screen_size = self.screen_size
	end
	if self.screenSize ~= nil then
		var48.screen_size = self.screenSize
	end
	if self.pagination ~= nil then
		var48.pagination = t.RequestPagination.jsonDecode(self.pagination)
	end
	return var48
end

t_1.descriptor = {
	name = "MarketplaceCatalogPageRequest",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.MarketplaceCatalogPageRequest"
}
t.MarketplaceCatalogPageRequest = t_1
typeRegistryModule.default:register(t.MarketplaceCatalogPageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		cursor = if p2 == nil or p2.cursor == nil then nil else p2.cursor,
		page_size = if p2 == nil or p2.page_size == nil then nil else p2.page_size,
		direction = if p2 == nil or p2.direction == nil then nil else p2.direction
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var50 = 0
	
	if self.cursor ~= nil then
		local var51, var52 = protoModule.writeTag(buff, var50, 1, protoModule.wireTypes.lengthDelimited)
		var51, var52 = protoModule.writeString(var51, var52, self.cursor)
		buff = var51
		var50 = var52
	end
	if self.page_size ~= nil then
		local var53, var54 = protoModule.writeTag(buff, var50, 2, protoModule.wireTypes.varint)
		var53, var54 = protoModule.writeVarInt(var53, var54, self.page_size)
		buff = var53
		var50 = var54
	end
	if self.direction ~= nil then
		local var55, var56 = protoModule.writeTag(buff, var50, 3, protoModule.wireTypes.varint)
		var55, var56 = protoModule.writeVarInt(var55, var56, t.PaginationDirection.toNumber(self.direction))
		buff = var55
		var50 = var56
	end
	local buff_1 = buffer.create(var50)
	buffer.copy(buff_1, 0, buff, 0, var50)
	
	return buff_1
end

function t_2.decode(p3)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var58 = t_2.new()
	local var59 = 0
	while var59 < buffer.len(p3) do
		local _ = nil
		local var60 = nil
		local var61, var62, var63 = protoModule.readTag(p3, var59)
		local var64 = var61
		var60 = var62
		var59 = var63
		
		if var60 == protoModule.wireTypes.varint then
			if var64 == 2 then
				local _ = nil
				local var65, var66 = protoModule.readVarIntI32(p3, var59)
				var59 = var66
				var58.page_size = var65
			elseif var64 == 3 then
				local _ = nil
				local var67, var68 = protoModule.readVarIntI32(p3, var59)
				local var69 = var67
				var59 = var68
				var58.direction = t.PaginationDirection.fromNumber(var69) or var69
			else
				local _ = nil
				local var70, var71 = protoModule.readVarInt(p3, var59)
				local _ = var70
				var59 = var71
			end
		end
		if var60 == protoModule.wireTypes.lengthDelimited then
			if var64 == 1 then
				local _ = nil
				local var72, var73 = protoModule.readBuffer(p3, var59)
				var59 = var73
				var58.cursor = buffer.tostring(var72)
			else
				local _ = nil
				local var74, var75 = protoModule.readVarInt(p3, var59)
				var59 = var75 + var74
			end
		elseif var60 == protoModule.wireTypes.i32 then
			local _ = nil
			local var76, var77 = protoModule.readFixed32(p3, var59)
			local _ = var76
			var59 = var77
		elseif var60 == protoModule.wireTypes.i64 then
			local _ = nil
			local var78, var79 = protoModule.readFixed64(p3, var59)
			local _ = var78
			var59 = var79
		else
			error("Unsupported wire type: " .. var60)
		end
	end
	return var58
end

function t_2:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.cursor ~= nil then
		t_1.cursor = self.cursor
	end
	if self.page_size ~= nil then
		t_1.pageSize = self.page_size
	end
	if self.direction ~= nil then
		t_1.direction = if typeof(self.direction) == "number" then self.direction else t.PaginationDirection.toNumber(self.direction)
	end
	return t_1
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), t (ref)
	local var81 = t_2.new()
	
	if self.cursor ~= nil then
		var81.cursor = self.cursor
	end
	if self.page_size ~= nil then
		var81.page_size = self.page_size
	end
	if self.pageSize ~= nil then
		var81.page_size = self.pageSize
	end
	if self.direction ~= nil then
		var81.direction = if typeof(self.direction) == "number" then t.PaginationDirection.fromNumber(self.direction) or self.direction else t.PaginationDirection.fromName(self.direction) or self.direction
	end
	return var81
end

t_2.descriptor = {
	name = "RequestPagination",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.RequestPagination"
}
t.RequestPagination = t_2
typeRegistryModule.default:register(t.RequestPagination)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4)
	-- upvalues: t_3 (ref)
	return setmetatable({
		page_entries = if p4 == nil or p4.page_entries == nil then {} else p4.page_entries,
		hydration_data = if p4 == nil or p4.hydration_data == nil then nil else p4.hydration_data,
		templates = if p4 == nil or p4.templates == nil then {} else p4.templates,
		localized_literals = if p4 == nil or p4.localized_literals == nil then {} else p4.localized_literals,
		pagination = if p4 == nil or p4.pagination == nil then nil else p4.pagination
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var83 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var84 = v:encode()
			local var85, var86 = protoModule.writeTag(buff, var83, 1, protoModule.wireTypes.lengthDelimited)
			var85, var86 = protoModule.writeBuffer(var85, var86, var84, buffer.len(var84))
			buff = var85
			var83 = var86
		end
	end
	if self.hydration_data ~= nil then
		local var87 = self.hydration_data:encode()
		local var88, var89 = protoModule.writeTag(buff, var83, 2, protoModule.wireTypes.lengthDelimited)
		var88, var89 = protoModule.writeBuffer(var88, var89, var87, buffer.len(var87))
		buff = var88
		var83 = var89
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var90, var91 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var90, var91 = protoModule.writeString(var90, var91, i)
			local var92 = v:encode()
			var91, var93 = protoModule.writeTag(var90, var91, 2, protoModule.wireTypes.lengthDelimited)
			var91, var93 = protoModule.writeBuffer(var91, var93, var92, buffer.len(var92))
			local var94 = var91
			local var95 = var93
			local var96, var97 = protoModule.writeTag(buff, var83, 3, protoModule.wireTypes.lengthDelimited)
			var96, var97 = protoModule.writeBuffer(var96, var97, var94, var95)
			buff = var96
			var83 = var97
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var98, var99 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var98, var99 = protoModule.writeString(var98, var99, i)
			var98, var99 = protoModule.writeTag(var98, var99, 2, protoModule.wireTypes.lengthDelimited)
			var98, var99 = protoModule.writeString(var98, var99, v)
			local var100 = var98
			local var101 = var99
			local var102, var103 = protoModule.writeTag(buff, var83, 4, protoModule.wireTypes.lengthDelimited)
			var102, var103 = protoModule.writeBuffer(var102, var103, var100, var101)
			buff = var102
			var83 = var103
		end
	end
	if self.pagination ~= nil then
		local var104 = self.pagination:encode()
		local var105, var106 = protoModule.writeTag(buff, var83, 5, protoModule.wireTypes.lengthDelimited)
		var105, var106 = protoModule.writeBuffer(var105, var106, var104, buffer.len(var104))
		buff = var105
		var83 = var106
	end
	local buff_1 = buffer.create(var83)
	buffer.copy(buff_1, 0, buff, 0, var83)
	
	return buff_1
end

function t_3.decode(p5)
	-- upvalues: t_3 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var108 = t_3.new()
	local var109 = 0
	while var109 < buffer.len(p5) do
		local _ = nil
		local var110 = nil
		local var111, var112, var113 = protoModule.readTag(p5, var109)
		local var114 = var111
		var110 = var112
		var109 = var113
		
		if var110 == protoModule.wireTypes.varint then
			local _ = nil
			local var115, var116 = protoModule.readVarInt(p5, var109)
			local _ = var115
			var109 = var116
			continue
		end
		if var110 == protoModule.wireTypes.lengthDelimited then
			if var114 == 1 then
				local _ = nil
				local var117, var118 = protoModule.readBuffer(p5, var109)
				var109 = var118
				table.insert(var108.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var117))
			elseif var114 == 2 then
				local _ = nil
				local var119, var120 = protoModule.readBuffer(p5, var109)
				var109 = var120
				var108.hydration_data = hydrationContentModule.HydrationContent.decode(var119)
			elseif var114 == 3 then
				local _ = nil
				local var121, var122 = protoModule.readBuffer(p5, var109)
				var109 = var122
				var121 = t.MarketplaceCatalogPageResponse_TemplatesEntry.decode(var121)
				var108.templates[var121.key or ""] = var121.value or templateEntryModule.TemplateEntry.new()
			elseif var114 == 4 then
				local _ = nil
				local var123, var124 = protoModule.readBuffer(p5, var109)
				var109 = var124
				var123 = t.MarketplaceCatalogPageResponse_LocalizedLiteralsEntry.decode(var123)
				var108.localized_literals[var123.key or ""] = var123.value or ""
			elseif var114 == 5 then
				local _ = nil
				local var125, var126 = protoModule.readBuffer(p5, var109)
				var109 = var126
				var108.pagination = t.Pagination.decode(var125)
			else
				local _ = nil
				local var127, var128 = protoModule.readVarInt(p5, var109)
				var109 = var128 + var127
			end
		elseif var110 == protoModule.wireTypes.i32 then
			local _ = nil
			local var129, var130 = protoModule.readFixed32(p5, var109)
			local _ = var129
			var109 = var130
		elseif var110 == protoModule.wireTypes.i64 then
			local _ = nil
			local var131, var132 = protoModule.readFixed64(p5, var109)
			local _ = var131
			var109 = var132
		else
			error("Unsupported wire type: " .. var110)
		end
	end
	return var108
end

function t_3:jsonEncode()
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
	if self.pagination ~= nil then
		t.pagination = self.pagination:jsonEncode()
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref), t (ref)
	local var137 = t_3.new()
	
	if self.page_entries ~= nil then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var137.page_entries = t_1
	end
	if self.pageEntries ~= nil then
		local t_1 = {}
		
		for i, v in self.pageEntries do
			table.insert(t_1, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var137.page_entries = t_1
	end
	if self.hydration_data ~= nil then
		var137.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var137.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var137.templates = t_1
	end
	if self.localized_literals ~= nil then
		local t_1 = {}
		
		for i, v in self.localized_literals do
			t_1[i] = v
		end
		var137.localized_literals = t_1
	end
	if self.localizedLiterals ~= nil then
		local t_1 = {}
		
		for i, v in self.localizedLiterals do
			t_1[i] = v
		end
		var137.localized_literals = t_1
	end
	if self.pagination ~= nil then
		var137.pagination = t.Pagination.jsonDecode(self.pagination)
	end
	return var137
end

t_3.descriptor = {
	name = "MarketplaceCatalogPageResponse",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.MarketplaceCatalogPageResponse"
}
t.MarketplaceCatalogPageResponse = t_3
typeRegistryModule.default:register(t.MarketplaceCatalogPageResponse)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6)
	-- upvalues: t_4 (ref)
	return setmetatable({
		key = if p6 == nil or p6.key == nil then "" else p6.key,
		value = if p6 == nil or p6.value == nil then nil else p6.value
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var144 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var145, var146 = protoModule.writeTag(buff, var144, 1, protoModule.wireTypes.lengthDelimited)
		var145, var146 = protoModule.writeString(var145, var146, self.key)
		buff = var145
		var144 = var146
	end
	if self.value ~= nil then
		local var147 = self.value:encode()
		local var148, var149 = protoModule.writeTag(buff, var144, 2, protoModule.wireTypes.lengthDelimited)
		var148, var149 = protoModule.writeBuffer(var148, var149, var147, buffer.len(var147))
		buff = var148
		var144 = var149
	end
	local buff_1 = buffer.create(var144)
	buffer.copy(buff_1, 0, buff, 0, var144)
	
	return buff_1
end

function t_4.decode(p7)
	-- upvalues: t_4 (ref), protoModule (ref), templateEntryModule (ref)
	local var151 = t_4.new()
	local var152 = 0
	while var152 < buffer.len(p7) do
		local _ = nil
		local var153 = nil
		local var154, var155, var156 = protoModule.readTag(p7, var152)
		local var157 = var154
		var153 = var155
		var152 = var156
		
		if var153 == protoModule.wireTypes.varint then
			local _ = nil
			local var158, var159 = protoModule.readVarInt(p7, var152)
			local _ = var158
			var152 = var159
			continue
		end
		if var153 == protoModule.wireTypes.lengthDelimited then
			if var157 == 1 then
				local _ = nil
				local var160, var161 = protoModule.readBuffer(p7, var152)
				var152 = var161
				var151.key = buffer.tostring(var160)
			elseif var157 == 2 then
				local _ = nil
				local var162, var163 = protoModule.readBuffer(p7, var152)
				var152 = var163
				var151.value = templateEntryModule.TemplateEntry.decode(var162)
			else
				local _ = nil
				local var164, var165 = protoModule.readVarInt(p7, var152)
				var152 = var165 + var164
			end
		elseif var153 == protoModule.wireTypes.i32 then
			local _ = nil
			local var166, var167 = protoModule.readFixed32(p7, var152)
			local _ = var166
			var152 = var167
		elseif var153 == protoModule.wireTypes.i64 then
			local _ = nil
			local var168, var169 = protoModule.readFixed64(p7, var152)
			local _ = var168
			var152 = var169
		else
			error("Unsupported wire type: " .. var153)
		end
	end
	return var151
end

function t_4:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), templateEntryModule (ref)
	local var171 = t_4.new()
	
	if self.key ~= nil then
		var171.key = self.key
	end
	if self.value ~= nil then
		var171.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var171
end

t_4.descriptor = {
	name = "MarketplaceCatalogPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.TemplatesEntry"
}
t.MarketplaceCatalogPageResponse_TemplatesEntry = t_4
typeRegistryModule.default:register(t.MarketplaceCatalogPageResponse_TemplatesEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8)
	-- upvalues: t_5 (ref)
	return setmetatable({
		key = if p8 == nil or p8.key == nil then "" else p8.key,
		value = if p8 == nil or p8.value == nil then "" else p8.value
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var173 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var174, var175 = protoModule.writeTag(buff, var173, 1, protoModule.wireTypes.lengthDelimited)
		var174, var175 = protoModule.writeString(var174, var175, self.key)
		buff = var174
		var173 = var175
	end
	if self.value ~= nil and self.value ~= "" then
		local var176, var177 = protoModule.writeTag(buff, var173, 2, protoModule.wireTypes.lengthDelimited)
		var176, var177 = protoModule.writeString(var176, var177, self.value)
		buff = var176
		var173 = var177
	end
	local buff_1 = buffer.create(var173)
	buffer.copy(buff_1, 0, buff, 0, var173)
	
	return buff_1
end

function t_5.decode(p9)
	-- upvalues: t_5 (ref), protoModule (ref)
	local var179 = t_5.new()
	local var180 = 0
	while var180 < buffer.len(p9) do
		local _ = nil
		local var181 = nil
		local var182, var183, var184 = protoModule.readTag(p9, var180)
		local var185 = var182
		var181 = var183
		var180 = var184
		
		if var181 == protoModule.wireTypes.varint then
			local _ = nil
			local var186, var187 = protoModule.readVarInt(p9, var180)
			local _ = var186
			var180 = var187
			continue
		end
		if var181 == protoModule.wireTypes.lengthDelimited then
			if var185 == 1 then
				local _ = nil
				local var188, var189 = protoModule.readBuffer(p9, var180)
				var180 = var189
				var179.key = buffer.tostring(var188)
			elseif var185 == 2 then
				local _ = nil
				local var190, var191 = protoModule.readBuffer(p9, var180)
				var180 = var191
				var179.value = buffer.tostring(var190)
			else
				local _ = nil
				local var192, var193 = protoModule.readVarInt(p9, var180)
				var180 = var193 + var192
			end
		elseif var181 == protoModule.wireTypes.i32 then
			local _ = nil
			local var194, var195 = protoModule.readFixed32(p9, var180)
			local _ = var194
			var180 = var195
		elseif var181 == protoModule.wireTypes.i64 then
			local _ = nil
			local var196, var197 = protoModule.readFixed64(p9, var180)
			local _ = var196
			var180 = var197
		else
			error("Unsupported wire type: " .. var181)
		end
	end
	return var179
end

function t_5:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref)
	local var199 = t_5.new()
	
	if self.key ~= nil then
		var199.key = self.key
	end
	if self.value ~= nil then
		var199.value = self.value
	end
	return var199
end

t_5.descriptor = {
	name = "MarketplaceCatalogPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.LocalizedLiteralsEntry"
}
t.MarketplaceCatalogPageResponse_LocalizedLiteralsEntry = t_5
typeRegistryModule.default:register(t.MarketplaceCatalogPageResponse_LocalizedLiteralsEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10)
	-- upvalues: t_6 (ref)
	return setmetatable({
		next_cursor = if p10 == nil or p10.next_cursor == nil then nil else p10.next_cursor
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var201 = 0
	
	if self.next_cursor ~= nil then
		local var202, var203 = protoModule.writeTag(buff, var201, 1, protoModule.wireTypes.lengthDelimited)
		var202, var203 = protoModule.writeString(var202, var203, self.next_cursor)
		buff = var202
		var201 = var203
	end
	local buff_1 = buffer.create(var201)
	buffer.copy(buff_1, 0, buff, 0, var201)
	
	return buff_1
end

function t_6.decode(p11)
	-- upvalues: t_6 (ref), protoModule (ref)
	local var205 = t_6.new()
	local var206 = 0
	while var206 < buffer.len(p11) do
		local _ = nil
		local var207 = nil
		local var208, var209, var210 = protoModule.readTag(p11, var206)
		local var211 = var208
		var207 = var209
		var206 = var210
		
		if var207 == protoModule.wireTypes.varint then
			local _ = nil
			local var212, var213 = protoModule.readVarInt(p11, var206)
			local _ = var212
			var206 = var213
			continue
		end
		if var207 == protoModule.wireTypes.lengthDelimited then
			if var211 == 1 then
				local _ = nil
				local var214, var215 = protoModule.readBuffer(p11, var206)
				var206 = var215
				var205.next_cursor = buffer.tostring(var214)
			else
				local _ = nil
				local var216, var217 = protoModule.readVarInt(p11, var206)
				var206 = var217 + var216
			end
		elseif var207 == protoModule.wireTypes.i32 then
			local _ = nil
			local var218, var219 = protoModule.readFixed32(p11, var206)
			local _ = var218
			var206 = var219
		elseif var207 == protoModule.wireTypes.i64 then
			local _ = nil
			local var220, var221 = protoModule.readFixed64(p11, var206)
			local _ = var220
			var206 = var221
		else
			error("Unsupported wire type: " .. var207)
		end
	end
	return var205
end

function t_6:jsonEncode()
	local t = {}
	
	if self.next_cursor ~= nil then
		t.nextCursor = self.next_cursor
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref)
	local var223 = t_6.new()
	
	if self.next_cursor ~= nil then
		var223.next_cursor = self.next_cursor
	end
	if self.nextCursor ~= nil then
		var223.next_cursor = self.nextCursor
	end
	return var223
end

t_6.descriptor = {
	name = "Pagination",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.Pagination"
}
t.Pagination = t_6
typeRegistryModule.default:register(t.Pagination)
t.PaginationDirection = {
	fromNumber = function(p12)
		return if p12 == 0 then "PAGINATION_DIRECTION_INVALID" elseif p12 == 1 then "PAGINATION_DIRECTION_FORWARD" elseif p12 == 2 then "PAGINATION_DIRECTION_BACKWARD" else nil
	end,
	toNumber = function(p13)
		return if p13 == "PAGINATION_DIRECTION_INVALID" then 0 elseif p13 == "PAGINATION_DIRECTION_FORWARD" then 1 elseif p13 == "PAGINATION_DIRECTION_BACKWARD" then 2 else p13
	end,
	fromName = function(p14)
		return if p14 == "PAGINATION_DIRECTION_INVALID" then "PAGINATION_DIRECTION_INVALID" elseif p14 == "PAGINATION_DIRECTION_FORWARD" then "PAGINATION_DIRECTION_FORWARD" elseif p14 == "PAGINATION_DIRECTION_BACKWARD" then "PAGINATION_DIRECTION_BACKWARD" else nil
	end
}

return {
	MarketplaceCatalogPageRequest = t.MarketplaceCatalogPageRequest,
	RequestPagination = t.RequestPagination,
	MarketplaceCatalogPageResponse = t.MarketplaceCatalogPageResponse,
	Pagination = t.Pagination,
	PaginationDirection = t.PaginationDirection
}