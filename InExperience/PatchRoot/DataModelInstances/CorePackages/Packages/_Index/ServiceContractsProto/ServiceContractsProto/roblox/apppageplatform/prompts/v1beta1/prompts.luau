local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local ClientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local HydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local PageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local TemplateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 310 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		parameters = if p1 == nil or p1.parameters == nil then {} else p1.parameters,
		translations = if p1 == nil or p1.translations == nil then {} else p1.translations
	}, Module))
end

function Module:encode() --[[ Line: 317 ]]
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

function Module.decode(Buf) --[[ Line: 352 ]]
	-- upvalues: Module (copy), ProtoModule (copy), t (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v39 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v39 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v39 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.CustomPrompt_ParametersEntry.decode(Buffer1)
				NewModule.parameters[DecodeResult.key or ""] = DecodeResult.value or ""
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v39 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.CustomPrompt_TranslationsEntry.decode(Buffer2)
				NewModule.translations[DecodeResult.key or ""] = DecodeResult.value or ""
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v39 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v39 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 414 ]]
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

function Module:jsonDecode() --[[ Line: 436 ]]
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

function Module1.new(p1) --[[ Line: 474 ]]
	-- upvalues: Module1 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module1))
end

function Module1:encode() --[[ Line: 483 ]]
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

function Module1.decode(Buf) --[[ Line: 502 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v64 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v64 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v64 = ProtoModule.readBuffer(Buf, v2)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v64 = ProtoModule.readBuffer(Buf, v2)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v64 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v64 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode() --[[ Line: 550 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module1:jsonDecode() --[[ Line: 564 ]]
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

function Module2.new(p1) --[[ Line: 592 ]]
	-- upvalues: Module2 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module2))
end

function Module2:encode() --[[ Line: 601 ]]
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

function Module2.decode(Buf) --[[ Line: 620 ]]
	-- upvalues: Module2 (copy), ProtoModule (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v83 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v83 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v83 = ProtoModule.readBuffer(Buf, v3)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v83 = ProtoModule.readBuffer(Buf, v3)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v83 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v83 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode() --[[ Line: 668 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module2:jsonDecode() --[[ Line: 682 ]]
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

function Module3.new(p1) --[[ Line: 710 ]]
	-- upvalues: Module3 (copy)
	return (setmetatable({
		entry_points = if p1 == nil or p1.entry_points == nil then {} else p1.entry_points,
		deeplink_detected = p1 ~= nil and p1.deeplink_detected ~= nil and p1.deeplink_detected,
		prompt_styles = if p1 == nil or p1.prompt_styles == nil then {} else p1.prompt_styles,
		client_attributes = if p1 == nil or p1.client_attributes == nil then {} else p1.client_attributes,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities
	}, Module3))
end

function Module3:encode() --[[ Line: 724 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.entry_points ~= nil and #self.entry_points > 0 then
		for _, entryPoint in self.entry_points do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, entryPoint)
		end
	end
	if self.deeplink_detected then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.deeplink_detected then 1 else 0)
	end
	if self.prompt_styles ~= nil and #self.prompt_styles > 0 then
		for _, promptStyle in self.prompt_styles do
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, promptStyle)
		end
	end
	if self.client_attributes ~= nil and next(self.client_attributes) ~= nil then
		for i, clientAttribute in self.client_attributes do
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, i)
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, clientAttribute)
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, WriteStringResult1, WriteStringResult2_1)
		end
	end
	if self.client_capabilities ~= nil then
		local EncodeResult = self.client_capabilities:encode()
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf) --[[ Line: 771 ]]
	-- upvalues: Module3 (copy), ProtoModule (copy), t (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v117 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v117 = ProtoModule.readVarInt(Buf, v4)
				NewModule.deeplink_detected = VarInt ~= 0
			else
				local _
				_, v117 = ProtoModule.readVarInt(Buf, v4)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v117 = ProtoModule.readBuffer(Buf, v4)
				table.insert(NewModule.entry_points, buffer.tostring(Buffer1))
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v117 = ProtoModule.readBuffer(Buf, v4)
				table.insert(NewModule.prompt_styles, buffer.tostring(Buffer2))
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v117 = ProtoModule.readBuffer(Buf, v4)
				local DecodeResult = t.GetEligiblePromptsRequest_ClientAttributesEntry.decode(Buffer3)
				NewModule.client_attributes[DecodeResult.key or ""] = DecodeResult.value or ""
			elseif Tag == 5 then
				local Buffer4
				Buffer4, v117 = ProtoModule.readBuffer(Buf, v4)
				NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.decode(Buffer4)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v117 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v117 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode() --[[ Line: 842 ]]
	local t = {}
	
	if self.entry_points ~= nil and #self.entry_points > 0 then
		local EntryPoints = {}
		
		for _, entryPoint in self.entry_points do
			table.insert(EntryPoints, entryPoint)
		end
		t.entryPoints = EntryPoints
	end
	if self.deeplink_detected then
		t.deeplinkDetected = self.deeplink_detected
	end
	if self.prompt_styles ~= nil and #self.prompt_styles > 0 then
		local PromptStyles = {}
		
		for _, promptStyle in self.prompt_styles do
			table.insert(PromptStyles, promptStyle)
		end
		t.promptStyles = PromptStyles
	end
	if self.client_attributes ~= nil and next(self.client_attributes) ~= nil then
		local ClientAttributes = {}
		
		for i, clientAttribute in self.client_attributes do
			ClientAttributes[i] = clientAttribute
		end
		t.clientAttributes = ClientAttributes
	end
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	return t
end

function Module3:jsonDecode() --[[ Line: 880 ]]
	-- upvalues: Module3 (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module3.new()
	
	if self.entry_points ~= nil then
		local Entry_points = {}
		
		for _, entryPoint in self.entry_points do
			table.insert(Entry_points, entryPoint)
		end
		NewModule.entry_points = Entry_points
	end
	if self.entryPoints ~= nil then
		local Entry_points = {}
		
		for _, entryPoint1 in self.entryPoints do
			table.insert(Entry_points, entryPoint1)
		end
		NewModule.entry_points = Entry_points
	end
	if self.deeplink_detected ~= nil then
		NewModule.deeplink_detected = self.deeplink_detected
	end
	if self.deeplinkDetected ~= nil then
		NewModule.deeplink_detected = self.deeplinkDetected
	end
	if self.prompt_styles ~= nil then
		local Prompt_styles = {}
		
		for _, promptStyle in self.prompt_styles do
			table.insert(Prompt_styles, promptStyle)
		end
		NewModule.prompt_styles = Prompt_styles
	end
	if self.promptStyles ~= nil then
		local Prompt_styles = {}
		
		for _, promptStyle1 in self.promptStyles do
			table.insert(Prompt_styles, promptStyle1)
		end
		NewModule.prompt_styles = Prompt_styles
	end
	if self.client_attributes ~= nil then
		local Client_attributes = {}
		
		for i, clientAttribute in self.client_attributes do
			Client_attributes[i] = clientAttribute
		end
		NewModule.client_attributes = Client_attributes
	end
	if self.clientAttributes ~= nil then
		local Client_attributes = {}
		
		for i1, clientAttribute1 in self.clientAttributes do
			Client_attributes[i1] = clientAttribute1
		end
		NewModule.client_attributes = Client_attributes
	end
	if self.client_capabilities ~= nil then
		NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	return NewModule
end

Module3.descriptor = {
	name = "GetEligiblePromptsRequest",
	fullName = "roblox.apppageplatform.prompts.v1beta1.GetEligiblePromptsRequest"
}
t.GetEligiblePromptsRequest = Module3
TypeRegistryModule.default:register(t.GetEligiblePromptsRequest)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1) --[[ Line: 976 ]]
	-- upvalues: Module4 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module4))
