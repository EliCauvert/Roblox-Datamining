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
	
	if self.kind ~= nil then
		if self.kind.type == "peek_view" then
			local var2 = self.kind.value:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var10 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		elseif self.kind.type == "full_page" then
			local var5 = self.kind.value:encode()
			local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var6, var13 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
			buff = var6
			var1 = var7
		end
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
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.kind = { type = "full_page", value = t.FullPage.decode(var12) }
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var17)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "peek_view" then
			t.peekView = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "full_page" then
			t.fullPage = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref)
	local var20 = t_1.new()
	
	if self.peek_view ~= nil then
		var20.kind = {
			type = "peek_view",
			value = t.PeekView.jsonDecode(self.peek_view)
		}
	end
	if self.peekView ~= nil then
		var20.kind = {
			type = "peek_view",
			value = t.PeekView.jsonDecode(self.peekView)
		}
	end
	if self.full_page ~= nil then
		var20.kind = {
			type = "full_page",
			value = t.FullPage.jsonDecode(self.full_page)
		}
	end
	if self.fullPage ~= nil then
		var20.kind = {
			type = "full_page",
			value = t.FullPage.jsonDecode(self.fullPage)
		}
	end
	return var20
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
	local var20 = 0
	
	if self.height_offset ~= nil then
		local var21, var22 = protoModule.writeTag(buff, var20, 1, protoModule.wireTypes.varint)
		var21, var39 = protoModule.writeVarInt(var21, var22, self.height_offset)
		buff = var21
		var20 = var22
	end
	local buff_1 = buffer.create(var20)
	buffer.copy(buff_1, 0, buff, 0, var20)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var20 = t_2.new()
	local var21 = 0
	while var21 < buffer.len(p2) do
		local _ = nil
		local _ = nil
		local var22, var23, var24 = protoModule.readTag(p2, var21)
		local var25 = var22
		local var26 = var23
		var21 = var24
		
		if var26 == protoModule.wireTypes.varint then
			if var25 == 1 then
				local _ = nil
				local var27, var28 = protoModule.readVarIntI32(p2, var21)
				var21 = var28
				var20.height_offset = var27
			else
				local _ = nil
				local var29, var30 = protoModule.readVarInt(p2, var21)
				local _ = var29
				var21 = var30
			end
		elseif var26 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var31, var32 = protoModule.readVarInt(p2, var21)
			var21 = var32 + var31
		elseif var26 == protoModule.wireTypes.i32 then
			local _ = nil
			local var33, var34 = protoModule.readFixed32(p2, var21)
			local _ = var33
			var21 = var34
		elseif var26 == protoModule.wireTypes.i64 then
			local _ = nil
			local var35, var36 = protoModule.readFixed64(p2, var21)
			local _ = var35
			var21 = var36
		else
			error("Unsupported wire type: " .. var47)
		end
	end
	return var20
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
	local var37 = t_2.new()
	
	if self.height_offset ~= nil then
		var37.height_offset = self.height_offset
	end
	if self.heightOffset ~= nil then
		var37.height_offset = self.heightOffset
	end
	return var37
end

t_2.descriptor = {
	name = "PeekView",
	fullName = "roblox.apppageplatform.shared.v1beta1.PeekView"
}
t.PeekView = t_2
typeRegistryModule.default:register(t.PeekView)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		content_top_padding = if p3 == nil or p3.content_top_padding == nil then nil else p3.content_top_padding
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var37 = 0
	
	if self.content_top_padding ~= nil then
		local var38, var39 = protoModule.writeTag(buff, var37, 1, protoModule.wireTypes.varint)
		var38, var63 = protoModule.writeVarInt(var38, var39, self.content_top_padding)
		buff = var38
		var37 = var39
	end
	local buff_1 = buffer.create(var37)
	buffer.copy(buff_1, 0, buff, 0, var37)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref)
	local var37 = t_3.new()
	local var38 = 0
	while var38 < buffer.len(p3) do
		local _ = nil
		local _ = nil
		local var39, var40, var41 = protoModule.readTag(p3, var38)
		local var42 = var39
		local var43 = var40
		var38 = var41
		
		if var43 == protoModule.wireTypes.varint then
			if var42 == 1 then
				local _ = nil
				local var44, var45 = protoModule.readVarIntI32(p3, var38)
				var38 = var45
				var37.content_top_padding = var44
			else
				local _ = nil
				local var46, var47 = protoModule.readVarInt(p3, var38)
				local _ = var46
				var38 = var47
			end
		elseif var43 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var48, var49 = protoModule.readVarInt(p3, var38)
			var38 = var49 + var48
		elseif var43 == protoModule.wireTypes.i32 then
			local _ = nil
			local var50, var51 = protoModule.readFixed32(p3, var38)
			local _ = var50
			var38 = var51
		elseif var43 == protoModule.wireTypes.i64 then
			local _ = nil
			local var52, var53 = protoModule.readFixed64(p3, var38)
			local _ = var52
			var38 = var53
		else
			error("Unsupported wire type: " .. var71)
		end
	end
	return var37
end

function t_3:jsonEncode()
	local t = {}
	
	if self.content_top_padding ~= nil then
		t.contentTopPadding = self.content_top_padding
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref)
	local var54 = t_3.new()
	
	if self.content_top_padding ~= nil then
		var54.content_top_padding = self.content_top_padding
	end
	if self.contentTopPadding ~= nil then
		var54.content_top_padding = self.contentTopPadding
	end
	return var54
end

t_3.descriptor = {
	name = "FullPage",
	fullName = "roblox.apppageplatform.shared.v1beta1.FullPage"
}
t.FullPage = t_3
typeRegistryModule.default:register(t.FullPage)

return {
	Surfacing = t.Surfacing,
	PeekView = t.PeekView,
	FullPage = t.FullPage
}