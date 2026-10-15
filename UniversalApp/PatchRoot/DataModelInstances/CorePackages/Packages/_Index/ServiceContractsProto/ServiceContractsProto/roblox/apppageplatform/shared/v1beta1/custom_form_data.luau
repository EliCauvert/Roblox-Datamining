local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		form_definition = if p1 == nil or p1.form_definition == nil then nil else p1.form_definition,
		viewer_response = if p1 == nil or p1.viewer_response == nil then nil else p1.viewer_response,
		results = if p1 == nil or p1.results == nil then nil else p1.results,
		is_editable = if p1 == nil or p1.is_editable == nil then nil else p1.is_editable,
		disabled_message = if p1 == nil or p1.disabled_message == nil then nil else p1.disabled_message
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.form_definition ~= nil then
		local var2 = self.form_definition:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var17 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.viewer_response ~= nil then
		local var5 = self.viewer_response:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var20 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.results ~= nil then
		local var8 = self.results:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var23 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.is_editable ~= nil then
		local var11, var12 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.varint)
		var11, var25 = protoModule.writeVarInt(var11, var12, if self.is_editable then 1 else 0)
		buff = var11
		var1 = var12
	end
	if self.disabled_message ~= nil then
		local var13, var14 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var13, var27 = protoModule.writeString(var13, var14, self.disabled_message)
		buff = var13
		var1 = var14
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var1 = t_1.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 4 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.is_editable = var8 ~= 0
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.form_definition = t.CustomFormDefinitionData.decode(var12)
			elseif var7 == 2 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.viewer_response = t.CustomFormResponseData.decode(var14)
			elseif var7 == 3 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.results = t.CustomFormResultsData.decode(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.disabled_message = buffer.tostring(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var31)
		end
	end
	return var1
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref)
	local var26 = t_1.new()
	
	if self.form_definition ~= nil then
		var26.form_definition = t.CustomFormDefinitionData.jsonDecode(self.form_definition)
	end
	if self.formDefinition ~= nil then
		var26.form_definition = t.CustomFormDefinitionData.jsonDecode(self.formDefinition)
	end
	if self.viewer_response ~= nil then
		var26.viewer_response = t.CustomFormResponseData.jsonDecode(self.viewer_response)
	end
	if self.viewerResponse ~= nil then
		var26.viewer_response = t.CustomFormResponseData.jsonDecode(self.viewerResponse)
	end
	if self.results ~= nil then
		var26.results = t.CustomFormResultsData.jsonDecode(self.results)
	end
	if self.is_editable ~= nil then
		var26.is_editable = self.is_editable
	end
	if self.isEditable ~= nil then
		var26.is_editable = self.isEditable
	end
	if self.disabled_message ~= nil then
		var26.disabled_message = self.disabled_message
	end
	if self.disabledMessage ~= nil then
		var26.disabled_message = self.disabledMessage
	end
	return var26
end

t_1.descriptor = {
	name = "CustomFormData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormData"
}
t.CustomFormData = t_1
typeRegistryModule.default:register(t.CustomFormData)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		form_id = if p2 == nil or p2.form_id == nil then "" else p2.form_id,
		title = if p2 == nil or p2.title == nil then nil else p2.title,
		description = if p2 == nil or p2.description == nil then nil else p2.description,
		sections = if p2 == nil or p2.sections == nil then {} else p2.sections
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var26 = 0
	
	if self.form_id ~= nil and self.form_id ~= "" then
		local var27, var28 = protoModule.writeTag(buff, var26, 1, protoModule.wireTypes.lengthDelimited)
		var27, var59 = protoModule.writeString(var27, var28, self.form_id)
		buff = var27
		var26 = var28
	end
	if self.title ~= nil then
		local var29, var30 = protoModule.writeTag(buff, var26, 2, protoModule.wireTypes.lengthDelimited)
		var29, var61 = protoModule.writeString(var29, var30, self.title)
		buff = var29
		var26 = var30
	end
	if self.description ~= nil then
		local var31, var32 = protoModule.writeTag(buff, var26, 3, protoModule.wireTypes.lengthDelimited)
		var31, var63 = protoModule.writeString(var31, var32, self.description)
		buff = var31
		var26 = var32
	end
	if self.sections ~= nil and #self.sections > 0 then
		for i, v in self.sections do
			local var33 = v:encode()
			local var34, var35 = protoModule.writeTag(buff, var26, 4, protoModule.wireTypes.lengthDelimited)
			var34, var66 = protoModule.writeBuffer(var34, var35, var33, buffer.len(var33))
			buff = var34
			var26 = var35
		end
	end
	local buff_1 = buffer.create(var26)
	buffer.copy(buff_1, 0, buff, 0, var26)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var36 = t_2.new()
	local var37 = 0
	while var37 < buffer.len(p2) do
		local _ = nil
		local var38 = nil
		local var39, var40, var41 = protoModule.readTag(p2, var37)
		local var42 = var39
		var38 = var40
		var37 = var41
		
		if var38 == protoModule.wireTypes.varint then
			local _ = nil
			local var43, var44 = protoModule.readVarInt(p2, var37)
			local _ = var43
			var37 = var44
			continue
		end
		if var38 == protoModule.wireTypes.lengthDelimited then
			if var42 == 1 then
				local _ = nil
				local var45, var46 = protoModule.readBuffer(p2, var37)
				var37 = var46
				var36.form_id = buffer.tostring(var45)
			elseif var42 == 2 then
				local _ = nil
				local var47, var48 = protoModule.readBuffer(p2, var37)
				var37 = var48
				var36.title = buffer.tostring(var47)
			elseif var42 == 3 then
				local _ = nil
				local var49, var50 = protoModule.readBuffer(p2, var37)
				var37 = var50
				var36.description = buffer.tostring(var49)
			elseif var42 == 4 then
				local _ = nil
				local var51, var52 = protoModule.readBuffer(p2, var37)
				var37 = var52
				table.insert(var36.sections, t.CustomFormSectionData.decode(var51))
			else
				local _ = nil
				local var53, var54 = protoModule.readVarInt(p2, var37)
				var37 = var54 + var53
			end
		elseif var38 == protoModule.wireTypes.i32 then
			local _ = nil
			local var55, var56 = protoModule.readFixed32(p2, var37)
			local _ = var55
			var37 = var56
		elseif var38 == protoModule.wireTypes.i64 then
			local _ = nil
			local var57, var58 = protoModule.readFixed64(p2, var37)
			local _ = var57
			var37 = var58
		else
			error("Unsupported wire type: " .. var70)
		end
	end
	return var36
