local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 154 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		request_id = if p0 == nil or p0.request_id == nil then "" else p0.request_id,
		context = if p0 == nil or p0.context == nil then "" else p0.context,
		screen_size = if p0 == nil or p0.screen_size == nil then "" else p0.screen_size
	}, t_1)
end

function t_1:encode() --[[ line: 164 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var11 = 0
	
	if self.request_id ~= nil and self.request_id ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var11, 1, protoModule.wireTypes.lengthDelimited)
		var12, var13 = protoModule.writeString(var12, var13, self.request_id)
		buff = var12
		var11 = var13
	end
	if self.context ~= nil and self.context ~= "" then
		local var14, var15 = protoModule.writeTag(buff, var11, 2, protoModule.wireTypes.lengthDelimited)
		var14, var15 = protoModule.writeString(var14, var15, self.context)
		buff = var14
		var11 = var15
	end
	if self.screen_size ~= nil and self.screen_size ~= "" then
		local var16, var17 = protoModule.writeTag(buff, var11, 3, protoModule.wireTypes.lengthDelimited)
		var16, var17 = protoModule.writeString(var16, var17, self.screen_size)
		buff = var16
		var11 = var17
	end
	local buff_1 = buffer.create(var11)
	buffer.copy(buff_1, 0, buff, 0, var11)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 188 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
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
				var19.request_id = buffer.tostring(var28)
			elseif var25 == 2 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var20)
				var20 = var31
				var19.context = buffer.tostring(var30)
			elseif var25 == 3 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var20)
				var20 = var33
				var19.screen_size = buffer.tostring(var32)
			else
				local _ = nil
				local var34, var35 = protoModule.readVarInt(p1, var20)
				var20 = var35 + var34
			end
		elseif var21 == protoModule.wireTypes.i32 then
			local _ = nil
			local var36, var37 = protoModule.readFixed32(p1, var20)
			local _ = var36
			var20 = var37
		elseif var21 == protoModule.wireTypes.i64 then
			local _ = nil
			local var38, var39 = protoModule.readFixed64(p1, var20)
			local _ = var38
			var20 = var39
		else
			error("Unsupported wire type: " .. var21)
		end
	end
	return var19
end

function t_1:jsonEncode() --[[ line: 241 ]]
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
	return t
end

function t_1:jsonDecode() --[[ line: 259 ]]
	-- upvalues: t_1 (ref)
	local var41 = t_1.new()
	
	if self.request_id ~= nil then
		var41.request_id = self.request_id
	end
	if self.requestId ~= nil then
		var41.request_id = self.requestId
	end
	if self.context ~= nil then
		var41.context = self.context
	end
	if self.screen_size ~= nil then
		var41.screen_size = self.screen_size
	end
	if self.screenSize ~= nil then
		var41.screen_size = self.screenSize
	end
	return var41
end

t_1.descriptor = {
	name = "MarketplaceCatalogPageRequest",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.MarketplaceCatalogPageRequest"
}
t.MarketplaceCatalogPageRequest = t_1
typeRegistryModule.default:register(t.MarketplaceCatalogPageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 299 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		page_entries = if p2 == nil or p2.page_entries == nil then {} else p2.page_entries,
		hydration_data = if p2 == nil or p2.hydration_data == nil then nil else p2.hydration_data,
		templates = if p2 == nil or p2.templates == nil then {} else p2.templates,
		localized_literals = if p2 == nil or p2.localized_literals == nil then {} else p2.localized_literals
	}, t_2)
end

