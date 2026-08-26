local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		parameters = if p1 == nil or p1.parameters == nil then {} else p1.parameters,
		translations = if p1 == nil or p1.translations == nil then {} else p1.translations
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.parameters ~= nil and next(self.parameters) ~= nil then
		for i, v in self.parameters do
			local var2, var3 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2, var16 = protoModule.writeString(var2, var3, i)
			var2, var16 = protoModule.writeTag(var2, var3, 2, protoModule.wireTypes.lengthDelimited)
			var2, var16 = protoModule.writeString(var2, var3, v)
			local var4 = var2
			local var5 = var3
			local var6, var7 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var6, var20 = protoModule.writeBuffer(var6, var7, var4, var5)
			buff = var6
			var1 = var7
		end
	end
	if self.translations ~= nil and next(self.translations) ~= nil then
		for i, v in self.translations do
			local var8, var9 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var8, var22 = protoModule.writeString(var8, var9, i)
			var8, var22 = protoModule.writeTag(var8, var9, 2, protoModule.wireTypes.lengthDelimited)
			var8, var22 = protoModule.writeString(var8, var9, v)
			local var10 = var8
			local var11 = var9
			local var12, var13 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var12, var26 = protoModule.writeBuffer(var12, var13, var10, var11)
			buff = var12
			var1 = var13
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var14 = t_1.new()
	local var15 = 0
	while var15 < buffer.len(p1) do
		local _ = nil
		local var16 = nil
		local var17, var18, var19 = protoModule.readTag(p1, var15)
		local var20 = var17
		var16 = var18
		var15 = var19
		
		if var16 == protoModule.wireTypes.varint then
			local _ = nil
			local var21, var22 = protoModule.readVarInt(p1, var15)
			local _ = var21
			var15 = var22
			continue
		end
		if var16 == protoModule.wireTypes.lengthDelimited then
			if var20 == 1 then
				local _ = nil
				local var23, var24 = protoModule.readBuffer(p1, var15)
				var15 = var24
				var23 = t.CustomPrompt_ParametersEntry.decode(var23)
				var14.parameters[var23.key or ""] = var23.value or ""
			elseif var20 == 2 then
				local _ = nil
				local var25, var26 = protoModule.readBuffer(p1, var15)
				var15 = var26
				var25 = t.CustomPrompt_TranslationsEntry.decode(var25)
				var14.translations[var25.key or ""] = var25.value or ""
			else
				local _ = nil
				local var27, var28 = protoModule.readVarInt(p1, var15)
				var15 = var28 + var27
			end
		elseif var16 == protoModule.wireTypes.i32 then
			local _ = nil
			local var29, var30 = protoModule.readFixed32(p1, var15)
			local _ = var29
			var15 = var30
		elseif var16 == protoModule.wireTypes.i64 then
			local _ = nil
			local var31, var32 = protoModule.readFixed64(p1, var15)
			local _ = var31
			var15 = var32
		else
			error("Unsupported wire type: " .. var30)
		end
	end
	return var14
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var33 = t_1.new()
	
	if self.parameters ~= nil then
		local t = {}
		
		for i, v in self.parameters do
			t[i] = v
		end
		var33.parameters = t
	end
	if self.translations ~= nil then
		local t = {}
		
		for i, v in self.translations do
			t[i] = v
		end
		var33.translations = t
	end
	return var33
end

