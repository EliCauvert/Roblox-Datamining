local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 44 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		name = if p0 == nil or p0.name == nil then "" else p0.name,
		description = if p0 == nil or p0.description == nil then "" else p0.description
	}, t_1)
end

function t_1:encode() --[[ line: 51 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.name ~= nil and self.name ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.lengthDelimited)
		var6, var7 = protoModule.writeString(var6, var7, self.name)
		buff = var6
		var5 = var7
	end
	if self.description ~= nil and self.description ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.lengthDelimited)
		var8, var9 = protoModule.writeString(var8, var9, self.description)
		buff = var8
		var5 = var9
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 70 ]]
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
			local _ = nil
			local var18, var19 = protoModule.readVarInt(p1, var12)
			local _ = var18
			var12 = var19
			continue
		end
		if var13 == protoModule.wireTypes.lengthDelimited then
			if var17 == 1 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var12)
				var12 = var21
				var11.name = buffer.tostring(var20)
			elseif var17 == 2 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var12)
				var12 = var23
				var11.description = buffer.tostring(var22)
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

function t_1:jsonEncode() --[[ line: 118 ]]
	local t = {}
	
	if self.name ~= nil and self.name ~= "" then
		t.name = self.name
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	return t
end

function t_1:jsonDecode() --[[ line: 132 ]]
	-- upvalues: t_1 (ref)
	local var31 = t_1.new()
	
	if self.name ~= nil then
		var31.name = self.name
	end
	if self.description ~= nil then
		var31.description = self.description
	end
	return var31
end

t_1.descriptor = {
	name = "ClientSideHydrationField",
	fullName = "roblox.apppageplatform.shared.v1beta1.ClientSideHydrationField"
}
t.ClientSideHydrationField = t_1
typeRegistryModule.default:register(t.ClientSideHydrationField)

return { ClientSideHydrationField = t.ClientSideHydrationField }