local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 311 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		form_definition = if p1 == nil or p1.form_definition == nil then nil else p1.form_definition,
		viewer_response = if p1 == nil or p1.viewer_response == nil then nil else p1.viewer_response,
		results = if p1 == nil or p1.results == nil then nil else p1.results,
		is_editable = if p1 == nil or p1.is_editable == nil then nil else p1.is_editable,
		disabled_message = if p1 == nil or p1.disabled_message == nil then nil else p1.disabled_message
	}, Module))
end

function Module:encode() --[[ Line: 321 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.form_definition ~= nil then
		local EncodeResult = self.form_definition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.viewer_response ~= nil then
		local EncodeResult = self.viewer_response:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.results ~= nil then
		local EncodeResult = self.results:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.is_editable ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, if self.is_editable then 1 else 0)
	end
	if self.disabled_message ~= nil then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.disabled_message)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 358 ]]
	-- upvalues: Module (copy), ProtoModule (copy), t (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v29 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 4 then
				local VarInt
				VarInt, v29 = ProtoModule.readVarInt(Buf, v1)
				NewModule.is_editable = VarInt ~= 0
			else
				local _
				_, v29 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v29 = ProtoModule.readBuffer(Buf, v1)
				NewModule.form_definition = t.CustomFormDefinitionData.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v29 = ProtoModule.readBuffer(Buf, v1)
				NewModule.viewer_response = t.CustomFormResponseData.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v29 = ProtoModule.readBuffer(Buf, v1)
				NewModule.results = t.CustomFormResultsData.decode(Buffer3)
			elseif Tag == 5 then
				local Buffer4
				Buffer4, v29 = ProtoModule.readBuffer(Buf, v1)
				NewModule.disabled_message = buffer.tostring(Buffer4)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v29 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v29 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 421 ]]
	local t = {}
	
	if self.form_definition ~= nil then
		t.formDefinition = self.form_definition:jsonEncode()
	end
	if self.viewer_response ~= nil then
		t.viewerResponse = self.viewer_response:jsonEncode()
	end
	if self.results ~= nil then
		t.results = self.results:jsonEncode()
	end
	if self.is_editable ~= nil then
		t.isEditable = self.is_editable
	end
	if self.disabled_message ~= nil then
		t.disabledMessage = self.disabled_message
	end
	return t
end

function Module:jsonDecode() --[[ Line: 447 ]]
	-- upvalues: Module (copy), t (copy)
	local NewModule = Module.new()
	
	if self.form_definition ~= nil then
		NewModule.form_definition = t.CustomFormDefinitionData.jsonDecode(self.form_definition)
	end
	if self.formDefinition ~= nil then
		NewModule.form_definition = t.CustomFormDefinitionData.jsonDecode(self.formDefinition)
	end
	if self.viewer_response ~= nil then
		NewModule.viewer_response = t.CustomFormResponseData.jsonDecode(self.viewer_response)
	end
	if self.viewerResponse ~= nil then
		NewModule.viewer_response = t.CustomFormResponseData.jsonDecode(self.viewerResponse)
	end
	if self.results ~= nil then
		NewModule.results = t.CustomFormResultsData.jsonDecode(self.results)
	end
	if self.is_editable ~= nil then
		NewModule.is_editable = self.is_editable
	end
	if self.isEditable ~= nil then
		NewModule.is_editable = self.isEditable
	end
	if self.disabled_message ~= nil then
		NewModule.disabled_message = self.disabled_message
	end
	if self.disabledMessage ~= nil then
		NewModule.disabled_message = self.disabledMessage
	end
	return NewModule
end

Module.descriptor = {
	name = "CustomFormData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormData"
}
t.CustomFormData = Module
TypeRegistryModule.default:register(t.CustomFormData)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1) --[[ Line: 503 ]]
	-- upvalues: Module1 (copy)
	return (setmetatable({
		form_id = if p1 == nil or p1.form_id == nil then "" else p1.form_id,
		title = if p1 == nil or p1.title == nil then nil else p1.title,
		description = if p1 == nil or p1.description == nil then nil else p1.description,
		sections = if p1 == nil or p1.sections == nil then {} else p1.sections
	}, Module1))
end