t_1.descriptor = {
	name = "CustomPrompt",
	fullName = "roblox.apppageplatform.prompts.v1beta1.CustomPrompt"
}
t.CustomPrompt = t_1
typeRegistryModule.default:register(t.CustomPrompt)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p2 == nil or p2.key == nil then "" else p2.key,
		value = if p2 == nil or p2.value == nil then "" else p2.value
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var34 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var35, var36 = protoModule.writeTag(buff, var34, 1, protoModule.wireTypes.lengthDelimited)
		var35, var56 = protoModule.writeString(var35, var36, self.key)
		buff = var35
		var34 = var36
	end
	if self.value ~= nil and self.value ~= "" then
		local var37, var38 = protoModule.writeTag(buff, var34, 2, protoModule.wireTypes.lengthDelimited)
		var37, var58 = protoModule.writeString(var37, var38, self.value)
		buff = var37
		var34 = var38
	end
	local buff_1 = buffer.create(var34)
	buffer.copy(buff_1, 0, buff, 0, var34)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var34 = t_2.new()
	local var35 = 0
	while var35 < buffer.len(p2) do
		local _ = nil
		local var36 = nil
		local var37, var38, var39 = protoModule.readTag(p2, var35)
		local var40 = var37
		var36 = var38
		var35 = var39
		
		if var36 == protoModule.wireTypes.varint then
			local _ = nil
			local var41, var42 = protoModule.readVarInt(p2, var35)
			local _ = var41
			var35 = var42
			continue
		end
		if var36 == protoModule.wireTypes.lengthDelimited then
			if var40 == 1 then
				local _ = nil
				local var43, var44 = protoModule.readBuffer(p2, var35)
				var35 = var44
				var34.key = buffer.tostring(var43)
			elseif var40 == 2 then
				local _ = nil
				local var45, var46 = protoModule.readBuffer(p2, var35)
				var35 = var46
				var34.value = buffer.tostring(var45)
			else
				local _ = nil
				local var47, var48 = protoModule.readVarInt(p2, var35)
				var35 = var48 + var47
			end
		elseif var36 == protoModule.wireTypes.i32 then
			local _ = nil
			local var49, var50 = protoModule.readFixed32(p2, var35)
			local _ = var49
			var35 = var50
		elseif var36 == protoModule.wireTypes.i64 then
			local _ = nil
			local var51, var52 = protoModule.readFixed64(p2, var35)
			local _ = var51
			var35 = var52
		else
			error("Unsupported wire type: " .. var62)
		end
	end
	return var34
end

function t_2:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref)
	local var53 = t_2.new()
	
	if self.key ~= nil then
		var53.key = self.key
	end
	if self.value ~= nil then
		var53.value = self.value
	end
	return var53
end

t_2.descriptor = {
	name = "CustomPrompt_ParametersEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.ParametersEntry"
}
t.CustomPrompt_ParametersEntry = t_2
typeRegistryModule.default:register(t.CustomPrompt_ParametersEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		key = if p3 == nil or p3.key == nil then "" else p3.key,
		value = if p3 == nil or p3.value == nil then "" else p3.value
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var53 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var54, var55 = protoModule.writeTag(buff, var53, 1, protoModule.wireTypes.lengthDelimited)
		var54, var84 = protoModule.writeString(var54, var55, self.key)
		buff = var54
		var53 = var55
	end
	if self.value ~= nil and self.value ~= "" then
		local var56, var57 = protoModule.writeTag(buff, var53, 2, protoModule.wireTypes.lengthDelimited)
		var56, var86 = protoModule.writeString(var56, var57, self.value)
		buff = var56
		var53 = var57
	end
	local buff_1 = buffer.create(var53)
	buffer.copy(buff_1, 0, buff, 0, var53)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref)
	local var53 = t_3.new()
	local var54 = 0
	while var54 < buffer.len(p3) do
		local _ = nil
		local var55 = nil
		local var56, var57, var58 = protoModule.readTag(p3, var54)
		local var59 = var56
		var55 = var57
		var54 = var58
		
		if var55 == protoModule.wireTypes.varint then
			local _ = nil
			local var60, var61 = protoModule.readVarInt(p3, var54)
			local _ = var60
			var54 = var61
			continue
		end
		if var55 == protoModule.wireTypes.lengthDelimited then
			if var59 == 1 then
				local _ = nil
				local var62, var63 = protoModule.readBuffer(p3, var54)
				var54 = var63
				var53.key = buffer.tostring(var62)
			elseif var59 == 2 then
				local _ = nil
				local var64, var65 = protoModule.readBuffer(p3, var54)
				var54 = var65
				var53.value = buffer.tostring(var64)
			else
				local _ = nil
				local var66, var67 = protoModule.readVarInt(p3, var54)
				var54 = var67 + var66
			end
		elseif var55 == protoModule.wireTypes.i32 then
			local _ = nil
			local var68, var69 = protoModule.readFixed32(p3, var54)
			local _ = var68
			var54 = var69
		elseif var55 == protoModule.wireTypes.i64 then
			local _ = nil
			local var70, var71 = protoModule.readFixed64(p3, var54)
			local _ = var70
			var54 = var71
		else
			error("Unsupported wire type: " .. var90)
		end
	end
	return var53
