local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then nil else p1.user_id,
		username = if p1 == nil or p1.username == nil then nil else p1.username,
		display_name = if p1 == nil or p1.display_name == nil then nil else p1.display_name,
		is_verified = if p1 == nil or p1.is_verified == nil then nil else p1.is_verified,
		previous_usernames = if p1 == nil or p1.previous_usernames == nil then {} else p1.previous_usernames
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.user_id ~= nil then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var7 = protoModule.writeVarInt(var2, var3, self.user_id)
		buff = var2
		var1 = var3
	end
	if self.username ~= nil then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var9 = protoModule.writeString(var4, var5, self.username)
		buff = var4
		var1 = var5
	end
	if self.display_name ~= nil then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var11 = protoModule.writeString(var6, var7, self.display_name)
		buff = var6
		var1 = var7
	end
	if self.is_verified ~= nil then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.varint)
		var8, var13 = protoModule.writeVarInt(var8, var9, if self.is_verified then 1 else 0)
		buff = var8
		var1 = var9
	end
	if self.previous_usernames ~= nil and #self.previous_usernames > 0 then
		for i, v in self.previous_usernames do
			local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var10, var15 = protoModule.writeString(var10, var11, v)
			buff = var10
			var1 = var11
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
	local var12 = t_1.new()
	local var13 = 0
	while var13 < buffer.len(p1) do
		local _ = nil
		local var14 = nil
		local var15, var16, var17 = protoModule.readTag(p1, var13)
		local var18 = var15
		var14 = var16
		var13 = var17
		
		if var14 == protoModule.wireTypes.varint then
			if var18 == 1 then
				local _ = nil
				local var19, var20 = protoModule.readVarIntI64(p1, var13)
				var13 = var20
				var12.user_id = var19
			elseif var18 == 4 then
				local _ = nil
				local var21, var22 = protoModule.readVarInt(p1, var13)
				var13 = var22
				var12.is_verified = var21 ~= 0
			else
				local _ = nil
				local var23, var24 = protoModule.readVarInt(p1, var13)
				local _ = var23
				var13 = var24
			end
		end
		if var14 == protoModule.wireTypes.lengthDelimited then
			if var18 == 2 then
				local _ = nil
				local var25, var26 = protoModule.readBuffer(p1, var13)
				var13 = var26
				var12.username = buffer.tostring(var25)
			elseif var18 == 3 then
				local _ = nil
				local var27, var28 = protoModule.readBuffer(p1, var13)
				var13 = var28
				var12.display_name = buffer.tostring(var27)
			elseif var18 == 5 then
				local _ = nil
				local var29, var30 = protoModule.readBuffer(p1, var13)
				var13 = var30
				table.insert(var12.previous_usernames, buffer.tostring(var29))
			else
				local _ = nil
				local var31, var32 = protoModule.readVarInt(p1, var13)
				var13 = var32 + var31
			end
		elseif var14 == protoModule.wireTypes.i32 then
			local _ = nil
			local var33, var34 = protoModule.readFixed32(p1, var13)
			local _ = var33
			var13 = var34
		elseif var14 == protoModule.wireTypes.i64 then
			local _ = nil
			local var35, var36 = protoModule.readFixed64(p1, var13)
			local _ = var35
			var13 = var36
		else
			error("Unsupported wire type: " .. var19)
		end
	end
	return var12
end

function t_1:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id
	end
	if self.username ~= nil then
		t.username = self.username
	end
	if self.display_name ~= nil then
		t.displayName = self.display_name
	end
	if self.is_verified ~= nil then
		t.isVerified = self.is_verified
	end
	if self.previous_usernames ~= nil and #self.previous_usernames > 0 then
		local t_1 = {}
		
		for i, v in self.previous_usernames do
			table.insert(t_1, v)
		end
		t.previousUsernames = t_1
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var37 = t_1.new()
	
	if self.user_id ~= nil then
		var37.user_id = self.user_id
	end
	if self.userId ~= nil then
		var37.user_id = self.userId
	end
	if self.username ~= nil then
		var37.username = self.username
	end
	if self.display_name ~= nil then
		var37.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var37.display_name = self.displayName
	end
	if self.is_verified ~= nil then
		var37.is_verified = self.is_verified
	end
	if self.isVerified ~= nil then
		var37.is_verified = self.isVerified
	end
	if self.previous_usernames ~= nil then
		local t = {}
		
		for i, v in self.previous_usernames do
			table.insert(t, v)
		end
		var37.previous_usernames = t
	end
	if self.previousUsernames ~= nil then
		local t = {}
		
		for i, v in self.previousUsernames do
			table.insert(t, v)
		end
		var37.previous_usernames = t
	end
	return var37
end

t_1.descriptor = {
	name = "UserProfileData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserProfileData"
}
t.UserProfileData = t_1
typeRegistryModule.default:register(t.UserProfileData)

return { UserProfileData = t.UserProfileData }