end

function t_2:jsonEncode()
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
		local t_1 = {}
		
		for i, v in self.sections do
			table.insert(t_1, v:jsonEncode())
		end
		t.sections = t_1
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), t (ref)
	local var59 = t_2.new()
	
	if self.form_id ~= nil then
		var59.form_id = self.form_id
	end
	if self.formId ~= nil then
		var59.form_id = self.formId
	end
	if self.title ~= nil then
		var59.title = self.title
	end
	if self.description ~= nil then
		var59.description = self.description
	end
	if self.sections ~= nil then
		local t_1 = {}
		
		for i, v in self.sections do
			table.insert(t_1, t.CustomFormSectionData.jsonDecode(v))
		end
		var59.sections = t_1
	end
	return var59
end

t_2.descriptor = {
	name = "CustomFormDefinitionData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormDefinitionData"
}
t.CustomFormDefinitionData = t_2
typeRegistryModule.default:register(t.CustomFormDefinitionData)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		id = if p3 == nil or p3.id == nil then "" else p3.id,
		header = if p3 == nil or p3.header == nil then nil else p3.header,
		fields = if p3 == nil or p3.fields == nil then {} else p3.fields
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var60 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var61, var62 = protoModule.writeTag(buff, var60, 1, protoModule.wireTypes.lengthDelimited)
		var61, var98 = protoModule.writeString(var61, var62, self.id)
		buff = var61
		var60 = var62
	end
	if self.header ~= nil then
		local var63, var64 = protoModule.writeTag(buff, var60, 2, protoModule.wireTypes.lengthDelimited)
		var63, var100 = protoModule.writeString(var63, var64, self.header)
		buff = var63
		var60 = var64
	end
	if self.fields ~= nil and #self.fields > 0 then
		for i, v in self.fields do
			local var65 = v:encode()
			local var66, var67 = protoModule.writeTag(buff, var60, 3, protoModule.wireTypes.lengthDelimited)
			var66, var103 = protoModule.writeBuffer(var66, var67, var65, buffer.len(var65))
			buff = var66
			var60 = var67
		end
	end
	local buff_1 = buffer.create(var60)
	buffer.copy(buff_1, 0, buff, 0, var60)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var68 = t_3.new()
	local var69 = 0
	while var69 < buffer.len(p3) do
		local _ = nil
		local var70 = nil
		local var71, var72, var73 = protoModule.readTag(p3, var69)
		local var74 = var71
		var70 = var72
		var69 = var73
		
		if var70 == protoModule.wireTypes.varint then
			local _ = nil
			local var75, var76 = protoModule.readVarInt(p3, var69)
			local _ = var75
			var69 = var76
			continue
		end
		if var70 == protoModule.wireTypes.lengthDelimited then
			if var74 == 1 then
				local _ = nil
				local var77, var78 = protoModule.readBuffer(p3, var69)
				var69 = var78
				var68.id = buffer.tostring(var77)
			elseif var74 == 2 then
				local _ = nil
				local var79, var80 = protoModule.readBuffer(p3, var69)
				var69 = var80
				var68.header = buffer.tostring(var79)
			elseif var74 == 3 then
				local _ = nil
				local var81, var82 = protoModule.readBuffer(p3, var69)
				var69 = var82
				table.insert(var68.fields, t.CustomFormFieldData.decode(var81))
			else
				local _ = nil
				local var83, var84 = protoModule.readVarInt(p3, var69)
				var69 = var84 + var83
			end
		elseif var70 == protoModule.wireTypes.i32 then
			local _ = nil
			local var85, var86 = protoModule.readFixed32(p3, var69)
			local _ = var85
			var69 = var86
		elseif var70 == protoModule.wireTypes.i64 then
			local _ = nil
			local var87, var88 = protoModule.readFixed64(p3, var69)
			local _ = var87
			var69 = var88
		else
			error("Unsupported wire type: " .. var107)
		end
	end
	return var68
