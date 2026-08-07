local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 47 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		user_id = if p0 == nil or p0.user_id == nil then nil else p0.user_id,
		username = if p0 == nil or p0.username == nil then nil else p0.username,
		display_name = if p0 == nil or p0.display_name == nil then nil else p0.display_name,
		is_verified = if p0 == nil or p0.is_verified == nil then nil else p0.is_verified,
		previous_usernames = if p0 == nil or p0.previous_usernames == nil then {} else p0.previous_usernames
	}, t_1)
end

function t_1:encode() --[[ line: 57 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.user_id ~= nil then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.varint)
		var6, var7 = protoModule.writeVarInt(var6, var7, self.user_id)
		buff = var6
		var5 = var7
	end
	if self.username ~= nil then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.lengthDelimited)
		var8, var9 = protoModule.writeString(var8, var9, self.username)
		buff = var8
		var5 = var9
	end
	if self.display_name ~= nil then
		local var10, var11 = protoModule.writeTag(buff, var5, 3, protoModule.wireTypes.lengthDelimited)
		var10, var11 = protoModule.writeString(var10, var11, self.display_name)
		buff = var10
		var5 = var11
	end
	if self.is_verified ~= nil then
		local var12, var13 = protoModule.writeTag(buff, var5, 4, protoModule.wireTypes.varint)
		var12, var13 = protoModule.writeVarInt(var12, var13, if self.is_verified then 1 else 0)
		buff = var12
		var5 = var13
	end
	if self.previous_usernames ~= nil and #self.previous_usernames > 0 then
		for i, v in self.previous_usernames do
			local var14, var15 = protoModule.writeTag(buff, var5, 5, protoModule.wireTypes.lengthDelimited)
			var14, var15 = protoModule.writeString(var14, var15, v)
			buff = var14
			var5 = var15
		end
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 93 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var17 = t_1.new()
	local var18 = 0
	while var18 < buffer.len(p1) do
		local _ = nil
		local var19 = nil
		local var20, var21, var22 = protoModule.readTag(p1, var18)
		local var23 = var20
		var19 = var21
		var18 = var22
		
		if var19 == protoModule.wireTypes.varint then
			if var23 == 1 then
				local _ = nil
				local var24, var25 = protoModule.readVarIntI64(p1, var18)
				var18 = var25
				var17.user_id = var24
			elseif var23 == 4 then
				local _ = nil
				local var26, var27 = protoModule.readVarInt(p1, var18)
				var18 = var27
				var17.is_verified = var26 ~= 0
			else
				local _ = nil
				local var28, var29 = protoModule.readVarInt(p1, var18)
				local _ = var28
				var18 = var29
			end
		end
		if var19 == protoModule.wireTypes.lengthDelimited then
			if var23 == 2 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var18)
				var18 = var31
				var17.username = buffer.tostring(var30)
			elseif var23 == 3 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var18)
				var18 = var33
				var17.display_name = buffer.tostring(var32)
			elseif var23 == 5 then
				local _ = nil
				local var34, var35 = protoModule.readBuffer(p1, var18)
				var18 = var35
				table.insert(var17.previous_usernames, buffer.tostring(var34))
			else
				local _ = nil
				local var36, var37 = protoModule.readVarInt(p1, var18)
				var18 = var37 + var36
			end
		elseif var19 == protoModule.wireTypes.i32 then
			local _ = nil
			local var38, var39 = protoModule.readFixed32(p1, var18)
			local _ = var38
			var18 = var39
		elseif var19 == protoModule.wireTypes.i64 then
			local _ = nil
			local var40, var41 = protoModule.readFixed64(p1, var18)
			local _ = var40
			var18 = var41
		else
			error("Unsupported wire type: " .. var19)
		end
	end
	return var17
end

function t_1:jsonEncode() --[[ line: 156 ]]
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

function t_1:jsonDecode() --[[ line: 186 ]]
	-- upvalues: t_1 (ref)
	local var44 = t_1.new()
	
	if self.user_id ~= nil then
		var44.user_id = self.user_id
	end
	if self.userId ~= nil then
		var44.user_id = self.userId
	end
	if self.username ~= nil then
		var44.username = self.username
	end
	if self.display_name ~= nil then
		var44.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var44.display_name = self.displayName
	end
	if self.is_verified ~= nil then
		var44.is_verified = self.is_verified
	end
	if self.isVerified ~= nil then
		var44.is_verified = self.isVerified
	end
	if self.previous_usernames ~= nil then
		local t = {}
		
		for i, v in self.previous_usernames do
			table.insert(t, v)
		end
		var44.previous_usernames = t
	end
	if self.previousUsernames ~= nil then
		local t = {}
		
		for i, v in self.previousUsernames do
			table.insert(t, v)
		end
		var44.previous_usernames = t
	end
	return var44
end

t_1.descriptor = {
	name = "UserProfileData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserProfileData"
}
t.UserProfileData = t_1
typeRegistryModule.default:register(t.UserProfileData)

return { UserProfileData = t.UserProfileData }