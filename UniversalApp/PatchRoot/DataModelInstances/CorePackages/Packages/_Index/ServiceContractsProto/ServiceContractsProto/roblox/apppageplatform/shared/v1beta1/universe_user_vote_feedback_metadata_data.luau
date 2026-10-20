local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local _ = require(script.Parent.custom_options)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		capabilities = if p1 == nil or p1.capabilities == nil then nil else p1.capabilities,
		categories = if p1 == nil or p1.categories == nil then {} else p1.categories,
		comment = if p1 == nil or p1.comment == nil then nil else p1.comment,
		metadata = if p1 == nil or p1.metadata == nil then nil else p1.metadata
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.capabilities ~= nil then
		local EncodeResult = self.capabilities:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.categories ~= nil and #self.categories > 0 then
		for _, category in self.categories do
			local EncodeResult = category:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.comment ~= nil then
		local EncodeResult = self.comment:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.metadata ~= nil then
		local EncodeResult = self.metadata:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
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
		Tag, Tag2, v25 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v25 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v25 = ProtoModule.readBuffer(Buf, v1)
				NewModule.capabilities = t.UniverseUserVoteFeedbackMetadataData_Capabilities.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v25 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.categories, t.UniverseUserVoteFeedbackMetadataData_Category.decode(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v25 = ProtoModule.readBuffer(Buf, v1)
				NewModule.comment = t.UniverseUserVoteFeedbackMetadataData_Comment.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v25 = ProtoModule.readBuffer(Buf, v1)
				NewModule.metadata = t.UniverseUserVoteFeedbackMetadataData_Metadata.decode(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v25 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v25 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.capabilities ~= nil then
		t.capabilities = self.capabilities:jsonEncode()
	end
	if self.categories ~= nil and #self.categories > 0 then
		local Categories = {}
		
		for _, category in self.categories do
			table.insert(Categories, category:jsonEncode())
		end
		t.categories = Categories
	end
	if self.comment ~= nil then
		t.comment = self.comment:jsonEncode()
	end
	if self.metadata ~= nil then
		t.metadata = self.metadata:jsonEncode()
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), t (copy)
	local NewModule = Module.new()
	
	if self.capabilities ~= nil then
		NewModule.capabilities = t.UniverseUserVoteFeedbackMetadataData_Capabilities.jsonDecode(self.capabilities)
	end
	if self.categories ~= nil then
		local Categories = {}
		
		for _, category in self.categories do
			table.insert(Categories, t.UniverseUserVoteFeedbackMetadataData_Category.jsonDecode(category))
		end
		NewModule.categories = Categories
	end
	if self.comment ~= nil then
		NewModule.comment = t.UniverseUserVoteFeedbackMetadataData_Comment.jsonDecode(self.comment)
	end
	if self.metadata ~= nil then
		NewModule.metadata = t.UniverseUserVoteFeedbackMetadataData_Metadata.jsonDecode(self.metadata)
	end
	return NewModule
end

Module.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserVoteFeedbackMetadataData"
}
t.UniverseUserVoteFeedbackMetadataData = Module
TypeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		can_submit_review = p1 ~= nil and p1.can_submit_review ~= nil and p1.can_submit_review,
		can_submit_comment = p1 ~= nil and p1.can_submit_comment ~= nil and p1.can_submit_comment,
		can_submit_category_options = if p1 == nil or p1.can_submit_category_options == nil then nil else p1.can_submit_category_options
	}, Module1))
end

function Module1:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.can_submit_review then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, if self.can_submit_review then 1 else 0)
	end
	if self.can_submit_comment then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.can_submit_comment then 1 else 0)
	end
	if self.can_submit_category_options ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, if self.can_submit_category_options then 1 else 0)
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
		Tag, Tag2, v50 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarInt
				VarInt, v50 = ProtoModule.readVarInt(Buf, v2)
				NewModule.can_submit_review = VarInt ~= 0
			elseif Tag == 2 then
				local VarInt1
				VarInt1, v50 = ProtoModule.readVarInt(Buf, v2)
				NewModule.can_submit_comment = VarInt1 ~= 0
			elseif Tag == 3 then
				local VarInt2
				VarInt2, v50 = ProtoModule.readVarInt(Buf, v2)
				NewModule.can_submit_category_options = VarInt2 ~= 0
			else
				local _
				_, v50 = ProtoModule.readVarInt(Buf, v2)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			local VarInt3, VarInt2_1 = ProtoModule.readVarInt(Buf, v2)
			v2 = VarInt2_1 + VarInt3
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v50 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v50 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	local t = {}
	
	if self.can_submit_review then
		t.canSubmitReview = self.can_submit_review
	end
	if self.can_submit_comment then
		t.canSubmitComment = self.can_submit_comment
	end
	if self.can_submit_category_options ~= nil then
		t.canSubmitCategoryOptions = self.can_submit_category_options
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy)
	local NewModule = Module1.new()
	
	if self.can_submit_review ~= nil then
		NewModule.can_submit_review = self.can_submit_review
	end
	if self.canSubmitReview ~= nil then
		NewModule.can_submit_review = self.canSubmitReview
	end
	if self.can_submit_comment ~= nil then
		NewModule.can_submit_comment = self.can_submit_comment
	end
	if self.canSubmitComment ~= nil then
		NewModule.can_submit_comment = self.canSubmitComment
	end
	if self.can_submit_category_options ~= nil then
		NewModule.can_submit_category_options = self.can_submit_category_options
	end
	if self.canSubmitCategoryOptions ~= nil then
		NewModule.can_submit_category_options = self.canSubmitCategoryOptions
	end
	return NewModule