end

function t_3:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.header ~= nil then
		t.header = self.header
	end
	if self.fields ~= nil and #self.fields > 0 then
		local t_1 = {}
		
		for i, v in self.fields do
			table.insert(t_1, v:jsonEncode())
		end
		t.fields = t_1
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), t (ref)
	local var89 = t_3.new()
	
	if self.id ~= nil then
		var89.id = self.id
	end
	if self.header ~= nil then
		var89.header = self.header
	end
	if self.fields ~= nil then
		local t_1 = {}
		
		for i, v in self.fields do
			table.insert(t_1, t.CustomFormFieldData.jsonDecode(v))
		end
		var89.fields = t_1
	end
	return var89
end

t_3.descriptor = {
	name = "CustomFormSectionData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormSectionData"
}
t.CustomFormSectionData = t_3
typeRegistryModule.default:register(t.CustomFormSectionData)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t (ref), t_4 (ref)
	return setmetatable({
		field_id = if p4 == nil or p4.field_id == nil then "" else p4.field_id,
		field_type = if p4 == nil or p4.field_type == nil then assert(t.CustomFormFieldType.fromNumber(0), "Enum has no 0 default") else p4.field_type,
		label = if p4 == nil or p4.label == nil then nil else p4.label,
		options = if p4 == nil or p4.options == nil then {} else p4.options
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var90 = 0
	
	if self.field_id ~= nil and self.field_id ~= "" then
		local var91, var92 = protoModule.writeTag(buff, var90, 1, protoModule.wireTypes.lengthDelimited)
		var91, var133 = protoModule.writeString(var91, var92, self.field_id)
		buff = var91
		var90 = var92
	end
	if self.field_type ~= nil and (self.field_type ~= nil and self.field_type ~= 0 or self.field_type ~= t.CustomFormFieldType.fromNumber(0)) then
		local var93, var94 = protoModule.writeTag(buff, var90, 2, protoModule.wireTypes.varint)
		var93, var135 = protoModule.writeVarInt(var93, var94, t.CustomFormFieldType.toNumber(self.field_type))
		buff = var93
		var90 = var94
	end
	if self.label ~= nil then
		local var95, var96 = protoModule.writeTag(buff, var90, 3, protoModule.wireTypes.lengthDelimited)
		var95, var137 = protoModule.writeString(var95, var96, self.label)
		buff = var95
		var90 = var96
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var97 = v:encode()
			local var98, var99 = protoModule.writeTag(buff, var90, 4, protoModule.wireTypes.lengthDelimited)
			var98, var140 = protoModule.writeBuffer(var98, var99, var97, buffer.len(var97))
			buff = var98
			var90 = var99
		end
	end
	local buff_1 = buffer.create(var90)
	buffer.copy(buff_1, 0, buff, 0, var90)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var100 = t_4.new()
	local var101 = 0
	while var101 < buffer.len(p4) do
		local _ = nil
		local var102 = nil
		local var103, var104, var105 = protoModule.readTag(p4, var101)
		local var106 = var103
		var102 = var104
		var101 = var105
		
		if var102 == protoModule.wireTypes.varint then
			if var106 == 2 then
				local _ = nil
				local var107, var108 = protoModule.readVarIntI32(p4, var101)
				local var109 = var107
				var101 = var108
				var100.field_type = t.CustomFormFieldType.fromNumber(var109) or var109
			else
				local _ = nil
				local var110, var111 = protoModule.readVarInt(p4, var101)
				local _ = var110
				var101 = var111
			end
		end
		if var102 == protoModule.wireTypes.lengthDelimited then
			if var106 == 1 then
				local _ = nil
				local var112, var113 = protoModule.readBuffer(p4, var101)
				var101 = var113
				var100.field_id = buffer.tostring(var112)
			elseif var106 == 3 then
				local _ = nil
				local var114, var115 = protoModule.readBuffer(p4, var101)
				var101 = var115
				var100.label = buffer.tostring(var114)
			elseif var106 == 4 then
				local _ = nil
				local var116, var117 = protoModule.readBuffer(p4, var101)
				var101 = var117
				table.insert(var100.options, t.CustomFormOptionData.decode(var116))
			else
				local _ = nil
				local var118, var119 = protoModule.readVarInt(p4, var101)
				var101 = var119 + var118
			end
		elseif var102 == protoModule.wireTypes.i32 then
			local _ = nil
			local var120, var121 = protoModule.readFixed32(p4, var101)
			local _ = var120
			var101 = var121
		elseif var102 == protoModule.wireTypes.i64 then
			local _ = nil
			local var122, var123 = protoModule.readFixed64(p4, var101)
			local _ = var122
			var101 = var123
		else
			error("Unsupported wire type: " .. var144)
		end
	end
	return var100
end

function t_4:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.field_id ~= nil and self.field_id ~= "" then
		t_1.fieldId = self.field_id
	end
	if self.field_type ~= nil and (self.field_type ~= nil and self.field_type ~= 0 or self.field_type ~= t.CustomFormFieldType.fromNumber(0)) then
		t_1.fieldType = if typeof(self.field_type) == "number" then self.field_type else t.CustomFormFieldType.toNumber(self.field_type)
	end
	if self.label ~= nil then
		t_1.label = self.label
	end
	if self.options ~= nil and #self.options > 0 then
		local t_2 = {}
		
		for i, v in self.options do
			table.insert(t_2, v:jsonEncode())
		end
		t_1.options = t_2
	end
	return t_1
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), t (ref)
	local var124 = t_4.new()
	
	if self.field_id ~= nil then
		var124.field_id = self.field_id
	end
	if self.fieldId ~= nil then
		var124.field_id = self.fieldId
	end
	if self.field_type ~= nil then
		var124.field_type = if typeof(self.field_type) == "number" then t.CustomFormFieldType.fromNumber(self.field_type) or self.field_type else t.CustomFormFieldType.fromName(self.field_type) or self.field_type
	end
	if self.fieldType ~= nil then
		var124.field_type = if typeof(self.fieldType) == "number" then t.CustomFormFieldType.fromNumber(self.fieldType) or self.fieldType else t.CustomFormFieldType.fromName(self.fieldType) or self.fieldType
	end
	if self.label ~= nil then
		var124.label = self.label
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.CustomFormOptionData.jsonDecode(v))
		end
		var124.options = t_1
	end
	return var124
