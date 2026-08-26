local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		can_follow = if p1 == nil or p1.can_follow == nil then false else p1.can_follow,
		is_following = if p1 == nil or p1.is_following == nil then false else p1.is_following
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.can_follow then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var7 = protoModule.writeVarInt(var2, var3, if self.can_follow then 1 else 0)
		buff = var2
		var1 = var3
	end
	if self.is_following then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var9 = protoModule.writeVarInt(var4, var5, if self.is_following then 1 else 0)
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
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.can_follow = var8 ~= 0
			elseif var6 == 2 then
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				var2 = var11
				var1.is_following = var10 ~= 0
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
	
	if self.can_follow then
		t.canFollow = self.can_follow
	end
	if self.is_following then
		t.isFollowing = self.is_following
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var20 = t_1.new()
	
	if self.can_follow ~= nil then
		var20.can_follow = self.can_follow
	end
	if self.canFollow ~= nil then
		var20.can_follow = self.canFollow
	end
	if self.is_following ~= nil then
		var20.is_following = self.is_following
	end
	if self.isFollowing ~= nil then
		var20.is_following = self.isFollowing
	end
	return var20
end

t_1.descriptor = {
	name = "UniverseUserFollowData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFollowData"
}
t.UniverseUserFollowData = t_1
typeRegistryModule.default:register(t.UniverseUserFollowData)

return { UniverseUserFollowData = t.UniverseUserFollowData }