end

function t_3:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref)
	local var72 = t_3.new()
	
	if self.key ~= nil then
		var72.key = self.key
	end
	if self.value ~= nil then
		var72.value = self.value
	end
	return var72
end

t_3.descriptor = {
	name = "CustomPrompt_TranslationsEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.TranslationsEntry"
}
t.CustomPrompt_TranslationsEntry = t_3
typeRegistryModule.default:register(t.CustomPrompt_TranslationsEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		page_entries = if p4 == nil or p4.page_entries == nil then {} else p4.page_entries,
		hydration_data = if p4 == nil or p4.hydration_data == nil then nil else p4.hydration_data,
		templates = if p4 == nil or p4.templates == nil then {} else p4.templates,
		custom_prompts = if p4 == nil or p4.custom_prompts == nil then {} else p4.custom_prompts,
		localized_literals = if p4 == nil or p4.localized_literals == nil then {} else p4.localized_literals
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var72 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var73 = v:encode()
			local var74, var75 = protoModule.writeTag(buff, var72, 1, protoModule.wireTypes.lengthDelimited)
			var74, var113 = protoModule.writeBuffer(var74, var75, var73, buffer.len(var73))
			buff = var74
			var72 = var75
		end
	end
	if self.hydration_data ~= nil then
		local var76 = self.hydration_data:encode()
		local var77, var78 = protoModule.writeTag(buff, var72, 2, protoModule.wireTypes.lengthDelimited)
		var77, var116 = protoModule.writeBuffer(var77, var78, var76, buffer.len(var76))
		buff = var77
		var72 = var78
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var79, var80 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var79, var118 = protoModule.writeString(var79, var80, i)
			local var81 = v:encode()
			var80, var120 = protoModule.writeTag(var79, var80, 2, protoModule.wireTypes.lengthDelimited)
			var80, var120 = protoModule.writeBuffer(var80, var120, var81, buffer.len(var81))
			local var82 = var80
			local var83 = var120
			local var84, var85 = protoModule.writeTag(buff, var72, 3, protoModule.wireTypes.lengthDelimited)
			var84, var124 = protoModule.writeBuffer(var84, var85, var82, var83)
			buff = var84
			var72 = var85
		end
	end
	if self.custom_prompts ~= nil and next(self.custom_prompts) ~= nil then
		for i, v in self.custom_prompts do
			local var86, var87 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var86, var126 = protoModule.writeString(var86, var87, i)
			local var88 = v:encode()
			var87, var128 = protoModule.writeTag(var86, var87, 2, protoModule.wireTypes.lengthDelimited)
			var87, var128 = protoModule.writeBuffer(var87, var128, var88, buffer.len(var88))
			local var89 = var87
			local var90 = var128
			local var91, var92 = protoModule.writeTag(buff, var72, 4, protoModule.wireTypes.lengthDelimited)
			var91, var132 = protoModule.writeBuffer(var91, var92, var89, var90)
			buff = var91
			var72 = var92
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i, v in self.localized_literals do
			local var93, var94 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var93, var134 = protoModule.writeString(var93, var94, i)
			var93, var134 = protoModule.writeTag(var93, var94, 2, protoModule.wireTypes.lengthDelimited)
			var93, var134 = protoModule.writeString(var93, var94, v)
			local var95 = var93
			local var96 = var94
			local var97, var98 = protoModule.writeTag(buff, var72, 5, protoModule.wireTypes.lengthDelimited)
			var97, var138 = protoModule.writeBuffer(var97, var98, var95, var96)
			buff = var97
			var72 = var98
		end
	end
	local buff_1 = buffer.create(var72)
	buffer.copy(buff_1, 0, buff, 0, var72)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var99 = t_4.new()
	local var100 = 0
	while var100 < buffer.len(p4) do
		local _ = nil
		local var101 = nil
		local var102, var103, var104 = protoModule.readTag(p4, var100)
		local var105 = var102
		var101 = var103
		var100 = var104
		
		if var101 == protoModule.wireTypes.varint then
			local _ = nil
			local var106, var107 = protoModule.readVarInt(p4, var100)
			local _ = var106
			var100 = var107
			continue
		end
		if var101 == protoModule.wireTypes.lengthDelimited then
			if var105 == 1 then
				local _ = nil
				local var108, var109 = protoModule.readBuffer(p4, var100)
				var100 = var109
				table.insert(var99.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var108))
			elseif var105 == 2 then
				local _ = nil
				local var110, var111 = protoModule.readBuffer(p4, var100)
				var100 = var111
				var99.hydration_data = hydrationContentModule.HydrationContent.decode(var110)
			elseif var105 == 3 then
				local _ = nil
				local var112, var113 = protoModule.readBuffer(p4, var100)
				var100 = var113
				var112 = t.GetEligiblePromptsResponse_TemplatesEntry.decode(var112)
				var99.templates[var112.key or ""] = var112.value or templateEntryModule.TemplateEntry.new()
			elseif var105 == 4 then
				local _ = nil
				local var114, var115 = protoModule.readBuffer(p4, var100)
				var100 = var115
				var114 = t.GetEligiblePromptsResponse_CustomPromptsEntry.decode(var114)
				var99.custom_prompts[var114.key or ""] = var114.value or t.CustomPrompt.new()
			elseif var105 == 5 then
				local _ = nil
				local var116, var117 = protoModule.readBuffer(p4, var100)
				var100 = var117
				var116 = t.GetEligiblePromptsResponse_LocalizedLiteralsEntry.decode(var116)
				var99.localized_literals[var116.key or ""] = var116.value or ""
			else
				local _ = nil
				local var118, var119 = protoModule.readVarInt(p4, var100)
				var100 = var119 + var118
			end
		elseif var101 == protoModule.wireTypes.i32 then
			local _ = nil
			local var120, var121 = protoModule.readFixed32(p4, var100)
			local _ = var120
			var100 = var121
		elseif var101 == protoModule.wireTypes.i64 then
			local _ = nil
			local var122, var123 = protoModule.readFixed64(p4, var100)
			local _ = var122
			var100 = var123
		else
			error("Unsupported wire type: " .. var142)
		end
	end
	return var99
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

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref), t (ref)
	local var124 = t_4.new()
	
	if self.page_entries ~= nil then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var124.page_entries = t_1
	end
	if self.pageEntries ~= nil then
		local t_1 = {}
		
		for i, v in self.pageEntries do
			table.insert(t_1, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var124.page_entries = t_1
	end
	if self.hydration_data ~= nil then
		var124.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var124.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var124.templates = t_1
	end
	if self.custom_prompts ~= nil then
		local t_1 = {}
		
		for i, v in self.custom_prompts do
			t_1[i] = t.CustomPrompt.jsonDecode(v)
		end
		var124.custom_prompts = t_1
	end
	if self.customPrompts ~= nil then
		local t_1 = {}
		
		for i, v in self.customPrompts do
			t_1[i] = t.CustomPrompt.jsonDecode(v)
		end
		var124.custom_prompts = t_1
	end
	if self.localized_literals ~= nil then
		local t_1 = {}
		
		for i, v in self.localized_literals do
			t_1[i] = v
		end
		var124.localized_literals = t_1
	end
	if self.localizedLiterals ~= nil then
		local t_1 = {}
		
		for i, v in self.localizedLiterals do
			t_1[i] = v
		end
		var124.localized_literals = t_1
	end
	return var124
end

t_4.descriptor = {
	name = "GetEligiblePromptsResponse",
	fullName = "roblox.apppageplatform.prompts.v1beta1.GetEligiblePromptsResponse"
}
t.GetEligiblePromptsResponse = t_4
typeRegistryModule.default:register(t.GetEligiblePromptsResponse)
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
	local var125 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var126, var127 = protoModule.writeTag(buff, var125, 1, protoModule.wireTypes.lengthDelimited)
		var126, var181 = protoModule.writeString(var126, var127, self.key)
		buff = var126
		var125 = var127
	end
	if self.value ~= nil then
		local var128 = self.value:encode()
		local var129, var130 = protoModule.writeTag(buff, var125, 2, protoModule.wireTypes.lengthDelimited)
		var129, var184 = protoModule.writeBuffer(var129, var130, var128, buffer.len(var128))
		buff = var129
		var125 = var130
	end
	local buff_1 = buffer.create(var125)
	buffer.copy(buff_1, 0, buff, 0, var125)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), templateEntryModule (ref)
	local var125 = t_5.new()
	local var126 = 0
	while var126 < buffer.len(p5) do
		local _ = nil
		local var127 = nil
		local var128, var129, var130 = protoModule.readTag(p5, var126)
		local var131 = var128
		var127 = var129
		var126 = var130
		
		if var127 == protoModule.wireTypes.varint then
			local _ = nil
			local var132, var133 = protoModule.readVarInt(p5, var126)
			local _ = var132
			var126 = var133
			continue
		end
		if var127 == protoModule.wireTypes.lengthDelimited then
			if var131 == 1 then
				local _ = nil
				local var134, var135 = protoModule.readBuffer(p5, var126)
				var126 = var135
				var125.key = buffer.tostring(var134)
			elseif var131 == 2 then
				local _ = nil
				local var136, var137 = protoModule.readBuffer(p5, var126)
				var126 = var137
				var125.value = templateEntryModule.TemplateEntry.decode(var136)
			else
				local _ = nil
				local var138, var139 = protoModule.readVarInt(p5, var126)
				var126 = var139 + var138
			end
		elseif var127 == protoModule.wireTypes.i32 then
			local _ = nil
			local var140, var141 = protoModule.readFixed32(p5, var126)
			local _ = var140
			var126 = var141
		elseif var127 == protoModule.wireTypes.i64 then
			local _ = nil
			local var142, var143 = protoModule.readFixed64(p5, var126)
			local _ = var142
			var126 = var143
		else
			error("Unsupported wire type: " .. var188)
		end
	end
	return var125
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
	local var144 = t_5.new()
	
	if self.key ~= nil then
		var144.key = self.key
	end
	if self.value ~= nil then
		var144.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var144