function Module1:encode() --[[ Line: 512 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.form_id ~= nil and self.form_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.form_id)
	end
	if self.title ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.title)
	end
	if self.description ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.description)
	end
	if self.sections ~= nil and #self.sections > 0 then
		for _, section in self.sections do
			local EncodeResult = section:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf) --[[ Line: 544 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v56 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v56 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v56 = ProtoModule.readBuffer(Buf, v2)
				NewModule.form_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v56 = ProtoModule.readBuffer(Buf, v2)
				NewModule.title = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v56 = ProtoModule.readBuffer(Buf, v2)
				NewModule.description = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v56 = ProtoModule.readBuffer(Buf, v2)
				table.insert(NewModule.sections, t.CustomFormSectionData.decode(Buffer4))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v56 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v56 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode() --[[ Line: 602 ]]
	local t = {}
	
	if self.form_id ~= nil and self.form_id ~= "" then
		t.formId = self.form_id
	end
	if self.title ~= nil then
		t.title = self.title
	end
	if self.description ~= nil then
		t.description = self.description
	end
	if self.sections ~= nil and #self.sections > 0 then
		local Sections = {}
		
		for _, section in self.sections do
			table.insert(Sections, section:jsonEncode())
		end
		t.sections = Sections
	end
	return t
end

function Module1:jsonDecode() --[[ Line: 628 ]]
	-- upvalues: Module1 (copy), t (copy)
	local NewModule = Module1.new()
	
	if self.form_id ~= nil then
		NewModule.form_id = self.form_id
	end
	if self.formId ~= nil then
		NewModule.form_id = self.formId
	end
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.description ~= nil then
		NewModule.description = self.description
	end
	if self.sections ~= nil then
		local Sections = {}
		
		for _, section in self.sections do
			table.insert(Sections, t.CustomFormSectionData.jsonDecode(section))
		end
		NewModule.sections = Sections
	end
	return NewModule
end

Module1.descriptor = {
	name = "CustomFormDefinitionData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormDefinitionData"
}
t.CustomFormDefinitionData = Module1
TypeRegistryModule.default:register(t.CustomFormDefinitionData)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1) --[[ Line: 673 ]]
	-- upvalues: Module2 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		header = if p1 == nil or p1.header == nil then nil else p1.header,
		fields = if p1 == nil or p1.fields == nil then {} else p1.fields
	}, Module2))
end

function Module2:encode() --[[ Line: 681 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.header ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.header)
	end
	if self.fields ~= nil and #self.fields > 0 then
		for _, field in self.fields do
			local EncodeResult = field:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf) --[[ Line: 708 ]]
	-- upvalues: Module2 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v82 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v82 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v82 = ProtoModule.readBuffer(Buf, v3)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v82 = ProtoModule.readBuffer(Buf, v3)
				NewModule.header = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v82 = ProtoModule.readBuffer(Buf, v3)
				table.insert(NewModule.fields, t.CustomFormFieldData.decode(Buffer3))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v82 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v82 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode() --[[ Line: 761 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.header ~= nil then
		t.header = self.header
	end
	if self.fields ~= nil and #self.fields > 0 then
		local Fields = {}
		
		for _, field in self.fields do
			table.insert(Fields, field:jsonEncode())
		end
		t.fields = Fields
	end
	return t
end

function Module2:jsonDecode() --[[ Line: 783 ]]
	-- upvalues: Module2 (copy), t (copy)
	local NewModule = Module2.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.header ~= nil then
		NewModule.header = self.header
	end
	if self.fields ~= nil then
		local Fields = {}
		
		for _, field in self.fields do
			table.insert(Fields, t.CustomFormFieldData.jsonDecode(field))
		end
		NewModule.fields = Fields
	end
	return NewModule
end

Module2.descriptor = {
	name = "CustomFormSectionData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormSectionData"
}
t.CustomFormSectionData = Module2
TypeRegistryModule.default:register(t.CustomFormSectionData)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1) --[[ Line: 820 ]]
	-- upvalues: t (copy), Module3 (copy)
	return (setmetatable({
		field_id = if p1 == nil or p1.field_id == nil then "" else p1.field_id,
		field_type = if p1 == nil or p1.field_type == nil then assert(t.CustomFormFieldType.fromNumber(0), "Enum has no 0 default") else p1.field_type,
		label = if p1 == nil or p1.label == nil then nil else p1.label,
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module3))
end

function Module3:encode() --[[ Line: 831 ]]
	-- upvalues: ProtoModule (copy), t (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.field_id ~= nil and self.field_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.field_id)
	end
	if self.field_type ~= nil and (self.field_type ~= nil and self.field_type ~= 0 or self.field_type ~= t.CustomFormFieldType.fromNumber(0)) then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, t.CustomFormFieldType.toNumber(self.field_type))
	end
	if self.label ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.label)
	end
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf) --[[ Line: 870 ]]
	-- upvalues: Module3 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v109 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v109 = ProtoModule.readVarIntI32(Buf, v4)
				NewModule.field_type = t.CustomFormFieldType.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v109 = ProtoModule.readVarInt(Buf, v4)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v109 = ProtoModule.readBuffer(Buf, v4)
				NewModule.field_id = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v109 = ProtoModule.readBuffer(Buf, v4)
				NewModule.label = buffer.tostring(Buffer2)
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v109 = ProtoModule.readBuffer(Buf, v4)
				table.insert(NewModule.options, t.CustomFormOptionData.decode(Buffer3))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v109 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v109 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode() --[[ Line: 928 ]]
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.field_id ~= nil and self.field_id ~= "" then
		t1.fieldId = self.field_id
	end
	if self.field_type ~= nil and (self.field_type ~= nil and self.field_type ~= 0 or self.field_type ~= t.CustomFormFieldType.fromNumber(0)) then
		t1.fieldType = if typeof(self.field_type) == "number" then self.field_type else t.CustomFormFieldType.toNumber(self.field_type)
	end
	if self.label ~= nil then
		t1.label = self.label
	end
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t1.options = Options
	end
	return t1
