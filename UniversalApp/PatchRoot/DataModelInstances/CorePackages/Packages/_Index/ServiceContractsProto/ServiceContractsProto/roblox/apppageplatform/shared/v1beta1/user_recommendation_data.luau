local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		context_type = if p1 == nil or p1.context_type == nil then nil else p1.context_type,
		mutual_friends_count = if p1 == nil or p1.mutual_friends_count == nil then nil else p1.mutual_friends_count
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.context_type ~= nil then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var7 = protoModule.writeString(var2, var3, self.context_type)
		buff = var2
		var1 = var3
	end
	if self.mutual_friends_count ~= nil then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var9 = protoModule.writeVarInt(var4, var5, self.mutual_friends_count)
		buff = var4
		var1 = var5
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
			if var7 == 2 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				var2 = var9
				var1.mutual_friends_count = var8
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
				var1.context_type = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var13)
		end
	end
	return var1
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
	local var20 = t_1.new()
	
	if self.context_type ~= nil then
		var20.context_type = self.context_type
	end
	if self.contextType ~= nil then
		var20.context_type = self.contextType
	end
	if self.mutual_friends_count ~= nil then
		var20.mutual_friends_count = self.mutual_friends_count
	end
	if self.mutualFriendsCount ~= nil then
		var20.mutual_friends_count = self.mutualFriendsCount
	end
	return var20
end

t_1.descriptor = {
	name = "UserRecommendationData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserRecommendationData"
}
t.UserRecommendationData = t_1
typeRegistryModule.default:register(t.UserRecommendationData)

return { UserRecommendationData = t.UserRecommendationData }