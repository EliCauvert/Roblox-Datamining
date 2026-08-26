local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		creator_type = if p1 == nil or p1.creator_type == nil then "" else p1.creator_type,
		creator_id = if p1 == nil or p1.creator_id == nil then 0 else p1.creator_id,
		creator_name = if p1 == nil or p1.creator_name == nil then "" else p1.creator_name,
		is_verified = if p1 == nil or p1.is_verified == nil then false else p1.is_verified
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.creator_type ~= nil and self.creator_type ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var7 = protoModule.writeString(var2, var3, self.creator_type)
		buff = var2
		var1 = var3
	end
	if self.creator_id ~= nil and self.creator_id ~= 0 then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var9 = protoModule.writeVarInt(var4, var5, self.creator_id)
		buff = var4
		var1 = var5
	end
	if self.creator_name ~= nil and self.creator_name ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var11 = protoModule.writeString(var6, var7, self.creator_name)
		buff = var6
		var1 = var7
	end
	if self.is_verified then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.varint)
		var8, var13 = protoModule.writeVarInt(var8, var9, if self.is_verified then 1 else 0)
		buff = var8
		var1 = var9
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
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.creator_id = var8
			elseif var7 == 4 then
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				var2 = var11
				var1.is_verified = var10 ~= 0
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				local _ = var12
				var2 = var13
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.creator_type = buffer.tostring(var14)
			elseif var7 == 3 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.creator_name = buffer.tostring(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var17)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.creator_type ~= nil and self.creator_type ~= "" then
		t.creatorType = self.creator_type
	end
	if self.creator_id ~= nil and self.creator_id ~= 0 then
		t.creatorId = self.creator_id
	end
	if self.creator_name ~= nil and self.creator_name ~= "" then
		t.creatorName = self.creator_name
	end
	if self.is_verified then
		t.isVerified = self.is_verified
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var24 = t_1.new()
	
	if self.creator_type ~= nil then
		var24.creator_type = self.creator_type
	end
	if self.creatorType ~= nil then
		var24.creator_type = self.creatorType
	end
	if self.creator_id ~= nil then
		var24.creator_id = self.creator_id
	end
	if self.creatorId ~= nil then
		var24.creator_id = self.creatorId
	end
	if self.creator_name ~= nil then
		var24.creator_name = self.creator_name
	end
	if self.creatorName ~= nil then
		var24.creator_name = self.creatorName
	end
	if self.is_verified ~= nil then
		var24.is_verified = self.is_verified
	end
	if self.isVerified ~= nil then
		var24.is_verified = self.isVerified
	end
	return var24
end

t_1.descriptor = {
	name = "CreatorData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CreatorData"
}
t.CreatorData = t_1
typeRegistryModule.default:register(t.CreatorData)

return { CreatorData = t.CreatorData }