end

Module1.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Capabilities",
	fullName = "roblox.apppageplatform.shared.v1beta1.Capabilities"
}
t.UniverseUserVoteFeedbackMetadataData_Capabilities = Module1
TypeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Capabilities)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: Module2 (copy)
	return (setmetatable({
		type = if p1 == nil or p1.type == nil then "" else p1.type,
		label = if p1 == nil or p1.label == nil then "" else p1.label,
		allows_multiple_selections = p1 ~= nil and p1.allows_multiple_selections ~= nil and p1.allows_multiple_selections,
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module2))
end

function Module2:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.type ~= nil and self.type ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.type)
	end
	if self.label ~= nil and self.label ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.label)
	end
	if self.allows_multiple_selections then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, if self.allows_multiple_selections then 1 else 0)
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

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v75 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				local VarInt
				VarInt, v75 = ProtoModule.readVarInt(Buf, v3)
				NewModule.allows_multiple_selections = VarInt ~= 0
			else
				local _
				_, v75 = ProtoModule.readVarInt(Buf, v3)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v75 = ProtoModule.readBuffer(Buf, v3)
				NewModule.type = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v75 = ProtoModule.readBuffer(Buf, v3)
				NewModule.label = buffer.tostring(Buffer2)
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v75 = ProtoModule.readBuffer(Buf, v3)
				table.insert(NewModule.options, t.UniverseUserVoteFeedbackMetadataData_Category_Option.decode(Buffer3))
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v75 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v75 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode()
	local t = {}
	
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	if self.label ~= nil and self.label ~= "" then
		t.label = self.label
	end
	if self.allows_multiple_selections then
		t.allowsMultipleSelections = self.allows_multiple_selections
	end
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module2:jsonDecode()
	-- upvalues: Module2 (copy), t (copy)
	local NewModule = Module2.new()
	
	if self.type ~= nil then
		NewModule.type = self.type
	end
	if self.label ~= nil then
		NewModule.label = self.label
	end
	if self.allows_multiple_selections ~= nil then
		NewModule.allows_multiple_selections = self.allows_multiple_selections
	end
	if self.allowsMultipleSelections ~= nil then
		NewModule.allows_multiple_selections = self.allowsMultipleSelections
	end
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, t.UniverseUserVoteFeedbackMetadataData_Category_Option.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module2.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Category",
	fullName = "roblox.apppageplatform.shared.v1beta1.Category"
}
t.UniverseUserVoteFeedbackMetadataData_Category = Module2
TypeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Category)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1)
	-- upvalues: Module3 (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		label = if p1 == nil or p1.label == nil then "" else p1.label
	}, Module3))
end

function Module3:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.label ~= nil and self.label ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.label)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf)
	-- upvalues: Module3 (copy), ProtoModule (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v98 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v98 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v98 = ProtoModule.readBuffer(Buf, v4)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v98 = ProtoModule.readBuffer(Buf, v4)
				NewModule.label = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v98 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v98 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.label ~= nil and self.label ~= "" then
		t.label = self.label
	end
	return t
end

function Module3:jsonDecode()
	-- upvalues: Module3 (copy)
	local NewModule = Module3.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.label ~= nil then
		NewModule.label = self.label
	end
	return NewModule
end

Module3.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Category_Option",
	fullName = "roblox.apppageplatform.shared.v1beta1.Option"
}
t.UniverseUserVoteFeedbackMetadataData_Category_Option = Module3
TypeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Category_Option)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1)
	-- upvalues: Module4 (copy)
	return (setmetatable({
		label = if p1 == nil or p1.label == nil then "" else p1.label,
		placeholder_text = if p1 == nil or p1.placeholder_text == nil then "" else p1.placeholder_text,
		minimum_length = if p1 == nil or p1.minimum_length == nil then 0 else p1.minimum_length,
		maximum_length = if p1 == nil or p1.maximum_length == nil then 0 else p1.maximum_length
	}, Module4))
end