function t_2:encode() --[[ line: 310 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var43 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var44 = v:encode()
			local var45, var46 = protoModule.writeTag(buff, var43, 1, protoModule.wireTypes.lengthDelimited)
			var45, var46 = protoModule.writeBuffer(var45, var46, var44, buffer.len(var44))
			buff = var45
			var43 = var46
		end
	end
	if self.hydration_data ~= nil then
		local var47 = self.hydration_data:encode()
		local var48, var49 = protoModule.writeTag(buff, var43, 2, protoModule.wireTypes.lengthDelimited)
		var48, var49 = protoModule.writeBuffer(var48, var49, var47, buffer.len(var47))
		buff = var48
		var43 = var49
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var50, var51 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var50, var51 = protoModule.writeString(var50, var51, i)
			local var52 = v:encode()
			var51, var53 = protoModule.writeTag(var50, var51, 2, protoModule.wireTypes.lengthDelimited)
			var51, var53 = protoModule.writeBuffer(var51, var53, var52, buffer.len(var52))
			local var54 = var51
			local var55 = var53
			local var56, var57 = protoModule.writeTag(buff, var43, 3, protoModule.wireTypes.lengthDelimited)
			var56, var57 = protoModule.writeBuffer(var56, var57, var54, var55)
			buff = var56
			var43 = var57
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var58, var59 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var58, var59 = protoModule.writeString(var58, var59, i)
			var58, var59 = protoModule.writeTag(var58, var59, 2, protoModule.wireTypes.lengthDelimited)
			var58, var59 = protoModule.writeString(var58, var59, v)
			local var60 = var58
			local var61 = var59
			local var62, var63 = protoModule.writeTag(buff, var43, 4, protoModule.wireTypes.lengthDelimited)
			var62, var63 = protoModule.writeBuffer(var62, var63, var60, var61)
			buff = var62
			var43 = var63
		end
	end
	local buff_1 = buffer.create(var43)
	buffer.copy(buff_1, 0, buff, 0, var43)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 360 ]]
	-- upvalues: t_2 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var65 = t_2.new()
	local var66 = 0
	while var66 < buffer.len(p3) do
		local _ = nil
		local var67 = nil
		local var68, var69, var70 = protoModule.readTag(p3, var66)
		local var71 = var68
		var67 = var69
		var66 = var70
		
		if var67 == protoModule.wireTypes.varint then
			local _ = nil
			local var72, var73 = protoModule.readVarInt(p3, var66)
			local _ = var72
			var66 = var73
			continue
		end
		if var67 == protoModule.wireTypes.lengthDelimited then
			if var71 == 1 then
				local _ = nil
				local var74, var75 = protoModule.readBuffer(p3, var66)
				var66 = var75
				table.insert(var65.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var74))
			elseif var71 == 2 then
				local _ = nil
				local var76, var77 = protoModule.readBuffer(p3, var66)
				var66 = var77
				var65.hydration_data = hydrationContentModule.HydrationContent.decode(var76)
			elseif var71 == 3 then
				local _ = nil
				local var78, var79 = protoModule.readBuffer(p3, var66)
				var66 = var79
				var78 = t.MarketplaceCatalogPageResponse_TemplatesEntry.decode(var78)
				var65.templates[var78.key or ""] = var78.value or templateEntryModule.TemplateEntry.new()
			elseif var71 == 4 then
				local _ = nil
				local var80, var81 = protoModule.readBuffer(p3, var66)
				var66 = var81
				var80 = t.MarketplaceCatalogPageResponse_LocalizedLiteralsEntry.decode(var80)
				var65.localized_literals[var80.key or ""] = var80.value or ""
			else
				local _ = nil
				local var82, var83 = protoModule.readVarInt(p3, var66)
				var66 = var83 + var82
			end
		elseif var67 == protoModule.wireTypes.i32 then
			local _ = nil
			local var84, var85 = protoModule.readFixed32(p3, var66)
			local _ = var84
			var66 = var85
		elseif var67 == protoModule.wireTypes.i64 then
			local _ = nil
			local var86, var87 = protoModule.readFixed64(p3, var66)
			local _ = var86
			var66 = var87
		else
			error("Unsupported wire type: " .. var67)
		end
	end
	return var65
end

function t_2:jsonEncode() --[[ line: 436 ]]
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

function t_2:jsonDecode() --[[ line: 470 ]]
	-- upvalues: t_2 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var92 = t_2.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var92.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var92.page_entries = t
	end
	if self.hydration_data ~= nil then
		var92.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var92.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var92.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var92.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var92.localized_literals = t
	end
	return var92
end

t_2.descriptor = {
	name = "MarketplaceCatalogPageResponse",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.MarketplaceCatalogPageResponse"
}
t.MarketplaceCatalogPageResponse = t_2
typeRegistryModule.default:register(t.MarketplaceCatalogPageResponse)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 553 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then nil else p4.value
	}, t_3)
end

function t_3:encode() --[[ line: 562 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var99 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var100, var101 = protoModule.writeTag(buff, var99, 1, protoModule.wireTypes.lengthDelimited)
		var100, var101 = protoModule.writeString(var100, var101, self.key)
		buff = var100
		var99 = var101
	end
	if self.value ~= nil then
		local var102 = self.value:encode()
		local var103, var104 = protoModule.writeTag(buff, var99, 2, protoModule.wireTypes.lengthDelimited)
		var103, var104 = protoModule.writeBuffer(var103, var104, var102, buffer.len(var102))
		buff = var103
		var99 = var104
	end
	local buff_1 = buffer.create(var99)
	buffer.copy(buff_1, 0, buff, 0, var99)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 584 ]]
	-- upvalues: t_3 (ref), protoModule (ref), templateEntryModule (ref)
	local var106 = t_3.new()
	local var107 = 0
	while var107 < buffer.len(p5) do
		local _ = nil
		local var108 = nil
		local var109, var110, var111 = protoModule.readTag(p5, var107)
		local var112 = var109
		var108 = var110
		var107 = var111
		
		if var108 == protoModule.wireTypes.varint then
			local _ = nil
			local var113, var114 = protoModule.readVarInt(p5, var107)
			local _ = var113
			var107 = var114
			continue
		end
		if var108 == protoModule.wireTypes.lengthDelimited then
			if var112 == 1 then
				local _ = nil
				local var115, var116 = protoModule.readBuffer(p5, var107)
				var107 = var116
				var106.key = buffer.tostring(var115)
			elseif var112 == 2 then
				local _ = nil
				local var117, var118 = protoModule.readBuffer(p5, var107)
				var107 = var118
				var106.value = templateEntryModule.TemplateEntry.decode(var117)
			else
				local _ = nil
				local var119, var120 = protoModule.readVarInt(p5, var107)
				var107 = var120 + var119
			end
		elseif var108 == protoModule.wireTypes.i32 then
			local _ = nil
			local var121, var122 = protoModule.readFixed32(p5, var107)
			local _ = var121
			var107 = var122
		elseif var108 == protoModule.wireTypes.i64 then
			local _ = nil
			local var123, var124 = protoModule.readFixed64(p5, var107)
			local _ = var123
			var107 = var124
		else
			error("Unsupported wire type: " .. var108)
		end
	end
	return var106
