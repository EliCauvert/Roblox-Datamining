local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		prefix = if p1 == nil or p1.prefix == nil then "" else p1.prefix
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.prefix ~= nil and self.prefix ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var10 = protoModule.writeString(var2, var3, self.prefix)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
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
				var1.prefix = buffer.tostring(var10)
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
			error("Unsupported wire type: " .. var14)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.prefix ~= nil and self.prefix ~= "" then
		t.prefix = self.prefix
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var18 = t_1.new()
	
	if self.prefix ~= nil then
		var18.prefix = self.prefix
	end
	return var18
end

t_1.descriptor = {
	name = "GetSearchAutocompleteRequest",
	fullName = "roblox.apppageplatform.search.v1beta1.GetSearchAutocompleteRequest"
}
t.GetSearchAutocompleteRequest = t_1
typeRegistryModule.default:register(t.GetSearchAutocompleteRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		page_entries = if p2 == nil or p2.page_entries == nil then {} else p2.page_entries,
		hydration_data = if p2 == nil or p2.hydration_data == nil then nil else p2.hydration_data
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var18 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var19 = v:encode()
			local var20, var21 = protoModule.writeTag(buff, var18, 1, protoModule.wireTypes.lengthDelimited)
			var20, var35 = protoModule.writeBuffer(var20, var21, var19, buffer.len(var19))
			buff = var20
			var18 = var21
		end
	end
	if self.hydration_data ~= nil then
		local var22 = self.hydration_data:encode()
		local var23, var24 = protoModule.writeTag(buff, var18, 2, protoModule.wireTypes.lengthDelimited)
		var23, var38 = protoModule.writeBuffer(var23, var24, var22, buffer.len(var22))
		buff = var23
		var18 = var24
	end
	local buff_1 = buffer.create(var18)
	buffer.copy(buff_1, 0, buff, 0, var18)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref)
	local var25 = t_2.new()
	local var26 = 0
	while var26 < buffer.len(p2) do
		local _ = nil
		local var27 = nil
		local var28, var29, var30 = protoModule.readTag(p2, var26)
		local var31 = var28
		var27 = var29
		var26 = var30
		
		if var27 == protoModule.wireTypes.varint then
			local _ = nil
			local var32, var33 = protoModule.readVarInt(p2, var26)
			local _ = var32
			var26 = var33
			continue
		end
		if var27 == protoModule.wireTypes.lengthDelimited then
			if var31 == 1 then
				local _ = nil
				local var34, var35 = protoModule.readBuffer(p2, var26)
				var26 = var35
				table.insert(var25.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var34))
			elseif var31 == 2 then
				local _ = nil
				local var36, var37 = protoModule.readBuffer(p2, var26)
				var26 = var37
				var25.hydration_data = hydrationContentModule.HydrationContent.decode(var36)
			else
				local _ = nil
				local var38, var39 = protoModule.readVarInt(p2, var26)
				var26 = var39 + var38
			end
		elseif var27 == protoModule.wireTypes.i32 then
			local _ = nil
			local var40, var41 = protoModule.readFixed32(p2, var26)
			local _ = var40
			var26 = var41
		elseif var27 == protoModule.wireTypes.i64 then
			local _ = nil
			local var42, var43 = protoModule.readFixed64(p2, var26)
			local _ = var42
			var26 = var43
		else
			error("Unsupported wire type: " .. var42)
		end
	end
	return var25
end

function t_2:jsonEncode()
	local t = {}
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, v:jsonEncode())
		end
		t.pageEntries = t_1
	end
	if self.hydration_data ~= nil then
		t.hydrationData = self.hydration_data:jsonEncode()
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), pageEntryContentModule (ref), hydrationContentModule (ref)
	local var44 = t_2.new()
	
	if self.page_entries ~= nil then
		local t = {}
		
		for i, v in self.page_entries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var44.page_entries = t
	end
	if self.pageEntries ~= nil then
		local t = {}
		
		for i, v in self.pageEntries do
			table.insert(t, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var44.page_entries = t
	end
	if self.hydration_data ~= nil then
		var44.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var44.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	return var44
end

t_2.descriptor = {
	name = "GetSearchAutocompleteResponse",
	fullName = "roblox.apppageplatform.search.v1beta1.GetSearchAutocompleteResponse"
}
t.GetSearchAutocompleteResponse = t_2
typeRegistryModule.default:register(t.GetSearchAutocompleteResponse)

return {
	GetSearchAutocompleteRequest = t.GetSearchAutocompleteRequest,
	GetSearchAutocompleteResponse = t.GetSearchAutocompleteResponse
}