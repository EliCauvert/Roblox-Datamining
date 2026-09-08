local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t (ref), t_1 (ref)
	return setmetatable({
		recommendation_type = if p1 == nil or p1.recommendation_type == nil then assert(t.FriendRecommendationData_RecommendationType.fromNumber(0), "Enum has no 0 default") else p1.recommendation_type,
		context_type = if p1 == nil or p1.context_type == nil then nil else p1.context_type,
		mutual_friends_count = if p1 == nil or p1.mutual_friends_count == nil then nil else p1.mutual_friends_count,
		contact_name = if p1 == nil or p1.contact_name == nil then nil else p1.contact_name,
		avatar_thumbnail_url = if p1 == nil or p1.avatar_thumbnail_url == nil then nil else p1.avatar_thumbnail_url,
		headshot_thumbnail_url = if p1 == nil or p1.headshot_thumbnail_url == nil then nil else p1.headshot_thumbnail_url
	}, t_1)
end

function t_1:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.recommendation_type ~= nil and (self.recommendation_type ~= nil and self.recommendation_type ~= 0 or self.recommendation_type ~= t.FriendRecommendationData_RecommendationType.fromNumber(0)) then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var7 = protoModule.writeVarInt(var2, var3, t.FriendRecommendationData_RecommendationType.toNumber(self.recommendation_type))
		buff = var2
		var1 = var3
	end
	if self.context_type ~= nil then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var9 = protoModule.writeString(var4, var5, self.context_type)
		buff = var4
		var1 = var5
	end
	if self.mutual_friends_count ~= nil then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var11 = protoModule.writeVarInt(var6, var7, self.mutual_friends_count)
		buff = var6
		var1 = var7
	end
	if self.contact_name ~= nil then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var13 = protoModule.writeString(var8, var9, self.contact_name)
		buff = var8
		var1 = var9
	end
	if self.avatar_thumbnail_url ~= nil then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var15 = protoModule.writeString(var10, var11, self.avatar_thumbnail_url)
		buff = var10
		var1 = var11
	end
	if self.headshot_thumbnail_url ~= nil then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var12, var17 = protoModule.writeString(var12, var13, self.headshot_thumbnail_url)
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
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.recommendation_type = t.FriendRecommendationData_RecommendationType.fromNumber(var10) or var10
			elseif var7 == 3 then
				local _ = nil
				local var11, var12 = protoModule.readVarIntI32(p1, var2)
				var2 = var12
				var1.mutual_friends_count = var11
			else
				local _ = nil
				local var13, var14 = protoModule.readVarInt(p1, var2)
				local _ = var13
				var2 = var14
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 2 then
				local _ = nil
				local var15, var16 = protoModule.readBuffer(p1, var2)
				var2 = var16
				var1.context_type = buffer.tostring(var15)
			elseif var7 == 4 then
				local _ = nil
				local var17, var18 = protoModule.readBuffer(p1, var2)
				var2 = var18
				var1.contact_name = buffer.tostring(var17)
			elseif var7 == 5 then
				local _ = nil
				local var19, var20 = protoModule.readBuffer(p1, var2)
				var2 = var20
				var1.avatar_thumbnail_url = buffer.tostring(var19)
			elseif var7 == 6 then
				local _ = nil
				local var21, var22 = protoModule.readBuffer(p1, var2)
				var2 = var22
				var1.headshot_thumbnail_url = buffer.tostring(var21)
			else
				local _ = nil
				local var23, var24 = protoModule.readVarInt(p1, var2)
				var2 = var24 + var23
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var25, var26 = protoModule.readFixed32(p1, var2)
			local _ = var25
			var2 = var26
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var27, var28 = protoModule.readFixed64(p1, var2)
			local _ = var27
			var2 = var28
		else
			error("Unsupported wire type: " .. var21)
		end
	end
	return var1
end