end

function t_3:jsonEncode() --[[ line: 634 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode() --[[ line: 650 ]]
	-- upvalues: t_3 (ref), templateEntryModule (ref)
	local var126 = t_3.new()
	
	if self.key ~= nil then
		var126.key = self.key
	end
	if self.value ~= nil then
		var126.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var126
end

t_3.descriptor = {
	name = "MarketplaceCatalogPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.TemplatesEntry"
}
t.MarketplaceCatalogPageResponse_TemplatesEntry = t_3
typeRegistryModule.default:register(t.MarketplaceCatalogPageResponse_TemplatesEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 681 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		key = if p6 == nil or p6.key == nil then "" else p6.key,
		value = if p6 == nil or p6.value == nil then "" else p6.value
	}, t_4)
end

function t_4:encode() --[[ line: 693 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var128 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var129, var130 = protoModule.writeTag(buff, var128, 1, protoModule.wireTypes.lengthDelimited)
		var129, var130 = protoModule.writeString(var129, var130, self.key)
		buff = var129
		var128 = var130
	end
	if self.value ~= nil and self.value ~= "" then
		local var131, var132 = protoModule.writeTag(buff, var128, 2, protoModule.wireTypes.lengthDelimited)
		var131, var132 = protoModule.writeString(var131, var132, self.value)
		buff = var131
		var128 = var132
	end
	local buff_1 = buffer.create(var128)
	buffer.copy(buff_1, 0, buff, 0, var128)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 714 ]]
	-- upvalues: t_4 (ref), protoModule (ref)
	local var134 = t_4.new()
	local var135 = 0
	while var135 < buffer.len(p7) do
		local _ = nil
		local var136 = nil
		local var137, var138, var139 = protoModule.readTag(p7, var135)
		local var140 = var137
		var136 = var138
		var135 = var139
		
		if var136 == protoModule.wireTypes.varint then
			local _ = nil
			local var141, var142 = protoModule.readVarInt(p7, var135)
			local _ = var141
			var135 = var142
			continue
		end
		if var136 == protoModule.wireTypes.lengthDelimited then
			if var140 == 1 then
				local _ = nil
				local var143, var144 = protoModule.readBuffer(p7, var135)
				var135 = var144
				var134.key = buffer.tostring(var143)
			elseif var140 == 2 then
				local _ = nil
				local var145, var146 = protoModule.readBuffer(p7, var135)
				var135 = var146
				var134.value = buffer.tostring(var145)
			else
				local _ = nil
				local var147, var148 = protoModule.readVarInt(p7, var135)
				var135 = var148 + var147
			end
		elseif var136 == protoModule.wireTypes.i32 then
			local _ = nil
			local var149, var150 = protoModule.readFixed32(p7, var135)
			local _ = var149
			var135 = var150
		elseif var136 == protoModule.wireTypes.i64 then
			local _ = nil
			local var151, var152 = protoModule.readFixed64(p7, var135)
			local _ = var151
			var135 = var152
		else
			error("Unsupported wire type: " .. var136)
		end
	end
	return var134
end

function t_4:jsonEncode() --[[ line: 764 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_4:jsonDecode() --[[ line: 780 ]]
	-- upvalues: t_4 (ref)
	local var154 = t_4.new()
	
	if self.key ~= nil then
		var154.key = self.key
	end
	if self.value ~= nil then
		var154.value = self.value
	end
	return var154
end

t_4.descriptor = {
	name = "MarketplaceCatalogPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.LocalizedLiteralsEntry"
}
t.MarketplaceCatalogPageResponse_LocalizedLiteralsEntry = t_4
typeRegistryModule.default:register(t.MarketplaceCatalogPageResponse_LocalizedLiteralsEntry)

return {
	MarketplaceCatalogPageRequest = t.MarketplaceCatalogPageRequest,
	MarketplaceCatalogPageResponse = t.MarketplaceCatalogPageResponse
}