local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
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
	local var1 = t_1.new()
	
	if self.name ~= nil then
		var1.name = self.name
	end
	if self.display_name ~= nil then
		var1.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var1.display_name = self.displayName
	end
	if self.contains ~= nil then
		var1.contains = self.contains
	end
	return var1
end

t_1.descriptor = {
	name = "AgeRecommendationDescriptor",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeRecommendationDescriptor"
}
t.AgeRecommendationDescriptor = t_1
typeRegistryModule.default:register(t.AgeRecommendationDescriptor)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p1)
	-- upvalues: t_2 (ref)
	return setmetatable({
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		display_name_with_header_short = if p1 == nil or p1.display_name_with_header_short == nil then "" else p1.display_name_with_header_short,
		igrs_rating = if p1 == nil or p1.igrs_rating == nil then "" else p1.igrs_rating,
		igrs_rating_display_message = if p1 == nil or p1.igrs_rating_display_message == nil then "" else p1.igrs_rating_display_message,
		descriptors = if p1 == nil or p1.descriptors == nil then {} else p1.descriptors,
		minimum_age_display = if p1 == nil or p1.minimum_age_display == nil then nil else p1.minimum_age_display
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var40 = protoModule.writeString(var2, var3, self.display_name)
		buff = var2
		var1 = var3
	end
	if self.display_name_with_header_short ~= nil and self.display_name_with_header_short ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var42 = protoModule.writeString(var4, var5, self.display_name_with_header_short)
		buff = var4
		var1 = var5
	end
	if self.igrs_rating ~= nil and self.igrs_rating ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var44 = protoModule.writeString(var6, var7, self.igrs_rating)
		buff = var6
		var1 = var7
	end
	if self.igrs_rating_display_message ~= nil and self.igrs_rating_display_message ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var46 = protoModule.writeString(var8, var9, self.igrs_rating_display_message)
		buff = var8
		var1 = var9
	end
	if self.descriptors ~= nil and #self.descriptors > 0 then
		for i, v in self.descriptors do
			local var10 = v:encode()
			local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var11, var49 = protoModule.writeBuffer(var11, var12, var10, buffer.len(var10))
			buff = var11
			var1 = var12
		end
	end
	if self.minimum_age_display ~= nil then
		local var13, var14 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var13, var51 = protoModule.writeString(var13, var14, self.minimum_age_display)
		buff = var13
		var1 = var14
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_2.decode(p1)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var1 = t_2.new()
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
				var1.display_name = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.display_name_with_header_short = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.igrs_rating = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.igrs_rating_display_message = buffer.tostring(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				table.insert(var1.descriptors, t.AgeRecommendationDescriptor.decode(var18))
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.minimum_age_display = buffer.tostring(var20)
			else
				local _ = nil
				local var22, var23 = protoModule.readVarInt(p1, var2)
				var2 = var23 + var22
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var24, var25 = protoModule.readFixed32(p1, var2)
			local _ = var24
			var2 = var25
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var26, var27 = protoModule.readFixed64(p1, var2)
			local _ = var26
			var2 = var27
		else
			error("Unsupported wire type: " .. var55)
		end
	end
	return var1
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
	local var1 = t_2.new()
	
	if self.display_name ~= nil then
		var1.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var1.display_name = self.displayName
	end
	if self.display_name_with_header_short ~= nil then
		var1.display_name_with_header_short = self.display_name_with_header_short
	end
	if self.displayNameWithHeaderShort ~= nil then
		var1.display_name_with_header_short = self.displayNameWithHeaderShort
	end
	if self.igrs_rating ~= nil then
		var1.igrs_rating = self.igrs_rating
	end
	if self.igrsRating ~= nil then
		var1.igrs_rating = self.igrsRating
	end
	if self.igrs_rating_display_message ~= nil then
		var1.igrs_rating_display_message = self.igrs_rating_display_message
	end
	if self.igrsRatingDisplayMessage ~= nil then
		var1.igrs_rating_display_message = self.igrsRatingDisplayMessage
	end
	if self.descriptors ~= nil then
		local t_1 = {}
		
		for i, v in self.descriptors do
			table.insert(t_1, t.AgeRecommendationDescriptor.jsonDecode(v))
		end
		var1.descriptors = t_1
	end
	if self.minimum_age_display ~= nil then
		var1.minimum_age_display = self.minimum_age_display
	end
	if self.minimumAgeDisplay ~= nil then
		var1.minimum_age_display = self.minimumAgeDisplay
	end
	return var1
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