local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local surfacingModule = require(script.Parent.surfacing)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component,
		identifier = if p1 == nil or p1.identifier == nil then "" else p1.identifier,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		category = if p1 == nil or p1.category == nil then "" else p1.category,
		surfacing = if p1 == nil or p1.surfacing == nil then nil else p1.surfacing
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var8 = protoModule.writeString(var2, var3, self.roblox_component)
		buff = var2
		var1 = var3
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var10 = protoModule.writeString(var4, var5, self.identifier)
		buff = var4
		var1 = var5
	end
	if self.title ~= nil and self.title ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var12 = protoModule.writeString(var6, var7, self.title)
		buff = var6
		var1 = var7
	end
	if self.category ~= nil and self.category ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var14 = protoModule.writeString(var8, var9, self.category)
		buff = var8
		var1 = var9
	end
	if self.surfacing ~= nil then
		local var10 = self.surfacing:encode()
		local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var11, var17 = protoModule.writeBuffer(var11, var12, var10, buffer.len(var10))
		buff = var11
		var1 = var12
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), surfacingModule (ref)
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
				var1.roblox_component = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.identifier = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.title = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.category = buffer.tostring(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.surfacing = surfacingModule.Surfacing.decode(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var21)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		t.identifier = self.identifier
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.category ~= nil and self.category ~= "" then
		t.category = self.category
	end
	if self.surfacing ~= nil then
		t.surfacing = self.surfacing:jsonEncode()
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), surfacingModule (ref)
	local var26 = t_1.new()
	
	if self.roblox_component ~= nil then
		var26.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var26.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var26.identifier = self.identifier
	end
	if self.title ~= nil then
		var26.title = self.title
	end
	if self.category ~= nil then
		var26.category = self.category
	end
	if self.surfacing ~= nil then
		var26.surfacing = surfacingModule.Surfacing.jsonDecode(self.surfacing)
	end
	return var26
end

t_1.descriptor = {
	name = "PageEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageEntry"
}
t.PageEntry = t_1
typeRegistryModule.default:register(t.PageEntry)

return { PageEntry = t.PageEntry }