local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	return setmetatable({
		context_type = if p0 == nil or p0.context_type == nil then nil else p0.context_type,
		mutual_friends_count = if p0 == nil or p0.mutual_friends_count == nil then nil else p0.mutual_friends_count
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.context_type ~= nil then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.lengthDelimited)
		var6, var7 = protoModule.writeString(var6, var7, self.context_type)
		buff = var6
		var5 = var7
	end
	if self.mutual_friends_count ~= nil then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.varint)
		var8, var9 = protoModule.writeVarInt(var8, var9, self.mutual_friends_count)
		buff = var8
		var5 = var9
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
	local var11 = t_1.new()
	local var12 = 0
	while var12 < buffer.len(p1) do
		local _ = nil
		local var13 = nil
		local var14, var15, var16 = protoModule.readTag(p1, var12)
		local var17 = var14
		var13 = var15
		var12 = var16
		
		if var13 == protoModule.wireTypes.varint then
			if var17 == 2 then
				local _ = nil
				local var18, var19 = protoModule.readVarIntI32(p1, var12)
				var12 = var19
				var11.mutual_friends_count = var18
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var12)
				local _ = var20
				var12 = var21
			end
		end
		if var13 == protoModule.wireTypes.lengthDelimited then
			if var17 == 1 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var12)
				var12 = var23
				var11.context_type = buffer.tostring(var22)
			else
				local _ = nil
				local var24, var25 = protoModule.readVarInt(p1, var12)
				var12 = var25 + var24
			end
		elseif var13 == protoModule.wireTypes.i32 then
			local _ = nil
			local var26, var27 = protoModule.readFixed32(p1, var12)
			local _ = var26
			var12 = var27
		elseif var13 == protoModule.wireTypes.i64 then
			local _ = nil
			local var28, var29 = protoModule.readFixed64(p1, var12)
			local _ = var28
			var12 = var29
		else
			error("Unsupported wire type: " .. var13)
		end
	end
	return var11
end

function t_1:jsonEncode()
	local t = {}
	
	if self.context_type ~= nil then
		t.contextType = self.context_type
	end
	if self.mutual_friends_count ~= nil then
		t.mutualFriendsCount = self.mutual_friends_count
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var31 = t_1.new()
	
	if self.context_type ~= nil then
		var31.context_type = self.context_type
	end
	if self.contextType ~= nil then
		var31.context_type = self.contextType
	end
	if self.mutual_friends_count ~= nil then
		var31.mutual_friends_count = self.mutual_friends_count
	end
	if self.mutualFriendsCount ~= nil then
		var31.mutual_friends_count = self.mutualFriendsCount
	end
	return var31
end

t_1.descriptor = {
	name = "UserRecommendationData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserRecommendationData"
}
t.UserRecommendationData = t_1
typeRegistryModule.default:register(t.UserRecommendationData)

return { UserRecommendationData = t.UserRecommendationData }