function Module4:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.label ~= nil and self.label ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.label)
	end
	if self.placeholder_text ~= nil and self.placeholder_text ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.placeholder_text)
	end
	if self.minimum_length ~= nil and self.minimum_length ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.minimum_length)
	end
	if self.maximum_length ~= nil and self.maximum_length ~= 0 then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, self.maximum_length)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf)
	-- upvalues: Module4 (copy), ProtoModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v121 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				NewModule.minimum_length, v121 = ProtoModule.readVarIntI32(Buf, v5)
			elseif Tag == 4 then
				NewModule.maximum_length, v121 = ProtoModule.readVarIntI32(Buf, v5)
			else
				local _
				_, v121 = ProtoModule.readVarInt(Buf, v5)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v121 = ProtoModule.readBuffer(Buf, v5)
				NewModule.label = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v121 = ProtoModule.readBuffer(Buf, v5)
				NewModule.placeholder_text = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v121 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v121 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode()
	local t = {}
	
	if self.label ~= nil and self.label ~= "" then
		t.label = self.label
	end
	if self.placeholder_text ~= nil and self.placeholder_text ~= "" then
		t.placeholderText = self.placeholder_text
	end
	if self.minimum_length ~= nil and self.minimum_length ~= 0 then
		t.minimumLength = self.minimum_length
	end
	if self.maximum_length ~= nil and self.maximum_length ~= 0 then
		t.maximumLength = self.maximum_length
	end
	return t
end

function Module4:jsonDecode()
	-- upvalues: Module4 (copy)
	local NewModule = Module4.new()
	
	if self.label ~= nil then
		NewModule.label = self.label
	end
	if self.placeholder_text ~= nil then
		NewModule.placeholder_text = self.placeholder_text
	end
	if self.placeholderText ~= nil then
		NewModule.placeholder_text = self.placeholderText
	end
	if self.minimum_length ~= nil then
		NewModule.minimum_length = self.minimum_length
	end
	if self.minimumLength ~= nil then
		NewModule.minimum_length = self.minimumLength
	end
	if self.maximum_length ~= nil then
		NewModule.maximum_length = self.maximum_length
	end
	if self.maximumLength ~= nil then
		NewModule.maximum_length = self.maximumLength
	end
	return NewModule
end

Module4.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Comment",
	fullName = "roblox.apppageplatform.shared.v1beta1.Comment"
}
t.UniverseUserVoteFeedbackMetadataData_Comment = Module4
TypeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Comment)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1)
	-- upvalues: Module5 (copy)
	return (setmetatable({
		disclaimer_label = if p1 == nil or p1.disclaimer_label == nil then "" else p1.disclaimer_label,
		submit_button_label = if p1 == nil or p1.submit_button_label == nil then "" else p1.submit_button_label,
		form_title_label = if p1 == nil or p1.form_title_label == nil then "" else p1.form_title_label
	}, Module5))
end

function Module5:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.disclaimer_label ~= nil and self.disclaimer_label ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.disclaimer_label)
	end
	if self.submit_button_label ~= nil and self.submit_button_label ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.submit_button_label)
	end
	if self.form_title_label ~= nil and self.form_title_label ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.form_title_label)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf)
	-- upvalues: Module5 (copy), ProtoModule (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v142 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v142 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v142 = ProtoModule.readBuffer(Buf, v6)
				NewModule.disclaimer_label = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v142 = ProtoModule.readBuffer(Buf, v6)
				NewModule.submit_button_label = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v142 = ProtoModule.readBuffer(Buf, v6)
				NewModule.form_title_label = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v142 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v142 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode()
	local t = {}
	
	if self.disclaimer_label ~= nil and self.disclaimer_label ~= "" then
		t.disclaimerLabel = self.disclaimer_label
	end
	if self.submit_button_label ~= nil and self.submit_button_label ~= "" then
		t.submitButtonLabel = self.submit_button_label
	end
	if self.form_title_label ~= nil and self.form_title_label ~= "" then
		t.formTitleLabel = self.form_title_label
	end
	return t
end

function Module5:jsonDecode()
	-- upvalues: Module5 (copy)
	local NewModule = Module5.new()
	
	if self.disclaimer_label ~= nil then
		NewModule.disclaimer_label = self.disclaimer_label
	end
	if self.disclaimerLabel ~= nil then
		NewModule.disclaimer_label = self.disclaimerLabel
	end
	if self.submit_button_label ~= nil then
		NewModule.submit_button_label = self.submit_button_label
	end
	if self.submitButtonLabel ~= nil then
		NewModule.submit_button_label = self.submitButtonLabel
	end
	if self.form_title_label ~= nil then
		NewModule.form_title_label = self.form_title_label
	end
	if self.formTitleLabel ~= nil then
		NewModule.form_title_label = self.formTitleLabel
	end
	return NewModule
end

Module5.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Metadata",
	fullName = "roblox.apppageplatform.shared.v1beta1.Metadata"
}
t.UniverseUserVoteFeedbackMetadataData_Metadata = Module5
TypeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Metadata)

return {
	UniverseUserVoteFeedbackMetadataData = t.UniverseUserVoteFeedbackMetadataData,
	UniverseUserVoteFeedbackMetadataData_Capabilities = t.UniverseUserVoteFeedbackMetadataData_Capabilities,
	UniverseUserVoteFeedbackMetadataData_Category = t.UniverseUserVoteFeedbackMetadataData_Category,
	UniverseUserVoteFeedbackMetadataData_Category_Option = t.UniverseUserVoteFeedbackMetadataData_Category_Option,
	UniverseUserVoteFeedbackMetadataData_Comment = t.UniverseUserVoteFeedbackMetadataData_Comment,
	UniverseUserVoteFeedbackMetadataData_Metadata = t.UniverseUserVoteFeedbackMetadataData_Metadata
}