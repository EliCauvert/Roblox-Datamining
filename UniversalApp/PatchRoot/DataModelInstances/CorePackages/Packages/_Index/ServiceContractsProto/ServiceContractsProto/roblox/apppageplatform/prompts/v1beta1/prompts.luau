local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 240 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		parameters = if p0 == nil or p0.parameters == nil then {} else p0.parameters,
		translations = if p0 == nil or p0.translations == nil then {} else p0.translations
	}, t_1)
end

function t_1:encode() --[[ line: 247 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var14 = 0
	
	if self.parameters ~= nil and next(self.parameters) ~= nil then
		for i, v in self.parameters do
			local var15, var16 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var15, var16 = protoModule.writeString(var15, var16, i)
			var15, var16 = protoModule.writeTag(var15, var16, 2, protoModule.wireTypes.lengthDelimited)
			var15, var16 = protoModule.writeString(var15, var16, v)
			local var17 = var15
			local var18 = var16
			local var19, var20 = protoModule.writeTag(buff, var14, 1, protoModule.wireTypes.lengthDelimited)
			var19, var20 = protoModule.writeBuffer(var19, var20, var17, var18)
			buff = var19
			var14 = var20
		end
	end
	if self.translations ~= nil and next(self.translations) ~= nil then
		for i, v in self.translations do
			local var21, var22 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var21, var22 = protoModule.writeString(var21, var22, i)
			var21, var22 = protoModule.writeTag(var21, var22, 2, protoModule.wireTypes.lengthDelimited)
			var21, var22 = protoModule.writeString(var21, var22, v)
			local var23 = var21
			local var24 = var22
			local var25, var26 = protoModule.writeTag(buff, var14, 2, protoModule.wireTypes.lengthDelimited)
			var25, var26 = protoModule.writeBuffer(var25, var26, var23, var24)
			buff = var25
			var14 = var26
		end
	end
	local buff_1 = buffer.create(var14)
	buffer.copy(buff_1, 0, buff, 0, var14)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 282 ]]
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var28 = t_1.new()
	local var29 = 0
	while var29 < buffer.len(p1) do
		local _ = nil
		local var30 = nil
		local var31, var32, var33 = protoModule.readTag(p1, var29)
		local var34 = var31
		var30 = var32
		var29 = var33
		
		if var30 == protoModule.wireTypes.varint then
			local _ = nil
			local var35, var36 = protoModule.readVarInt(p1, var29)
			local _ = var35
			var29 = var36
			continue
		end
		if var30 == protoModule.wireTypes.lengthDelimited then
			if var34 == 1 then
				local _ = nil
				local var37, var38 = protoModule.readBuffer(p1, var29)
				var29 = var38
				var37 = t.CustomPrompt_ParametersEntry.decode(var37)
				var28.parameters[var37.key or ""] = var37.value or ""
			elseif var34 == 2 then
				local _ = nil
				local var39, var40 = protoModule.readBuffer(p1, var29)
				var29 = var40
				var39 = t.CustomPrompt_TranslationsEntry.decode(var39)
				var28.translations[var39.key or ""] = var39.value or ""
			else
				local _ = nil
				local var41, var42 = protoModule.readVarInt(p1, var29)
				var29 = var42 + var41
			end
		elseif var30 == protoModule.wireTypes.i32 then
			local _ = nil
			local var43, var44 = protoModule.readFixed32(p1, var29)
			local _ = var43
			var29 = var44
		elseif var30 == protoModule.wireTypes.i64 then
			local _ = nil
			local var45, var46 = protoModule.readFixed64(p1, var29)
			local _ = var45
			var29 = var46
		else
			error("Unsupported wire type: " .. var30)
		end
	end
	return var28
end

function t_1:jsonEncode() --[[ line: 344 ]]
	local t = {}
	
	if self.parameters ~= nil and next(self.parameters) ~= nil then
		local t_1 = {}
		
		for i, v in self.parameters do
			t_1[i] = v
		end
		t.parameters = t_1
	end
	if self.translations ~= nil and next(self.translations) ~= nil then
		local t_1 = {}
		
		for i, v in self.translations do
			t_1[i] = v
		end
		t.translations = t_1
	end
	return t