end

t_4.descriptor = {
	name = "CustomFormFieldData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormFieldData"
}
t.CustomFormFieldData = t_4
typeRegistryModule.default:register(t.CustomFormFieldData)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		option_id = if p5 == nil or p5.option_id == nil then "" else p5.option_id,
		label = if p5 == nil or p5.label == nil then "" else p5.label
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var125 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var126, var127 = protoModule.writeTag(buff, var125, 1, protoModule.wireTypes.lengthDelimited)
		var126, var173 = protoModule.writeString(var126, var127, self.option_id)
		buff = var126
		var125 = var127
	end
	if self.label ~= nil and self.label ~= "" then
		local var128, var129 = protoModule.writeTag(buff, var125, 2, protoModule.wireTypes.lengthDelimited)
		var128, var175 = protoModule.writeString(var128, var129, self.label)
		buff = var128
		var125 = var129
	end
	local buff_1 = buffer.create(var125)
	buffer.copy(buff_1, 0, buff, 0, var125)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref)
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
				var125.option_id = buffer.tostring(var134)
			elseif var131 == 2 then
				local _ = nil
				local var136, var137 = protoModule.readBuffer(p5, var126)
				var126 = var137
				var125.label = buffer.tostring(var136)
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
			error("Unsupported wire type: " .. var179)
		end
	end
	return var125
end

function t_5:jsonEncode()
	local t = {}
	
	if self.option_id ~= nil and self.option_id ~= "" then
		t.optionId = self.option_id
	end
	if self.label ~= nil and self.label ~= "" then
		t.label = self.label
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref)
	local var144 = t_5.new()
	
	if self.option_id ~= nil then
		var144.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var144.option_id = self.optionId
	end
	if self.label ~= nil then
		var144.label = self.label
	end
	return var144
end