end

function Module3:jsonDecode() --[[ Line: 962 ]]
	-- upvalues: Module3 (copy), t (copy)
	local NewModule = Module3.new()
	
	if self.field_id ~= nil then
		NewModule.field_id = self.field_id
	end
	if self.fieldId ~= nil then
		NewModule.field_id = self.fieldId
	end
	if self.field_type ~= nil then
		NewModule.field_type = (if typeof(self.field_type) == "number" then t.CustomFormFieldType.fromNumber(self.field_type) else t.CustomFormFieldType.fromName(self.field_type)) or self.field_type
	end
	if self.fieldType ~= nil then
		NewModule.field_type = (if typeof(self.fieldType) == "number" then t.CustomFormFieldType.fromNumber(self.fieldType) else t.CustomFormFieldType.fromName(self.fieldType)) or self.fieldType
	end
	if self.label ~= nil then
		NewModule.label = self.label
	end
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, t.CustomFormOptionData.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module3.descriptor = {
	name = "CustomFormFieldData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormFieldData"
}
t.CustomFormFieldData = Module3
TypeRegistryModule.default:register(t.CustomFormFieldData)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1) --[[ Line: 1015 ]]
	-- upvalues: Module4 (copy)
	return (setmetatable({
		option_id = if p1 == nil or p1.option_id == nil then "" else p1.option_id,
		label = if p1 == nil or p1.label == nil then "" else p1.label
	}, Module4))
end

function Module4:encode() --[[ Line: 1022 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.option_id)
	end
	if self.label ~= nil and self.label ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.label)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf) --[[ Line: 1041 ]]
	-- upvalues: Module4 (copy), ProtoModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v132 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v132 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v132 = ProtoModule.readBuffer(Buf, v5)
				NewModule.option_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v132 = ProtoModule.readBuffer(Buf, v5)
				NewModule.label = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v132 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v132 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode() --[[ Line: 1089 ]]
	local t = {}
	
	if self.option_id ~= nil and self.option_id ~= "" then
		t.optionId = self.option_id
	end
	if self.label ~= nil and self.label ~= "" then
		t.label = self.label
	end
	return t
end

function Module4:jsonDecode() --[[ Line: 1103 ]]
	-- upvalues: Module4 (copy)
	local NewModule = Module4.new()
	
	if self.option_id ~= nil then
		NewModule.option_id = self.option_id
	end
	if self.optionId ~= nil then
		NewModule.option_id = self.optionId
	end
	if self.label ~= nil then
		NewModule.label = self.label
	end
	return NewModule
end

Module4.descriptor = {
	name = "CustomFormOptionData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormOptionData"
}
t.CustomFormOptionData = Module4
TypeRegistryModule.default:register(t.CustomFormOptionData)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1) --[[ Line: 1135 ]]
	-- upvalues: Module5 (copy)
	return (setmetatable({
		answers = if p1 == nil or p1.answers == nil then {} else p1.answers
	}, Module5))
end

