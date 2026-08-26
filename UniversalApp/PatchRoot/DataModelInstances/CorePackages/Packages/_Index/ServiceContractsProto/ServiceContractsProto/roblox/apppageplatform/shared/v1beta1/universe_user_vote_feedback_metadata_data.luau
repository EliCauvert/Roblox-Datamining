local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local _ = require(script.Parent.custom_options)
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
				var14.capabilities = t.UniverseUserVoteFeedbackMetadataData_Capabilities.decode(var23)
			elseif var20 == 2 then
				local _ = nil
				local var25, var26 = protoModule.readBuffer(p1, var15)
				var15 = var26
				table.insert(var14.categories, t.UniverseUserVoteFeedbackMetadataData_Category.decode(var25))
			elseif var20 == 3 then
				local _ = nil
				local var27, var28 = protoModule.readBuffer(p1, var15)
				var15 = var28
				var14.comment = t.UniverseUserVoteFeedbackMetadataData_Comment.decode(var27)
			elseif var20 == 4 then
				local _ = nil
				local var29, var30 = protoModule.readBuffer(p1, var15)
				var15 = var30
				var14.metadata = t.UniverseUserVoteFeedbackMetadataData_Metadata.decode(var29)
			else
				local _ = nil
				local var31, var32 = protoModule.readVarInt(p1, var15)
				var15 = var32 + var31
			end
		elseif var16 == protoModule.wireTypes.i32 then
			local _ = nil
			local var33, var34 = protoModule.readFixed32(p1, var15)
			local _ = var33
			var15 = var34
		elseif var16 == protoModule.wireTypes.i64 then
			local _ = nil
			local var35, var36 = protoModule.readFixed64(p1, var15)
			local _ = var35
			var15 = var36
		else
			error("Unsupported wire type: " .. var26)
		end
	end
	return var14
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
	local var37 = t_1.new()
	
	if self.capabilities ~= nil then
		var37.capabilities = t.UniverseUserVoteFeedbackMetadataData_Capabilities.jsonDecode(self.capabilities)
	end
	if self.categories ~= nil then
		local t_2 = {}
		
		for i, v in self.categories do
			table.insert(t_2, t.UniverseUserVoteFeedbackMetadataData_Category.jsonDecode(v))
		end
		var37.categories = t_2
	end
	if self.comment ~= nil then
		var37.comment = t.UniverseUserVoteFeedbackMetadataData_Comment.jsonDecode(self.comment)
	end
	if self.metadata ~= nil then
		var37.metadata = t.UniverseUserVoteFeedbackMetadataData_Metadata.jsonDecode(self.metadata)
	end
	return var37
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
	local var38 = 0
	
	if self.can_submit_review then
		local var39, var40 = protoModule.writeTag(buff, var38, 1, protoModule.wireTypes.varint)
		var39, var54 = protoModule.writeVarInt(var39, var40, if self.can_submit_review then 1 else 0)
		buff = var39
		var38 = var40
	end
	if self.can_submit_comment then
		local var41, var42 = protoModule.writeTag(buff, var38, 2, protoModule.wireTypes.varint)
		var41, var56 = protoModule.writeVarInt(var41, var42, if self.can_submit_comment then 1 else 0)
		buff = var41
		var38 = var42
	end
	if self.can_submit_category_options ~= nil then
		local var43, var44 = protoModule.writeTag(buff, var38, 3, protoModule.wireTypes.varint)
		var43, var58 = protoModule.writeVarInt(var43, var44, if self.can_submit_category_options then 1 else 0)
		buff = var43
		var38 = var44
	end
	local buff_1 = buffer.create(var38)
	buffer.copy(buff_1, 0, buff, 0, var38)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var38 = t_2.new()
	local var39 = 0
	while var39 < buffer.len(p2) do
		local _ = nil
		local _ = nil
		local var40, var41, var42 = protoModule.readTag(p2, var39)
		local var43 = var40
		local var44 = var41
		var39 = var42
		
		if var44 == protoModule.wireTypes.varint then
			if var43 == 1 then
				local _ = nil
				local var45, var46 = protoModule.readVarInt(p2, var39)
				var39 = var46
				var38.can_submit_review = var45 ~= 0
			elseif var43 == 2 then
				local _ = nil
				local var47, var48 = protoModule.readVarInt(p2, var39)
				var39 = var48
				var38.can_submit_comment = var47 ~= 0
			elseif var43 == 3 then
				local _ = nil
				local var49, var50 = protoModule.readVarInt(p2, var39)
				var39 = var50
				var38.can_submit_category_options = var49 ~= 0
			else
				local _ = nil
				local var51, var52 = protoModule.readVarInt(p2, var39)
				local _ = var51
				var39 = var52
			end
		elseif var44 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var53, var54 = protoModule.readVarInt(p2, var39)
			var39 = var54 + var53
		elseif var44 == protoModule.wireTypes.i32 then
			local _ = nil
			local var55, var56 = protoModule.readFixed32(p2, var39)
			local _ = var55
			var39 = var56
		elseif var44 == protoModule.wireTypes.i64 then
			local _ = nil
			local var57, var58 = protoModule.readFixed64(p2, var39)
			local _ = var57
			var39 = var58
		else
			error("Unsupported wire type: " .. var66)
		end
	end
	return var38
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
	local var59 = t_2.new()
	
	if self.can_submit_review ~= nil then
		var59.can_submit_review = self.can_submit_review
	end
	if self.canSubmitReview ~= nil then
		var59.can_submit_review = self.canSubmitReview
	end
	if self.can_submit_comment ~= nil then
		var59.can_submit_comment = self.can_submit_comment
	end
	if self.canSubmitComment ~= nil then
		var59.can_submit_comment = self.canSubmitComment
	end
	if self.can_submit_category_options ~= nil then
		var59.can_submit_category_options = self.can_submit_category_options
	end
	if self.canSubmitCategoryOptions ~= nil then
		var59.can_submit_category_options = self.canSubmitCategoryOptions
	end
	return var59
