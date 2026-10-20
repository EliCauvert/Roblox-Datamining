local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local HydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local PageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local TemplateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		parameters = if p1 == nil or p1.parameters == nil then {} else p1.parameters,
		translations = if p1 == nil or p1.translations == nil then {} else p1.translations
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.parameters ~= nil and next(self.parameters) ~= nil then
		for i, parameter in self.parameters do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult, WriteTagResult2, i)
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, parameter)
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, WriteStringResult1, WriteStringResult2_1)
		end
	end
	if self.translations ~= nil and next(self.translations) ~= nil then
		for i1, translation in self.translations do
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult3, WriteStringResult2_2 = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, i1)
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(WriteStringResult3, WriteStringResult2_2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult4, WriteStringResult2_3 = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, translation)
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, WriteStringResult4, WriteStringResult2_3)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), t (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v36 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v36 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v36 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.CustomPrompt_ParametersEntry.decode(Buffer1)
				NewModule.parameters[DecodeResult.key or ""] = DecodeResult.value or ""
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v36 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.CustomPrompt_TranslationsEntry.decode(Buffer2)
				NewModule.translations[DecodeResult.key or ""] = DecodeResult.value or ""
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v36 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v36 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.parameters ~= nil and next(self.parameters) ~= nil then
		local Parameters = {}
		
		for i, parameter in self.parameters do
			Parameters[i] = parameter
		end
		t.parameters = Parameters
	end
	if self.translations ~= nil and next(self.translations) ~= nil then
		local Translations = {}
		
		for i1, translation in self.translations do
			Translations[i1] = translation
		end
		t.translations = Translations
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.parameters ~= nil then
		local Parameters = {}
		
		for i, parameter in self.parameters do
			Parameters[i] = parameter
		end
		NewModule.parameters = Parameters
	end
	if self.translations ~= nil then
		local Translations = {}
		
		for i1, translation in self.translations do
			Translations[i1] = translation
		end
		NewModule.translations = Translations
	end
	return NewModule
end

Module.descriptor = {
	name = "CustomPrompt",
	fullName = "roblox.apppageplatform.prompts.v1beta1.CustomPrompt"
}
t.CustomPrompt = Module
TypeRegistryModule.default:register(t.CustomPrompt)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module1))
end

function Module1:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil and self.value ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf)
	-- upvalues: Module1 (copy), ProtoModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v61 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v61 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v61 = ProtoModule.readBuffer(Buf, v2)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v61 = ProtoModule.readBuffer(Buf, v2)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v61 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v61 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy)
	local NewModule = Module1.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module1.descriptor = {
	name = "CustomPrompt_ParametersEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.ParametersEntry"
}
t.CustomPrompt_ParametersEntry = Module1
TypeRegistryModule.default:register(t.CustomPrompt_ParametersEntry)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: Module2 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module2))
end

function Module2:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil and self.value ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v80 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v80 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v80 = ProtoModule.readBuffer(Buf, v3)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v80 = ProtoModule.readBuffer(Buf, v3)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v80 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v80 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module2:jsonDecode()
	-- upvalues: Module2 (copy)
	local NewModule = Module2.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module2.descriptor = {
	name = "CustomPrompt_TranslationsEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.TranslationsEntry"
}
t.CustomPrompt_TranslationsEntry = Module2
TypeRegistryModule.default:register(t.CustomPrompt_TranslationsEntry)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1)
	-- upvalues: Module3 (copy)
	return (setmetatable({
		page_entries = if p1 == nil or p1.page_entries == nil then {} else p1.page_entries,
		hydration_data = if p1 == nil or p1.hydration_data == nil then nil else p1.hydration_data,
		templates = if p1 == nil or p1.templates == nil then {} else p1.templates,
		custom_prompts = if p1 == nil or p1.custom_prompts == nil then {} else p1.custom_prompts,
		localized_literals = if p1 == nil or p1.localized_literals == nil then {} else p1.localized_literals
	}, Module3))
end