t_5.descriptor = {
	name = "CustomFormOptionData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormOptionData"
}
t.CustomFormOptionData = t_5
typeRegistryModule.default:register(t.CustomFormOptionData)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		answers = if p6 == nil or p6.answers == nil then {} else p6.answers
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var144 = 0
	
	if self.answers ~= nil and #self.answers > 0 then
		for i, v in self.answers do
			local var145 = v:encode()
			local var146, var147 = protoModule.writeTag(buff, var144, 1, protoModule.wireTypes.lengthDelimited)
			var146, var202 = protoModule.writeBuffer(var146, var147, var145, buffer.len(var145))
			buff = var146
			var144 = var147
		end
	end
	local buff_1 = buffer.create(var144)
	buffer.copy(buff_1, 0, buff, 0, var144)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var148 = t_6.new()
	local var149 = 0
	while var149 < buffer.len(p6) do
		local _ = nil
		local var150 = nil
		local var151, var152, var153 = protoModule.readTag(p6, var149)
		local var154 = var151
		var150 = var152
		var149 = var153
		
		if var150 == protoModule.wireTypes.varint then
			local _ = nil
			local var155, var156 = protoModule.readVarInt(p6, var149)
			local _ = var155
			var149 = var156
			continue
		end
		if var150 == protoModule.wireTypes.lengthDelimited then
			if var154 == 1 then
				local _ = nil
				local var157, var158 = protoModule.readBuffer(p6, var149)
				var149 = var158
				table.insert(var148.answers, t.CustomFormAnswerData.decode(var157))
			else
				local _ = nil
				local var159, var160 = protoModule.readVarInt(p6, var149)
				var149 = var160 + var159
			end
		elseif var150 == protoModule.wireTypes.i32 then
			local _ = nil
			local var161, var162 = protoModule.readFixed32(p6, var149)
			local _ = var161
			var149 = var162
		elseif var150 == protoModule.wireTypes.i64 then
			local _ = nil
			local var163, var164 = protoModule.readFixed64(p6, var149)
			local _ = var163
			var149 = var164
		else
			error("Unsupported wire type: " .. var206)
		end
	end
	return var148
end

function t_6:jsonEncode()
	local t = {}
	
	if self.answers ~= nil and #self.answers > 0 then
		local t_1 = {}
		
		for i, v in self.answers do
			table.insert(t_1, v:jsonEncode())
		end
		t.answers = t_1
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), t (ref)
	local var165 = t_6.new()
	
	if self.answers ~= nil then
		local t_1 = {}
		
		for i, v in self.answers do
			table.insert(t_1, t.CustomFormAnswerData.jsonDecode(v))
		end
		var165.answers = t_1
	end
	return var165
end

t_6.descriptor = {
	name = "CustomFormResponseData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormResponseData"
}
t.CustomFormResponseData = t_6
typeRegistryModule.default:register(t.CustomFormResponseData)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		field_id = if p7 == nil or p7.field_id == nil then "" else p7.field_id,
		option_ids = if p7 == nil or p7.option_ids == nil then {} else p7.option_ids
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var166 = 0
	
	if self.field_id ~= nil and self.field_id ~= "" then
		local var167, var168 = protoModule.writeTag(buff, var166, 1, protoModule.wireTypes.lengthDelimited)
		var167, var228 = protoModule.writeString(var167, var168, self.field_id)
		buff = var167
		var166 = var168
	end
	if self.option_ids ~= nil and #self.option_ids > 0 then
		for i, v in self.option_ids do
			local var169, var170 = protoModule.writeTag(buff, var166, 2, protoModule.wireTypes.lengthDelimited)
			var169, var230 = protoModule.writeString(var169, var170, v)
			buff = var169
			var166 = var170
		end
	end
	local buff_1 = buffer.create(var166)
	buffer.copy(buff_1, 0, buff, 0, var166)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref)
	local var171 = t_7.new()
	local var172 = 0
	while var172 < buffer.len(p7) do
		local _ = nil
		local var173 = nil
		local var174, var175, var176 = protoModule.readTag(p7, var172)
		local var177 = var174
		var173 = var175
		var172 = var176
		
		if var173 == protoModule.wireTypes.varint then
			local _ = nil
			local var178, var179 = protoModule.readVarInt(p7, var172)
			local _ = var178
			var172 = var179
			continue
		end
		if var173 == protoModule.wireTypes.lengthDelimited then
			if var177 == 1 then
				local _ = nil
				local var180, var181 = protoModule.readBuffer(p7, var172)
				var172 = var181
				var171.field_id = buffer.tostring(var180)
			elseif var177 == 2 then
				local _ = nil
				local var182, var183 = protoModule.readBuffer(p7, var172)
				var172 = var183
				table.insert(var171.option_ids, buffer.tostring(var182))
			else
				local _ = nil
				local var184, var185 = protoModule.readVarInt(p7, var172)
				var172 = var185 + var184
			end
		elseif var173 == protoModule.wireTypes.i32 then
			local _ = nil
			local var186, var187 = protoModule.readFixed32(p7, var172)
			local _ = var186
			var172 = var187
		elseif var173 == protoModule.wireTypes.i64 then
			local _ = nil
			local var188, var189 = protoModule.readFixed64(p7, var172)
			local _ = var188
			var172 = var189
		else
			error("Unsupported wire type: " .. var234)
		end
	end
	return var171