end

t_5.descriptor = {
	name = "GetEligiblePromptsResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.TemplatesEntry"
}
t.GetEligiblePromptsResponse_TemplatesEntry = t_5
typeRegistryModule.default:register(t.GetEligiblePromptsResponse_TemplatesEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		key = if p6 == nil or p6.key == nil then "" else p6.key,
		value = if p6 == nil or p6.value == nil then nil else p6.value
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var144 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var145, var146 = protoModule.writeTag(buff, var144, 1, protoModule.wireTypes.lengthDelimited)
		var145, var210 = protoModule.writeString(var145, var146, self.key)
		buff = var145
		var144 = var146
	end
	if self.value ~= nil then
		local var147 = self.value:encode()
		local var148, var149 = protoModule.writeTag(buff, var144, 2, protoModule.wireTypes.lengthDelimited)
		var148, var213 = protoModule.writeBuffer(var148, var149, var147, buffer.len(var147))
		buff = var148
		var144 = var149
	end
	local buff_1 = buffer.create(var144)
	buffer.copy(buff_1, 0, buff, 0, var144)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var144 = t_6.new()
	local var145 = 0
	while var145 < buffer.len(p6) do
		local _ = nil
		local var146 = nil
		local var147, var148, var149 = protoModule.readTag(p6, var145)
		local var150 = var147
		var146 = var148
		var145 = var149
		
		if var146 == protoModule.wireTypes.varint then
			local _ = nil
			local var151, var152 = protoModule.readVarInt(p6, var145)
			local _ = var151
			var145 = var152
			continue
		end
		if var146 == protoModule.wireTypes.lengthDelimited then
			if var150 == 1 then
				local _ = nil
				local var153, var154 = protoModule.readBuffer(p6, var145)
				var145 = var154
				var144.key = buffer.tostring(var153)
			elseif var150 == 2 then
				local _ = nil
				local var155, var156 = protoModule.readBuffer(p6, var145)
				var145 = var156
				var144.value = t.CustomPrompt.decode(var155)
			else
				local _ = nil
				local var157, var158 = protoModule.readVarInt(p6, var145)
				var145 = var158 + var157
			end
		elseif var146 == protoModule.wireTypes.i32 then
			local _ = nil
			local var159, var160 = protoModule.readFixed32(p6, var145)
			local _ = var159
			var145 = var160
		elseif var146 == protoModule.wireTypes.i64 then
			local _ = nil
			local var161, var162 = protoModule.readFixed64(p6, var145)
			local _ = var161
			var145 = var162
		else
			error("Unsupported wire type: " .. var217)
		end
	end
	return var144
end

function t_6:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), t (ref)
	local var163 = t_6.new()
	
	if self.key ~= nil then
		var163.key = self.key
	end
	if self.value ~= nil then
		var163.value = t.CustomPrompt.jsonDecode(self.value)
	end
	return var163
