-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:34 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentTypeModule = require(script.Parent.hydration_content_type)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 75 ]]
	-- upvalues: hydrationContentTypeModule (ref), t_1 (ref)
	return setmetatable({
		content_type = if p0 == nil or p0.content_type == nil then assert(hydrationContentTypeModule.HydrationContentType.fromNumber(0), "Enum has no 0 default") else p0.content_type,
		id_binding = if p0 == nil or p0.id_binding == nil then nil else p0.id_binding,
		alias = if p0 == nil or p0.alias == nil then "" else p0.alias,
		client_fetch = if p0 == nil or p0.client_fetch == nil then false else p0.client_fetch,
		required_fields = if p0 == nil or p0.required_fields == nil then {} else p0.required_fields,
		required = if p0 == nil or p0.required == nil then false else p0.required,
		client_hints = if p0 == nil or p0.client_hints == nil then {} else p0.client_hints
	}, t_1)
end

function t_1:encode() --[[ line: 92 ]]
	-- upvalues: hydrationContentTypeModule (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var7 = 0
	
	if self.content_type ~= nil and (self.content_type ~= nil and self.content_type ~= 0 or self.content_type ~= hydrationContentTypeModule.HydrationContentType.fromNumber(0)) then
		local var8, var9 = protoModule.writeTag(buff, var7, 1, protoModule.wireTypes.varint)
		var8, var9 = protoModule.writeVarInt(var8, var9, hydrationContentTypeModule.HydrationContentType.toNumber(self.content_type))
		buff = var8
		var7 = var9
	end
	if self.id_binding ~= nil then
		local var10 = self.id_binding:encode()
		local var11, var12 = protoModule.writeTag(buff, var7, 2, protoModule.wireTypes.lengthDelimited)
		var11, var12 = protoModule.writeBuffer(var11, var12, var10, buffer.len(var10))
		buff = var11
		var7 = var12
	end
	if self.alias ~= nil and self.alias ~= "" then
		local var13, var14 = protoModule.writeTag(buff, var7, 3, protoModule.wireTypes.lengthDelimited)
		var13, var14 = protoModule.writeString(var13, var14, self.alias)
		buff = var13
		var7 = var14
	end
	if self.client_fetch then
		local var15, var16 = protoModule.writeTag(buff, var7, 4, protoModule.wireTypes.varint)
		var15, var16 = protoModule.writeVarInt(var15, var16, if self.client_fetch then 1 else 0)
		buff = var15
		var7 = var16
	end
	if self.required_fields ~= nil and #self.required_fields > 0 then
		for i, v in self.required_fields do
			local var17, var18 = protoModule.writeTag(buff, var7, 5, protoModule.wireTypes.lengthDelimited)
			var17, var18 = protoModule.writeString(var17, var18, v)
			buff = var17
			var7 = var18
		end
	end
	if self.required then
		local var19, var20 = protoModule.writeTag(buff, var7, 6, protoModule.wireTypes.varint)
		var19, var20 = protoModule.writeVarInt(var19, var20, if self.required then 1 else 0)
		buff = var19
		var7 = var20
	end
	if self.client_hints ~= nil and #self.client_hints > 0 then
		for i, v in self.client_hints do
			local var21, var22 = protoModule.writeTag(buff, var7, 7, protoModule.wireTypes.lengthDelimited)
			var21, var22 = protoModule.writeString(var21, var22, v)
			buff = var21
			var7 = var22
		end
	end
	local buff_1 = buffer.create(var7)
	buffer.copy(buff_1, 0, buff, 0, var7)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 154 ]]
	-- upvalues: t_1 (ref), protoModule (ref), hydrationContentTypeModule (ref), t (ref)
	local var24 = t_1.new()
	local var25 = 0
	while var25 < buffer.len(p1) do
		local _ = nil
		local var26 = nil
		local var27, var28, var29 = protoModule.readTag(p1, var25)
		local var30 = var27
		var26 = var28
		var25 = var29
		
		if var26 == protoModule.wireTypes.varint then
			if var30 == 1 then
				local _ = nil
				local var31, var32 = protoModule.readVarIntI32(p1, var25)
				local var33 = var31
				var25 = var32
				var24.content_type = hydrationContentTypeModule.HydrationContentType.fromNumber(var33) or var33
			elseif var30 == 4 then
				local _ = nil
				local var34, var35 = protoModule.readVarInt(p1, var25)
				var25 = var35
				var24.client_fetch = var34 ~= 0
			elseif var30 == 6 then
				local _ = nil
				local var36, var37 = protoModule.readVarInt(p1, var25)
				var25 = var37
				var24.required = var36 ~= 0
			else
				local _ = nil
				local var38, var39 = protoModule.readVarInt(p1, var25)
				local _ = var38
				var25 = var39
			end
		end
		if var26 == protoModule.wireTypes.lengthDelimited then
			if var30 == 2 then
				local _ = nil
				local var40, var41 = protoModule.readBuffer(p1, var25)
				var25 = var41
				var24.id_binding = t.IdBinding.decode(var40)
			elseif var30 == 3 then
				local _ = nil
				local var42, var43 = protoModule.readBuffer(p1, var25)
				var25 = var43
				var24.alias = buffer.tostring(var42)
			elseif var30 == 5 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p1, var25)
				var25 = var45
				table.insert(var24.required_fields, buffer.tostring(var44))
			elseif var30 == 7 then
				local _ = nil
				local var46, var47 = protoModule.readBuffer(p1, var25)
				var25 = var47
				table.insert(var24.client_hints, buffer.tostring(var46))
			else
				local _ = nil
				local var48, var49 = protoModule.readVarInt(p1, var25)
				var25 = var49 + var48
			end
		elseif var26 == protoModule.wireTypes.i32 then
			local _ = nil
			local var50, var51 = protoModule.readFixed32(p1, var25)
			local _ = var50
			var25 = var51
		elseif var26 == protoModule.wireTypes.i64 then
			local _ = nil
			local var52, var53 = protoModule.readFixed64(p1, var25)
			local _ = var52
			var25 = var53
		else
			error("Unsupported wire type: " .. var26)
		end
	end
	return var24
