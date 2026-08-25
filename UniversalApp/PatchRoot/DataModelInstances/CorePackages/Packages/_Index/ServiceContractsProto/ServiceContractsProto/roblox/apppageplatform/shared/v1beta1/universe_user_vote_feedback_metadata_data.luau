local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		capabilities = if p1 == nil or p1.capabilities == nil then nil else p1.capabilities,
		categories = if p1 == nil or p1.categories == nil then {} else p1.categories,
		comment = if p1 == nil or p1.comment == nil then nil else p1.comment,
		metadata = if p1 == nil or p1.metadata == nil then nil else p1.metadata
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.capabilities ~= nil then
		local var2 = self.capabilities:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var13 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.categories ~= nil and #self.categories > 0 then
		for i, v in self.categories do
			local var5 = v:encode()
			local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var6, var16 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
			buff = var6
			var1 = var7
		end
	end
	if self.comment ~= nil then
		local var8 = self.comment:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var19 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	if self.metadata ~= nil then
		local var11 = self.metadata:encode()
		local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var12, var22 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var1 = var13
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
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.capabilities = t.UniverseUserVoteFeedbackMetadataData_Capabilities.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				table.insert(var1.categories, t.UniverseUserVoteFeedbackMetadataData_Category.decode(var12))
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.comment = t.UniverseUserVoteFeedbackMetadataData_Comment.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.metadata = t.UniverseUserVoteFeedbackMetadataData_Metadata.decode(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var26)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.capabilities ~= nil then
		t.capabilities = self.capabilities:jsonEncode()
	end
	if self.categories ~= nil and #self.categories > 0 then
		local t_1 = {}
		
		for i, v in self.categories do
			table.insert(t_1, v:jsonEncode())
		end
		t.categories = t_1
	end
	if self.comment ~= nil then
		t.comment = self.comment:jsonEncode()
	end
	if self.metadata ~= nil then
		t.metadata = self.metadata:jsonEncode()
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref)
	local var1 = t_1.new()
	
	if self.capabilities ~= nil then
		var1.capabilities = t.UniverseUserVoteFeedbackMetadataData_Capabilities.jsonDecode(self.capabilities)
	end
	if self.categories ~= nil then
		local t_2 = {}
		
		for i, v in self.categories do
			table.insert(t_2, t.UniverseUserVoteFeedbackMetadataData_Category.jsonDecode(v))
		end
		var1.categories = t_2
	end
	if self.comment ~= nil then
		var1.comment = t.UniverseUserVoteFeedbackMetadataData_Comment.jsonDecode(self.comment)
	end
	if self.metadata ~= nil then
		var1.metadata = t.UniverseUserVoteFeedbackMetadataData_Metadata.jsonDecode(self.metadata)
	end
	return var1
end

