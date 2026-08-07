local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local capabilityModule = require(script.Parent.capability)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 43 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		enabled_capabilities = if p0 == nil or p0.enabled_capabilities == nil then {} else p0.enabled_capabilities,
		proto_version = if p0 == nil or p0.proto_version == nil then "" else p0.proto_version
	}, t_1)
end

function t_1:encode() --[[ line: 52 ]]
	-- upvalues: protoModule (ref), capabilityModule (ref)
	local buff = buffer.create(0)
	local var6 = 0
	
	if self.enabled_capabilities ~= nil and #self.enabled_capabilities > 0 then
		for i, v in self.enabled_capabilities do
			local var7, var8 = protoModule.writeTag(buff, var6, 1, protoModule.wireTypes.varint)
			var7, var8 = protoModule.writeVarInt(var7, var8, capabilityModule.Capability.toNumber(v))
			buff = var7
			var6 = var8
		end
	end
	if self.proto_version ~= nil and self.proto_version ~= "" then
		local var9, var10 = protoModule.writeTag(buff, var6, 2, protoModule.wireTypes.lengthDelimited)
		var9, var10 = protoModule.writeString(var9, var10, self.proto_version)
		buff = var9
		var6 = var10
	end
	local buff_1 = buffer.create(var6)
	buffer.copy(buff_1, 0, buff, 0, var6)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 77 ]]
	-- upvalues: t_1 (ref), protoModule (ref), capabilityModule (ref)
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
				local var19, var20 = protoModule.readVarIntI32(p1, var13)
				local var21 = var19
				var13 = var20
				table.insert(var12.enabled_capabilities, capabilityModule.Capability.fromNumber(var21) or var21)
			else
				local _ = nil
				local var22, var23 = protoModule.readVarInt(p1, var13)
				local _ = var22
				var13 = var23
			end
		end
		if var14 == protoModule.wireTypes.lengthDelimited then
			if var18 == 2 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var13)
				var13 = var25
				var12.proto_version = buffer.tostring(var24)
			else
				local _ = nil
				local var26, var27 = protoModule.readVarInt(p1, var13)
				var13 = var27 + var26
			end
		elseif var14 == protoModule.wireTypes.i32 then
			local _ = nil
			local var28, var29 = protoModule.readFixed32(p1, var13)
			local _ = var28
			var13 = var29
		elseif var14 == protoModule.wireTypes.i64 then
			local _ = nil
			local var30, var31 = protoModule.readFixed64(p1, var13)
			local _ = var30
			var13 = var31
		else
			error("Unsupported wire type: " .. var14)
		end
	end
	return var12
end

function t_1:jsonEncode() --[[ line: 128 ]]
	-- upvalues: capabilityModule (ref)
	local t = {}
	
	if self.enabled_capabilities ~= nil and #self.enabled_capabilities > 0 then
		local t_1 = {}
		
		for i, v in self.enabled_capabilities do
			table.insert(t_1, if typeof(v) == "number" then v else capabilityModule.Capability.toNumber(v))
		end
		t.enabledCapabilities = t_1
	end
	if self.proto_version ~= nil and self.proto_version ~= "" then
		t.protoVersion = self.proto_version
	end
	return t
end

function t_1:jsonDecode() --[[ line: 151 ]]
	-- upvalues: t_1 (ref), capabilityModule (ref)
	local var34 = t_1.new()
	
	if self.enabled_capabilities ~= nil then
		local t = {}
		
		for i, v in self.enabled_capabilities do
			table.insert(t, if typeof(v) == "number" then capabilityModule.Capability.fromNumber(v) or v else capabilityModule.Capability.fromName(v) or v)
		end
		var34.enabled_capabilities = t
	end
	if self.enabledCapabilities ~= nil then
		local t = {}
		
		for i, v in self.enabledCapabilities do
			table.insert(t, if typeof(v) == "number" then capabilityModule.Capability.fromNumber(v) or v else capabilityModule.Capability.fromName(v) or v)
		end
		var34.enabled_capabilities = t
	end
	if self.proto_version ~= nil then
		var34.proto_version = self.proto_version
	end
	if self.protoVersion ~= nil then
		var34.proto_version = self.protoVersion
	end
	return var34
end

t_1.descriptor = {
	name = "ClientCapabilities",
	fullName = "roblox.apppageplatform.shared.v1beta1.ClientCapabilities"
}
t.ClientCapabilities = t_1
typeRegistryModule.default:register(t.ClientCapabilities)

return { ClientCapabilities = t.ClientCapabilities }