end

t_2.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Capabilities",
	fullName = "roblox.apppageplatform.shared.v1beta1.Capabilities"
}
t.UniverseUserVoteFeedbackMetadataData_Capabilities = t_2
typeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Capabilities)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		type = if p3 == nil or p3.type == nil then "" else p3.type,
		label = if p3 == nil or p3.label == nil then "" else p3.label,
		allows_multiple_selections = if p3 == nil or p3.allows_multiple_selections == nil then false else p3.allows_multiple_selections,
		options = if p3 == nil or p3.options == nil then {} else p3.options
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var59 = 0
	
	if self.type ~= nil and self.type ~= "" then
		local var60, var61 = protoModule.writeTag(buff, var59, 1, protoModule.wireTypes.lengthDelimited)
		var60, var86 = protoModule.writeString(var60, var61, self.type)
		buff = var60
		var59 = var61
	end
	if self.label ~= nil and self.label ~= "" then
		local var62, var63 = protoModule.writeTag(buff, var59, 2, protoModule.wireTypes.lengthDelimited)
		var62, var88 = protoModule.writeString(var62, var63, self.label)
		buff = var62
		var59 = var63
	end
	if self.allows_multiple_selections then
		local var64, var65 = protoModule.writeTag(buff, var59, 3, protoModule.wireTypes.varint)
		var64, var90 = protoModule.writeVarInt(var64, var65, if self.allows_multiple_selections then 1 else 0)
		buff = var64
		var59 = var65
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var66 = v:encode()
			local var67, var68 = protoModule.writeTag(buff, var59, 4, protoModule.wireTypes.lengthDelimited)
			var67, var93 = protoModule.writeBuffer(var67, var68, var66, buffer.len(var66))
			buff = var67
			var59 = var68
		end
	end
	local buff_1 = buffer.create(var59)
	buffer.copy(buff_1, 0, buff, 0, var59)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var69 = t_3.new()
	local var70 = 0
	while var70 < buffer.len(p3) do
		local _ = nil
		local var71 = nil
		local var72, var73, var74 = protoModule.readTag(p3, var70)
		local var75 = var72
		var71 = var73
		var70 = var74
		
		if var71 == protoModule.wireTypes.varint then
			if var75 == 3 then
				local _ = nil
				local var76, var77 = protoModule.readVarInt(p3, var70)
				var70 = var77
				var69.allows_multiple_selections = var76 ~= 0
			else
				local _ = nil
				local var78, var79 = protoModule.readVarInt(p3, var70)
				local _ = var78
				var70 = var79
			end
		end
		if var71 == protoModule.wireTypes.lengthDelimited then
			if var75 == 1 then
				local _ = nil
				local var80, var81 = protoModule.readBuffer(p3, var70)
				var70 = var81
				var69.type = buffer.tostring(var80)
			elseif var75 == 2 then
				local _ = nil
				local var82, var83 = protoModule.readBuffer(p3, var70)
				var70 = var83
				var69.label = buffer.tostring(var82)
			elseif var75 == 4 then
				local _ = nil
				local var84, var85 = protoModule.readBuffer(p3, var70)
				var70 = var85
				table.insert(var69.options, t.UniverseUserVoteFeedbackMetadataData_Category_Option.decode(var84))
			else
				local _ = nil
				local var86, var87 = protoModule.readVarInt(p3, var70)
				var70 = var87 + var86
			end
		elseif var71 == protoModule.wireTypes.i32 then
			local _ = nil
			local var88, var89 = protoModule.readFixed32(p3, var70)
			local _ = var88
			var70 = var89
		elseif var71 == protoModule.wireTypes.i64 then
			local _ = nil
			local var90, var91 = protoModule.readFixed64(p3, var70)
			local _ = var90
			var70 = var91
		else
			error("Unsupported wire type: " .. var97)
		end
	end
	return var69
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
	local var92 = t_3.new()
	
	if self.type ~= nil then
		var92.type = self.type
	end
	if self.label ~= nil then
		var92.label = self.label
	end
	if self.allows_multiple_selections ~= nil then
		var92.allows_multiple_selections = self.allows_multiple_selections
	end
	if self.allowsMultipleSelections ~= nil then
		var92.allows_multiple_selections = self.allowsMultipleSelections
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UniverseUserVoteFeedbackMetadataData_Category_Option.jsonDecode(v))
		end
		var92.options = t_1
	end
	return var92