end

function t_1:jsonDecode() --[[ line: 366 ]]
	-- upvalues: t_1 (ref)
	local var50 = t_1.new()
	
	if self.parameters ~= nil then
		local t = {}
		
		for i, v in self.parameters do
			t[i] = v
		end
		var50.parameters = t
	end
	if self.translations ~= nil then
		local t = {}
		
		for i, v in self.translations do
			t[i] = v
		end
		var50.translations = t
	end
	return var50
end

t_1.descriptor = {
	name = "CustomPrompt",
	fullName = "roblox.apppageplatform.prompts.v1beta1.CustomPrompt"
}
t.CustomPrompt = t_1
typeRegistryModule.default:register(t.CustomPrompt)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 404 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p2 == nil or p2.key == nil then "" else p2.key,
		value = if p2 == nil or p2.value == nil then "" else p2.value
	}, t_2)
end

function t_2:encode() --[[ line: 413 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var54 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var55, var56 = protoModule.writeTag(buff, var54, 1, protoModule.wireTypes.lengthDelimited)
		var55, var56 = protoModule.writeString(var55, var56, self.key)
		buff = var55
		var54 = var56
	end
	if self.value ~= nil and self.value ~= "" then
		local var57, var58 = protoModule.writeTag(buff, var54, 2, protoModule.wireTypes.lengthDelimited)
		var57, var58 = protoModule.writeString(var57, var58, self.value)
		buff = var57
		var54 = var58
	end
	local buff_1 = buffer.create(var54)
	buffer.copy(buff_1, 0, buff, 0, var54)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 432 ]]
	-- upvalues: t_2 (ref), protoModule (ref)
	local var60 = t_2.new()
	local var61 = 0
	while var61 < buffer.len(p3) do
		local _ = nil
		local var62 = nil
		local var63, var64, var65 = protoModule.readTag(p3, var61)
		local var66 = var63
		var62 = var64
		var61 = var65
		
		if var62 == protoModule.wireTypes.varint then
			local _ = nil
			local var67, var68 = protoModule.readVarInt(p3, var61)
			local _ = var67
			var61 = var68
			continue
		end
		if var62 == protoModule.wireTypes.lengthDelimited then
			if var66 == 1 then
				local _ = nil
				local var69, var70 = protoModule.readBuffer(p3, var61)
				var61 = var70
				var60.key = buffer.tostring(var69)
			elseif var66 == 2 then
				local _ = nil
				local var71, var72 = protoModule.readBuffer(p3, var61)
				var61 = var72
				var60.value = buffer.tostring(var71)
			else
				local _ = nil
				local var73, var74 = protoModule.readVarInt(p3, var61)
				var61 = var74 + var73
			end
		elseif var62 == protoModule.wireTypes.i32 then
			local _ = nil
			local var75, var76 = protoModule.readFixed32(p3, var61)
			local _ = var75
			var61 = var76
		elseif var62 == protoModule.wireTypes.i64 then
			local _ = nil
			local var77, var78 = protoModule.readFixed64(p3, var61)
			local _ = var77
			var61 = var78
		else
			error("Unsupported wire type: " .. var62)
		end
	end
	return var60
end