end

function t_7:jsonEncode()
	local t = {}
	
	if self.field_id ~= nil and self.field_id ~= "" then
		t.fieldId = self.field_id
	end
	if self.option_ids ~= nil and #self.option_ids > 0 then
		local t_1 = {}
		
		for i, v in self.option_ids do
			table.insert(t_1, v)
		end
		t.optionIds = t_1
	end
	return t
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref)
	local var190 = t_7.new()
	
	if self.field_id ~= nil then
		var190.field_id = self.field_id
	end
	if self.fieldId ~= nil then
		var190.field_id = self.fieldId
	end
	if self.option_ids ~= nil then
		local t = {}
		
		for i, v in self.option_ids do
			table.insert(t, v)
		end
		var190.option_ids = t
	end
	if self.optionIds ~= nil then
		local t = {}
		
		for i, v in self.optionIds do
			table.insert(t, v)
		end
		var190.option_ids = t
	end
	return var190
end

t_7.descriptor = {
	name = "CustomFormAnswerData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormAnswerData"
}
t.CustomFormAnswerData = t_7
typeRegistryModule.default:register(t.CustomFormAnswerData)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t_8 (ref)
	return setmetatable({
		total_responses = if p8 == nil or p8.total_responses == nil then 0 else p8.total_responses,
		field_results = if p8 == nil or p8.field_results == nil then {} else p8.field_results
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var191 = 0
	
	if self.total_responses ~= nil and self.total_responses ~= 0 then
		local var192, var193 = protoModule.writeTag(buff, var191, 1, protoModule.wireTypes.varint)
		var192, var259 = protoModule.writeVarInt(var192, var193, self.total_responses)
		buff = var192
		var191 = var193
	end
	if self.field_results ~= nil and #self.field_results > 0 then
		for i, v in self.field_results do
			local var194 = v:encode()
			local var195, var196 = protoModule.writeTag(buff, var191, 2, protoModule.wireTypes.lengthDelimited)
			var195, var262 = protoModule.writeBuffer(var195, var196, var194, buffer.len(var194))
			buff = var195
			var191 = var196
		end
	end
	local buff_1 = buffer.create(var191)
	buffer.copy(buff_1, 0, buff, 0, var191)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var197 = t_8.new()
	local var198 = 0
	while var198 < buffer.len(p8) do
		local _ = nil
		local var199 = nil
		local var200, var201, var202 = protoModule.readTag(p8, var198)
		local var203 = var200
		var199 = var201
		var198 = var202
		
		if var199 == protoModule.wireTypes.varint then
			if var203 == 1 then
				local _ = nil
				local var204, var205 = protoModule.readVarIntI64(p8, var198)
				var198 = var205
				var197.total_responses = var204
			else
				local _ = nil
				local var206, var207 = protoModule.readVarInt(p8, var198)
				local _ = var206
				var198 = var207
			end
		end
		if var199 == protoModule.wireTypes.lengthDelimited then
			if var203 == 2 then
				local _ = nil
				local var208, var209 = protoModule.readBuffer(p8, var198)
				var198 = var209
				table.insert(var197.field_results, t.CustomFormFieldResultData.decode(var208))
			else
				local _ = nil
				local var210, var211 = protoModule.readVarInt(p8, var198)
				var198 = var211 + var210
			end
		elseif var199 == protoModule.wireTypes.i32 then
			local _ = nil
			local var212, var213 = protoModule.readFixed32(p8, var198)
			local _ = var212
			var198 = var213
		elseif var199 == protoModule.wireTypes.i64 then
			local _ = nil
			local var214, var215 = protoModule.readFixed64(p8, var198)
			local _ = var214
			var198 = var215
		else
			error("Unsupported wire type: " .. var266)
		end
	end
	return var197
end

function t_8:jsonEncode()
	local t = {}
	
	if self.total_responses ~= nil and self.total_responses ~= 0 then
		t.totalResponses = self.total_responses
	end
	if self.field_results ~= nil and #self.field_results > 0 then
		local t_1 = {}
		
		for i, v in self.field_results do
			table.insert(t_1, v:jsonEncode())
		end
		t.fieldResults = t_1
	end
	return t
end

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), t (ref)
	local var216 = t_8.new()
	
	if self.total_responses ~= nil then
		var216.total_responses = self.total_responses
	end
	if self.totalResponses ~= nil then
		var216.total_responses = self.totalResponses
	end
	if self.field_results ~= nil then
		local t_1 = {}
		
		for i, v in self.field_results do
			table.insert(t_1, t.CustomFormFieldResultData.jsonDecode(v))
		end
		var216.field_results = t_1
	end
	if self.fieldResults ~= nil then
		local t_1 = {}
		
		for i, v in self.fieldResults do
			table.insert(t_1, t.CustomFormFieldResultData.jsonDecode(v))
		end
		var216.field_results = t_1
	end
	return var216
end

t_8.descriptor = {
	name = "CustomFormResultsData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormResultsData"
}
t.CustomFormResultsData = t_8
typeRegistryModule.default:register(t.CustomFormResultsData)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p9)
	-- upvalues: t_9 (ref)
	return setmetatable({
		field_id = if p9 == nil or p9.field_id == nil then "" else p9.field_id,
		option_results = if p9 == nil or p9.option_results == nil then {} else p9.option_results
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var217 = 0
	
	if self.field_id ~= nil and self.field_id ~= "" then
		local var218, var219 = protoModule.writeTag(buff, var217, 1, protoModule.wireTypes.lengthDelimited)
		var218, var291 = protoModule.writeString(var218, var219, self.field_id)
		buff = var218
		var217 = var219
	end
	if self.option_results ~= nil and #self.option_results > 0 then
		for i, v in self.option_results do
			local var220 = v:encode()
			local var221, var222 = protoModule.writeTag(buff, var217, 2, protoModule.wireTypes.lengthDelimited)
			var221, var294 = protoModule.writeBuffer(var221, var222, var220, buffer.len(var220))
			buff = var221
			var217 = var222
		end
	end
	local buff_1 = buffer.create(var217)
	buffer.copy(buff_1, 0, buff, 0, var217)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var223 = t_9.new()
	local var224 = 0
	while var224 < buffer.len(p9) do
		local _ = nil
		local var225 = nil
		local var226, var227, var228 = protoModule.readTag(p9, var224)
		local var229 = var226
		var225 = var227
		var224 = var228
		
		if var225 == protoModule.wireTypes.varint then
			local _ = nil
			local var230, var231 = protoModule.readVarInt(p9, var224)
			local _ = var230
			var224 = var231
			continue
		end
		if var225 == protoModule.wireTypes.lengthDelimited then
			if var229 == 1 then
				local _ = nil
				local var232, var233 = protoModule.readBuffer(p9, var224)
				var224 = var233
				var223.field_id = buffer.tostring(var232)
			elseif var229 == 2 then
				local _ = nil
				local var234, var235 = protoModule.readBuffer(p9, var224)
				var224 = var235
				table.insert(var223.option_results, t.CustomFormOptionResultData.decode(var234))
			else
				local _ = nil
				local var236, var237 = protoModule.readVarInt(p9, var224)
				var224 = var237 + var236
			end
		elseif var225 == protoModule.wireTypes.i32 then
			local _ = nil
			local var238, var239 = protoModule.readFixed32(p9, var224)
			local _ = var238
			var224 = var239
		elseif var225 == protoModule.wireTypes.i64 then
			local _ = nil
			local var240, var241 = protoModule.readFixed64(p9, var224)
			local _ = var240
			var224 = var241
		else
			error("Unsupported wire type: " .. var298)
		end
	end
	return var223
end

function t_9:jsonEncode()
	local t = {}
	
	if self.field_id ~= nil and self.field_id ~= "" then
		t.fieldId = self.field_id
	end
	if self.option_results ~= nil and #self.option_results > 0 then
		local t_1 = {}
		
		for i, v in self.option_results do
			table.insert(t_1, v:jsonEncode())
		end
		t.optionResults = t_1
	end
	return t
end

function t_9:jsonDecode()
	-- upvalues: t_9 (ref), t (ref)
	local var242 = t_9.new()
	
	if self.field_id ~= nil then
		var242.field_id = self.field_id
	end
	if self.fieldId ~= nil then
		var242.field_id = self.fieldId
	end
	if self.option_results ~= nil then
		local t_1 = {}
		
		for i, v in self.option_results do
			table.insert(t_1, t.CustomFormOptionResultData.jsonDecode(v))
		end
		var242.option_results = t_1
	end
	if self.optionResults ~= nil then
		local t_1 = {}
		
		for i, v in self.optionResults do
			table.insert(t_1, t.CustomFormOptionResultData.jsonDecode(v))
		end
		var242.option_results = t_1
	end
	return var242
end

t_9.descriptor = {
	name = "CustomFormFieldResultData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormFieldResultData"
}
t.CustomFormFieldResultData = t_9
typeRegistryModule.default:register(t.CustomFormFieldResultData)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p10)
	-- upvalues: t_10 (ref)
	return setmetatable({
		option_id = if p10 == nil or p10.option_id == nil then "" else p10.option_id,
		vote_count = if p10 == nil or p10.vote_count == nil then 0 else p10.vote_count,
		percentage = if p10 == nil or p10.percentage == nil then 0 else p10.percentage
	}, t_10)
end

function t_10:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var243 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var244, var245 = protoModule.writeTag(buff, var243, 1, protoModule.wireTypes.lengthDelimited)
		var244, var323 = protoModule.writeString(var244, var245, self.option_id)
		buff = var244
		var243 = var245
	end
	if self.vote_count ~= nil and self.vote_count ~= 0 then
		local var246, var247 = protoModule.writeTag(buff, var243, 2, protoModule.wireTypes.varint)
		var246, var325 = protoModule.writeVarInt(var246, var247, self.vote_count)
		buff = var246
		var243 = var247
	end
	if self.percentage ~= nil and self.percentage ~= 0 then
		local var248, var249 = protoModule.writeTag(buff, var243, 3, protoModule.wireTypes.varint)
		var248, var327 = protoModule.writeVarInt(var248, var249, self.percentage)
		buff = var248
		var243 = var249
	end
	local buff_1 = buffer.create(var243)
	buffer.copy(buff_1, 0, buff, 0, var243)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref)
	local var243 = t_10.new()
	local var244 = 0
	while var244 < buffer.len(p10) do
		local _ = nil
		local var245 = nil
		local var246, var247, var248 = protoModule.readTag(p10, var244)
		local var249 = var246
		var245 = var247
		var244 = var248
		
		if var245 == protoModule.wireTypes.varint then
			if var249 == 2 then
				local _ = nil
				local var250, var251 = protoModule.readVarIntI64(p10, var244)
				var244 = var251
				var243.vote_count = var250
			elseif var249 == 3 then
				local _ = nil
				local var252, var253 = protoModule.readVarIntI32(p10, var244)
				var244 = var253
				var243.percentage = var252
			else
				local _ = nil
				local var254, var255 = protoModule.readVarInt(p10, var244)
				local _ = var254
				var244 = var255
			end
		end
		if var245 == protoModule.wireTypes.lengthDelimited then
			if var249 == 1 then
				local _ = nil
				local var256, var257 = protoModule.readBuffer(p10, var244)
				var244 = var257
				var243.option_id = buffer.tostring(var256)
			else
				local _ = nil
				local var258, var259 = protoModule.readVarInt(p10, var244)
				var244 = var259 + var258
			end
		elseif var245 == protoModule.wireTypes.i32 then
			local _ = nil
			local var260, var261 = protoModule.readFixed32(p10, var244)
			local _ = var260
			var244 = var261
		elseif var245 == protoModule.wireTypes.i64 then
			local _ = nil
			local var262, var263 = protoModule.readFixed64(p10, var244)
			local _ = var262
			var244 = var263
		else
			error("Unsupported wire type: " .. var331)
		end
	end
	return var243