end

t_3.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Category",
	fullName = "roblox.apppageplatform.shared.v1beta1.Category"
}
t.UniverseUserVoteFeedbackMetadataData_Category = t_3
typeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Category)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		id = if p4 == nil or p4.id == nil then "" else p4.id,
		label = if p4 == nil or p4.label == nil then "" else p4.label
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var93 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var94, var95 = protoModule.writeTag(buff, var93, 1, protoModule.wireTypes.lengthDelimited)
		var94, var125 = protoModule.writeString(var94, var95, self.id)
		buff = var94
		var93 = var95
	end
	if self.label ~= nil and self.label ~= "" then
		local var96, var97 = protoModule.writeTag(buff, var93, 2, protoModule.wireTypes.lengthDelimited)
		var96, var127 = protoModule.writeString(var96, var97, self.label)
		buff = var96
		var93 = var97
	end
	local buff_1 = buffer.create(var93)
	buffer.copy(buff_1, 0, buff, 0, var93)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var93 = t_4.new()
	local var94 = 0
	while var94 < buffer.len(p4) do
		local _ = nil
		local var95 = nil
		local var96, var97, var98 = protoModule.readTag(p4, var94)
		local var99 = var96
		var95 = var97
		var94 = var98
		
		if var95 == protoModule.wireTypes.varint then
			local _ = nil
			local var100, var101 = protoModule.readVarInt(p4, var94)
			local _ = var100
			var94 = var101
			continue
		end
		if var95 == protoModule.wireTypes.lengthDelimited then
			if var99 == 1 then
				local _ = nil
				local var102, var103 = protoModule.readBuffer(p4, var94)
				var94 = var103
				var93.id = buffer.tostring(var102)
			elseif var99 == 2 then
				local _ = nil
				local var104, var105 = protoModule.readBuffer(p4, var94)
				var94 = var105
				var93.label = buffer.tostring(var104)
			else
				local _ = nil
				local var106, var107 = protoModule.readVarInt(p4, var94)
				var94 = var107 + var106
			end
		elseif var95 == protoModule.wireTypes.i32 then
			local _ = nil
			local var108, var109 = protoModule.readFixed32(p4, var94)
			local _ = var108
			var94 = var109
		elseif var95 == protoModule.wireTypes.i64 then
			local _ = nil
			local var110, var111 = protoModule.readFixed64(p4, var94)
			local _ = var110
			var94 = var111
		else
			error("Unsupported wire type: " .. var131)
		end
	end
	return var93
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
	local var112 = t_4.new()
	
	if self.id ~= nil then
		var112.id = self.id
	end
	if self.label ~= nil then
		var112.label = self.label
	end
	return var112
end

