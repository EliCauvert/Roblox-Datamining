local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p0 == nil or p0.id == nil then "" else p0.id,
		creator_name = if p0 == nil or p0.creator_name == nil then nil else p0.creator_name,
		creator_has_verified_badge = if p0 == nil or p0.creator_has_verified_badge == nil then nil else p0.creator_has_verified_badge,
		price = if p0 == nil or p0.price == nil then nil else p0.price
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.lengthDelimited)
		var6, var7 = protoModule.writeString(var6, var7, self.id)
		buff = var6
		var5 = var7
	end
	if self.creator_name ~= nil then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.lengthDelimited)
		var8, var9 = protoModule.writeString(var8, var9, self.creator_name)
		buff = var8
		var5 = var9
	end
	if self.creator_has_verified_badge ~= nil then
		local var10, var11 = protoModule.writeTag(buff, var5, 3, protoModule.wireTypes.varint)
		var10, var11 = protoModule.writeVarInt(var10, var11, if self.creator_has_verified_badge then 1 else 0)
		buff = var10
		var5 = var11
	end
	if self.price ~= nil then
		local var12, var13 = protoModule.writeTag(buff, var5, 4, protoModule.wireTypes.varint)
		var12, var13 = protoModule.writeVarInt(var12, var13, self.price)
		buff = var12
		var5 = var13
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
	local var15 = t_1.new()
	local var16 = 0
	while var16 < buffer.len(p1) do
		local _ = nil
		local var17 = nil
		local var18, var19, var20 = protoModule.readTag(p1, var16)
		local var21 = var18
		var17 = var19
		var16 = var20
		
		if var17 == protoModule.wireTypes.varint then
			if var21 == 3 then
				local _ = nil
				local var22, var23 = protoModule.readVarInt(p1, var16)
				var16 = var23
				var15.creator_has_verified_badge = var22 ~= 0
			elseif var21 == 4 then
				local _ = nil
				local var24, var25 = protoModule.readVarIntI64(p1, var16)
				var16 = var25
				var15.price = var24
			else
				local _ = nil
				local var26, var27 = protoModule.readVarInt(p1, var16)
				local _ = var26
				var16 = var27
			end
		end
		if var17 == protoModule.wireTypes.lengthDelimited then
			if var21 == 1 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var16)
				var16 = var29
				var15.id = buffer.tostring(var28)
			elseif var21 == 2 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var16)
				var16 = var31
				var15.creator_name = buffer.tostring(var30)
			else
				local _ = nil
				local var32, var33 = protoModule.readVarInt(p1, var16)
				var16 = var33 + var32
			end
		elseif var17 == protoModule.wireTypes.i32 then
			local _ = nil
			local var34, var35 = protoModule.readFixed32(p1, var16)
			local _ = var34
			var16 = var35
		elseif var17 == protoModule.wireTypes.i64 then
			local _ = nil
			local var36, var37 = protoModule.readFixed64(p1, var16)
			local _ = var36
			var16 = var37
		else
			error("Unsupported wire type: " .. var17)
		end
	end
	return var15
end

function t_1:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.creator_name ~= nil then
		t.creatorName = self.creator_name
	end
	if self.creator_has_verified_badge ~= nil then
		t.creatorHasVerifiedBadge = self.creator_has_verified_badge
	end
	if self.price ~= nil then
		t.price = self.price
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var39 = t_1.new()
	
	if self.id ~= nil then
		var39.id = self.id
	end
	if self.creator_name ~= nil then
		var39.creator_name = self.creator_name
	end
	if self.creatorName ~= nil then
		var39.creator_name = self.creatorName
	end
	if self.creator_has_verified_badge ~= nil then
		var39.creator_has_verified_badge = self.creator_has_verified_badge
	end
	if self.creatorHasVerifiedBadge ~= nil then
		var39.creator_has_verified_badge = self.creatorHasVerifiedBadge
	end
	if self.price ~= nil then
		var39.price = self.price
	end
	return var39
end

t_1.descriptor = {
	name = "MarketplaceLookData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceLookData"
}
t.MarketplaceLookData = t_1
typeRegistryModule.default:register(t.MarketplaceLookData)

return { MarketplaceLookData = t.MarketplaceLookData }