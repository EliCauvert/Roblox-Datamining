-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:15 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 151 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		offer_id = if p0 == nil or p0.offer_id == nil then "" else p0.offer_id
	}, t_1)
end

function t_1:encode() --[[ line: 159 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var11 = 0
	
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var11, 1, protoModule.wireTypes.lengthDelimited)
		var12, var13 = protoModule.writeString(var12, var13, self.offer_id)
		buff = var12
		var11 = var13
	end
	local buff_1 = buffer.create(var11)
	buffer.copy(buff_1, 0, buff, 0, var11)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 173 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var15 = t_1.new()
	local var16 = 0
	while var16 < buffer.len(p1) do
		local _ = nil
		local var17 = nil
		local var18, var19, var20 = protoModule.readTag(p1, var16)
		local var21 = var18
		var17 = var19
		var16 = var20
		
		if var17 == protoModule.wireTypes.varint then
			local _ = nil
			local var22, var23 = protoModule.readVarInt(p1, var16)
			local _ = var22
			var16 = var23
			continue
		end
		if var17 == protoModule.wireTypes.lengthDelimited then
			if var21 == 1 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var16)
				var16 = var25
				var15.offer_id = buffer.tostring(var24)
			else
				local _ = nil
				local var26, var27 = protoModule.readVarInt(p1, var16)
				var16 = var27 + var26
			end
		elseif var17 == protoModule.wireTypes.i32 then
			local _ = nil
			local var28, var29 = protoModule.readFixed32(p1, var16)
			local _ = var28
			var16 = var29
		elseif var17 == protoModule.wireTypes.i64 then
			local _ = nil
			local var30, var31 = protoModule.readFixed64(p1, var16)
			local _ = var30
			var16 = var31
		else
			error("Unsupported wire type: " .. var17)
		end
	end
	return var15
end

function t_1:jsonEncode() --[[ line: 216 ]]
	local t = {}
	
	if self.offer_id ~= nil and self.offer_id ~= "" then
		t.offerId = self.offer_id
	end
	return t
end

function t_1:jsonDecode() --[[ line: 226 ]]
	-- upvalues: t_1 (ref)
	local var33 = t_1.new()
	
	if self.offer_id ~= nil then
		var33.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var33.offer_id = self.offerId
	end
	return var33
end

t_1.descriptor = {
	name = "MarketplaceOfferModalPageRequest",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.MarketplaceOfferModalPageRequest"
}
t.MarketplaceOfferModalPageRequest = t_1
typeRegistryModule.default:register(t.MarketplaceOfferModalPageRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 256 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		page_entries = if p2 == nil or p2.page_entries == nil then {} else p2.page_entries,
		hydration_data = if p2 == nil or p2.hydration_data == nil then nil else p2.hydration_data,
		templates = if p2 == nil or p2.templates == nil then {} else p2.templates,
		localized_literals = if p2 == nil or p2.localized_literals == nil then {} else p2.localized_literals
	}, t_2)
end