t_1.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserVoteFeedbackMetadataData"
}
t.UniverseUserVoteFeedbackMetadataData = t_1
typeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p1)
	-- upvalues: t_2 (ref)
	return setmetatable({
		can_submit_review = if p1 == nil or p1.can_submit_review == nil then false else p1.can_submit_review,
		can_submit_comment = if p1 == nil or p1.can_submit_comment == nil then false else p1.can_submit_comment,
		can_submit_category_options = if p1 == nil or p1.can_submit_category_options == nil then nil else p1.can_submit_category_options
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.can_submit_review then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var54 = protoModule.writeVarInt(var2, var3, if self.can_submit_review then 1 else 0)
		buff = var2
		var1 = var3
	end
	if self.can_submit_comment then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var56 = protoModule.writeVarInt(var4, var5, if self.can_submit_comment then 1 else 0)
		buff = var4
		var1 = var5
	end
	if self.can_submit_category_options ~= nil then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var58 = protoModule.writeVarInt(var6, var7, if self.can_submit_category_options then 1 else 0)
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_2.decode(p1)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var1 = t_2.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local _ = nil
		local var3, var4, var5 = protoModule.readTag(p1, var2)
		local var6 = var3
		local var7 = var4
		var2 = var5
		
		if var7 == protoModule.wireTypes.varint then
			if var6 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.can_submit_review = var8 ~= 0
			elseif var6 == 2 then
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				var2 = var11
				var1.can_submit_comment = var10 ~= 0
			elseif var6 == 3 then
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13
				var1.can_submit_category_options = var12 ~= 0
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				local _ = var14
				var2 = var15
			end
		elseif var7 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var16, var17 = protoModule.readVarInt(p1, var2)
			var2 = var17 + var16
		elseif var7 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var7 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var66)
		end
	end
	return var1
end

function t_2:jsonEncode()
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

function t_2:jsonDecode()
	-- upvalues: t_2 (ref)
	local var1 = t_2.new()
	
	if self.can_submit_review ~= nil then
		var1.can_submit_review = self.can_submit_review
	end
	if self.canSubmitReview ~= nil then
		var1.can_submit_review = self.canSubmitReview
	end
	if self.can_submit_comment ~= nil then
		var1.can_submit_comment = self.can_submit_comment
	end
	if self.canSubmitComment ~= nil then
		var1.can_submit_comment = self.canSubmitComment
	end
	if self.can_submit_category_options ~= nil then
		var1.can_submit_category_options = self.can_submit_category_options
	end
	if self.canSubmitCategoryOptions ~= nil then
		var1.can_submit_category_options = self.canSubmitCategoryOptions
	end
	return var1
end

t_2.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Capabilities",
	fullName = "roblox.apppageplatform.shared.v1beta1.Capabilities"
}
t.UniverseUserVoteFeedbackMetadataData_Capabilities = t_2
typeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Capabilities)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p1)
	-- upvalues: t_3 (ref)
	return setmetatable({
		type = if p1 == nil or p1.type == nil then "" else p1.type,
		label = if p1 == nil or p1.label == nil then "" else p1.label,
		allows_multiple_selections = if p1 == nil or p1.allows_multiple_selections == nil then false else p1.allows_multiple_selections,
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.type ~= nil and self.type ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var86 = protoModule.writeString(var2, var3, self.type)
		buff = var2
		var1 = var3
	end
	if self.label ~= nil and self.label ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var88 = protoModule.writeString(var4, var5, self.label)
		buff = var4
		var1 = var5
	end
	if self.allows_multiple_selections then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var90 = protoModule.writeVarInt(var6, var7, if self.allows_multiple_selections then 1 else 0)
		buff = var6
		var1 = var7
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var8 = v:encode()
			local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var9, var93 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
			buff = var9
			var1 = var10
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_3.decode(p1)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var1 = t_3.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 3 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.allows_multiple_selections = var8 ~= 0
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
				var1.type = buffer.tostring(var12)
			elseif var7 == 2 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.label = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				table.insert(var1.options, t.UniverseUserVoteFeedbackMetadataData_Category_Option.decode(var16))
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var97)
		end
	end
	return var1
end

function t_3:jsonEncode()
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
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), t (ref)
	local var1 = t_3.new()
	
	if self.type ~= nil then
		var1.type = self.type
	end
	if self.label ~= nil then
		var1.label = self.label
	end
	if self.allows_multiple_selections ~= nil then
		var1.allows_multiple_selections = self.allows_multiple_selections
	end
	if self.allowsMultipleSelections ~= nil then
		var1.allows_multiple_selections = self.allowsMultipleSelections
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UniverseUserVoteFeedbackMetadataData_Category_Option.jsonDecode(v))
		end
		var1.options = t_1
	end
	return var1
end

t_3.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Category",
	fullName = "roblox.apppageplatform.shared.v1beta1.Category"
}
t.UniverseUserVoteFeedbackMetadataData_Category = t_3
typeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Category)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p1)
	-- upvalues: t_4 (ref)
	return setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		label = if p1 == nil or p1.label == nil then "" else p1.label
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var125 = protoModule.writeString(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.label ~= nil and self.label ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var127 = protoModule.writeString(var4, var5, self.label)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_4.decode(p1)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var1 = t_4.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.label = buffer.tostring(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var131)
		end
	end
	return var1
end

function t_4:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.label ~= nil and self.label ~= "" then
		t.label = self.label
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref)
	local var1 = t_4.new()
	
	if self.id ~= nil then
		var1.id = self.id
	end
	if self.label ~= nil then
		var1.label = self.label
	end
	return var1
end