function t_1:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.recommendation_type ~= nil and (self.recommendation_type ~= nil and self.recommendation_type ~= 0 or self.recommendation_type ~= t.FriendRecommendationData_RecommendationType.fromNumber(0)) then
		t_1.recommendationType = if typeof(self.recommendation_type) == "number" then self.recommendation_type else t.FriendRecommendationData_RecommendationType.toNumber(self.recommendation_type)
	end
	if self.context_type ~= nil then
		t_1.contextType = self.context_type
	end
	if self.mutual_friends_count ~= nil then
		t_1.mutualFriendsCount = self.mutual_friends_count
	end
	if self.contact_name ~= nil then
		t_1.contactName = self.contact_name
	end
	if self.avatar_thumbnail_url ~= nil then
		t_1.avatarThumbnailUrl = self.avatar_thumbnail_url
	end
	if self.headshot_thumbnail_url ~= nil then
		t_1.headshotThumbnailUrl = self.headshot_thumbnail_url
	end
	return t_1
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref)
	local var29 = t_1.new()
	
	if self.recommendation_type ~= nil then
		var29.recommendation_type = if typeof(self.recommendation_type) == "number" then t.FriendRecommendationData_RecommendationType.fromNumber(self.recommendation_type) or self.recommendation_type else t.FriendRecommendationData_RecommendationType.fromName(self.recommendation_type) or self.recommendation_type
	end
	if self.recommendationType ~= nil then
		var29.recommendation_type = if typeof(self.recommendationType) == "number" then t.FriendRecommendationData_RecommendationType.fromNumber(self.recommendationType) or self.recommendationType else t.FriendRecommendationData_RecommendationType.fromName(self.recommendationType) or self.recommendationType
	end
	if self.context_type ~= nil then
		var29.context_type = self.context_type
	end
	if self.contextType ~= nil then
		var29.context_type = self.contextType
	end
	if self.mutual_friends_count ~= nil then
		var29.mutual_friends_count = self.mutual_friends_count
	end
	if self.mutualFriendsCount ~= nil then
		var29.mutual_friends_count = self.mutualFriendsCount
	end
	if self.contact_name ~= nil then
		var29.contact_name = self.contact_name
	end
	if self.contactName ~= nil then
		var29.contact_name = self.contactName
	end
	if self.avatar_thumbnail_url ~= nil then
		var29.avatar_thumbnail_url = self.avatar_thumbnail_url
	end
	if self.avatarThumbnailUrl ~= nil then
		var29.avatar_thumbnail_url = self.avatarThumbnailUrl
	end
	if self.headshot_thumbnail_url ~= nil then
		var29.headshot_thumbnail_url = self.headshot_thumbnail_url
	end
	if self.headshotThumbnailUrl ~= nil then
		var29.headshot_thumbnail_url = self.headshotThumbnailUrl
	end
	return var29
end

t_1.descriptor = {
	name = "FriendRecommendationData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationData"
}
t.FriendRecommendationData = t_1
typeRegistryModule.default:register(t.FriendRecommendationData)
t.FriendRecommendationData_RecommendationType = {
	fromNumber = function(p2)
		return if p2 == 0 then "RECOMMENDATION_TYPE_INVALID" elseif p2 == 1 then "RECOMMENDATION_TYPE_USER" elseif p2 == 2 then "RECOMMENDATION_TYPE_CONTACT" else nil
	end,
	toNumber = function(p2)
		return if p2 == "RECOMMENDATION_TYPE_INVALID" then 0 elseif p2 == "RECOMMENDATION_TYPE_USER" then 1 elseif p2 == "RECOMMENDATION_TYPE_CONTACT" then 2 else p2
	end,
	fromName = function(p2)
		return if p2 == "RECOMMENDATION_TYPE_INVALID" then "RECOMMENDATION_TYPE_INVALID" elseif p2 == "RECOMMENDATION_TYPE_USER" then "RECOMMENDATION_TYPE_USER" elseif p2 == "RECOMMENDATION_TYPE_CONTACT" then "RECOMMENDATION_TYPE_CONTACT" else nil
	end
}

return {
	FriendRecommendationData = t.FriendRecommendationData,
	FriendRecommendationData_RecommendationType = t.FriendRecommendationData_RecommendationType
}