function Module3:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for _, pageEntry in self.page_entries do
			local EncodeResult = pageEntry:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.hydration_data ~= nil then
		local EncodeResult = self.hydration_data:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, template in self.templates do
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, i)
			local EncodeResult = template:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.custom_prompts ~= nil and next(self.custom_prompts) ~= nil then
		for i1, customPrompt in self.custom_prompts do
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, i1)
			local EncodeResult = customPrompt:encode()
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(WriteStringResult1, WriteStringResult2_1, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult1, WriteBufferResult2_1 = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, WriteBufferResult1, WriteBufferResult2_1)
		end
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i2, localizedLiteral in self.localized_literals do
			local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult3, WriteStringResult2_2 = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, i2)
			local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(WriteStringResult3, WriteStringResult2_2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult4, WriteStringResult2_3 = ProtoModule.writeString(WriteTagResult10, WriteTagResult2_9, localizedLiteral)
			local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult11, WriteTagResult2_10, WriteStringResult4, WriteStringResult2_3)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf)
	-- upvalues: Module3 (copy), ProtoModule (copy), PageEntryContentModule (copy), HydrationContentModule (copy), t (copy), TemplateEntryModule (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v133 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v133 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v133 = ProtoModule.readBuffer(Buf, v4)
				table.insert(NewModule.page_entries, PageEntryContentModule.UniversalPageEntry.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v133 = ProtoModule.readBuffer(Buf, v4)
				NewModule.hydration_data = HydrationContentModule.HydrationContent.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v133 = ProtoModule.readBuffer(Buf, v4)
				local DecodeResult = t.GetEligiblePromptsResponse_TemplatesEntry.decode(Buffer3)
				local NewResult = TemplateEntryModule.TemplateEntry.new()
				NewModule.templates[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v133 = ProtoModule.readBuffer(Buf, v4)
				local DecodeResult = t.GetEligiblePromptsResponse_CustomPromptsEntry.decode(Buffer4)
				local NewResult = t.CustomPrompt.new()
				NewModule.custom_prompts[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v133 = ProtoModule.readBuffer(Buf, v4)
				local DecodeResult = t.GetEligiblePromptsResponse_LocalizedLiteralsEntry.decode(Buffer5)
				NewModule.localized_literals[DecodeResult.key or ""] = DecodeResult.value or ""
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v133 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v133 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode()
	local t = {}
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		local PageEntries = {}
		
		for _, pageEntry in self.page_entries do
			table.insert(PageEntries, pageEntry:jsonEncode())
		end
		t.pageEntries = PageEntries
	end
	if self.hydration_data ~= nil then
		t.hydrationData = self.hydration_data:jsonEncode()
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		local Templates = {}
		
		for i, template in self.templates do
			Templates[i] = template:jsonEncode()
		end
		t.templates = Templates
	end
	if self.custom_prompts ~= nil and next(self.custom_prompts) ~= nil then
		local CustomPrompts = {}
		
		for i1, customPrompt in self.custom_prompts do
			CustomPrompts[i1] = customPrompt:jsonEncode()
		end
		t.customPrompts = CustomPrompts
	end
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		local LocalizedLiterals = {}
		
		for i2, localizedLiteral in self.localized_literals do
			LocalizedLiterals[i2] = localizedLiteral
		end
		t.localizedLiterals = LocalizedLiterals
	end
	return t
end

function Module3:jsonDecode()
	-- upvalues: Module3 (copy), PageEntryContentModule (copy), HydrationContentModule (copy), TemplateEntryModule (copy), t (copy)
	local NewModule = Module3.new()
	
	if self.page_entries ~= nil then
		local Page_entries = {}
		
		for _, pageEntry in self.page_entries do
			table.insert(Page_entries, PageEntryContentModule.UniversalPageEntry.jsonDecode(pageEntry))
		end
		NewModule.page_entries = Page_entries
	end
	if self.pageEntries ~= nil then
		local Page_entries = {}
		
		for _, pageEntry1 in self.pageEntries do
			table.insert(Page_entries, PageEntryContentModule.UniversalPageEntry.jsonDecode(pageEntry1))
		end
		NewModule.page_entries = Page_entries
	end
	if self.hydration_data ~= nil then
		NewModule.hydration_data = HydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		NewModule.hydration_data = HydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local Templates = {}
		
		for i, template in self.templates do
			Templates[i] = TemplateEntryModule.TemplateEntry.jsonDecode(template)
		end
		NewModule.templates = Templates
	end
	if self.custom_prompts ~= nil then
		local Custom_prompts = {}
		
		for i1, customPrompt in self.custom_prompts do
			Custom_prompts[i1] = t.CustomPrompt.jsonDecode(customPrompt)
		end
		NewModule.custom_prompts = Custom_prompts
	end
	if self.customPrompts ~= nil then
		local Custom_prompts = {}
		
		for i2, customPrompt1 in self.customPrompts do
			Custom_prompts[i2] = t.CustomPrompt.jsonDecode(customPrompt1)
		end
		NewModule.custom_prompts = Custom_prompts
	end
	if self.localized_literals ~= nil then
		local Localized_literals = {}
		
		for i3, localizedLiteral in self.localized_literals do
			Localized_literals[i3] = localizedLiteral
		end
		NewModule.localized_literals = Localized_literals
	end
	if self.localizedLiterals ~= nil then
		local Localized_literals = {}
		
		for i4, localizedLiteral1 in self.localizedLiterals do
			Localized_literals[i4] = localizedLiteral1
		end
		NewModule.localized_literals = Localized_literals
	end
	return NewModule
end

Module3.descriptor = {
	name = "GetEligiblePromptsResponse",
	fullName = "roblox.apppageplatform.prompts.v1beta1.GetEligiblePromptsResponse"
}
t.GetEligiblePromptsResponse = Module3
TypeRegistryModule.default:register(t.GetEligiblePromptsResponse)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1)
	-- upvalues: Module4 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module4))
end

function Module4:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf)
	-- upvalues: Module4 (copy), ProtoModule (copy), TemplateEntryModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v172 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v172 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v172 = ProtoModule.readBuffer(Buf, v5)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v172 = ProtoModule.readBuffer(Buf, v5)
				NewModule.value = TemplateEntryModule.TemplateEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v172 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v172 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module4:jsonDecode()
	-- upvalues: Module4 (copy), TemplateEntryModule (copy)
	local NewModule = Module4.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = TemplateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module4.descriptor = {
	name = "GetEligiblePromptsResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.TemplatesEntry"
}
t.GetEligiblePromptsResponse_TemplatesEntry = Module4
TypeRegistryModule.default:register(t.GetEligiblePromptsResponse_TemplatesEntry)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1)
	-- upvalues: Module5 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module5))