end

function t_10:jsonEncode()
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

function t_10:jsonDecode()
	-- upvalues: t_10 (ref)
	local var264 = t_10.new()
	
	if self.option_id ~= nil then
		var264.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var264.option_id = self.optionId
	end
	if self.vote_count ~= nil then
		var264.vote_count = self.vote_count
	end
	if self.voteCount ~= nil then
		var264.vote_count = self.voteCount
	end
	if self.percentage ~= nil then
		var264.percentage = self.percentage
	end
	return var264
end

t_10.descriptor = {
	name = "CustomFormOptionResultData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CustomFormOptionResultData"
}
t.CustomFormOptionResultData = t_10
typeRegistryModule.default:register(t.CustomFormOptionResultData)
t.CustomFormFieldType = {
	fromNumber = function(p11)
		return if p11 == 0 then "CUSTOM_FORM_FIELD_TYPE_INVALID" elseif p11 == 1 then "CUSTOM_FORM_FIELD_TYPE_RADIO" elseif p11 == 2 then "CUSTOM_FORM_FIELD_TYPE_CHECKBOX" else nil
	end,
	toNumber = function(p11)
		return if p11 == "CUSTOM_FORM_FIELD_TYPE_INVALID" then 0 elseif p11 == "CUSTOM_FORM_FIELD_TYPE_RADIO" then 1 elseif p11 == "CUSTOM_FORM_FIELD_TYPE_CHECKBOX" then 2 else p11
	end,
	fromName = function(p11)
		return if p11 == "CUSTOM_FORM_FIELD_TYPE_INVALID" then "CUSTOM_FORM_FIELD_TYPE_INVALID" elseif p11 == "CUSTOM_FORM_FIELD_TYPE_RADIO" then "CUSTOM_FORM_FIELD_TYPE_RADIO" elseif p11 == "CUSTOM_FORM_FIELD_TYPE_CHECKBOX" then "CUSTOM_FORM_FIELD_TYPE_CHECKBOX" else nil
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