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

function t_1.new(p0) --[[ line: 112 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		page_entries = if p0 == nil or p0.page_entries == nil then {} else p0.page_entries,
		hydration_data = if p0 == nil or p0.hydration_data == nil then nil else p0.hydration_data,
		templates = if p0 == nil or p0.templates == nil then {} else p0.templates,
		localized_literals = if p0 == nil or p0.localized_literals == nil then {} else p0.localized_literals
	}, t_1)
end

function t_1:encode() --[[ line: 121 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var10 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var11 = v:encode()
			local var12, var13 = protoModule.writeTag(buff, var10, 1, protoModule.wireTypes.lengthDelimited)
			var12, var13 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
			buff = var12
			var10 = var13
		end
	end
	if self.hydration_data ~= nil then
		local var14 = self.hydration_data:encode()
		local var15, var16 = protoModule.writeTag(buff, var10, 2, protoModule.wireTypes.lengthDelimited)
		var15, var16 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
		buff = var15
		var10 = var16
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var17, var18 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var17, var18 = protoModule.writeString(var17, var18, i)
			local var19 = v:encode()
			var18, var20 = protoModule.writeTag(var17, var18, 2, protoModule.wireTypes.lengthDelimited)
			var18, var20 = protoModule.writeBuffer(var18, var20, var19, buffer.len(var19))
			local var21 = var18
			local var22 = var20
			local var23, var24 = protoModule.writeTag(buff, var10, 3, protoModule.wireTypes.lengthDelimited)
			var23, var24 = protoModule.writeBuffer(var23, var24, var21, var22)
			buff = var23
			var10 = var24
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var25, var26 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var25, var26 = protoModule.writeString(var25, var26, i)
			var25, var26 = protoModule.writeTag(var25, var26, 2, protoModule.wireTypes.lengthDelimited)
			var25, var26 = protoModule.writeString(var25, var26, v)
			local var27 = var25
			local var28 = var26
			local var29, var30 = protoModule.writeTag(buff, var10, 4, protoModule.wireTypes.lengthDelimited)
			var29, var30 = protoModule.writeBuffer(var29, var30, var27, var28)
			buff = var29
			var10 = var30
		end
	end
	local buff_1 = buffer.create(var10)
	buffer.copy(buff_1, 0, buff, 0, var10)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 171 ]]
	-- upvalues: t_1 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var32 = t_1.new()
	local var33 = 0
	while var33 < buffer.len(p1) do
		local _ = nil
		local var34 = nil
		local var35, var36, var37 = protoModule.readTag(p1, var33)
		local var38 = var35
		var34 = var36
		var33 = var37
		
		if var34 == protoModule.wireTypes.varint then
			local _ = nil
			local var39, var40 = protoModule.readVarInt(p1, var33)
			local _ = var39
			var33 = var40
			continue
		end
		if var34 == protoModule.wireTypes.lengthDelimited then
			if var38 == 1 then
				local _ = nil
				local var41, var42 = protoModule.readBuffer(p1, var33)
				var33 = var42
				table.insert(var32.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var41))
			elseif var38 == 2 then
				local _ = nil
				local var43, var44 = protoModule.readBuffer(p1, var33)
				var33 = var44
				var32.hydration_data = hydrationContentModule.HydrationContent.decode(var43)
			elseif var38 == 3 then
				local _ = nil
				local var45, var46 = protoModule.readBuffer(p1, var33)
				var33 = var46
				var45 = t.PartyChatResponse_TemplatesEntry.decode(var45)
				var32.templates[var45.key or ""] = var45.value or templateEntryModule.TemplateEntry.new()
			elseif var38 == 4 then
				local _ = nil
				local var47, var48 = protoModule.readBuffer(p1, var33)
				var33 = var48
				var47 = t.PartyChatResponse_LocalizedLiteralsEntry.decode(var47)
				var32.localized_literals[var47.key or ""] = var47.value or ""
			else
				local _ = nil
				local var49, var50 = protoModule.readVarInt(p1, var33)
				var33 = var50 + var49
			end
		elseif var34 == protoModule.wireTypes.i32 then
			local _ = nil
			local var51, var52 = protoModule.readFixed32(p1, var33)
			local _ = var51
			var33 = var52
		elseif var34 == protoModule.wireTypes.i64 then
			local _ = nil
			local var53, var54 = protoModule.readFixed64(p1, var33)
			local _ = var53
			var33 = var54
		else
			error("Unsupported wire type: " .. var34)
		end
	end
	return var32