function t_2:jsonEncode() --[[ line: 480 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_2:jsonDecode() --[[ line: 494 ]]
	-- upvalues: t_2 (ref)
	local var80 = t_2.new()
	
	if self.key ~= nil then
		var80.key = self.key
	end
	if self.value ~= nil then
		var80.value = self.value
	end
	return var80
end

t_2.descriptor = {
	name = "CustomPrompt_ParametersEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.ParametersEntry"
}
t.CustomPrompt_ParametersEntry = t_2
typeRegistryModule.default:register(t.CustomPrompt_ParametersEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 522 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p4 == nil or p4.key == nil then "" else p4.key,
		value = if p4 == nil or p4.value == nil then "" else p4.value
	}, t_3)
end

function t_3:encode() --[[ line: 531 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var82 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var83, var84 = protoModule.writeTag(buff, var82, 1, protoModule.wireTypes.lengthDelimited)
		var83, var84 = protoModule.writeString(var83, var84, self.key)
		buff = var83
		var82 = var84
	end
	if self.value ~= nil and self.value ~= "" then
		local var85, var86 = protoModule.writeTag(buff, var82, 2, protoModule.wireTypes.lengthDelimited)
		var85, var86 = protoModule.writeString(var85, var86, self.value)
		buff = var85
		var82 = var86
	end
	local buff_1 = buffer.create(var82)
	buffer.copy(buff_1, 0, buff, 0, var82)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 550 ]]
	-- upvalues: t_3 (ref), protoModule (ref)
	local var88 = t_3.new()
	local var89 = 0
	while var89 < buffer.len(p5) do
		local _ = nil
		local var90 = nil
		local var91, var92, var93 = protoModule.readTag(p5, var89)
		local var94 = var91
		var90 = var92
		var89 = var93
		
		if var90 == protoModule.wireTypes.varint then
			local _ = nil
			local var95, var96 = protoModule.readVarInt(p5, var89)
			local _ = var95
			var89 = var96
			continue
		end
		if var90 == protoModule.wireTypes.lengthDelimited then
			if var94 == 1 then
				local _ = nil
				local var97, var98 = protoModule.readBuffer(p5, var89)
				var89 = var98
				var88.key = buffer.tostring(var97)
			elseif var94 == 2 then
				local _ = nil
				local var99, var100 = protoModule.readBuffer(p5, var89)
				var89 = var100
				var88.value = buffer.tostring(var99)
			else
				local _ = nil
				local var101, var102 = protoModule.readVarInt(p5, var89)
				var89 = var102 + var101
			end
		elseif var90 == protoModule.wireTypes.i32 then
			local _ = nil
			local var103, var104 = protoModule.readFixed32(p5, var89)
			local _ = var103
			var89 = var104
		elseif var90 == protoModule.wireTypes.i64 then
			local _ = nil
			local var105, var106 = protoModule.readFixed64(p5, var89)
			local _ = var105
			var89 = var106
		else
			error("Unsupported wire type: " .. var90)
		end
	end
	return var88
end

function t_3:jsonEncode() --[[ line: 598 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_3:jsonDecode() --[[ line: 612 ]]
	-- upvalues: t_3 (ref)
	local var108 = t_3.new()
	
	if self.key ~= nil then
		var108.key = self.key
	end
	if self.value ~= nil then
		var108.value = self.value
	end
	return var108
end

t_3.descriptor = {
	name = "CustomPrompt_TranslationsEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.TranslationsEntry"
}
t.CustomPrompt_TranslationsEntry = t_3
typeRegistryModule.default:register(t.CustomPrompt_TranslationsEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 640 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		page_entries = if p6 == nil or p6.page_entries == nil then {} else p6.page_entries,
		hydration_data = if p6 == nil or p6.hydration_data == nil then nil else p6.hydration_data,
		templates = if p6 == nil or p6.templates == nil then {} else p6.templates,
		custom_prompts = if p6 == nil or p6.custom_prompts == nil then {} else p6.custom_prompts,
		localized_literals = if p6 == nil or p6.localized_literals == nil then {} else p6.localized_literals
	}, t_4)
end

function t_4:encode() --[[ line: 652 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var110 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var111 = v:encode()
			local var112, var113 = protoModule.writeTag(buff, var110, 1, protoModule.wireTypes.lengthDelimited)
			var112, var113 = protoModule.writeBuffer(var112, var113, var111, buffer.len(var111))
			buff = var112
			var110 = var113
		end
	end
	if self.hydration_data ~= nil then
		local var114 = self.hydration_data:encode()
		local var115, var116 = protoModule.writeTag(buff, var110, 2, protoModule.wireTypes.lengthDelimited)
		var115, var116 = protoModule.writeBuffer(var115, var116, var114, buffer.len(var114))
		buff = var115
		var110 = var116
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var117, var118 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var117, var118 = protoModule.writeString(var117, var118, i)
			local var119 = v:encode()
			var118, var120 = protoModule.writeTag(var117, var118, 2, protoModule.wireTypes.lengthDelimited)
			var118, var120 = protoModule.writeBuffer(var118, var120, var119, buffer.len(var119))
			local var121 = var118
			local var122 = var120
			local var123, var124 = protoModule.writeTag(buff, var110, 3, protoModule.wireTypes.lengthDelimited)
			var123, var124 = protoModule.writeBuffer(var123, var124, var121, var122)
			buff = var123
			var110 = var124
		end
	end
	if self.custom_prompts ~= nil and next(self.custom_prompts) ~= nil then
		for i, v in self.custom_prompts do
			local var125, var126 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var125, var126 = protoModule.writeString(var125, var126, i)
			local var127 = v:encode()
			var126, var128 = protoModule.writeTag(var125, var126, 2, protoModule.wireTypes.lengthDelimited)
			var126, var128 = protoModule.writeBuffer(var126, var128, var127, buffer.len(var127))
			local var129 = var126
			local var130 = var128
			local var131, var132 = protoModule.writeTag(buff, var110, 4, protoModule.wireTypes.lengthDelimited)
			var131, var132 = protoModule.writeBuffer(var131, var132, var129, var130)
			buff = var131
			var110 = var132
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var133, var134 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var133, var134 = protoModule.writeString(var133, var134, i)
			var133, var134 = protoModule.writeTag(var133, var134, 2, protoModule.wireTypes.lengthDelimited)
			var133, var134 = protoModule.writeString(var133, var134, v)
			local var135 = var133
			local var136 = var134
			local var137, var138 = protoModule.writeTag(buff, var110, 5, protoModule.wireTypes.lengthDelimited)
			var137, var138 = protoModule.writeBuffer(var137, var138, var135, var136)
			buff = var137
			var110 = var138
		end
	end
	local buff_1 = buffer.create(var110)
	buffer.copy(buff_1, 0, buff, 0, var110)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 716 ]]
	-- upvalues: t_4 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var140 = t_4.new()
	local var141 = 0
	while var141 < buffer.len(p7) do
		local _ = nil
		local var142 = nil
		local var143, var144, var145 = protoModule.readTag(p7, var141)
		local var146 = var143
		var142 = var144
		var141 = var145
		
		if var142 == protoModule.wireTypes.varint then
			local _ = nil
			local var147, var148 = protoModule.readVarInt(p7, var141)
			local _ = var147
			var141 = var148
			continue
		end
		if var142 == protoModule.wireTypes.lengthDelimited then
			if var146 == 1 then
				local _ = nil
				local var149, var150 = protoModule.readBuffer(p7, var141)
				var141 = var150
				table.insert(var140.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var149))
			elseif var146 == 2 then
				local _ = nil
				local var151, var152 = protoModule.readBuffer(p7, var141)
				var141 = var152
				var140.hydration_data = hydrationContentModule.HydrationContent.decode(var151)
			elseif var146 == 3 then
				local _ = nil
				local var153, var154 = protoModule.readBuffer(p7, var141)
				var141 = var154
				var153 = t.GetEligiblePromptsResponse_TemplatesEntry.decode(var153)
				var140.templates[var153.key or ""] = var153.value or templateEntryModule.TemplateEntry.new()
			elseif var146 == 4 then
				local _ = nil
				local var155, var156 = protoModule.readBuffer(p7, var141)
				var141 = var156
				var155 = t.GetEligiblePromptsResponse_CustomPromptsEntry.decode(var155)
				var140.custom_prompts[var155.key or ""] = var155.value or t.CustomPrompt.new()
			elseif var146 == 5 then
				local _ = nil
				local var157, var158 = protoModule.readBuffer(p7, var141)
				var141 = var158
				var157 = t.GetEligiblePromptsResponse_LocalizedLiteralsEntry.decode(var157)
				var140.localized_literals[var157.key or ""] = var157.value or ""
			else
				local _ = nil
				local var159, var160 = protoModule.readVarInt(p7, var141)
				var141 = var160 + var159
			end
		elseif var142 == protoModule.wireTypes.i32 then
			local _ = nil
			local var161, var162 = protoModule.readFixed32(p7, var141)
			local _ = var161
			var141 = var162
		elseif var142 == protoModule.wireTypes.i64 then
			local _ = nil
			local var163, var164 = protoModule.readFixed64(p7, var141)
			local _ = var163
			var141 = var164
		else
			error("Unsupported wire type: " .. var142)
		end
	end
	return var140
end

function t_4:jsonEncode() --[[ line: 804 ]]
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
	if self.custom_prompts ~= nil and next(self.custom_prompts) ~= nil then
		local t_1 = {}
		
		for i, v in self.custom_prompts do
			t_1[i] = v:jsonEncode()
		end
		t.customPrompts = t_1
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

function t_4:jsonDecode() --[[ line: 846 ]]
	-- upvalues: t_4 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref), t (ref)
	local var170 = t_4.new()
	
	if self.page_entries ~= nil then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var170.page_entries = t_1
	end
	if self.pageEntries ~= nil then
		local t_1 = {}
		
		for i, v in self.pageEntries do
			table.insert(t_1, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var170.page_entries = t_1
	end
	if self.hydration_data ~= nil then
		var170.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var170.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var170.templates = t_1
	end
	if self.custom_prompts ~= nil then
		local t_1 = {}
		
		for i, v in self.custom_prompts do
			t_1[i] = t.CustomPrompt.jsonDecode(v)
		end
		var170.custom_prompts = t_1
	end
	if self.customPrompts ~= nil then
		local t_1 = {}
		
		for i, v in self.customPrompts do
			t_1[i] = t.CustomPrompt.jsonDecode(v)
		end
		var170.custom_prompts = t_1
	end
	if self.localized_literals ~= nil then
		local t_1 = {}
		
		for i, v in self.localized_literals do
			t_1[i] = v
		end
		var170.localized_literals = t_1
	end
	if self.localizedLiterals ~= nil then
		local t_1 = {}
		
		for i, v in self.localizedLiterals do
			t_1[i] = v
		end
		var170.localized_literals = t_1
	end
	return var170
end

t_4.descriptor = {
	name = "GetEligiblePromptsResponse",
	fullName = "roblox.apppageplatform.prompts.v1beta1.GetEligiblePromptsResponse"
}
t.GetEligiblePromptsResponse = t_4
typeRegistryModule.default:register(t.GetEligiblePromptsResponse)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 947 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		key = if p8 == nil or p8.key == nil then "" else p8.key,
		value = if p8 == nil or p8.value == nil then nil else p8.value
	}, t_5)
