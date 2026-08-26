local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil and self.kind.type == "peek_view" then
		local var2 = self.kind.value:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var9 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
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
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.kind = { type = "peek_view", value = t.PeekView.decode(var10) }
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var13)
		end
	end
	return var1
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
	local var18 = t_1.new()
	
	if self.peek_view ~= nil then
		var18.kind = {
			type = "peek_view",
			value = t.PeekView.jsonDecode(self.peek_view)
		}
	end
	if self.peekView ~= nil then
		var18.kind = {
			type = "peek_view",
			value = t.PeekView.jsonDecode(self.peekView)
		}
	end
	return var18
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
	local var18 = 0
	
	if self.height_offset ~= nil then
		local var19, var20 = protoModule.writeTag(buff, var18, 1, protoModule.wireTypes.varint)
		var19, var33 = protoModule.writeVarInt(var19, var20, self.height_offset)
		buff = var19
		var18 = var20
	end
	local buff_1 = buffer.create(var18)
	buffer.copy(buff_1, 0, buff, 0, var18)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var18 = t_2.new()
	local var19 = 0
	while var19 < buffer.len(p2) do
		local _ = nil
		local _ = nil
		local var20, var21, var22 = protoModule.readTag(p2, var19)
		local var23 = var20
		local var24 = var21
		var19 = var22
		
		if var24 == protoModule.wireTypes.varint then
			if var23 == 1 then
				local _ = nil
				local var25, var26 = protoModule.readVarIntI32(p2, var19)
				var19 = var26
				var18.height_offset = var25
			else
				local _ = nil
				local var27, var28 = protoModule.readVarInt(p2, var19)
				local _ = var27
				var19 = var28
			end
		elseif var24 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var29, var30 = protoModule.readVarInt(p2, var19)
			var19 = var30 + var29
		elseif var24 == protoModule.wireTypes.i32 then
			local _ = nil
			local var31, var32 = protoModule.readFixed32(p2, var19)
			local _ = var31
			var19 = var32
		elseif var24 == protoModule.wireTypes.i64 then
			local _ = nil
			local var33, var34 = protoModule.readFixed64(p2, var19)
			local _ = var33
			var19 = var34
		else
			error("Unsupported wire type: " .. var41)
		end
	end
	return var18
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
	local var35 = t_2.new()
	
	if self.height_offset ~= nil then
		var35.height_offset = self.height_offset
	end
	if self.heightOffset ~= nil then
		var35.height_offset = self.heightOffset
	end
	return var35
end

t_2.descriptor = {
	name = "PeekView",
	fullName = "roblox.apppageplatform.shared.v1beta1.PeekView"
}
t.PeekView = t_2
typeRegistryModule.default:register(t.PeekView)

return { Surfacing = t.Surfacing, PeekView = t.PeekView }