end

function Module5:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf)
	-- upvalues: Module5 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v192 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v192 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v192 = ProtoModule.readBuffer(Buf, v6)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v192 = ProtoModule.readBuffer(Buf, v6)
				NewModule.value = t.CustomPrompt.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v192 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v192 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module5:jsonDecode()
	-- upvalues: Module5 (copy), t (copy)
	local NewModule = Module5.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.CustomPrompt.jsonDecode(self.value)
	end
	return NewModule
end

Module5.descriptor = {
	name = "GetEligiblePromptsResponse_CustomPromptsEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.CustomPromptsEntry"
}
t.GetEligiblePromptsResponse_CustomPromptsEntry = Module5
TypeRegistryModule.default:register(t.GetEligiblePromptsResponse_CustomPromptsEntry)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1)
	-- upvalues: Module6 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module6))
end

function Module6:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil and self.value ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module6.decode(Buf)
	-- upvalues: Module6 (copy), ProtoModule (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v211 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v211 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v211 = ProtoModule.readBuffer(Buf, v7)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v211 = ProtoModule.readBuffer(Buf, v7)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v211 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v211 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module6:jsonDecode()
	-- upvalues: Module6 (copy)
	local NewModule = Module6.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module6.descriptor = {
	name = "GetEligiblePromptsResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.LocalizedLiteralsEntry"
}
t.GetEligiblePromptsResponse_LocalizedLiteralsEntry = Module6
TypeRegistryModule.default:register(t.GetEligiblePromptsResponse_LocalizedLiteralsEntry)

return {
	CustomPrompt = t.CustomPrompt,
	GetEligiblePromptsResponse = t.GetEligiblePromptsResponse
}