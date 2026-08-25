local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local _ = require(script.Parent.custom_options)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	return setmetatable({
		capabilities = if p0 == nil or p0.capabilities == nil then nil else p0.capabilities,
		categories = if p0 == nil or p0.categories == nil then {} else p0.categories,
		comment = if p0 == nil or p0.comment == nil then nil else p0.comment,
		metadata = if p0 == nil or p0.metadata == nil then nil else p0.metadata
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var10 = 0
	
	if self.capabilities ~= nil then
		local var11 = self.capabilities:encode()
		local var12, var13 = protoModule.writeTag(buff, var10, 1, protoModule.wireTypes.lengthDelimited)
		var12, var13 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
		buff = var12
		var10 = var13
	end
	if self.categories ~= nil and #self.categories > 0 then
		for i, v in self.categories do
			local var14 = v:encode()
			local var15, var16 = protoModule.writeTag(buff, var10, 2, protoModule.wireTypes.lengthDelimited)
			var15, var16 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
			buff = var15
			var10 = var16
		end
	end
	if self.comment ~= nil then
		local var17 = self.comment:encode()
		local var18, var19 = protoModule.writeTag(buff, var10, 3, protoModule.wireTypes.lengthDelimited)
		var18, var19 = protoModule.writeBuffer(var18, var19, var17, buffer.len(var17))
		buff = var18
		var10 = var19
	end
	if self.metadata ~= nil then
		local var20 = self.metadata:encode()
		local var21, var22 = protoModule.writeTag(buff, var10, 4, protoModule.wireTypes.lengthDelimited)
		var21, var22 = protoModule.writeBuffer(var21, var22, var20, buffer.len(var20))
		buff = var21
		var10 = var22
	end
	local buff_1 = buffer.create(var10)
	buffer.copy(buff_1, 0, buff, 0, var10)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var24 = t_1.new()
	local var25 = 0
	while var25 < buffer.len(p1) do
		local _ = nil
		local var26 = nil
		local var27, var28, var29 = protoModule.readTag(p1, var25)
		local var30 = var27
		var26 = var28
		var25 = var29
		
		if var26 == protoModule.wireTypes.varint then
			local _ = nil
			local var31, var32 = protoModule.readVarInt(p1, var25)
			local _ = var31
			var25 = var32
			continue
		end
		if var26 == protoModule.wireTypes.lengthDelimited then
			if var30 == 1 then
				local _ = nil
				local var33, var34 = protoModule.readBuffer(p1, var25)
				var25 = var34
				var24.capabilities = t.UniverseUserVoteFeedbackMetadataData_Capabilities.decode(var33)
			elseif var30 == 2 then
				local _ = nil
				local var35, var36 = protoModule.readBuffer(p1, var25)
				var25 = var36
				table.insert(var24.categories, t.UniverseUserVoteFeedbackMetadataData_Category.decode(var35))
			elseif var30 == 3 then
				local _ = nil
				local var37, var38 = protoModule.readBuffer(p1, var25)
				var25 = var38
				var24.comment = t.UniverseUserVoteFeedbackMetadataData_Comment.decode(var37)
			elseif var30 == 4 then
				local _ = nil
				local var39, var40 = protoModule.readBuffer(p1, var25)
				var25 = var40
				var24.metadata = t.UniverseUserVoteFeedbackMetadataData_Metadata.decode(var39)
			else
				local _ = nil
				local var41, var42 = protoModule.readVarInt(p1, var25)
				var25 = var42 + var41
			end
		elseif var26 == protoModule.wireTypes.i32 then
			local _ = nil
			local var43, var44 = protoModule.readFixed32(p1, var25)
			local _ = var43
			var25 = var44
		elseif var26 == protoModule.wireTypes.i64 then
			local _ = nil
			local var45, var46 = protoModule.readFixed64(p1, var25)
			local _ = var45
			var25 = var46
		else
			error("Unsupported wire type: " .. var26)
		end
	end
	return var24
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
	local var49 = t_1.new()
	
	if self.capabilities ~= nil then
		var49.capabilities = t.UniverseUserVoteFeedbackMetadataData_Capabilities.jsonDecode(self.capabilities)
	end
	if self.categories ~= nil then
		local t_2 = {}
		
		for i, v in self.categories do
			table.insert(t_2, t.UniverseUserVoteFeedbackMetadataData_Category.jsonDecode(v))
		end
		var49.categories = t_2
	end
	if self.comment ~= nil then
		var49.comment = t.UniverseUserVoteFeedbackMetadataData_Comment.jsonDecode(self.comment)
	end
	if self.metadata ~= nil then
		var49.metadata = t.UniverseUserVoteFeedbackMetadataData_Metadata.jsonDecode(self.metadata)
	end
	return var49
end

t_1.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserVoteFeedbackMetadataData"
}
t.UniverseUserVoteFeedbackMetadataData = t_1
typeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		can_submit_review = if p2 == nil or p2.can_submit_review == nil then false else p2.can_submit_review,
		can_submit_comment = if p2 == nil or p2.can_submit_comment == nil then false else p2.can_submit_comment,
		can_submit_category_options = if p2 == nil or p2.can_submit_category_options == nil then nil else p2.can_submit_category_options
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var52 = 0
	
	if self.can_submit_review then
		local var53, var54 = protoModule.writeTag(buff, var52, 1, protoModule.wireTypes.varint)
		var53, var54 = protoModule.writeVarInt(var53, var54, if self.can_submit_review then 1 else 0)
		buff = var53
		var52 = var54
	end
	if self.can_submit_comment then
		local var55, var56 = protoModule.writeTag(buff, var52, 2, protoModule.wireTypes.varint)
		var55, var56 = protoModule.writeVarInt(var55, var56, if self.can_submit_comment then 1 else 0)
		buff = var55
		var52 = var56
	end
	if self.can_submit_category_options ~= nil then
		local var57, var58 = protoModule.writeTag(buff, var52, 3, protoModule.wireTypes.varint)
		var57, var58 = protoModule.writeVarInt(var57, var58, if self.can_submit_category_options then 1 else 0)
		buff = var57
		var52 = var58
	end
	local buff_1 = buffer.create(var52)
	buffer.copy(buff_1, 0, buff, 0, var52)
	
	return buff_1
end

function t_2.decode(p3)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var60 = t_2.new()
	local var61 = 0
	while var61 < buffer.len(p3) do
		local _ = nil
		local _ = nil
		local var62, var63, var64 = protoModule.readTag(p3, var61)
		local var65 = var62
		local var66 = var63
		var61 = var64
		
		if var66 == protoModule.wireTypes.varint then
			if var65 == 1 then
				local _ = nil
				local var67, var68 = protoModule.readVarInt(p3, var61)
				var61 = var68
				var60.can_submit_review = var67 ~= 0
			elseif var65 == 2 then
				local _ = nil
				local var69, var70 = protoModule.readVarInt(p3, var61)
				var61 = var70
				var60.can_submit_comment = var69 ~= 0
			elseif var65 == 3 then
				local _ = nil
				local var71, var72 = protoModule.readVarInt(p3, var61)
				var61 = var72
				var60.can_submit_category_options = var71 ~= 0
			else
				local _ = nil
				local var73, var74 = protoModule.readVarInt(p3, var61)
				local _ = var73
				var61 = var74
			end
		elseif var66 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var75, var76 = protoModule.readVarInt(p3, var61)
			var61 = var76 + var75
		elseif var66 == protoModule.wireTypes.i32 then
			local _ = nil
			local var77, var78 = protoModule.readFixed32(p3, var61)
			local _ = var77
			var61 = var78
		elseif var66 == protoModule.wireTypes.i64 then
			local _ = nil
			local var79, var80 = protoModule.readFixed64(p3, var61)
			local _ = var79
			var61 = var80
		else
			error("Unsupported wire type: " .. var66)
		end
	end
	return var60
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
	local var82 = t_2.new()
	
	if self.can_submit_review ~= nil then
		var82.can_submit_review = self.can_submit_review
	end
	if self.canSubmitReview ~= nil then
		var82.can_submit_review = self.canSubmitReview
	end
	if self.can_submit_comment ~= nil then
		var82.can_submit_comment = self.can_submit_comment
	end
	if self.canSubmitComment ~= nil then
		var82.can_submit_comment = self.canSubmitComment
	end
	if self.can_submit_category_options ~= nil then
		var82.can_submit_category_options = self.can_submit_category_options
	end
	if self.canSubmitCategoryOptions ~= nil then
		var82.can_submit_category_options = self.canSubmitCategoryOptions
	end
	return var82
end

t_2.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Capabilities",
	fullName = "roblox.apppageplatform.shared.v1beta1.Capabilities"
}
t.UniverseUserVoteFeedbackMetadataData_Capabilities = t_2
typeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Capabilities)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4)
	-- upvalues: t_3 (ref)
	return setmetatable({
		type = if p4 == nil or p4.type == nil then "" else p4.type,
		label = if p4 == nil or p4.label == nil then "" else p4.label,
		allows_multiple_selections = if p4 == nil or p4.allows_multiple_selections == nil then false else p4.allows_multiple_selections,
		options = if p4 == nil or p4.options == nil then {} else p4.options
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var84 = 0
	
	if self.type ~= nil and self.type ~= "" then
		local var85, var86 = protoModule.writeTag(buff, var84, 1, protoModule.wireTypes.lengthDelimited)
		var85, var86 = protoModule.writeString(var85, var86, self.type)
		buff = var85
		var84 = var86
	end
	if self.label ~= nil and self.label ~= "" then
		local var87, var88 = protoModule.writeTag(buff, var84, 2, protoModule.wireTypes.lengthDelimited)
		var87, var88 = protoModule.writeString(var87, var88, self.label)
		buff = var87
		var84 = var88
	end
	if self.allows_multiple_selections then
		local var89, var90 = protoModule.writeTag(buff, var84, 3, protoModule.wireTypes.varint)
		var89, var90 = protoModule.writeVarInt(var89, var90, if self.allows_multiple_selections then 1 else 0)
		buff = var89
		var84 = var90
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var91 = v:encode()
			local var92, var93 = protoModule.writeTag(buff, var84, 4, protoModule.wireTypes.lengthDelimited)
			var92, var93 = protoModule.writeBuffer(var92, var93, var91, buffer.len(var91))
			buff = var92
			var84 = var93
		end
	end
	local buff_1 = buffer.create(var84)
	buffer.copy(buff_1, 0, buff, 0, var84)
	
	return buff_1
end

function t_3.decode(p5)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var95 = t_3.new()
	local var96 = 0
	while var96 < buffer.len(p5) do
		local _ = nil
		local var97 = nil
		local var98, var99, var100 = protoModule.readTag(p5, var96)
		local var101 = var98
		var97 = var99
		var96 = var100
		
		if var97 == protoModule.wireTypes.varint then
			if var101 == 3 then
				local _ = nil
				local var102, var103 = protoModule.readVarInt(p5, var96)
				var96 = var103
				var95.allows_multiple_selections = var102 ~= 0
			else
				local _ = nil
				local var104, var105 = protoModule.readVarInt(p5, var96)
				local _ = var104
				var96 = var105
			end
		end
		if var97 == protoModule.wireTypes.lengthDelimited then
			if var101 == 1 then
				local _ = nil
				local var106, var107 = protoModule.readBuffer(p5, var96)
				var96 = var107
				var95.type = buffer.tostring(var106)
			elseif var101 == 2 then
				local _ = nil
				local var108, var109 = protoModule.readBuffer(p5, var96)
				var96 = var109
				var95.label = buffer.tostring(var108)
			elseif var101 == 4 then
				local _ = nil
				local var110, var111 = protoModule.readBuffer(p5, var96)
				var96 = var111
				table.insert(var95.options, t.UniverseUserVoteFeedbackMetadataData_Category_Option.decode(var110))
			else
				local _ = nil
				local var112, var113 = protoModule.readVarInt(p5, var96)
				var96 = var113 + var112
			end
		elseif var97 == protoModule.wireTypes.i32 then
			local _ = nil
			local var114, var115 = protoModule.readFixed32(p5, var96)
			local _ = var114
			var96 = var115
		elseif var97 == protoModule.wireTypes.i64 then
			local _ = nil
			local var116, var117 = protoModule.readFixed64(p5, var96)
			local _ = var116
			var96 = var117
		else
			error("Unsupported wire type: " .. var97)
		end
	end
	return var95
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
	local var120 = t_3.new()
	
	if self.type ~= nil then
		var120.type = self.type
	end
	if self.label ~= nil then
		var120.label = self.label
	end
	if self.allows_multiple_selections ~= nil then
		var120.allows_multiple_selections = self.allows_multiple_selections
	end
	if self.allowsMultipleSelections ~= nil then
		var120.allows_multiple_selections = self.allowsMultipleSelections
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UniverseUserVoteFeedbackMetadataData_Category_Option.jsonDecode(v))
		end
		var120.options = t_1
	end
	return var120
end

t_3.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Category",
	fullName = "roblox.apppageplatform.shared.v1beta1.Category"
}
t.UniverseUserVoteFeedbackMetadataData_Category = t_3
typeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Category)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6)
	-- upvalues: t_4 (ref)
	return setmetatable({
		id = if p6 == nil or p6.id == nil then "" else p6.id,
		label = if p6 == nil or p6.label == nil then "" else p6.label
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var123 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var124, var125 = protoModule.writeTag(buff, var123, 1, protoModule.wireTypes.lengthDelimited)
		var124, var125 = protoModule.writeString(var124, var125, self.id)
		buff = var124
		var123 = var125
	end
	if self.label ~= nil and self.label ~= "" then
		local var126, var127 = protoModule.writeTag(buff, var123, 2, protoModule.wireTypes.lengthDelimited)
		var126, var127 = protoModule.writeString(var126, var127, self.label)
		buff = var126
		var123 = var127
	end
	local buff_1 = buffer.create(var123)
	buffer.copy(buff_1, 0, buff, 0, var123)
	
	return buff_1
end

function t_4.decode(p7)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var129 = t_4.new()
	local var130 = 0
	while var130 < buffer.len(p7) do
		local _ = nil
		local var131 = nil
		local var132, var133, var134 = protoModule.readTag(p7, var130)
		local var135 = var132
		var131 = var133
		var130 = var134
		
		if var131 == protoModule.wireTypes.varint then
			local _ = nil
			local var136, var137 = protoModule.readVarInt(p7, var130)
			local _ = var136
			var130 = var137
			continue
		end
		if var131 == protoModule.wireTypes.lengthDelimited then
			if var135 == 1 then
				local _ = nil
				local var138, var139 = protoModule.readBuffer(p7, var130)
				var130 = var139
				var129.id = buffer.tostring(var138)
			elseif var135 == 2 then
				local _ = nil
				local var140, var141 = protoModule.readBuffer(p7, var130)
				var130 = var141
				var129.label = buffer.tostring(var140)
			else
				local _ = nil
				local var142, var143 = protoModule.readVarInt(p7, var130)
				var130 = var143 + var142
			end
		elseif var131 == protoModule.wireTypes.i32 then
			local _ = nil
			local var144, var145 = protoModule.readFixed32(p7, var130)
			local _ = var144
			var130 = var145
		elseif var131 == protoModule.wireTypes.i64 then
			local _ = nil
			local var146, var147 = protoModule.readFixed64(p7, var130)
			local _ = var146
			var130 = var147
		else
			error("Unsupported wire type: " .. var131)
		end
	end
	return var129
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
	local var149 = t_4.new()
	
	if self.id ~= nil then
		var149.id = self.id
	end
	if self.label ~= nil then
		var149.label = self.label
	end
	return var149
end

t_4.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Category_Option",
	fullName = "roblox.apppageplatform.shared.v1beta1.Option"
}
t.UniverseUserVoteFeedbackMetadataData_Category_Option = t_4
typeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Category_Option)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8)
	-- upvalues: t_5 (ref)
	return setmetatable({
		label = if p8 == nil or p8.label == nil then "" else p8.label,
		placeholder_text = if p8 == nil or p8.placeholder_text == nil then "" else p8.placeholder_text,
		minimum_length = if p8 == nil or p8.minimum_length == nil then 0 else p8.minimum_length,
		maximum_length = if p8 == nil or p8.maximum_length == nil then 0 else p8.maximum_length
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var151 = 0
	
	if self.label ~= nil and self.label ~= "" then
		local var152, var153 = protoModule.writeTag(buff, var151, 1, protoModule.wireTypes.lengthDelimited)
		var152, var153 = protoModule.writeString(var152, var153, self.label)
		buff = var152
		var151 = var153
	end
	if self.placeholder_text ~= nil and self.placeholder_text ~= "" then
		local var154, var155 = protoModule.writeTag(buff, var151, 2, protoModule.wireTypes.lengthDelimited)
		var154, var155 = protoModule.writeString(var154, var155, self.placeholder_text)
		buff = var154
		var151 = var155
	end
	if self.minimum_length ~= nil and self.minimum_length ~= 0 then
		local var156, var157 = protoModule.writeTag(buff, var151, 3, protoModule.wireTypes.varint)
		var156, var157 = protoModule.writeVarInt(var156, var157, self.minimum_length)
		buff = var156
		var151 = var157
	end
	if self.maximum_length ~= nil and self.maximum_length ~= 0 then
		local var158, var159 = protoModule.writeTag(buff, var151, 4, protoModule.wireTypes.varint)
		var158, var159 = protoModule.writeVarInt(var158, var159, self.maximum_length)
		buff = var158
		var151 = var159
	end
	local buff_1 = buffer.create(var151)
	buffer.copy(buff_1, 0, buff, 0, var151)
	
	return buff_1
end

function t_5.decode(p9)
	-- upvalues: t_5 (ref), protoModule (ref)
	local var161 = t_5.new()
	local var162 = 0
	while var162 < buffer.len(p9) do
		local _ = nil
		local var163 = nil
		local var164, var165, var166 = protoModule.readTag(p9, var162)
		local var167 = var164
		var163 = var165
		var162 = var166
		
		if var163 == protoModule.wireTypes.varint then
			if var167 == 3 then
				local _ = nil
				local var168, var169 = protoModule.readVarIntI32(p9, var162)
				var162 = var169
				var161.minimum_length = var168
			elseif var167 == 4 then
				local _ = nil
				local var170, var171 = protoModule.readVarIntI32(p9, var162)
				var162 = var171
				var161.maximum_length = var170
			else
				local _ = nil
				local var172, var173 = protoModule.readVarInt(p9, var162)
				local _ = var172
				var162 = var173
			end
		end
		if var163 == protoModule.wireTypes.lengthDelimited then
			if var167 == 1 then
				local _ = nil
				local var174, var175 = protoModule.readBuffer(p9, var162)
				var162 = var175
				var161.label = buffer.tostring(var174)
			elseif var167 == 2 then
				local _ = nil
				local var176, var177 = protoModule.readBuffer(p9, var162)
				var162 = var177
				var161.placeholder_text = buffer.tostring(var176)
			else
				local _ = nil
				local var178, var179 = protoModule.readVarInt(p9, var162)
				var162 = var179 + var178
			end
		elseif var163 == protoModule.wireTypes.i32 then
			local _ = nil
			local var180, var181 = protoModule.readFixed32(p9, var162)
			local _ = var180
			var162 = var181
		elseif var163 == protoModule.wireTypes.i64 then
			local _ = nil
			local var182, var183 = protoModule.readFixed64(p9, var162)
			local _ = var182
			var162 = var183
		else
			error("Unsupported wire type: " .. var163)
		end
	end
	return var161
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
	local var185 = t_5.new()
	
	if self.label ~= nil then
		var185.label = self.label
	end
	if self.placeholder_text ~= nil then
		var185.placeholder_text = self.placeholder_text
	end
	if self.placeholderText ~= nil then
		var185.placeholder_text = self.placeholderText
	end
	if self.minimum_length ~= nil then
		var185.minimum_length = self.minimum_length
	end
	if self.minimumLength ~= nil then
		var185.minimum_length = self.minimumLength
	end
	if self.maximum_length ~= nil then
		var185.maximum_length = self.maximum_length
	end
	if self.maximumLength ~= nil then
		var185.maximum_length = self.maximumLength
	end
	return var185
end

t_5.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Comment",
	fullName = "roblox.apppageplatform.shared.v1beta1.Comment"
}
t.UniverseUserVoteFeedbackMetadataData_Comment = t_5
typeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Comment)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10)
	-- upvalues: t_6 (ref)
	return setmetatable({
		disclaimer_label = if p10 == nil or p10.disclaimer_label == nil then "" else p10.disclaimer_label,
		submit_button_label = if p10 == nil or p10.submit_button_label == nil then "" else p10.submit_button_label,
		form_title_label = if p10 == nil or p10.form_title_label == nil then "" else p10.form_title_label
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var187 = 0
	
	if self.disclaimer_label ~= nil and self.disclaimer_label ~= "" then
		local var188, var189 = protoModule.writeTag(buff, var187, 1, protoModule.wireTypes.lengthDelimited)
		var188, var189 = protoModule.writeString(var188, var189, self.disclaimer_label)
		buff = var188
		var187 = var189
	end
	if self.submit_button_label ~= nil and self.submit_button_label ~= "" then
		local var190, var191 = protoModule.writeTag(buff, var187, 2, protoModule.wireTypes.lengthDelimited)
		var190, var191 = protoModule.writeString(var190, var191, self.submit_button_label)
		buff = var190
		var187 = var191
	end
	if self.form_title_label ~= nil and self.form_title_label ~= "" then
		local var192, var193 = protoModule.writeTag(buff, var187, 3, protoModule.wireTypes.lengthDelimited)
		var192, var193 = protoModule.writeString(var192, var193, self.form_title_label)
		buff = var192
		var187 = var193
	end
	local buff_1 = buffer.create(var187)
	buffer.copy(buff_1, 0, buff, 0, var187)
	
	return buff_1
end

function t_6.decode(p11)
	-- upvalues: t_6 (ref), protoModule (ref)
	local var195 = t_6.new()
	local var196 = 0
	while var196 < buffer.len(p11) do
		local _ = nil
		local var197 = nil
		local var198, var199, var200 = protoModule.readTag(p11, var196)
		local var201 = var198
		var197 = var199
		var196 = var200
		
		if var197 == protoModule.wireTypes.varint then
			local _ = nil
			local var202, var203 = protoModule.readVarInt(p11, var196)
			local _ = var202
			var196 = var203
			continue
		end
		if var197 == protoModule.wireTypes.lengthDelimited then
			if var201 == 1 then
				local _ = nil
				local var204, var205 = protoModule.readBuffer(p11, var196)
				var196 = var205
				var195.disclaimer_label = buffer.tostring(var204)
			elseif var201 == 2 then
				local _ = nil
				local var206, var207 = protoModule.readBuffer(p11, var196)
				var196 = var207
				var195.submit_button_label = buffer.tostring(var206)
			elseif var201 == 3 then
				local _ = nil
				local var208, var209 = protoModule.readBuffer(p11, var196)
				var196 = var209
				var195.form_title_label = buffer.tostring(var208)
			else
				local _ = nil
				local var210, var211 = protoModule.readVarInt(p11, var196)
				var196 = var211 + var210
			end
		elseif var197 == protoModule.wireTypes.i32 then
			local _ = nil
			local var212, var213 = protoModule.readFixed32(p11, var196)
			local _ = var212
			var196 = var213
		elseif var197 == protoModule.wireTypes.i64 then
			local _ = nil
			local var214, var215 = protoModule.readFixed64(p11, var196)
			local _ = var214
			var196 = var215
		else
			error("Unsupported wire type: " .. var197)
		end
	end
	return var195
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
	local var217 = t_6.new()
	
	if self.disclaimer_label ~= nil then
		var217.disclaimer_label = self.disclaimer_label
	end
	if self.disclaimerLabel ~= nil then
		var217.disclaimer_label = self.disclaimerLabel
	end
	if self.submit_button_label ~= nil then
		var217.submit_button_label = self.submit_button_label
	end
	if self.submitButtonLabel ~= nil then
		var217.submit_button_label = self.submitButtonLabel
	end
	if self.form_title_label ~= nil then
		var217.form_title_label = self.form_title_label
	end
	if self.formTitleLabel ~= nil then
		var217.form_title_label = self.formTitleLabel
	end
	return var217
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