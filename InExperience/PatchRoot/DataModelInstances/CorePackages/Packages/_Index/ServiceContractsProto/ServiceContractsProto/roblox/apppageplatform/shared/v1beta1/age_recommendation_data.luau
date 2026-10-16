local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local _ = require(script.Parent.custom_options)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 86 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		name = if p1 == nil or p1.name == nil then "" else p1.name,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		contains = p1 ~= nil and p1.contains ~= nil and p1.contains
	}, Module))
end

function Module:encode() --[[ Line: 96 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.name ~= nil and self.name ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.name)
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.display_name)
	end
	if self.contains then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, if self.contains then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 120 ]]
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v15 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 3 then
				local VarInt
				VarInt, v15 = ProtoModule.readVarInt(Buf, v1)
				NewModule.contains = VarInt ~= 0
			else
				local _
				_, v15 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v15 = ProtoModule.readBuffer(Buf, v1)
				NewModule.name = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v15 = ProtoModule.readBuffer(Buf, v1)
				NewModule.display_name = buffer.tostring(Buffer2)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v15 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v15 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 173 ]]
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

function Module:jsonDecode() --[[ Line: 191 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.name ~= nil then
		NewModule.name = self.name
	end
	if self.display_name ~= nil then
		NewModule.display_name = self.display_name
	end
	if self.displayName ~= nil then
		NewModule.display_name = self.displayName
	end
	if self.contains ~= nil then
		NewModule.contains = self.contains
	end
	return NewModule
end

Module.descriptor = {
	name = "AgeRecommendationDescriptor",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeRecommendationDescriptor"
}
local config = { AgeRecommendationDescriptor = Module }
TypeRegistryModule.default:register(config.AgeRecommendationDescriptor)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1) --[[ Line: 227 ]]
	-- upvalues: Module1 (copy)
	return (setmetatable({
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		display_name_with_header_short = if p1 == nil or p1.display_name_with_header_short == nil then "" else p1.display_name_with_header_short,
		igrs_rating = if p1 == nil or p1.igrs_rating == nil then "" else p1.igrs_rating,
		igrs_rating_display_message = if p1 == nil or p1.igrs_rating_display_message == nil then "" else p1.igrs_rating_display_message,
		descriptors = if p1 == nil or p1.descriptors == nil then {} else p1.descriptors,
		minimum_age_display = if p1 == nil or p1.minimum_age_display == nil then nil else p1.minimum_age_display
	}, Module1))
end

function Module1:encode() --[[ Line: 244 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.display_name ~= nil and self.display_name ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.display_name)
	end
	if self.display_name_with_header_short ~= nil and self.display_name_with_header_short ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.display_name_with_header_short)
	end
	if self.igrs_rating ~= nil and self.igrs_rating ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.igrs_rating)
	end
	if self.igrs_rating_display_message ~= nil and self.igrs_rating_display_message ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.igrs_rating_display_message)
	end
	if self.descriptors ~= nil and #self.descriptors > 0 then
		for _, descriptor in self.descriptors do
			local EncodeResult = descriptor:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.minimum_age_display ~= nil then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.minimum_age_display)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf) --[[ Line: 286 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v44 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v44 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v44 = ProtoModule.readBuffer(Buf, v2)
				NewModule.display_name = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v44 = ProtoModule.readBuffer(Buf, v2)
				NewModule.display_name_with_header_short = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v44 = ProtoModule.readBuffer(Buf, v2)
				NewModule.igrs_rating = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v44 = ProtoModule.readBuffer(Buf, v2)
				NewModule.igrs_rating_display_message = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v44 = ProtoModule.readBuffer(Buf, v2)
				table.insert(NewModule.descriptors, config.AgeRecommendationDescriptor.decode(Buffer5))
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v44 = ProtoModule.readBuffer(Buf, v2)
				NewModule.minimum_age_display = buffer.tostring(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v44 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v44 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode() --[[ Line: 354 ]]
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
		local Descriptors = {}
		
		for _, descriptor in self.descriptors do
			table.insert(Descriptors, descriptor:jsonEncode())
		end
		t.descriptors = Descriptors
	end
	if self.minimum_age_display ~= nil then
		t.minimumAgeDisplay = self.minimum_age_display
	end
	return t
end

function Module1:jsonDecode() --[[ Line: 388 ]]
	-- upvalues: Module1 (copy), config (copy)
	local NewModule = Module1.new()
	
	if self.display_name ~= nil then
		NewModule.display_name = self.display_name
	end
	if self.displayName ~= nil then
		NewModule.display_name = self.displayName
	end
	if self.display_name_with_header_short ~= nil then
		NewModule.display_name_with_header_short = self.display_name_with_header_short
	end
	if self.displayNameWithHeaderShort ~= nil then
		NewModule.display_name_with_header_short = self.displayNameWithHeaderShort
	end
	if self.igrs_rating ~= nil then
		NewModule.igrs_rating = self.igrs_rating
	end
	if self.igrsRating ~= nil then
		NewModule.igrs_rating = self.igrsRating
	end
	if self.igrs_rating_display_message ~= nil then
		NewModule.igrs_rating_display_message = self.igrs_rating_display_message
	end
	if self.igrsRatingDisplayMessage ~= nil then
		NewModule.igrs_rating_display_message = self.igrsRatingDisplayMessage
	end
	if self.descriptors ~= nil then
		local Descriptors = {}
		
		for _, descriptor in self.descriptors do
			table.insert(Descriptors, config.AgeRecommendationDescriptor.jsonDecode(descriptor))
		end
		NewModule.descriptors = Descriptors
	end
	if self.minimum_age_display ~= nil then
		NewModule.minimum_age_display = self.minimum_age_display
	end
	if self.minimumAgeDisplay ~= nil then
		NewModule.minimum_age_display = self.minimumAgeDisplay
	end
	return NewModule
end

Module1.descriptor = {
	name = "AgeRecommendationData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeRecommendationData"
}
config.AgeRecommendationData = Module1
TypeRegistryModule.default:register(config.AgeRecommendationData)

return {
	AgeRecommendationDescriptor = config.AgeRecommendationDescriptor,
	AgeRecommendationData = config.AgeRecommendationData
}