end

t_6.descriptor = {
	name = "GetEligiblePromptsResponse_CustomPromptsEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.CustomPromptsEntry"
}
t.GetEligiblePromptsResponse_CustomPromptsEntry = t_6
typeRegistryModule.default:register(t.GetEligiblePromptsResponse_CustomPromptsEntry)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		key = if p7 == nil or p7.key == nil then "" else p7.key,
		value = if p7 == nil or p7.value == nil then "" else p7.value
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var163 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var164, var165 = protoModule.writeTag(buff, var163, 1, protoModule.wireTypes.lengthDelimited)
		var164, var239 = protoModule.writeString(var164, var165, self.key)
		buff = var164
		var163 = var165
	end
	if self.value ~= nil and self.value ~= "" then
		local var166, var167 = protoModule.writeTag(buff, var163, 2, protoModule.wireTypes.lengthDelimited)
		var166, var241 = protoModule.writeString(var166, var167, self.value)
		buff = var166
		var163 = var167
	end
	local buff_1 = buffer.create(var163)
	buffer.copy(buff_1, 0, buff, 0, var163)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref)
	local var163 = t_7.new()
	local var164 = 0
	while var164 < buffer.len(p7) do
		local _ = nil
		local var165 = nil
		local var166, var167, var168 = protoModule.readTag(p7, var164)
		local var169 = var166
		var165 = var167
		var164 = var168
		
		if var165 == protoModule.wireTypes.varint then
			local _ = nil
			local var170, var171 = protoModule.readVarInt(p7, var164)
			local _ = var170
			var164 = var171
			continue
		end
		if var165 == protoModule.wireTypes.lengthDelimited then
			if var169 == 1 then
				local _ = nil
				local var172, var173 = protoModule.readBuffer(p7, var164)
				var164 = var173
				var163.key = buffer.tostring(var172)
			elseif var169 == 2 then
				local _ = nil
				local var174, var175 = protoModule.readBuffer(p7, var164)
				var164 = var175
				var163.value = buffer.tostring(var174)
			else
				local _ = nil
				local var176, var177 = protoModule.readVarInt(p7, var164)
				var164 = var177 + var176
			end
		elseif var165 == protoModule.wireTypes.i32 then
			local _ = nil
			local var178, var179 = protoModule.readFixed32(p7, var164)
			local _ = var178
			var164 = var179
		elseif var165 == protoModule.wireTypes.i64 then
			local _ = nil
			local var180, var181 = protoModule.readFixed64(p7, var164)
			local _ = var180
			var164 = var181
		else
			error("Unsupported wire type: " .. var245)
		end
	end
	return var163
end

function t_7:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref)
	local var182 = t_7.new()
	
	if self.key ~= nil then
		var182.key = self.key
	end
	if self.value ~= nil then
		var182.value = self.value
	end
	return var182
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