function t_2:encode() --[[ line: 267 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var35 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var36 = v:encode()
			local var37, var38 = protoModule.writeTag(buff, var35, 1, protoModule.wireTypes.lengthDelimited)
			var37, var38 = protoModule.writeBuffer(var37, var38, var36, buffer.len(var36))
			buff = var37
			var35 = var38
		end
	end
	if self.hydration_data ~= nil then
		local var39 = self.hydration_data:encode()
		local var40, var41 = protoModule.writeTag(buff, var35, 2, protoModule.wireTypes.lengthDelimited)
		var40, var41 = protoModule.writeBuffer(var40, var41, var39, buffer.len(var39))
		buff = var40
		var35 = var41
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var42, var43 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var42, var43 = protoModule.writeString(var42, var43, i)
			local var44 = v:encode()
			var43, var45 = protoModule.writeTag(var42, var43, 2, protoModule.wireTypes.lengthDelimited)
			var43, var45 = protoModule.writeBuffer(var43, var45, var44, buffer.len(var44))
			local var46 = var43
			local var47 = var45
			local var48, var49 = protoModule.writeTag(buff, var35, 3, protoModule.wireTypes.lengthDelimited)
			var48, var49 = protoModule.writeBuffer(var48, var49, var46, var47)
			buff = var48
			var35 = var49
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var50, var51 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var50, var51 = protoModule.writeString(var50, var51, i)
			var50, var51 = protoModule.writeTag(var50, var51, 2, protoModule.wireTypes.lengthDelimited)
			var50, var51 = protoModule.writeString(var50, var51, v)
			local var52 = var50
			local var53 = var51
			local var54, var55 = protoModule.writeTag(buff, var35, 4, protoModule.wireTypes.lengthDelimited)
			var54, var55 = protoModule.writeBuffer(var54, var55, var52, var53)
			buff = var54
			var35 = var55
		end
	end
	local buff_1 = buffer.create(var35)
	buffer.copy(buff_1, 0, buff, 0, var35)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 317 ]]
	-- upvalues: t_2 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var57 = t_2.new()
	local var58 = 0
	while var58 < buffer.len(p3) do
		local _ = nil
		local var59 = nil
		local var60, var61, var62 = protoModule.readTag(p3, var58)
		local var63 = var60
		var59 = var61
		var58 = var62
		
		if var59 == protoModule.wireTypes.varint then
			local _ = nil
			local var64, var65 = protoModule.readVarInt(p3, var58)
			local _ = var64
			var58 = var65
			continue
		end
		if var59 == protoModule.wireTypes.lengthDelimited then
			if var63 == 1 then
				local _ = nil
				local var66, var67 = protoModule.readBuffer(p3, var58)
				var58 = var67
				table.insert(var57.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var66))
			elseif var63 == 2 then
				local _ = nil
				local var68, var69 = protoModule.readBuffer(p3, var58)
				var58 = var69
				var57.hydration_data = hydrationContentModule.HydrationContent.decode(var68)
			elseif var63 == 3 then
				local _ = nil
				local var70, var71 = protoModule.readBuffer(p3, var58)
				var58 = var71
				var70 = t.MarketplaceOfferModalPageResponse_TemplatesEntry.decode(var70)
				var57.templates[var70.key or ""] = var70.value or templateEntryModule.TemplateEntry.new()
			elseif var63 == 4 then
				local _ = nil
				local var72, var73 = protoModule.readBuffer(p3, var58)
				var58 = var73
				var72 = t.MarketplaceOfferModalPageResponse_LocalizedLiteralsEntry.decode(var72)
				var57.localized_literals[var72.key or ""] = var72.value or ""
			else
				local _ = nil
				local var74, var75 = protoModule.readVarInt(p3, var58)
				var58 = var75 + var74
			end
		elseif var59 == protoModule.wireTypes.i32 then
			local _ = nil
			local var76, var77 = protoModule.readFixed32(p3, var58)
			local _ = var76
			var58 = var77
		elseif var59 == protoModule.wireTypes.i64 then
			local _ = nil
			local var78, var79 = protoModule.readFixed64(p3, var58)
			local _ = var78
			var58 = var79
		else
			error("Unsupported wire type: " .. var59)
		end
	end
	return var57
end

function t_2:jsonEncode() --[[ line: 393 ]]
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

function t_2:jsonDecode() --[[ line: 427 ]]
	-- upvalues: t_2 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var84 = t_2.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var84.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var84.page_entries = t
	end
	if self.hydration_data ~= nil then
		var84.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var84.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var84.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var84.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var84.localized_literals = t
	end
	return var84
end

t_2.descriptor = {
	name = "MarketplaceOfferModalPageResponse",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.MarketplaceOfferModalPageResponse"
}
t.MarketplaceOfferModalPageResponse = t_2
typeRegistryModule.default:register(t.MarketplaceOfferModalPageResponse)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 513 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then nil else p4.value
	}, t_3)
end

function t_3:encode() --[[ line: 525 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var91 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var92, var93 = protoModule.writeTag(buff, var91, 1, protoModule.wireTypes.lengthDelimited)
		var92, var93 = protoModule.writeString(var92, var93, self.key)
		buff = var92
		var91 = var93
	end
	if self.value ~= nil then
		local var94 = self.value:encode()
		local var95, var96 = protoModule.writeTag(buff, var91, 2, protoModule.wireTypes.lengthDelimited)
		var95, var96 = protoModule.writeBuffer(var95, var96, var94, buffer.len(var94))
		buff = var95
		var91 = var96
	end
	local buff_1 = buffer.create(var91)
	buffer.copy(buff_1, 0, buff, 0, var91)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 547 ]]
	-- upvalues: t_3 (ref), protoModule (ref), templateEntryModule (ref)
	local var98 = t_3.new()
	local var99 = 0
	while var99 < buffer.len(p5) do
		local _ = nil
		local var100 = nil
		local var101, var102, var103 = protoModule.readTag(p5, var99)
		local var104 = var101
		var100 = var102
		var99 = var103
		
		if var100 == protoModule.wireTypes.varint then
			local _ = nil
			local var105, var106 = protoModule.readVarInt(p5, var99)
			local _ = var105
			var99 = var106
			continue
		end
		if var100 == protoModule.wireTypes.lengthDelimited then
			if var104 == 1 then
				local _ = nil
				local var107, var108 = protoModule.readBuffer(p5, var99)
				var99 = var108
				var98.key = buffer.tostring(var107)
			elseif var104 == 2 then
				local _ = nil
				local var109, var110 = protoModule.readBuffer(p5, var99)
				var99 = var110
				var98.value = templateEntryModule.TemplateEntry.decode(var109)
			else
				local _ = nil
				local var111, var112 = protoModule.readVarInt(p5, var99)
				var99 = var112 + var111
			end
		elseif var100 == protoModule.wireTypes.i32 then
			local _ = nil
			local var113, var114 = protoModule.readFixed32(p5, var99)
			local _ = var113
			var99 = var114
		elseif var100 == protoModule.wireTypes.i64 then
			local _ = nil
			local var115, var116 = protoModule.readFixed64(p5, var99)
			local _ = var115
			var99 = var116
		else
			error("Unsupported wire type: " .. var100)
		end
	end
	return var98
