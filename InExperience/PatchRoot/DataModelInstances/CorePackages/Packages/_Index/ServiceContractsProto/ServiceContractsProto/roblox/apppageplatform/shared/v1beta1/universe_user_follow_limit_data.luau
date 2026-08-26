local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		following_count_by_type = if p1 == nil or p1.following_count_by_type == nil then 0 else p1.following_count_by_type,
		following_limit_by_type = if p1 == nil or p1.following_limit_by_type == nil then 0 else p1.following_limit_by_type
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.following_count_by_type ~= nil and self.following_count_by_type ~= 0 then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var7 = protoModule.writeVarInt(var2, var3, self.following_count_by_type)
		buff = var2
		var1 = var3
	end
	if self.following_limit_by_type ~= nil and self.following_limit_by_type ~= 0 then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var9 = protoModule.writeVarInt(var4, var5, self.following_limit_by_type)
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
		local _ = nil
		local var3, var4, var5 = protoModule.readTag(p1, var2)
		local var6 = var3
		local var7 = var4
		var2 = var5
		
		if var7 == protoModule.wireTypes.varint then
			if var6 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				var2 = var9
				var1.following_count_by_type = var8
			elseif var6 == 2 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI32(p1, var2)
				var2 = var11
				var1.following_limit_by_type = var10
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				local _ = var12
				var2 = var13
			end
		elseif var7 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var14, var15 = protoModule.readVarInt(p1, var2)
			var2 = var15 + var14
		elseif var7 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var7 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var17)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.following_count_by_type ~= nil and self.following_count_by_type ~= 0 then
		t.followingCountByType = self.following_count_by_type
	end
	if self.following_limit_by_type ~= nil and self.following_limit_by_type ~= 0 then
		t.followingLimitByType = self.following_limit_by_type
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var20 = t_1.new()
	
	if self.following_count_by_type ~= nil then
		var20.following_count_by_type = self.following_count_by_type
	end
	if self.followingCountByType ~= nil then
		var20.following_count_by_type = self.followingCountByType
	end
	if self.following_limit_by_type ~= nil then
		var20.following_limit_by_type = self.following_limit_by_type
	end
	if self.followingLimitByType ~= nil then
		var20.following_limit_by_type = self.followingLimitByType
	end
	return var20
end

t_1.descriptor = {
	name = "UniverseUserFollowLimitData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFollowLimitData"
}
t.UniverseUserFollowLimitData = t_1
typeRegistryModule.default:register(t.UniverseUserFollowLimitData)

return {
	UniverseUserFollowLimitData = t.UniverseUserFollowLimitData
}