end

function t_1:jsonEncode() --[[ line: 247 ]]
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

function t_1:jsonDecode() --[[ line: 281 ]]
	-- upvalues: t_1 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var59 = t_1.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var59.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var59.page_entries = t
	end
	if self.hydration_data ~= nil then
		var59.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var59.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t = {}
		
		for i, v in self.templates do
			t[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var59.templates = t
	end
	if self.localized_literals ~= nil then
		local t = {}
		
		for i, v in self.localized_literals do
			t[i] = v
		end
		var59.localized_literals = t
	end
	if self.localizedLiterals ~= nil then
		local t = {}
		
		for i, v in self.localizedLiterals do
			t[i] = v
		end
		var59.localized_literals = t
	end
	return var59
end

t_1.descriptor = {
	name = "PartyChatResponse",
	fullName = "roblox.apppageplatform.partychat.v1beta1.PartyChatResponse"
}
t.PartyChatResponse = t_1
typeRegistryModule.default:register(t.PartyChatResponse)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 364 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p2 == nil or p2.key == nil then "" else p2.key,
		value = if p2 == nil or p2.value == nil then nil else p2.value
	}, t_2)
end

function t_2:encode() --[[ line: 373 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var66 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var67, var68 = protoModule.writeTag(buff, var66, 1, protoModule.wireTypes.lengthDelimited)
		var67, var68 = protoModule.writeString(var67, var68, self.key)
		buff = var67
		var66 = var68
	end
	if self.value ~= nil then
		local var69 = self.value:encode()
		local var70, var71 = protoModule.writeTag(buff, var66, 2, protoModule.wireTypes.lengthDelimited)
		var70, var71 = protoModule.writeBuffer(var70, var71, var69, buffer.len(var69))
		buff = var70
		var66 = var71
	end
	local buff_1 = buffer.create(var66)
	buffer.copy(buff_1, 0, buff, 0, var66)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 393 ]]
	-- upvalues: t_2 (ref), protoModule (ref), templateEntryModule (ref)
	local var73 = t_2.new()
	local var74 = 0
	while var74 < buffer.len(p3) do
		local _ = nil
		local var75 = nil
		local var76, var77, var78 = protoModule.readTag(p3, var74)
		local var79 = var76
		var75 = var77
		var74 = var78
		
		if var75 == protoModule.wireTypes.varint then
			local _ = nil
			local var80, var81 = protoModule.readVarInt(p3, var74)
			local _ = var80
			var74 = var81
			continue
		end
		if var75 == protoModule.wireTypes.lengthDelimited then
			if var79 == 1 then
				local _ = nil
				local var82, var83 = protoModule.readBuffer(p3, var74)
				var74 = var83
				var73.key = buffer.tostring(var82)
			elseif var79 == 2 then
				local _ = nil
				local var84, var85 = protoModule.readBuffer(p3, var74)
				var74 = var85
				var73.value = templateEntryModule.TemplateEntry.decode(var84)
			else
				local _ = nil
				local var86, var87 = protoModule.readVarInt(p3, var74)
				var74 = var87 + var86
			end
		elseif var75 == protoModule.wireTypes.i32 then
			local _ = nil
			local var88, var89 = protoModule.readFixed32(p3, var74)
			local _ = var88
			var74 = var89
		elseif var75 == protoModule.wireTypes.i64 then
			local _ = nil
			local var90, var91 = protoModule.readFixed64(p3, var74)
			local _ = var90
			var74 = var91
		else
			error("Unsupported wire type: " .. var75)
		end
	end
	return var73