function Module5:encode() --[[ Line: 1141 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.answers ~= nil and #self.answers > 0 then
		for _, answer in self.answers do
			local EncodeResult = answer:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf) --[[ Line: 1158 ]]
	-- upvalues: Module5 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v150 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v150 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v150 = ProtoModule.readBuffer(Buf, v6)
				table.insert(NewModule.answers, t.CustomFormAnswerData.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v150 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v150 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode() --[[ Line: 1201 ]]
	local t = {}
	
	if self.answers ~= nil and #self.answers > 0 then
		local Answers = {}
		
		for _, answer in self.answers do
			table.insert(Answers, answer:jsonEncode())
		end
		t.answers = Answers
	end
	return t
end

function Module5:jsonDecode() --[[ Line: 1215 ]]
	-- upvalues: Module5 (copy), t (copy)
	local NewModule = Module5.new()
	
	if self.answers ~= nil then
		local Answers = {}
		
		for _, answer in self.answers do
			table.insert(Answers, t.CustomFormAnswerData.jsonDecode(answer))
		end
		NewModule.answers = Answers
	end
	return NewModule
end

Module5.descriptor = {
	name = "CustomFormResponseData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormResponseData"
}
t.CustomFormResponseData = Module5
TypeRegistryModule.default:register(t.CustomFormResponseData)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1) --[[ Line: 1244 ]]
	-- upvalues: Module6 (copy)
	return (setmetatable({
		field_id = if p1 == nil or p1.field_id == nil then "" else p1.field_id,
		option_ids = if p1 == nil or p1.option_ids == nil then {} else p1.option_ids
	}, Module6))
end

function Module6:encode() --[[ Line: 1251 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.field_id ~= nil and self.field_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.field_id)
	end
	if self.option_ids ~= nil and #self.option_ids > 0 then
		for _, optionId in self.option_ids do
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, optionId)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module6.decode(Buf) --[[ Line: 1272 ]]
	-- upvalues: Module6 (copy), ProtoModule (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v170 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v170 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v170 = ProtoModule.readBuffer(Buf, v7)
				NewModule.field_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v170 = ProtoModule.readBuffer(Buf, v7)
				table.insert(NewModule.option_ids, buffer.tostring(Buffer2))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v170 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v170 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode() --[[ Line: 1320 ]]
	local t = {}
	
	if self.field_id ~= nil and self.field_id ~= "" then
		t.fieldId = self.field_id
	end
	if self.option_ids ~= nil and #self.option_ids > 0 then
		local OptionIds = {}
		
		for _, optionId in self.option_ids do
			table.insert(OptionIds, optionId)
		end
		t.optionIds = OptionIds
	end
	return t
end

function Module6:jsonDecode() --[[ Line: 1338 ]]
	-- upvalues: Module6 (copy)
	local NewModule = Module6.new()
	
	if self.field_id ~= nil then
		NewModule.field_id = self.field_id
	end
	if self.fieldId ~= nil then
		NewModule.field_id = self.fieldId
	end
	if self.option_ids ~= nil then
		local Option_ids = {}
		
		for _, optionId in self.option_ids do
			table.insert(Option_ids, optionId)
		end
		NewModule.option_ids = Option_ids
	end
	if self.optionIds ~= nil then
		local Option_ids = {}
		
		for _, optionId1 in self.optionIds do
			table.insert(Option_ids, optionId1)
		end
		NewModule.option_ids = Option_ids
	end
	return NewModule
end

Module6.descriptor = {
	name = "CustomFormAnswerData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormAnswerData"
}
t.CustomFormAnswerData = Module6
TypeRegistryModule.default:register(t.CustomFormAnswerData)
local Module7 = {}
Module7.__index = Module7

function Module7.new(p1) --[[ Line: 1384 ]]
	-- upvalues: Module7 (copy)
	return (setmetatable({
		total_responses = if p1 == nil or p1.total_responses == nil then 0 else p1.total_responses,
		field_results = if p1 == nil or p1.field_results == nil then {} else p1.field_results
	}, Module7))
end

function Module7:encode() --[[ Line: 1391 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.total_responses ~= nil and self.total_responses ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.total_responses)
	end
	if self.field_results ~= nil and #self.field_results > 0 then
		for _, fieldResult in self.field_results do
			local EncodeResult = fieldResult:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module7.decode(Buf) --[[ Line: 1413 ]]
	-- upvalues: Module7 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v193 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.total_responses, v193 = ProtoModule.readVarIntI64(Buf, v8)
			else
				local _
				_, v193 = ProtoModule.readVarInt(Buf, v8)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v193 = ProtoModule.readBuffer(Buf, v8)
				table.insert(NewModule.field_results, t.CustomFormFieldResultData.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v193 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v193 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode() --[[ Line: 1461 ]]
	local t = {}
	
	if self.total_responses ~= nil and self.total_responses ~= 0 then
		t.totalResponses = self.total_responses
	end
	if self.field_results ~= nil and #self.field_results > 0 then
		local FieldResults = {}
		
		for _, fieldResult in self.field_results do
			table.insert(FieldResults, fieldResult:jsonEncode())
		end
		t.fieldResults = FieldResults
	end
	return t
end

function Module7:jsonDecode() --[[ Line: 1479 ]]
	-- upvalues: Module7 (copy), t (copy)
	local NewModule = Module7.new()
	
	if self.total_responses ~= nil then
		NewModule.total_responses = self.total_responses
	end
	if self.totalResponses ~= nil then
		NewModule.total_responses = self.totalResponses
	end
	if self.field_results ~= nil then
		local Field_results = {}
		
		for _, fieldResult in self.field_results do
			table.insert(Field_results, t.CustomFormFieldResultData.jsonDecode(fieldResult))
		end
		NewModule.field_results = Field_results
	end
	if self.fieldResults ~= nil then
		local Field_results = {}
		
		for _, fieldResult1 in self.fieldResults do
			table.insert(Field_results, t.CustomFormFieldResultData.jsonDecode(fieldResult1))
		end
		NewModule.field_results = Field_results
	end
	return NewModule
end

Module7.descriptor = {
	name = "CustomFormResultsData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormResultsData"
}
t.CustomFormResultsData = Module7
TypeRegistryModule.default:register(t.CustomFormResultsData)
local Module8 = {}
Module8.__index = Module8

function Module8.new(p1) --[[ Line: 1525 ]]
	-- upvalues: Module8 (copy)
	return (setmetatable({
		field_id = if p1 == nil or p1.field_id == nil then "" else p1.field_id,
		option_results = if p1 == nil or p1.option_results == nil then {} else p1.option_results
	}, Module8))
end

function Module8:encode() --[[ Line: 1534 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.field_id ~= nil and self.field_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.field_id)
	end
	if self.option_results ~= nil and #self.option_results > 0 then
		for _, optionResult in self.option_results do
			local EncodeResult = optionResult:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module8.decode(Buf) --[[ Line: 1556 ]]
	-- upvalues: Module8 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module8.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v215 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v215 = ProtoModule.readVarInt(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v215 = ProtoModule.readBuffer(Buf, v9)
				NewModule.field_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v215 = ProtoModule.readBuffer(Buf, v9)
				table.insert(NewModule.option_results, t.CustomFormOptionResultData.decode(Buffer2))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v215 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v215 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module8:jsonEncode() --[[ Line: 1604 ]]
	local t = {}
	
	if self.field_id ~= nil and self.field_id ~= "" then
		t.fieldId = self.field_id
	end
	if self.option_results ~= nil and #self.option_results > 0 then
		local OptionResults = {}
		
		for _, optionResult in self.option_results do
			table.insert(OptionResults, optionResult:jsonEncode())
		end
		t.optionResults = OptionResults
	end
	return t
end

function Module8:jsonDecode() --[[ Line: 1622 ]]
	-- upvalues: Module8 (copy), t (copy)
	local NewModule = Module8.new()
	
	if self.field_id ~= nil then
		NewModule.field_id = self.field_id
	end
	if self.fieldId ~= nil then
		NewModule.field_id = self.fieldId
	end
	if self.option_results ~= nil then
		local Option_results = {}
		
		for _, optionResult in self.option_results do
			table.insert(Option_results, t.CustomFormOptionResultData.jsonDecode(optionResult))
		end
		NewModule.option_results = Option_results
	end
	if self.optionResults ~= nil then
		local Option_results = {}
		
		for _, optionResult1 in self.optionResults do
			table.insert(Option_results, t.CustomFormOptionResultData.jsonDecode(optionResult1))
		end
		NewModule.option_results = Option_results
	end
	return NewModule
end

Module8.descriptor = {
	name = "CustomFormFieldResultData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormFieldResultData"
}
t.CustomFormFieldResultData = Module8
TypeRegistryModule.default:register(t.CustomFormFieldResultData)
local Module9 = {}
Module9.__index = Module9

function Module9.new(p1) --[[ Line: 1668 ]]
	-- upvalues: Module9 (copy)
	return (setmetatable({
		option_id = if p1 == nil or p1.option_id == nil then "" else p1.option_id,
		vote_count = if p1 == nil or p1.vote_count == nil then 0 else p1.vote_count,
		percentage = if p1 == nil or p1.percentage == nil then 0 else p1.percentage
	}, Module9))
end

function Module9:encode() --[[ Line: 1678 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.option_id)
	end
	if self.vote_count ~= nil and self.vote_count ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.vote_count)
	end
	if self.percentage ~= nil and self.percentage ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.percentage)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module9.decode(Buf) --[[ Line: 1702 ]]
	-- upvalues: Module9 (copy), ProtoModule (copy)
	local NewModule = Module9.new()
	local v10 = 0
	while v10 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v239 = ProtoModule.readTag(Buf, v10)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				NewModule.vote_count, v239 = ProtoModule.readVarIntI64(Buf, v10)
			elseif Tag == 3 then
				NewModule.percentage, v239 = ProtoModule.readVarIntI32(Buf, v10)
			else
				local _
				_, v239 = ProtoModule.readVarInt(Buf, v10)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v239 = ProtoModule.readBuffer(Buf, v10)
				NewModule.option_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v10)
				v10 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v239 = ProtoModule.readFixed32(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v239 = ProtoModule.readFixed64(Buf, v10)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module9:jsonEncode() --[[ Line: 1755 ]]
	local t = {}
	
	if self.option_id ~= nil and self.option_id ~= "" then
		t.optionId = self.option_id
	end
	if self.vote_count ~= nil and self.vote_count ~= 0 then
		t.voteCount = self.vote_count
	end
	if self.percentage ~= nil and self.percentage ~= 0 then
		t.percentage = self.percentage
	end
	return t
end

function Module9:jsonDecode() --[[ Line: 1773 ]]
	-- upvalues: Module9 (copy)
	local NewModule = Module9.new()
	
	if self.option_id ~= nil then
		NewModule.option_id = self.option_id
	end
	if self.optionId ~= nil then
		NewModule.option_id = self.optionId
	end
	if self.vote_count ~= nil then
		NewModule.vote_count = self.vote_count
	end
	if self.voteCount ~= nil then
		NewModule.vote_count = self.voteCount
	end
	if self.percentage ~= nil then
		NewModule.percentage = self.percentage
	end
	return NewModule
end

Module9.descriptor = {
	name = "CustomFormOptionResultData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormOptionResultData"
}
t.CustomFormOptionResultData = Module9
TypeRegistryModule.default:register(t.CustomFormOptionResultData)
t.CustomFormFieldType = {
	fromNumber = function(p1) --[[ Line: 1810 ]]
		return if p1 == 0 then "CUSTOM_FORM_FIELD_TYPE_INVALID" elseif p1 == 1 then "CUSTOM_FORM_FIELD_TYPE_RADIO" elseif p1 == 2 then "CUSTOM_FORM_FIELD_TYPE_CHECKBOX" else nil
	end,
	toNumber = function(p1) --[[ Line: 1822 ]]
		return if p1 == "CUSTOM_FORM_FIELD_TYPE_INVALID" then 0 elseif p1 == "CUSTOM_FORM_FIELD_TYPE_RADIO" then 1 elseif p1 == "CUSTOM_FORM_FIELD_TYPE_CHECKBOX" then 2 else p1
	end,
	fromName = function(p1) --[[ Line: 1834 ]]
		return if p1 == "CUSTOM_FORM_FIELD_TYPE_INVALID" then "CUSTOM_FORM_FIELD_TYPE_INVALID" elseif p1 == "CUSTOM_FORM_FIELD_TYPE_RADIO" then "CUSTOM_FORM_FIELD_TYPE_RADIO" elseif p1 == "CUSTOM_FORM_FIELD_TYPE_CHECKBOX" then "CUSTOM_FORM_FIELD_TYPE_CHECKBOX" else nil
	end
}

return {
	CustomFormData = t.CustomFormData,
	CustomFormDefinitionData = t.CustomFormDefinitionData,
	CustomFormSectionData = t.CustomFormSectionData,
	CustomFormFieldData = t.CustomFormFieldData,
	CustomFormOptionData = t.CustomFormOptionData,
	CustomFormResponseData = t.CustomFormResponseData,
	CustomFormAnswerData = t.CustomFormAnswerData,
	CustomFormResultsData = t.CustomFormResultsData,
	CustomFormFieldResultData = t.CustomFormFieldResultData,
	CustomFormOptionResultData = t.CustomFormOptionResultData,
	CustomFormFieldType = t.CustomFormFieldType
}