t_4.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Category_Option",
	fullName = "roblox.apppageplatform.shared.v1beta1.Option"
}
t.UniverseUserVoteFeedbackMetadataData_Category_Option = t_4
typeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Category_Option)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		label = if p5 == nil or p5.label == nil then "" else p5.label,
		placeholder_text = if p5 == nil or p5.placeholder_text == nil then "" else p5.placeholder_text,
		minimum_length = if p5 == nil or p5.minimum_length == nil then 0 else p5.minimum_length,
		maximum_length = if p5 == nil or p5.maximum_length == nil then 0 else p5.maximum_length
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var112 = 0
	
	if self.label ~= nil and self.label ~= "" then
		local var113, var114 = protoModule.writeTag(buff, var112, 1, protoModule.wireTypes.lengthDelimited)
		var113, var153 = protoModule.writeString(var113, var114, self.label)
		buff = var113
		var112 = var114
	end
	if self.placeholder_text ~= nil and self.placeholder_text ~= "" then
		local var115, var116 = protoModule.writeTag(buff, var112, 2, protoModule.wireTypes.lengthDelimited)
		var115, var155 = protoModule.writeString(var115, var116, self.placeholder_text)
		buff = var115
		var112 = var116
	end
	if self.minimum_length ~= nil and self.minimum_length ~= 0 then
		local var117, var118 = protoModule.writeTag(buff, var112, 3, protoModule.wireTypes.varint)
		var117, var157 = protoModule.writeVarInt(var117, var118, self.minimum_length)
		buff = var117
		var112 = var118
	end
	if self.maximum_length ~= nil and self.maximum_length ~= 0 then
		local var119, var120 = protoModule.writeTag(buff, var112, 4, protoModule.wireTypes.varint)
		var119, var159 = protoModule.writeVarInt(var119, var120, self.maximum_length)
		buff = var119
		var112 = var120
	end
	local buff_1 = buffer.create(var112)
	buffer.copy(buff_1, 0, buff, 0, var112)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref)
	local var112 = t_5.new()
	local var113 = 0
	while var113 < buffer.len(p5) do
		local _ = nil
		local var114 = nil
		local var115, var116, var117 = protoModule.readTag(p5, var113)
		local var118 = var115
		var114 = var116
		var113 = var117
		
		if var114 == protoModule.wireTypes.varint then
			if var118 == 3 then
				local _ = nil
				local var119, var120 = protoModule.readVarIntI32(p5, var113)
				var113 = var120
				var112.minimum_length = var119
			elseif var118 == 4 then
				local _ = nil
				local var121, var122 = protoModule.readVarIntI32(p5, var113)
				var113 = var122
				var112.maximum_length = var121
			else
				local _ = nil
				local var123, var124 = protoModule.readVarInt(p5, var113)
				local _ = var123
				var113 = var124
			end
		end
		if var114 == protoModule.wireTypes.lengthDelimited then
			if var118 == 1 then
				local _ = nil
				local var125, var126 = protoModule.readBuffer(p5, var113)
				var113 = var126
				var112.label = buffer.tostring(var125)
			elseif var118 == 2 then
				local _ = nil
				local var127, var128 = protoModule.readBuffer(p5, var113)
				var113 = var128
				var112.placeholder_text = buffer.tostring(var127)
			else
				local _ = nil
				local var129, var130 = protoModule.readVarInt(p5, var113)
				var113 = var130 + var129
			end
		elseif var114 == protoModule.wireTypes.i32 then
			local _ = nil
			local var131, var132 = protoModule.readFixed32(p5, var113)
			local _ = var131
			var113 = var132
		elseif var114 == protoModule.wireTypes.i64 then
			local _ = nil
			local var133, var134 = protoModule.readFixed64(p5, var113)
			local _ = var133
			var113 = var134
		else
			error("Unsupported wire type: " .. var163)
		end
	end
	return var112
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
	local var135 = t_5.new()
	
	if self.label ~= nil then
		var135.label = self.label
	end
	if self.placeholder_text ~= nil then
		var135.placeholder_text = self.placeholder_text
	end
	if self.placeholderText ~= nil then
		var135.placeholder_text = self.placeholderText
	end
	if self.minimum_length ~= nil then
		var135.minimum_length = self.minimum_length
	end
	if self.minimumLength ~= nil then
		var135.minimum_length = self.minimumLength
	end
	if self.maximum_length ~= nil then
		var135.maximum_length = self.maximum_length
	end
	if self.maximumLength ~= nil then
		var135.maximum_length = self.maximumLength
	end
	return var135