end

function t_5:encode() --[[ line: 956 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var179 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var180, var181 = protoModule.writeTag(buff, var179, 1, protoModule.wireTypes.lengthDelimited)
		var180, var181 = protoModule.writeString(var180, var181, self.key)
		buff = var180
		var179 = var181
	end
	if self.value ~= nil then
		local var182 = self.value:encode()
		local var183, var184 = protoModule.writeTag(buff, var179, 2, protoModule.wireTypes.lengthDelimited)
		var183, var184 = protoModule.writeBuffer(var183, var184, var182, buffer.len(var182))
		buff = var183
		var179 = var184
	end
	local buff_1 = buffer.create(var179)
	buffer.copy(buff_1, 0, buff, 0, var179)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 978 ]]
	-- upvalues: t_5 (ref), protoModule (ref), templateEntryModule (ref)
	local var186 = t_5.new()
	local var187 = 0
	while var187 < buffer.len(p9) do
		local _ = nil
		local var188 = nil
		local var189, var190, var191 = protoModule.readTag(p9, var187)
		local var192 = var189
		var188 = var190
		var187 = var191
		
		if var188 == protoModule.wireTypes.varint then
			local _ = nil
			local var193, var194 = protoModule.readVarInt(p9, var187)
			local _ = var193
			var187 = var194
			continue
		end
		if var188 == protoModule.wireTypes.lengthDelimited then
			if var192 == 1 then
				local _ = nil
				local var195, var196 = protoModule.readBuffer(p9, var187)
				var187 = var196
				var186.key = buffer.tostring(var195)
			elseif var192 == 2 then
				local _ = nil
				local var197, var198 = protoModule.readBuffer(p9, var187)
				var187 = var198
				var186.value = templateEntryModule.TemplateEntry.decode(var197)
			else
				local _ = nil
				local var199, var200 = protoModule.readVarInt(p9, var187)
				var187 = var200 + var199
			end
		elseif var188 == protoModule.wireTypes.i32 then
			local _ = nil
			local var201, var202 = protoModule.readFixed32(p9, var187)
			local _ = var201
			var187 = var202
		elseif var188 == protoModule.wireTypes.i64 then
			local _ = nil
			local var203, var204 = protoModule.readFixed64(p9, var187)
			local _ = var203
			var187 = var204
		else
			error("Unsupported wire type: " .. var188)
		end
	end
	return var186
