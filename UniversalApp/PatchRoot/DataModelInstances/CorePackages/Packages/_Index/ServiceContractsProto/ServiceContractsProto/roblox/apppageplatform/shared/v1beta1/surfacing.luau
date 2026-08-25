local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	return setmetatable({
		kind = if p0 == nil or p0.kind == nil then nil else p0.kind
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var6 = 0
	
	if self.kind ~= nil and self.kind.type == "peek_view" then
		local var7 = self.kind.value:encode()
		local var8, var9 = protoModule.writeTag(buff, var6, 1, protoModule.wireTypes.lengthDelimited)
		var8, var9 = protoModule.writeBuffer(var8, var9, var7, buffer.len(var7))
		buff = var8
		var6 = var9
	end
	local buff_1 = buffer.create(var6)
	buffer.copy(buff_1, 0, buff, 0, var6)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
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
				var11.kind = { type = "peek_view", value = t.PeekView.decode(var20) }
			else
				local _ = nil
				local var22, var23 = protoModule.readVarInt(p1, var12)
				var12 = var23 + var22
			end
		elseif var13 == protoModule.wireTypes.i32 then
			local _ = nil
			local var24, var25 = protoModule.readFixed32(p1, var12)
			local _ = var24
			var12 = var25
		elseif var13 == protoModule.wireTypes.i64 then
			local _ = nil
			local var26, var27 = protoModule.readFixed64(p1, var12)
			local _ = var26
			var12 = var27
		else
			error("Unsupported wire type: " .. var13)
		end
	end
	return var11
end

function t_1:jsonEncode()
	local t = {}
	
	if self.kind ~= nil and self.kind.type == "peek_view" then
		t.peekView = self.kind.value:jsonEncode()
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref)
	local var29 = t_1.new()
	
	if self.peek_view ~= nil then
		var29.kind = {
			type = "peek_view",
			value = t.PeekView.jsonDecode(self.peek_view)
		}
	end
	if self.peekView ~= nil then
		var29.kind = {
			type = "peek_view",
			value = t.PeekView.jsonDecode(self.peekView)
		}
	end
	return var29
end

t_1.descriptor = {
	name = "Surfacing",
	fullName = "roblox.apppageplatform.shared.v1beta1.Surfacing"
}
t.Surfacing = t_1
typeRegistryModule.default:register(t.Surfacing)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		height_offset = if p2 == nil or p2.height_offset == nil then nil else p2.height_offset
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var31 = 0
	
	if self.height_offset ~= nil then
		local var32, var33 = protoModule.writeTag(buff, var31, 1, protoModule.wireTypes.varint)
		var32, var33 = protoModule.writeVarInt(var32, var33, self.height_offset)
		buff = var32
		var31 = var33
	end
	local buff_1 = buffer.create(var31)
	buffer.copy(buff_1, 0, buff, 0, var31)
	
	return buff_1
end

function t_2.decode(p3)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var35 = t_2.new()
	local var36 = 0
	while var36 < buffer.len(p3) do
		local _ = nil
		local _ = nil
		local var37, var38, var39 = protoModule.readTag(p3, var36)
		local var40 = var37
		local var41 = var38
		var36 = var39
		
		if var41 == protoModule.wireTypes.varint then
			if var40 == 1 then
				local _ = nil
				local var42, var43 = protoModule.readVarIntI32(p3, var36)
				var36 = var43
				var35.height_offset = var42
			else
				local _ = nil
				local var44, var45 = protoModule.readVarInt(p3, var36)
				local _ = var44
				var36 = var45
			end
		elseif var41 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var46, var47 = protoModule.readVarInt(p3, var36)
			var36 = var47 + var46
		elseif var41 == protoModule.wireTypes.i32 then
			local _ = nil
			local var48, var49 = protoModule.readFixed32(p3, var36)
			local _ = var48
			var36 = var49
		elseif var41 == protoModule.wireTypes.i64 then
			local _ = nil
			local var50, var51 = protoModule.readFixed64(p3, var36)
			local _ = var50
			var36 = var51
		else
			error("Unsupported wire type: " .. var41)
		end
	end
	return var35
end

function t_2:jsonEncode()
	local t = {}
	
	if self.height_offset ~= nil then
		t.heightOffset = self.height_offset
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref)
	local var53 = t_2.new()
	
	if self.height_offset ~= nil then
		var53.height_offset = self.height_offset
	end
	if self.heightOffset ~= nil then
		var53.height_offset = self.heightOffset
	end
	return var53
end

t_2.descriptor = {
	name = "PeekView",
	fullName = "roblox.apppageplatform.shared.v1beta1.PeekView"
}
t.PeekView = t_2
typeRegistryModule.default:register(t.PeekView)

return { Surfacing = t.Surfacing, PeekView = t.PeekView }