t_4.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Category_Option",
	fullName = "roblox.apppageplatform.shared.v1beta1.Option"
}
t.UniverseUserVoteFeedbackMetadataData_Category_Option = t_4
typeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Category_Option)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p1)
	-- upvalues: t_5 (ref)
	return setmetatable({
		label = if p1 == nil or p1.label == nil then "" else p1.label,
		placeholder_text = if p1 == nil or p1.placeholder_text == nil then "" else p1.placeholder_text,
		minimum_length = if p1 == nil or p1.minimum_length == nil then 0 else p1.minimum_length,
		maximum_length = if p1 == nil or p1.maximum_length == nil then 0 else p1.maximum_length
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.label ~= nil and self.label ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var153 = protoModule.writeString(var2, var3, self.label)
		buff = var2
		var1 = var3
	end
	if self.placeholder_text ~= nil and self.placeholder_text ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var155 = protoModule.writeString(var4, var5, self.placeholder_text)
		buff = var4
		var1 = var5
	end
	if self.minimum_length ~= nil and self.minimum_length ~= 0 then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var157 = protoModule.writeVarInt(var6, var7, self.minimum_length)
		buff = var6
		var1 = var7
	end
	if self.maximum_length ~= nil and self.maximum_length ~= 0 then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.varint)
		var8, var159 = protoModule.writeVarInt(var8, var9, self.maximum_length)
		buff = var8
		var1 = var9
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_5.decode(p1)
	-- upvalues: t_5 (ref), protoModule (ref)
	local var1 = t_5.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 3 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				var2 = var9
				var1.minimum_length = var8
			elseif var7 == 4 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI32(p1, var2)
				var2 = var11
				var1.maximum_length = var10
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				local _ = var12
				var2 = var13
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.label = buffer.tostring(var14)
			elseif var7 == 2 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.placeholder_text = buffer.tostring(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var163)
		end
	end
	return var1
end

function t_5:jsonEncode()
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

function t_5:jsonDecode()
	-- upvalues: t_5 (ref)
	local var1 = t_5.new()
	
	if self.label ~= nil then
		var1.label = self.label
	end
	if self.placeholder_text ~= nil then
		var1.placeholder_text = self.placeholder_text
	end
	if self.placeholderText ~= nil then
		var1.placeholder_text = self.placeholderText
	end
	if self.minimum_length ~= nil then
		var1.minimum_length = self.minimum_length
	end
	if self.minimumLength ~= nil then
		var1.minimum_length = self.minimumLength
	end
	if self.maximum_length ~= nil then
		var1.maximum_length = self.maximum_length
	end
	if self.maximumLength ~= nil then
		var1.maximum_length = self.maximumLength
	end
	return var1
end

t_5.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Comment",
	fullName = "roblox.apppageplatform.shared.v1beta1.Comment"
}
t.UniverseUserVoteFeedbackMetadataData_Comment = t_5
typeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Comment)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p1)
	-- upvalues: t_6 (ref)
	return setmetatable({
		disclaimer_label = if p1 == nil or p1.disclaimer_label == nil then "" else p1.disclaimer_label,
		submit_button_label = if p1 == nil or p1.submit_button_label == nil then "" else p1.submit_button_label,
		form_title_label = if p1 == nil or p1.form_title_label == nil then "" else p1.form_title_label
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.disclaimer_label ~= nil and self.disclaimer_label ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var189 = protoModule.writeString(var2, var3, self.disclaimer_label)
		buff = var2
		var1 = var3
	end
	if self.submit_button_label ~= nil and self.submit_button_label ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var191 = protoModule.writeString(var4, var5, self.submit_button_label)
		buff = var4
		var1 = var5
	end
	if self.form_title_label ~= nil and self.form_title_label ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var193 = protoModule.writeString(var6, var7, self.form_title_label)
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_6.decode(p1)
	-- upvalues: t_6 (ref), protoModule (ref)
	local var1 = t_6.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.disclaimer_label = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.submit_button_label = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.form_title_label = buffer.tostring(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var197)
		end
	end
	return var1
end

function t_6:jsonEncode()
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

function t_6:jsonDecode()
	-- upvalues: t_6 (ref)
	local var1 = t_6.new()
	
	if self.disclaimer_label ~= nil then
		var1.disclaimer_label = self.disclaimer_label
	end
	if self.disclaimerLabel ~= nil then
		var1.disclaimer_label = self.disclaimerLabel
	end
	if self.submit_button_label ~= nil then
		var1.submit_button_label = self.submit_button_label
	end
	if self.submitButtonLabel ~= nil then
		var1.submit_button_label = self.submitButtonLabel
	end
	if self.form_title_label ~= nil then
		var1.form_title_label = self.form_title_label
	end
	if self.formTitleLabel ~= nil then
		var1.form_title_label = self.formTitleLabel
	end
	return var1
end

t_6.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Metadata",
	fullName = "roblox.apppageplatform.shared.v1beta1.Metadata"
}
t.UniverseUserVoteFeedbackMetadataData_Metadata = t_6
typeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Metadata)

return {
	UniverseUserVoteFeedbackMetadataData = t.UniverseUserVoteFeedbackMetadataData,
	UniverseUserVoteFeedbackMetadataData_Capabilities = t.UniverseUserVoteFeedbackMetadataData_Capabilities,
	UniverseUserVoteFeedbackMetadataData_Category = t.UniverseUserVoteFeedbackMetadataData_Category,
	UniverseUserVoteFeedbackMetadataData_Category_Option = t.UniverseUserVoteFeedbackMetadataData_Category_Option,
	UniverseUserVoteFeedbackMetadataData_Comment = t.UniverseUserVoteFeedbackMetadataData_Comment,
	UniverseUserVoteFeedbackMetadataData_Metadata = t.UniverseUserVoteFeedbackMetadataData_Metadata
}