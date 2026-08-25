local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	return setmetatable({
		is_playable = if p0 == nil or p0.is_playable == nil then false else p0.is_playable,
		playability_status = if p0 == nil or p0.playability_status == nil then "" else p0.playability_status
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.is_playable then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.varint)
		var6, var7 = protoModule.writeVarInt(var6, var7, if self.is_playable then 1 else 0)
		buff = var6
		var5 = var7
	end
	if self.playability_status ~= nil and self.playability_status ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.lengthDelimited)
		var8, var9 = protoModule.writeString(var8, var9, self.playability_status)
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
			if var17 == 1 then
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var12)
				var12 = var19
				var11.is_playable = var18 ~= 0
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var12)
				local _ = var20
				var12 = var21
			end
		end
		if var13 == protoModule.wireTypes.lengthDelimited then
			if var17 == 2 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var12)
				var12 = var23
				var11.playability_status = buffer.tostring(var22)
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
	
	if self.is_playable then
		t.isPlayable = self.is_playable
	end
	if self.playability_status ~= nil and self.playability_status ~= "" then
		t.playabilityStatus = self.playability_status
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var31 = t_1.new()
	
	if self.is_playable ~= nil then
		var31.is_playable = self.is_playable
	end
	if self.isPlayable ~= nil then
		var31.is_playable = self.isPlayable
	end
	if self.playability_status ~= nil then
		var31.playability_status = self.playability_status
	end
	if self.playabilityStatus ~= nil then
		var31.playability_status = self.playabilityStatus
	end
	return var31
end

t_1.descriptor = {
	name = "PlayabilityData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PlayabilityData"
}
t.PlayabilityData = t_1
typeRegistryModule.default:register(t.PlayabilityData)

return { PlayabilityData = t.PlayabilityData }