end

function Module4:encode() --[[ Line: 985 ]]
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

function Module4.decode(Buf) --[[ Line: 1006 ]]
	-- upvalues: Module4 (copy), ProtoModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v149 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v149 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v149 = ProtoModule.readBuffer(Buf, v5)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v149 = ProtoModule.readBuffer(Buf, v5)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v149 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v149 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode() --[[ Line: 1056 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module4:jsonDecode() --[[ Line: 1072 ]]
	-- upvalues: Module4 (copy)
	local NewModule = Module4.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module4.descriptor = {
	name = "GetEligiblePromptsRequest_ClientAttributesEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.ClientAttributesEntry"
}
t.GetEligiblePromptsRequest_ClientAttributesEntry = Module4
TypeRegistryModule.default:register(t.GetEligiblePromptsRequest_ClientAttributesEntry)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1) --[[ Line: 1103 ]]
	-- upvalues: Module5 (copy)
	return (setmetatable({
		page_entries = if p1 == nil or p1.page_entries == nil then {} else p1.page_entries,
		hydration_data = if p1 == nil or p1.hydration_data == nil then nil else p1.hydration_data,
		templates = if p1 == nil or p1.templates == nil then {} else p1.templates,
		custom_prompts = if p1 == nil or p1.custom_prompts == nil then {} else p1.custom_prompts,
		localized_literals = if p1 == nil or p1.localized_literals == nil then {} else p1.localized_literals
	}, Module5))
end

function Module5:encode() --[[ Line: 1115 ]]
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

function Module5.decode(Buf) --[[ Line: 1179 ]]
	-- upvalues: Module5 (copy), ProtoModule (copy), PageEntryContentModule (copy), HydrationContentModule (copy), t (copy), TemplateEntryModule (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v202 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v202 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v202 = ProtoModule.readBuffer(Buf, v6)
				table.insert(NewModule.page_entries, PageEntryContentModule.UniversalPageEntry.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v202 = ProtoModule.readBuffer(Buf, v6)
				NewModule.hydration_data = HydrationContentModule.HydrationContent.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v202 = ProtoModule.readBuffer(Buf, v6)
				local DecodeResult = t.GetEligiblePromptsResponse_TemplatesEntry.decode(Buffer3)
				local NewResult = TemplateEntryModule.TemplateEntry.new()
				NewModule.templates[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v202 = ProtoModule.readBuffer(Buf, v6)
				local DecodeResult = t.GetEligiblePromptsResponse_CustomPromptsEntry.decode(Buffer4)
				local NewResult = t.CustomPrompt.new()
				NewModule.custom_prompts[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v202 = ProtoModule.readBuffer(Buf, v6)
				local DecodeResult = t.GetEligiblePromptsResponse_LocalizedLiteralsEntry.decode(Buffer5)
				NewModule.localized_literals[DecodeResult.key or ""] = DecodeResult.value or ""
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v202 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v202 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode() --[[ Line: 1267 ]]
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

function Module5:jsonDecode() --[[ Line: 1309 ]]
	-- upvalues: Module5 (copy), PageEntryContentModule (copy), HydrationContentModule (copy), TemplateEntryModule (copy), t (copy)
	local NewModule = Module5.new()
	
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

Module5.descriptor = {
	name = "GetEligiblePromptsResponse",
	fullName = "roblox.apppageplatform.prompts.v1beta1.GetEligiblePromptsResponse"
}
t.GetEligiblePromptsResponse = Module5
TypeRegistryModule.default:register(t.GetEligiblePromptsResponse)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1) --[[ Line: 1410 ]]
	-- upvalues: Module6 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module6))
end

function Module6:encode() --[[ Line: 1419 ]]
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

function Module6.decode(Buf) --[[ Line: 1441 ]]
	-- upvalues: Module6 (copy), ProtoModule (copy), TemplateEntryModule (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v241 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v241 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v241 = ProtoModule.readBuffer(Buf, v7)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v241 = ProtoModule.readBuffer(Buf, v7)
				NewModule.value = TemplateEntryModule.TemplateEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v241 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v241 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode() --[[ Line: 1491 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module6:jsonDecode() --[[ Line: 1507 ]]
	-- upvalues: Module6 (copy), TemplateEntryModule (copy)
	local NewModule = Module6.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = TemplateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module6.descriptor = {
	name = "GetEligiblePromptsResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.TemplatesEntry"
}
t.GetEligiblePromptsResponse_TemplatesEntry = Module6
TypeRegistryModule.default:register(t.GetEligiblePromptsResponse_TemplatesEntry)
local Module7 = {}
Module7.__index = Module7

function Module7.new(p1) --[[ Line: 1537 ]]
	-- upvalues: Module7 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module7))
end

function Module7:encode() --[[ Line: 1546 ]]
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

function Module7.decode(Buf) --[[ Line: 1568 ]]
	-- upvalues: Module7 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v261 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v261 = ProtoModule.readVarInt(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v261 = ProtoModule.readBuffer(Buf, v8)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v261 = ProtoModule.readBuffer(Buf, v8)
				NewModule.value = t.CustomPrompt.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v261 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v261 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode() --[[ Line: 1618 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module7:jsonDecode() --[[ Line: 1634 ]]
	-- upvalues: Module7 (copy), t (copy)
	local NewModule = Module7.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.CustomPrompt.jsonDecode(self.value)
	end
	return NewModule
end

Module7.descriptor = {
	name = "GetEligiblePromptsResponse_CustomPromptsEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.CustomPromptsEntry"
}
t.GetEligiblePromptsResponse_CustomPromptsEntry = Module7
TypeRegistryModule.default:register(t.GetEligiblePromptsResponse_CustomPromptsEntry)
local Module8 = {}
Module8.__index = Module8

function Module8.new(p1) --[[ Line: 1665 ]]
	-- upvalues: Module8 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module8))
end

function Module8:encode() --[[ Line: 1677 ]]
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

function Module8.decode(Buf) --[[ Line: 1698 ]]
	-- upvalues: Module8 (copy), ProtoModule (copy)
	local NewModule = Module8.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v280 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v280 = ProtoModule.readVarInt(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v280 = ProtoModule.readBuffer(Buf, v9)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v280 = ProtoModule.readBuffer(Buf, v9)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v280 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v280 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module8:jsonEncode() --[[ Line: 1748 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module8:jsonDecode() --[[ Line: 1764 ]]
	-- upvalues: Module8 (copy)
	local NewModule = Module8.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module8.descriptor = {
	name = "GetEligiblePromptsResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.prompts.v1beta1.LocalizedLiteralsEntry"
}
t.GetEligiblePromptsResponse_LocalizedLiteralsEntry = Module8
TypeRegistryModule.default:register(t.GetEligiblePromptsResponse_LocalizedLiteralsEntry)

return {
	CustomPrompt = t.CustomPrompt,
	GetEligiblePromptsRequest = t.GetEligiblePromptsRequest,
	GetEligiblePromptsResponse = t.GetEligiblePromptsResponse
}