local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local _ = require(script.Parent.custom_options)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		name = if p1 == nil or p1.name == nil then "" else p1.name,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		contains = if p1 == nil or p1.contains == nil then false else p1.contains
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.name ~= nil and self.name ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var8 = protoModule.writeString(var2, var3, self.name)
		buff = var2
		var1 = var3
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var10 = protoModule.writeString(var4, var5, self.display_name)
		buff = var4
		var1 = var5
	end
	if self.contains then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var12 = protoModule.writeVarInt(var6, var7, if self.contains then 1 else 0)
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
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
			if var7 == 3 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.contains = var8 ~= 0
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
				var1.name = buffer.tostring(var12)
			elseif var7 == 2 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.display_name = buffer.tostring(var14)
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
			error("Unsupported wire type: " .. var16)
		end
	end
	return var1
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
	local var22 = t_1.new()
	
	if self.name ~= nil then
		var22.name = self.name
	end
	if self.display_name ~= nil then
		var22.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var22.display_name = self.displayName
	end
	if self.contains ~= nil then
		var22.contains = self.contains
	end
	return var22
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
	local var22 = 0
	
	if self.display_name ~= nil and self.display_name ~= "" then
		local var23, var24 = protoModule.writeTag(buff, var22, 1, protoModule.wireTypes.lengthDelimited)
		var23, var40 = protoModule.writeString(var23, var24, self.display_name)
		buff = var23
		var22 = var24
	end
	if self.display_name_with_header_short ~= nil and self.display_name_with_header_short ~= "" then
		local var25, var26 = protoModule.writeTag(buff, var22, 2, protoModule.wireTypes.lengthDelimited)
		var25, var42 = protoModule.writeString(var25, var26, self.display_name_with_header_short)
		buff = var25
		var22 = var26
	end
	if self.igrs_rating ~= nil and self.igrs_rating ~= "" then
		local var27, var28 = protoModule.writeTag(buff, var22, 3, protoModule.wireTypes.lengthDelimited)
		var27, var44 = protoModule.writeString(var27, var28, self.igrs_rating)
		buff = var27
		var22 = var28
	end
	if self.igrs_rating_display_message ~= nil and self.igrs_rating_display_message ~= "" then
		local var29, var30 = protoModule.writeTag(buff, var22, 4, protoModule.wireTypes.lengthDelimited)
		var29, var46 = protoModule.writeString(var29, var30, self.igrs_rating_display_message)
		buff = var29
		var22 = var30
	end
	if self.descriptors ~= nil and #self.descriptors > 0 then
		for i, v in self.descriptors do
			local var31 = v:encode()
			local var32, var33 = protoModule.writeTag(buff, var22, 5, protoModule.wireTypes.lengthDelimited)
			var32, var49 = protoModule.writeBuffer(var32, var33, var31, buffer.len(var31))
			buff = var32
			var22 = var33
		end
	end
	if self.minimum_age_display ~= nil then
		local var34, var35 = protoModule.writeTag(buff, var22, 6, protoModule.wireTypes.lengthDelimited)
		var34, var51 = protoModule.writeString(var34, var35, self.minimum_age_display)
		buff = var34
		var22 = var35
	end
	local buff_1 = buffer.create(var22)
	buffer.copy(buff_1, 0, buff, 0, var22)
	
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
				var36.display_name = buffer.tostring(var45)
			elseif var42 == 2 then
				local _ = nil
				local var47, var48 = protoModule.readBuffer(p2, var37)
				var37 = var48
				var36.display_name_with_header_short = buffer.tostring(var47)
			elseif var42 == 3 then
				local _ = nil
				local var49, var50 = protoModule.readBuffer(p2, var37)
				var37 = var50
				var36.igrs_rating = buffer.tostring(var49)
			elseif var42 == 4 then
				local _ = nil
				local var51, var52 = protoModule.readBuffer(p2, var37)
				var37 = var52
				var36.igrs_rating_display_message = buffer.tostring(var51)
			elseif var42 == 5 then
				local _ = nil
				local var53, var54 = protoModule.readBuffer(p2, var37)
				var37 = var54
				table.insert(var36.descriptors, t.AgeRecommendationDescriptor.decode(var53))
			elseif var42 == 6 then
				local _ = nil
				local var55, var56 = protoModule.readBuffer(p2, var37)
				var37 = var56
				var36.minimum_age_display = buffer.tostring(var55)
			else
				local _ = nil
				local var57, var58 = protoModule.readVarInt(p2, var37)
				var37 = var58 + var57
			end
		elseif var38 == protoModule.wireTypes.i32 then
			local _ = nil
			local var59, var60 = protoModule.readFixed32(p2, var37)
			local _ = var59
			var37 = var60
		elseif var38 == protoModule.wireTypes.i64 then
			local _ = nil
			local var61, var62 = protoModule.readFixed64(p2, var37)
			local _ = var61
			var37 = var62
		else
			error("Unsupported wire type: " .. var55)
		end
	end
	return var36
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
	local var63 = t_2.new()
	
	if self.display_name ~= nil then
		var63.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var63.display_name = self.displayName
	end
	if self.display_name_with_header_short ~= nil then
		var63.display_name_with_header_short = self.display_name_with_header_short
	end
	if self.displayNameWithHeaderShort ~= nil then
		var63.display_name_with_header_short = self.displayNameWithHeaderShort
	end
	if self.igrs_rating ~= nil then
		var63.igrs_rating = self.igrs_rating
	end
	if self.igrsRating ~= nil then
		var63.igrs_rating = self.igrsRating
	end
	if self.igrs_rating_display_message ~= nil then
		var63.igrs_rating_display_message = self.igrs_rating_display_message
	end
	if self.igrsRatingDisplayMessage ~= nil then
		var63.igrs_rating_display_message = self.igrsRatingDisplayMessage
	end
	if self.descriptors ~= nil then
		local t_1 = {}
		
		for i, v in self.descriptors do
			table.insert(t_1, t.AgeRecommendationDescriptor.jsonDecode(v))
		end
		var63.descriptors = t_1
	end
	if self.minimum_age_display ~= nil then
		var63.minimum_age_display = self.minimum_age_display
	end
	if self.minimumAgeDisplay ~= nil then
		var63.minimum_age_display = self.minimumAgeDisplay
	end
	return var63
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