end

function t_5:jsonEncode() --[[ line: 1028 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_5:jsonDecode() --[[ line: 1044 ]]
	-- upvalues: t_5 (ref), templateEntryModule (ref)
	local var206 = t_5.new()
	
	if self.key ~= nil then
		var206.key = self.key
	end
	if self.value ~= nil then
		var206.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var206
end

t_5.descriptor = {
	name = "GetEligiblePromptsResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.TemplatesEntry"
}
t.GetEligiblePromptsResponse_TemplatesEntry = t_5
typeRegistryModule.default:register(t.GetEligiblePromptsResponse_TemplatesEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 1074 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		key = if p10 == nil or p10.key == nil then "" else p10.key,
		value = if p10 == nil or p10.value == nil then nil else p10.value
	}, t_6)
end

function t_6:encode() --[[ line: 1083 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var208 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var209, var210 = protoModule.writeTag(buff, var208, 1, protoModule.wireTypes.lengthDelimited)
		var209, var210 = protoModule.writeString(var209, var210, self.key)
		buff = var209
		var208 = var210
	end
	if self.value ~= nil then
		local var211 = self.value:encode()
		local var212, var213 = protoModule.writeTag(buff, var208, 2, protoModule.wireTypes.lengthDelimited)
		var212, var213 = protoModule.writeBuffer(var212, var213, var211, buffer.len(var211))
		buff = var212
		var208 = var213
	end
	local buff_1 = buffer.create(var208)
	buffer.copy(buff_1, 0, buff, 0, var208)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 1105 ]]
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var215 = t_6.new()
	local var216 = 0
	while var216 < buffer.len(p11) do
		local _ = nil
		local var217 = nil
		local var218, var219, var220 = protoModule.readTag(p11, var216)
		local var221 = var218
		var217 = var219
		var216 = var220
		
		if var217 == protoModule.wireTypes.varint then
			local _ = nil
			local var222, var223 = protoModule.readVarInt(p11, var216)
			local _ = var222
			var216 = var223
			continue
		end
		if var217 == protoModule.wireTypes.lengthDelimited then
			if var221 == 1 then
				local _ = nil
				local var224, var225 = protoModule.readBuffer(p11, var216)
				var216 = var225
				var215.key = buffer.tostring(var224)
			elseif var221 == 2 then
				local _ = nil
				local var226, var227 = protoModule.readBuffer(p11, var216)
				var216 = var227
				var215.value = t.CustomPrompt.decode(var226)
			else
				local _ = nil
				local var228, var229 = protoModule.readVarInt(p11, var216)
				var216 = var229 + var228
			end
		elseif var217 == protoModule.wireTypes.i32 then
			local _ = nil
			local var230, var231 = protoModule.readFixed32(p11, var216)
			local _ = var230
			var216 = var231
		elseif var217 == protoModule.wireTypes.i64 then
			local _ = nil
			local var232, var233 = protoModule.readFixed64(p11, var216)
			local _ = var232
			var216 = var233
		else
			error("Unsupported wire type: " .. var217)
		end
	end
	return var215
end

function t_6:jsonEncode() --[[ line: 1155 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_6:jsonDecode() --[[ line: 1171 ]]
	-- upvalues: t_6 (ref), t (ref)
	local var235 = t_6.new()
	
	if self.key ~= nil then
		var235.key = self.key
	end
	if self.value ~= nil then
		var235.value = t.CustomPrompt.jsonDecode(self.value)
	end
	return var235
end

t_6.descriptor = {
	name = "GetEligiblePromptsResponse_CustomPromptsEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.CustomPromptsEntry"
}
t.GetEligiblePromptsResponse_CustomPromptsEntry = t_6
typeRegistryModule.default:register(t.GetEligiblePromptsResponse_CustomPromptsEntry)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12) --[[ line: 1202 ]]
	-- upvalues: t_7 (ref)
	return setmetatable({
		key = if p12 == nil or p12.key == nil then "" else p12.key,
		value = if p12 == nil or p12.value == nil then "" else p12.value
	}, t_7)
end

function t_7:encode() --[[ line: 1214 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var237 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var238, var239 = protoModule.writeTag(buff, var237, 1, protoModule.wireTypes.lengthDelimited)
		var238, var239 = protoModule.writeString(var238, var239, self.key)
		buff = var238
		var237 = var239
	end
	if self.value ~= nil and self.value ~= "" then
		local var240, var241 = protoModule.writeTag(buff, var237, 2, protoModule.wireTypes.lengthDelimited)
		var240, var241 = protoModule.writeString(var240, var241, self.value)
		buff = var240
		var237 = var241
	end
	local buff_1 = buffer.create(var237)
	buffer.copy(buff_1, 0, buff, 0, var237)
	
	return buff_1
end

function t_7.decode(p13) --[[ line: 1235 ]]
	-- upvalues: t_7 (ref), protoModule (ref)
	local var243 = t_7.new()
	local var244 = 0
	while var244 < buffer.len(p13) do
		local _ = nil
		local var245 = nil
		local var246, var247, var248 = protoModule.readTag(p13, var244)
		local var249 = var246
		var245 = var247
		var244 = var248
		
		if var245 == protoModule.wireTypes.varint then
			local _ = nil
			local var250, var251 = protoModule.readVarInt(p13, var244)
			local _ = var250
			var244 = var251
			continue
		end
		if var245 == protoModule.wireTypes.lengthDelimited then
			if var249 == 1 then
				local _ = nil
				local var252, var253 = protoModule.readBuffer(p13, var244)
				var244 = var253
				var243.key = buffer.tostring(var252)
			elseif var249 == 2 then
				local _ = nil
				local var254, var255 = protoModule.readBuffer(p13, var244)
				var244 = var255
				var243.value = buffer.tostring(var254)
			else
				local _ = nil
				local var256, var257 = protoModule.readVarInt(p13, var244)
				var244 = var257 + var256
			end
		elseif var245 == protoModule.wireTypes.i32 then
			local _ = nil
			local var258, var259 = protoModule.readFixed32(p13, var244)
			local _ = var258
			var244 = var259
		elseif var245 == protoModule.wireTypes.i64 then
			local _ = nil
			local var260, var261 = protoModule.readFixed64(p13, var244)
			local _ = var260
			var244 = var261
		else
			error("Unsupported wire type: " .. var245)
		end
	end
	return var243
end

function t_7:jsonEncode() --[[ line: 1285 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_7:jsonDecode() --[[ line: 1301 ]]
	-- upvalues: t_7 (ref)
	local var263 = t_7.new()
	
	if self.key ~= nil then
		var263.key = self.key
	end
	if self.value ~= nil then
		var263.value = self.value
	end
	return var263
end

t_7.descriptor = {
	name = "GetEligiblePromptsResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.LocalizedLiteralsEntry"
}
t.GetEligiblePromptsResponse_LocalizedLiteralsEntry = t_7
typeRegistryModule.default:register(t.GetEligiblePromptsResponse_LocalizedLiteralsEntry)

return {
	CustomPrompt = t.CustomPrompt,
	GetEligiblePromptsResponse = t.GetEligiblePromptsResponse
}