end

function t_1:jsonEncode() --[[ line: 231 ]]
	-- upvalues: hydrationContentTypeModule (ref)
	local t = {}
	
	if self.content_type ~= nil and (self.content_type ~= nil and self.content_type ~= 0 or self.content_type ~= hydrationContentTypeModule.HydrationContentType.fromNumber(0)) then
		t.contentType = if typeof(self.content_type) == "number" then self.content_type else hydrationContentTypeModule.HydrationContentType.toNumber(self.content_type)
	end
	if self.id_binding ~= nil then
		t.idBinding = self.id_binding:jsonEncode()
	end
	if self.alias ~= nil and self.alias ~= "" then
		t.alias = self.alias
	end
	if self.client_fetch then
		t.clientFetch = self.client_fetch
	end
	if self.required_fields ~= nil and #self.required_fields > 0 then
		local t_1 = {}
		
		for i, v in self.required_fields do
			table.insert(t_1, v)
		end
		t.requiredFields = t_1
	end
	if self.required then
		t.required = self.required
	end
	if self.client_hints ~= nil and #self.client_hints > 0 then
		local t_1 = {}
		
		for i, v in self.client_hints do
			table.insert(t_1, v)
		end
		t.clientHints = t_1
	end
	return t
end

function t_1:jsonDecode() --[[ line: 284 ]]
	-- upvalues: t_1 (ref), hydrationContentTypeModule (ref), t (ref)
	local var57 = t_1.new()
	
	if self.content_type ~= nil then
		var57.content_type = if typeof(self.content_type) == "number" then hydrationContentTypeModule.HydrationContentType.fromNumber(self.content_type) or self.content_type else hydrationContentTypeModule.HydrationContentType.fromName(self.content_type) or self.content_type
	end
	if self.contentType ~= nil then
		var57.content_type = if typeof(self.contentType) == "number" then hydrationContentTypeModule.HydrationContentType.fromNumber(self.contentType) or self.contentType else hydrationContentTypeModule.HydrationContentType.fromName(self.contentType) or self.contentType
	end
	if self.id_binding ~= nil then
		var57.id_binding = t.IdBinding.jsonDecode(self.id_binding)
	end
	if self.idBinding ~= nil then
		var57.id_binding = t.IdBinding.jsonDecode(self.idBinding)
	end
	if self.alias ~= nil then
		var57.alias = self.alias
	end
	if self.client_fetch ~= nil then
		var57.client_fetch = self.client_fetch
	end
	if self.clientFetch ~= nil then
		var57.client_fetch = self.clientFetch
	end
	if self.required_fields ~= nil then
		local t_2 = {}
		
		for i, v in self.required_fields do
			table.insert(t_2, v)
		end
		var57.required_fields = t_2
	end
	if self.requiredFields ~= nil then
		local t_2 = {}
		
		for i, v in self.requiredFields do
			table.insert(t_2, v)
		end
		var57.required_fields = t_2
	end
	if self.required ~= nil then
		var57.required = self.required
	end
	if self.client_hints ~= nil then
		local t_2 = {}
		
		for i, v in self.client_hints do
			table.insert(t_2, v)
		end
		var57.client_hints = t_2
	end
	if self.clientHints ~= nil then
		local t_2 = {}
		
		for i, v in self.clientHints do
			table.insert(t_2, v)
		end
		var57.client_hints = t_2
	end
	return var57