end

t_5.descriptor = {
	name = "UniverseUserVoteFeedbackMetadataData_Comment",
	fullName = "roblox.apppageplatform.shared.v1beta1.Comment"
}
t.UniverseUserVoteFeedbackMetadataData_Comment = t_5
typeRegistryModule.default:register(t.UniverseUserVoteFeedbackMetadataData_Comment)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		disclaimer_label = if p6 == nil or p6.disclaimer_label == nil then "" else p6.disclaimer_label,
		submit_button_label = if p6 == nil or p6.submit_button_label == nil then "" else p6.submit_button_label,
		form_title_label = if p6 == nil or p6.form_title_label == nil then "" else p6.form_title_label
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var135 = 0
	
	if self.disclaimer_label ~= nil and self.disclaimer_label ~= "" then
		local var136, var137 = protoModule.writeTag(buff, var135, 1, protoModule.wireTypes.lengthDelimited)
		var136, var189 = protoModule.writeString(var136, var137, self.disclaimer_label)
		buff = var136
		var135 = var137
	end
	if self.submit_button_label ~= nil and self.submit_button_label ~= "" then
		local var138, var139 = protoModule.writeTag(buff, var135, 2, protoModule.wireTypes.lengthDelimited)
		var138, var191 = protoModule.writeString(var138, var139, self.submit_button_label)
		buff = var138
		var135 = var139
	end
	if self.form_title_label ~= nil and self.form_title_label ~= "" then
		local var140, var141 = protoModule.writeTag(buff, var135, 3, protoModule.wireTypes.lengthDelimited)
		var140, var193 = protoModule.writeString(var140, var141, self.form_title_label)
		buff = var140
		var135 = var141
	end
	local buff_1 = buffer.create(var135)
	buffer.copy(buff_1, 0, buff, 0, var135)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref)
	local var135 = t_6.new()
	local var136 = 0
	while var136 < buffer.len(p6) do
		local _ = nil
		local var137 = nil
		local var138, var139, var140 = protoModule.readTag(p6, var136)
		local var141 = var138
		var137 = var139
		var136 = var140
		
		if var137 == protoModule.wireTypes.varint then
			local _ = nil
			local var142, var143 = protoModule.readVarInt(p6, var136)
			local _ = var142
			var136 = var143
			continue
		end
		if var137 == protoModule.wireTypes.lengthDelimited then
			if var141 == 1 then
				local _ = nil
				local var144, var145 = protoModule.readBuffer(p6, var136)
				var136 = var145
				var135.disclaimer_label = buffer.tostring(var144)
			elseif var141 == 2 then
				local _ = nil
				local var146, var147 = protoModule.readBuffer(p6, var136)
				var136 = var147
				var135.submit_button_label = buffer.tostring(var146)
			elseif var141 == 3 then
				local _ = nil
				local var148, var149 = protoModule.readBuffer(p6, var136)
				var136 = var149
				var135.form_title_label = buffer.tostring(var148)
			else
				local _ = nil
				local var150, var151 = protoModule.readVarInt(p6, var136)
				var136 = var151 + var150
			end
		elseif var137 == protoModule.wireTypes.i32 then
			local _ = nil
			local var152, var153 = protoModule.readFixed32(p6, var136)
			local _ = var152
			var136 = var153
		elseif var137 == protoModule.wireTypes.i64 then
			local _ = nil
			local var154, var155 = protoModule.readFixed64(p6, var136)
			local _ = var154
			var136 = var155
		else
			error("Unsupported wire type: " .. var197)
		end
	end
	return var135
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
	local var156 = t_6.new()
	
	if self.disclaimer_label ~= nil then
		var156.disclaimer_label = self.disclaimer_label
	end
	if self.disclaimerLabel ~= nil then
		var156.disclaimer_label = self.disclaimerLabel
	end
	if self.submit_button_label ~= nil then
		var156.submit_button_label = self.submit_button_label
	end
	if self.submitButtonLabel ~= nil then
		var156.submit_button_label = self.submitButtonLabel
	end
	if self.form_title_label ~= nil then
		var156.form_title_label = self.form_title_label
	end
	if self.formTitleLabel ~= nil then
		var156.form_title_label = self.formTitleLabel
	end
	return var156
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