end

function t_2:jsonEncode() --[[ line: 441 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_2:jsonDecode() --[[ line: 455 ]]
	-- upvalues: t_2 (ref), templateEntryModule (ref)
	local var93 = t_2.new()
	
	if self.key ~= nil then
		var93.key = self.key
	end
	if self.value ~= nil then
		var93.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var93
end

t_2.descriptor = {
	name = "PartyChatResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.partychat.v1beta1.TemplatesEntry"
}
t.PartyChatResponse_TemplatesEntry = t_2
typeRegistryModule.default:register(t.PartyChatResponse_TemplatesEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 485 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then "" else p4.value
	}, t_3)
end

function t_3:encode() --[[ line: 494 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var95 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var96, var97 = protoModule.writeTag(buff, var95, 1, protoModule.wireTypes.lengthDelimited)
		var96, var97 = protoModule.writeString(var96, var97, self.key)
		buff = var96
		var95 = var97
	end
	if self.value ~= nil and self.value ~= "" then
		local var98, var99 = protoModule.writeTag(buff, var95, 2, protoModule.wireTypes.lengthDelimited)
		var98, var99 = protoModule.writeString(var98, var99, self.value)
		buff = var98
		var95 = var99
	end
	local buff_1 = buffer.create(var95)
	buffer.copy(buff_1, 0, buff, 0, var95)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 515 ]]
	-- upvalues: t_3 (ref), protoModule (ref)
	local var101 = t_3.new()
	local var102 = 0
	while var102 < buffer.len(p5) do
		local _ = nil
		local var103 = nil
		local var104, var105, var106 = protoModule.readTag(p5, var102)
		local var107 = var104
		var103 = var105
		var102 = var106
		
		if var103 == protoModule.wireTypes.varint then
			local _ = nil
			local var108, var109 = protoModule.readVarInt(p5, var102)
			local _ = var108
			var102 = var109
			continue
		end
		if var103 == protoModule.wireTypes.lengthDelimited then
			if var107 == 1 then
				local _ = nil
				local var110, var111 = protoModule.readBuffer(p5, var102)
				var102 = var111
				var101.key = buffer.tostring(var110)
			elseif var107 == 2 then
				local _ = nil
				local var112, var113 = protoModule.readBuffer(p5, var102)
				var102 = var113
				var101.value = buffer.tostring(var112)
			else
				local _ = nil
				local var114, var115 = protoModule.readVarInt(p5, var102)
				var102 = var115 + var114
			end
		elseif var103 == protoModule.wireTypes.i32 then
			local _ = nil
			local var116, var117 = protoModule.readFixed32(p5, var102)
			local _ = var116
			var102 = var117
		elseif var103 == protoModule.wireTypes.i64 then
			local _ = nil
			local var118, var119 = protoModule.readFixed64(p5, var102)
			local _ = var118
			var102 = var119
		else
			error("Unsupported wire type: " .. var103)
		end
	end
	return var101
end

function t_3:jsonEncode() --[[ line: 565 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_3:jsonDecode() --[[ line: 581 ]]
	-- upvalues: t_3 (ref)
	local var121 = t_3.new()
	
	if self.key ~= nil then
		var121.key = self.key
	end
	if self.value ~= nil then
		var121.value = self.value
	end
	return var121
end

t_3.descriptor = {
	name = "PartyChatResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.partychat.v1beta1.LocalizedLiteralsEntry"
}
t.PartyChatResponse_LocalizedLiteralsEntry = t_3
typeRegistryModule.default:register(t.PartyChatResponse_LocalizedLiteralsEntry)

return { PartyChatResponse = t.PartyChatResponse }