end

t_1.descriptor = {
	name = "HydrationDataSpec",
	fullName = "roblox.apppageplatform.shared.v1beta1.HydrationDataSpec"
}
t.HydrationDataSpec = t_1
typeRegistryModule.default:register(t.HydrationDataSpec)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 384 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		kind = if p2 == nil or p2.kind == nil then nil else p2.kind
	}, t_2)
end

function t_2:encode() --[[ line: 390 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var63 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var64, var65 = protoModule.writeTag(buff, var63, 1, protoModule.wireTypes.lengthDelimited)
			var64, var65 = protoModule.writeString(var64, var65, self.kind.value)
			buff = var64
			var63 = var65
		elseif self.kind.type == "input_path" then
			local var66, var67 = protoModule.writeTag(buff, var63, 2, protoModule.wireTypes.lengthDelimited)
			var66, var67 = protoModule.writeString(var66, var67, self.kind.value)
			buff = var66
			var63 = var67
		end
	end
	local buff_1 = buffer.create(var63)
	buffer.copy(buff_1, 0, buff, 0, var63)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 409 ]]
	-- upvalues: t_2 (ref), protoModule (ref)
	local var69 = t_2.new()
	local var70 = 0
	while var70 < buffer.len(p3) do
		local _ = nil
		local var71 = nil
		local var72, var73, var74 = protoModule.readTag(p3, var70)
		local var75 = var72
		var71 = var73
		var70 = var74
		
		if var71 == protoModule.wireTypes.varint then
			local _ = nil
			local var76, var77 = protoModule.readVarInt(p3, var70)
			local _ = var76
			var70 = var77
			continue
		end
		if var71 == protoModule.wireTypes.lengthDelimited then
			if var75 == 1 then
				local _ = nil
				local var78, var79 = protoModule.readBuffer(p3, var70)
				var70 = var79
				var69.kind = { type = "literal", value = buffer.tostring(var78) }
			elseif var75 == 2 then
				local _ = nil
				local var80, var81 = protoModule.readBuffer(p3, var70)
				var70 = var81
				var69.kind = { type = "input_path", value = buffer.tostring(var80) }
			else
				local _ = nil
				local var82, var83 = protoModule.readVarInt(p3, var70)
				var70 = var83 + var82
			end
		elseif var71 == protoModule.wireTypes.i32 then
			local _ = nil
			local var84, var85 = protoModule.readFixed32(p3, var70)
			local _ = var84
			var70 = var85
		elseif var71 == protoModule.wireTypes.i64 then
			local _ = nil
			local var86, var87 = protoModule.readFixed64(p3, var70)
			local _ = var86
			var70 = var87
		else
			error("Unsupported wire type: " .. var71)
		end
	end
	return var69
end

function t_2:jsonEncode() --[[ line: 457 ]]
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "input_path" then
			t.inputPath = self.kind.value
		end
	end
	return t
end

function t_2:jsonDecode() --[[ line: 471 ]]
	-- upvalues: t_2 (ref)
	local var89 = t_2.new()
	
	if self.literal ~= nil then
		var89.kind = { type = "literal", value = self.literal }
	end
	if self.input_path ~= nil then
		var89.kind = { type = "input_path", value = self.input_path }
	end
	if self.inputPath ~= nil then
		var89.kind = { type = "input_path", value = self.inputPath }
	end
	return var89
end

t_2.descriptor = {
	name = "IdBinding",
	fullName = "roblox.apppageplatform.shared.v1beta1.IdBinding"
}
t.IdBinding = t_2
typeRegistryModule.default:register(t.IdBinding)

return {
	HydrationDataSpec = t.HydrationDataSpec,
	IdBinding = t.IdBinding
}