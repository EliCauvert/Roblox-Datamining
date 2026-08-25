local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local _ = require(script.Parent.custom_options)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	return setmetatable({
		name = if p0 == nil or p0.name == nil then "" else p0.name,
		display_name = if p0 == nil or p0.display_name == nil then "" else p0.display_name,
		contains = if p0 == nil or p0.contains == nil then false else p0.contains
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6 = 0
	
	if self.name ~= nil and self.name ~= "" then
		local var7, var8 = protoModule.writeTag(buff, var6, 1, protoModule.wireTypes.lengthDelimited)
		var7, var8 = protoModule.writeString(var7, var8, self.name)
		buff = var7
		var6 = var8
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var9, var10 = protoModule.writeTag(buff, var6, 2, protoModule.wireTypes.lengthDelimited)
		var9, var10 = protoModule.writeString(var9, var10, self.display_name)
		buff = var9
		var6 = var10
	end
	if self.contains then
		local var11, var12 = protoModule.writeTag(buff, var6, 3, protoModule.wireTypes.varint)
		var11, var12 = protoModule.writeVarInt(var11, var12, if self.contains then 1 else 0)
		buff = var11
		var6 = var12
	end
	local buff_1 = buffer.create(var6)
	buffer.copy(buff_1, 0, buff, 0, var6)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
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
			if var20 == 3 then
				local _ = nil
				local var21, var22 = protoModule.readVarInt(p1, var15)
				var15 = var22
				var14.contains = var21 ~= 0
			else
				local _ = nil
				local var23, var24 = protoModule.readVarInt(p1, var15)
				local _ = var23
				var15 = var24
			end
		end
		if var16 == protoModule.wireTypes.lengthDelimited then
			if var20 == 1 then
				local _ = nil
				local var25, var26 = protoModule.readBuffer(p1, var15)
				var15 = var26
				var14.name = buffer.tostring(var25)
			elseif var20 == 2 then
				local _ = nil
				local var27, var28 = protoModule.readBuffer(p1, var15)
				var15 = var28
				var14.display_name = buffer.tostring(var27)
			else
				local _ = nil
				local var29, var30 = protoModule.readVarInt(p1, var15)
				var15 = var30 + var29
			end
		elseif var16 == protoModule.wireTypes.i32 then
			local _ = nil
			local var31, var32 = protoModule.readFixed32(p1, var15)
			local _ = var31
			var15 = var32
		elseif var16 == protoModule.wireTypes.i64 then
			local _ = nil
			local var33, var34 = protoModule.readFixed64(p1, var15)
			local _ = var33
			var15 = var34
		else
			error("Unsupported wire type: " .. var16)
		end
	end
	return var14
end

function t_1:jsonEncode()
	local t = {}
	
	if self.name ~= nil and self.name ~= "" then
		t.name = self.name
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.contains then
		t.contains = self.contains
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var36 = t_1.new()
	
	if self.name ~= nil then
		var36.name = self.name
	end
	if self.display_name ~= nil then
		var36.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var36.display_name = self.displayName
	end
	if self.contains ~= nil then
		var36.contains = self.contains
	end
	return var36
end

t_1.descriptor = {
	name = "AgeRecommendationDescriptor",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeRecommendationDescriptor"
}
t.AgeRecommendationDescriptor = t_1
typeRegistryModule.default:register(t.AgeRecommendationDescriptor)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		display_name = if p2 == nil or p2.display_name == nil then "" else p2.display_name,
		display_name_with_header_short = if p2 == nil or p2.display_name_with_header_short == nil then "" else p2.display_name_with_header_short,
		igrs_rating = if p2 == nil or p2.igrs_rating == nil then "" else p2.igrs_rating,
		igrs_rating_display_message = if p2 == nil or p2.igrs_rating_display_message == nil then "" else p2.igrs_rating_display_message,
		descriptors = if p2 == nil or p2.descriptors == nil then {} else p2.descriptors,
		minimum_age_display = if p2 == nil or p2.minimum_age_display == nil then nil else p2.minimum_age_display
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var38 = 0
	
	if self.display_name ~= nil and self.display_name ~= "" then
		local var39, var40 = protoModule.writeTag(buff, var38, 1, protoModule.wireTypes.lengthDelimited)
		var39, var40 = protoModule.writeString(var39, var40, self.display_name)
		buff = var39
		var38 = var40
	end
	if self.display_name_with_header_short ~= nil and self.display_name_with_header_short ~= "" then
		local var41, var42 = protoModule.writeTag(buff, var38, 2, protoModule.wireTypes.lengthDelimited)
		var41, var42 = protoModule.writeString(var41, var42, self.display_name_with_header_short)
		buff = var41
		var38 = var42
	end
	if self.igrs_rating ~= nil and self.igrs_rating ~= "" then
		local var43, var44 = protoModule.writeTag(buff, var38, 3, protoModule.wireTypes.lengthDelimited)
		var43, var44 = protoModule.writeString(var43, var44, self.igrs_rating)
		buff = var43
		var38 = var44
	end
	if self.igrs_rating_display_message ~= nil and self.igrs_rating_display_message ~= "" then
		local var45, var46 = protoModule.writeTag(buff, var38, 4, protoModule.wireTypes.lengthDelimited)
		var45, var46 = protoModule.writeString(var45, var46, self.igrs_rating_display_message)
		buff = var45
		var38 = var46
	end
	if self.descriptors ~= nil and #self.descriptors > 0 then
		for i, v in self.descriptors do
			local var47 = v:encode()
			local var48, var49 = protoModule.writeTag(buff, var38, 5, protoModule.wireTypes.lengthDelimited)
			var48, var49 = protoModule.writeBuffer(var48, var49, var47, buffer.len(var47))
			buff = var48
			var38 = var49
		end
	end
	if self.minimum_age_display ~= nil then
		local var50, var51 = protoModule.writeTag(buff, var38, 6, protoModule.wireTypes.lengthDelimited)
		var50, var51 = protoModule.writeString(var50, var51, self.minimum_age_display)
		buff = var50
		var38 = var51
	end
	local buff_1 = buffer.create(var38)
	buffer.copy(buff_1, 0, buff, 0, var38)
	
	return buff_1
end

function t_2.decode(p3)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var53 = t_2.new()
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
				var53.display_name = buffer.tostring(var62)
			elseif var59 == 2 then
				local _ = nil
				local var64, var65 = protoModule.readBuffer(p3, var54)
				var54 = var65
				var53.display_name_with_header_short = buffer.tostring(var64)
			elseif var59 == 3 then
				local _ = nil
				local var66, var67 = protoModule.readBuffer(p3, var54)
				var54 = var67
				var53.igrs_rating = buffer.tostring(var66)
			elseif var59 == 4 then
				local _ = nil
				local var68, var69 = protoModule.readBuffer(p3, var54)
				var54 = var69
				var53.igrs_rating_display_message = buffer.tostring(var68)
			elseif var59 == 5 then
				local _ = nil
				local var70, var71 = protoModule.readBuffer(p3, var54)
				var54 = var71
				table.insert(var53.descriptors, t.AgeRecommendationDescriptor.decode(var70))
			elseif var59 == 6 then
				local _ = nil
				local var72, var73 = protoModule.readBuffer(p3, var54)
				var54 = var73
				var53.minimum_age_display = buffer.tostring(var72)
			else
				local _ = nil
				local var74, var75 = protoModule.readVarInt(p3, var54)
				var54 = var75 + var74
			end
		elseif var55 == protoModule.wireTypes.i32 then
			local _ = nil
			local var76, var77 = protoModule.readFixed32(p3, var54)
			local _ = var76
			var54 = var77
		elseif var55 == protoModule.wireTypes.i64 then
			local _ = nil
			local var78, var79 = protoModule.readFixed64(p3, var54)
			local _ = var78
			var54 = var79
		else
			error("Unsupported wire type: " .. var55)
		end
	end
	return var53
end

function t_2:jsonEncode()
	local t = {}
	
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.display_name_with_header_short ~= nil and self.display_name_with_header_short ~= "" then
		t.displayNameWithHeaderShort = self.display_name_with_header_short
	end
	if self.igrs_rating ~= nil and self.igrs_rating ~= "" then
		t.igrsRating = self.igrs_rating
	end
	if self.igrs_rating_display_message ~= nil and self.igrs_rating_display_message ~= "" then
		t.igrsRatingDisplayMessage = self.igrs_rating_display_message
	end
	if self.descriptors ~= nil and #self.descriptors > 0 then
		local t_1 = {}
		
		for i, v in self.descriptors do
			table.insert(t_1, v:jsonEncode())
		end
		t.descriptors = t_1
	end
	if self.minimum_age_display ~= nil then
		t.minimumAgeDisplay = self.minimum_age_display
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), t (ref)
	local var82 = t_2.new()
	
	if self.display_name ~= nil then
		var82.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var82.display_name = self.displayName
	end
	if self.display_name_with_header_short ~= nil then
		var82.display_name_with_header_short = self.display_name_with_header_short
	end
	if self.displayNameWithHeaderShort ~= nil then
		var82.display_name_with_header_short = self.displayNameWithHeaderShort
	end
	if self.igrs_rating ~= nil then
		var82.igrs_rating = self.igrs_rating
	end
	if self.igrsRating ~= nil then
		var82.igrs_rating = self.igrsRating
	end
	if self.igrs_rating_display_message ~= nil then
		var82.igrs_rating_display_message = self.igrs_rating_display_message
	end
	if self.igrsRatingDisplayMessage ~= nil then
		var82.igrs_rating_display_message = self.igrsRatingDisplayMessage
	end
	if self.descriptors ~= nil then
		local t_1 = {}
		
		for i, v in self.descriptors do
			table.insert(t_1, t.AgeRecommendationDescriptor.jsonDecode(v))
		end
		var82.descriptors = t_1
	end
	if self.minimum_age_display ~= nil then
		var82.minimum_age_display = self.minimum_age_display
	end
	if self.minimumAgeDisplay ~= nil then
		var82.minimum_age_display = self.minimumAgeDisplay
	end
	return var82
end

t_2.descriptor = {
	name = "AgeRecommendationData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeRecommendationData"
}
t.AgeRecommendationData = t_2
typeRegistryModule.default:register(t.AgeRecommendationData)

return {
	AgeRecommendationDescriptor = t.AgeRecommendationDescriptor,
	AgeRecommendationData = t.AgeRecommendationData
}