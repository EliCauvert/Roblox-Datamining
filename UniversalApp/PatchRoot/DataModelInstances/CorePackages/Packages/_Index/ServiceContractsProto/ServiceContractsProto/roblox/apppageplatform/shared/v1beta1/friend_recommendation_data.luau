local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: t (copy), Module (copy)
	return (setmetatable({
		recommendation_type = if p1 == nil or p1.recommendation_type == nil then assert(t.FriendRecommendationData_RecommendationType.fromNumber(0), "Enum has no 0 default") else p1.recommendation_type,
		context_type = if p1 == nil or p1.context_type == nil then nil else p1.context_type,
		mutual_friends_count = if p1 == nil or p1.mutual_friends_count == nil then nil else p1.mutual_friends_count,
		contact_name = if p1 == nil or p1.contact_name == nil then nil else p1.contact_name,
		avatar_thumbnail_url = if p1 == nil or p1.avatar_thumbnail_url == nil then nil else p1.avatar_thumbnail_url,
		headshot_thumbnail_url = if p1 == nil or p1.headshot_thumbnail_url == nil then nil else p1.headshot_thumbnail_url
	}, Module))
end

function Module:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.recommendation_type ~= nil and (self.recommendation_type ~= nil and self.recommendation_type ~= 0 or self.recommendation_type ~= t.FriendRecommendationData_RecommendationType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.FriendRecommendationData_RecommendationType.toNumber(self.recommendation_type))
	end
	if self.context_type ~= nil then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.context_type)
	end
	if self.mutual_friends_count ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.mutual_friends_count)
	end
	if self.contact_name ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.contact_name)
	end
	if self.avatar_thumbnail_url ~= nil then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.avatar_thumbnail_url)
	end
	if self.headshot_thumbnail_url ~= nil then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.headshot_thumbnail_url)
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
		Tag, Tag2, v19 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v19 = ProtoModule.readVarIntI32(Buf, v1)
				NewModule.recommendation_type = t.FriendRecommendationData_RecommendationType.fromNumber(VarIntI32) or VarIntI32
			elseif Tag == 3 then
				NewModule.mutual_friends_count, v19 = ProtoModule.readVarIntI32(Buf, v1)
			else
				local _
				_, v19 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.context_type = buffer.tostring(Buffer1)
			elseif Tag == 4 then
				local Buffer2
				Buffer2, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.contact_name = buffer.tostring(Buffer2)
			elseif Tag == 5 then
				local Buffer3
				Buffer3, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.avatar_thumbnail_url = buffer.tostring(Buffer3)
			elseif Tag == 6 then
				local Buffer4
				Buffer4, v19 = ProtoModule.readBuffer(Buf, v1)
				NewModule.headshot_thumbnail_url = buffer.tostring(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v19 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v19 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.recommendation_type ~= nil and (self.recommendation_type ~= nil and self.recommendation_type ~= 0 or self.recommendation_type ~= t.FriendRecommendationData_RecommendationType.fromNumber(0)) then
		t1.recommendationType = if typeof(self.recommendation_type) == "number" then self.recommendation_type else t.FriendRecommendationData_RecommendationType.toNumber(self.recommendation_type)
	end
	if self.context_type ~= nil then
		t1.contextType = self.context_type
	end
	if self.mutual_friends_count ~= nil then
		t1.mutualFriendsCount = self.mutual_friends_count
	end
	if self.contact_name ~= nil then
		t1.contactName = self.contact_name
	end
	if self.avatar_thumbnail_url ~= nil then
		t1.avatarThumbnailUrl = self.avatar_thumbnail_url
	end
	if self.headshot_thumbnail_url ~= nil then
		t1.headshotThumbnailUrl = self.headshot_thumbnail_url
	end
	return t1
end

function Module:jsonDecode()
	-- upvalues: Module (copy), t (copy)
	local NewModule = Module.new()
	
	if self.recommendation_type ~= nil then
		NewModule.recommendation_type = (if typeof(self.recommendation_type) == "number" then t.FriendRecommendationData_RecommendationType.fromNumber(self.recommendation_type) else t.FriendRecommendationData_RecommendationType.fromName(self.recommendation_type)) or self.recommendation_type
	end
	if self.recommendationType ~= nil then
		NewModule.recommendation_type = (if typeof(self.recommendationType) == "number" then t.FriendRecommendationData_RecommendationType.fromNumber(self.recommendationType) else t.FriendRecommendationData_RecommendationType.fromName(self.recommendationType)) or self.recommendationType
	end
	if self.context_type ~= nil then
		NewModule.context_type = self.context_type
	end
	if self.contextType ~= nil then
		NewModule.context_type = self.contextType
	end
	if self.mutual_friends_count ~= nil then
		NewModule.mutual_friends_count = self.mutual_friends_count
	end
	if self.mutualFriendsCount ~= nil then
		NewModule.mutual_friends_count = self.mutualFriendsCount
	end
	if self.contact_name ~= nil then
		NewModule.contact_name = self.contact_name
	end
	if self.contactName ~= nil then
		NewModule.contact_name = self.contactName
	end
	if self.avatar_thumbnail_url ~= nil then
		NewModule.avatar_thumbnail_url = self.avatar_thumbnail_url
	end
	if self.avatarThumbnailUrl ~= nil then
		NewModule.avatar_thumbnail_url = self.avatarThumbnailUrl
	end
	if self.headshot_thumbnail_url ~= nil then
		NewModule.headshot_thumbnail_url = self.headshot_thumbnail_url
	end
	if self.headshotThumbnailUrl ~= nil then
		NewModule.headshot_thumbnail_url = self.headshotThumbnailUrl
	end
	return NewModule
end

Module.descriptor = {
	name = "FriendRecommendationData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationData"
}
t.FriendRecommendationData = Module
TypeRegistryModule.default:register(t.FriendRecommendationData)
t.FriendRecommendationData_RecommendationType = {
	fromNumber = function(p1)
		return if p1 == 0 then "RECOMMENDATION_TYPE_INVALID" elseif p1 == 1 then "RECOMMENDATION_TYPE_USER" elseif p1 == 2 then "RECOMMENDATION_TYPE_CONTACT" else nil
	end,
	toNumber = function(p1)
		return if p1 == "RECOMMENDATION_TYPE_INVALID" then 0 elseif p1 == "RECOMMENDATION_TYPE_USER" then 1 elseif p1 == "RECOMMENDATION_TYPE_CONTACT" then 2 else p1
	end,
	fromName = function(p1)
		return if p1 == "RECOMMENDATION_TYPE_INVALID" then "RECOMMENDATION_TYPE_INVALID" elseif p1 == "RECOMMENDATION_TYPE_USER" then "RECOMMENDATION_TYPE_USER" elseif p1 == "RECOMMENDATION_TYPE_CONTACT" then "RECOMMENDATION_TYPE_CONTACT" else nil
	end
}

return {
	FriendRecommendationData = t.FriendRecommendationData,
	FriendRecommendationData_RecommendationType = t.FriendRecommendationData_RecommendationType
}