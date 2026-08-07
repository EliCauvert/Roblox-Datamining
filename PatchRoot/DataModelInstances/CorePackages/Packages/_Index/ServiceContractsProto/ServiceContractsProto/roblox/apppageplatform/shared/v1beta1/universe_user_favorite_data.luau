-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:18 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 42 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		is_favorited = if p0 == nil or p0.is_favorited == nil then false else p0.is_favorited
	}, t_1)
end

function t_1:encode() --[[ line: 48 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.is_favorited then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.varint)
		var6, var7 = protoModule.writeVarInt(var6, var7, if self.is_favorited then 1 else 0)
		buff = var6
		var5 = var7
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 62 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var9 = t_1.new()
	local var10 = 0
	while var10 < buffer.len(p1) do
		local _ = nil
		local _ = nil
		local var11, var12, var13 = protoModule.readTag(p1, var10)
		local var14 = var11
		local var15 = var12
		var10 = var13
		
		if var15 == protoModule.wireTypes.varint then
			if var14 == 1 then
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var10)
				var10 = var17
				var9.is_favorited = var16 ~= 0
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var10)
				local _ = var18
				var10 = var19
			end
		elseif var15 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var20, var21 = protoModule.readVarInt(p1, var10)
			var10 = var21 + var20
		elseif var15 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var10)
			local _ = var22
			var10 = var23
		elseif var15 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var10)
			local _ = var24
			var10 = var25
		else
			error("Unsupported wire type: " .. var15)
		end
	end
	return var9
end

function t_1:jsonEncode() --[[ line: 105 ]]
	local t = {}
	
	if self.is_favorited then
		t.isFavorited = self.is_favorited
	end
	return t
end

function t_1:jsonDecode() --[[ line: 115 ]]
	-- upvalues: t_1 (ref)
	local var27 = t_1.new()
	
	if self.is_favorited ~= nil then
		var27.is_favorited = self.is_favorited
	end
	if self.isFavorited ~= nil then
		var27.is_favorited = self.isFavorited
	end
	return var27
end

t_1.descriptor = {
	name = "UniverseUserFavoriteData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseUserFavoriteData"
}
t.UniverseUserFavoriteData = t_1
typeRegistryModule.default:register(t.UniverseUserFavoriteData)

return { UniverseUserFavoriteData = t.UniverseUserFavoriteData }