end

function t_3:jsonEncode() --[[ line: 597 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_3:jsonDecode() --[[ line: 613 ]]
	-- upvalues: t_3 (ref), templateEntryModule (ref)
	local var118 = t_3.new()
	
	if self.key ~= nil then
		var118.key = self.key
	end
	if self.value ~= nil then
		var118.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var118
end

t_3.descriptor = {
	name = "MarketplaceOfferModalPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.TemplatesEntry"
}
t.MarketplaceOfferModalPageResponse_TemplatesEntry = t_3
typeRegistryModule.default:register(t.MarketplaceOfferModalPageResponse_TemplatesEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 645 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		key = if p6 == nil or p6.key == nil then "" else p6.key,
		value = if p6 == nil or p6.value == nil then "" else p6.value
	}, t_4)
end

function t_4:encode() --[[ line: 657 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var120 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var121, var122 = protoModule.writeTag(buff, var120, 1, protoModule.wireTypes.lengthDelimited)
		var121, var122 = protoModule.writeString(var121, var122, self.key)
		buff = var121
		var120 = var122
	end
	if self.value ~= nil and self.value ~= "" then
		local var123, var124 = protoModule.writeTag(buff, var120, 2, protoModule.wireTypes.lengthDelimited)
		var123, var124 = protoModule.writeString(var123, var124, self.value)
		buff = var123
		var120 = var124
	end
	local buff_1 = buffer.create(var120)
	buffer.copy(buff_1, 0, buff, 0, var120)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 678 ]]
	-- upvalues: t_4 (ref), protoModule (ref)
	local var126 = t_4.new()
	local var127 = 0
	while var127 < buffer.len(p7) do
		local _ = nil
		local var128 = nil
		local var129, var130, var131 = protoModule.readTag(p7, var127)
		local var132 = var129
		var128 = var130
		var127 = var131
		
		if var128 == protoModule.wireTypes.varint then
			local _ = nil
			local var133, var134 = protoModule.readVarInt(p7, var127)
			local _ = var133
			var127 = var134
			continue
		end
		if var128 == protoModule.wireTypes.lengthDelimited then
			if var132 == 1 then
				local _ = nil
				local var135, var136 = protoModule.readBuffer(p7, var127)
				var127 = var136
				var126.key = buffer.tostring(var135)
			elseif var132 == 2 then
				local _ = nil
				local var137, var138 = protoModule.readBuffer(p7, var127)
				var127 = var138
				var126.value = buffer.tostring(var137)
			else
				local _ = nil
				local var139, var140 = protoModule.readVarInt(p7, var127)
				var127 = var140 + var139
			end
		elseif var128 == protoModule.wireTypes.i32 then
			local _ = nil
			local var141, var142 = protoModule.readFixed32(p7, var127)
			local _ = var141
			var127 = var142
		elseif var128 == protoModule.wireTypes.i64 then
			local _ = nil
			local var143, var144 = protoModule.readFixed64(p7, var127)
			local _ = var143
			var127 = var144
		else
			error("Unsupported wire type: " .. var128)
		end
	end
	return var126
end

function t_4:jsonEncode() --[[ line: 728 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_4:jsonDecode() --[[ line: 744 ]]
	-- upvalues: t_4 (ref)
	local var146 = t_4.new()
	
	if self.key ~= nil then
		var146.key = self.key
	end
	if self.value ~= nil then
		var146.value = self.value
	end
	return var146
end

t_4.descriptor = {
	name = "MarketplaceOfferModalPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.marketplacecatalog.v1beta1.LocalizedLiteralsEntry"
}
t.MarketplaceOfferModalPageResponse_LocalizedLiteralsEntry = t_4
typeRegistryModule.default:register(t.MarketplaceOfferModalPageResponse_LocalizedLiteralsEntry)

return {
	MarketplaceOfferModalPageRequest = t.MarketplaceOfferModalPageRequest,
	MarketplaceOfferModalPageResponse = t.MarketplaceOfferModalPageResponse
}