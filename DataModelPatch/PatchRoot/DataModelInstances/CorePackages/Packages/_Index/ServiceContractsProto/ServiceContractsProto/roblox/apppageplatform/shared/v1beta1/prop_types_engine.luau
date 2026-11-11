local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Label = {}
local PropConditionModule = require(script.Parent.prop_condition)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, Label.AutomaticSize.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v50 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v50 = ProtoModule.readVarIntI32(Buf, v1)
				NewModule.kind = {
					type = "literal",
					value = Label.AutomaticSize.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v50 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v50 = ProtoModule.readBuffer(Buf, v1)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v50 = ProtoModule.readBuffer(Buf, v1)
				NewModule.kind = {
					type = "conditional",
					value = Label.AutomaticSizeProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v50 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v50 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.AutomaticSize.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), Label (copy)
	local NewModule = Module.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.AutomaticSize.fromNumber(self.literal) else Label.AutomaticSize.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = Label.AutomaticSizeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module.descriptor = {
	name = "AutomaticSizeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.AutomaticSizeProp"
}
Label.AutomaticSizeProp = Module
TypeRegistryModule.default:register(Label.AutomaticSizeProp)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module1))
end

function Module1:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, Label.AutomaticSize.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf)
	-- upvalues: Module1 (copy), ProtoModule (copy), Label (copy), PropConditionModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v73 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v73 = ProtoModule.readVarIntI32(Buf, v2)
				NewModule.kind = {
					type = "literal",
					value = Label.AutomaticSize.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v73 = ProtoModule.readVarInt(Buf, v2)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v73 = ProtoModule.readBuffer(Buf, v2)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v73 = ProtoModule.readBuffer(Buf, v2)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v73 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v73 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.AutomaticSize.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy), PropConditionModule (copy), Label (copy)
	local NewModule = Module1.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.AutomaticSize.fromNumber(self.literal) else Label.AutomaticSize.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module1.descriptor = {
	name = "AutomaticSizeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
Label.AutomaticSizeProp_ConditionalOption = Module1
TypeRegistryModule.default:register(Label.AutomaticSizeProp_ConditionalOption)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: Module2 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module2))
end

function Module2:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v92 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v92 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v92 = ProtoModule.readBuffer(Buf, v3)
				table.insert(NewModule.options, Label.AutomaticSizeProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v92 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v92 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module2:jsonDecode()
	-- upvalues: Module2 (copy), Label (copy)
	local NewModule = Module2.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, Label.AutomaticSizeProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module2.descriptor = {
	name = "AutomaticSizeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
Label.AutomaticSizeProp_ConditionalOptions = Module2
TypeRegistryModule.default:register(Label.AutomaticSizeProp_ConditionalOptions)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1)
	-- upvalues: Module3 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module3))
end

function Module3:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, Label.TextTruncate.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf)
	-- upvalues: Module3 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v115 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v115 = ProtoModule.readVarIntI32(Buf, v4)
				NewModule.kind = {
					type = "literal",
					value = Label.TextTruncate.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v115 = ProtoModule.readVarInt(Buf, v4)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v115 = ProtoModule.readBuffer(Buf, v4)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v115 = ProtoModule.readBuffer(Buf, v4)
				NewModule.kind = {
					type = "conditional",
					value = Label.TextTruncateProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v115 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v115 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.TextTruncate.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module3:jsonDecode()
	-- upvalues: Module3 (copy), Label (copy)
	local NewModule = Module3.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.TextTruncate.fromNumber(self.literal) else Label.TextTruncate.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = Label.TextTruncateProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module3.descriptor = {
	name = "TextTruncateProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextTruncateProp"
}
Label.TextTruncateProp = Module3
TypeRegistryModule.default:register(Label.TextTruncateProp)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1)
	-- upvalues: Module4 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module4))
end

function Module4:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, Label.TextTruncate.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf)
	-- upvalues: Module4 (copy), ProtoModule (copy), Label (copy), PropConditionModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v138 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v138 = ProtoModule.readVarIntI32(Buf, v5)
				NewModule.kind = {
					type = "literal",
					value = Label.TextTruncate.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v138 = ProtoModule.readVarInt(Buf, v5)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v138 = ProtoModule.readBuffer(Buf, v5)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v138 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v138 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v138 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.TextTruncate.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module4:jsonDecode()
	-- upvalues: Module4 (copy), PropConditionModule (copy), Label (copy)
	local NewModule = Module4.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.TextTruncate.fromNumber(self.literal) else Label.TextTruncate.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module4.descriptor = {
	name = "TextTruncateProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
Label.TextTruncateProp_ConditionalOption = Module4
TypeRegistryModule.default:register(Label.TextTruncateProp_ConditionalOption)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1)
	-- upvalues: Module5 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module5))
end

function Module5:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf)
	-- upvalues: Module5 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v157 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v157 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v157 = ProtoModule.readBuffer(Buf, v6)
				table.insert(NewModule.options, Label.TextTruncateProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v157 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v157 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module5:jsonDecode()
	-- upvalues: Module5 (copy), Label (copy)
	local NewModule = Module5.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, Label.TextTruncateProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module5.descriptor = {
	name = "TextTruncateProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
Label.TextTruncateProp_ConditionalOptions = Module5
TypeRegistryModule.default:register(Label.TextTruncateProp_ConditionalOptions)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1)
	-- upvalues: Module6 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module6))
end

function Module6:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, Label.TextXAlignment.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module6.decode(Buf)
	-- upvalues: Module6 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v180 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v180 = ProtoModule.readVarIntI32(Buf, v7)
				NewModule.kind = {
					type = "literal",
					value = Label.TextXAlignment.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v180 = ProtoModule.readVarInt(Buf, v7)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v180 = ProtoModule.readBuffer(Buf, v7)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v180 = ProtoModule.readBuffer(Buf, v7)
				NewModule.kind = {
					type = "conditional",
					value = Label.TextXAlignmentProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v180 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v180 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.TextXAlignment.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module6:jsonDecode()
	-- upvalues: Module6 (copy), Label (copy)
	local NewModule = Module6.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.TextXAlignment.fromNumber(self.literal) else Label.TextXAlignment.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = Label.TextXAlignmentProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module6.descriptor = {
	name = "TextXAlignmentProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextXAlignmentProp"
}
Label.TextXAlignmentProp = Module6
TypeRegistryModule.default:register(Label.TextXAlignmentProp)
local Module7 = {}
Module7.__index = Module7

function Module7.new(p1)
	-- upvalues: Module7 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module7))
end

function Module7:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, Label.TextXAlignment.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module7.decode(Buf)
	-- upvalues: Module7 (copy), ProtoModule (copy), Label (copy), PropConditionModule (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v203 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v203 = ProtoModule.readVarIntI32(Buf, v8)
				NewModule.kind = {
					type = "literal",
					value = Label.TextXAlignment.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v203 = ProtoModule.readVarInt(Buf, v8)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v203 = ProtoModule.readBuffer(Buf, v8)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v203 = ProtoModule.readBuffer(Buf, v8)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v203 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v203 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.TextXAlignment.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module7:jsonDecode()
	-- upvalues: Module7 (copy), PropConditionModule (copy), Label (copy)
	local NewModule = Module7.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.TextXAlignment.fromNumber(self.literal) else Label.TextXAlignment.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module7.descriptor = {
	name = "TextXAlignmentProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
Label.TextXAlignmentProp_ConditionalOption = Module7
TypeRegistryModule.default:register(Label.TextXAlignmentProp_ConditionalOption)
local Module8 = {}
Module8.__index = Module8

function Module8.new(p1)
	-- upvalues: Module8 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module8))
end

function Module8:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module8.decode(Buf)
	-- upvalues: Module8 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module8.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v222 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v222 = ProtoModule.readVarInt(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v222 = ProtoModule.readBuffer(Buf, v9)
				table.insert(NewModule.options, Label.TextXAlignmentProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v222 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v222 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module8:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module8:jsonDecode()
	-- upvalues: Module8 (copy), Label (copy)
	local NewModule = Module8.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, Label.TextXAlignmentProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module8.descriptor = {
	name = "TextXAlignmentProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
Label.TextXAlignmentProp_ConditionalOptions = Module8
TypeRegistryModule.default:register(Label.TextXAlignmentProp_ConditionalOptions)
local Module9 = {}
Module9.__index = Module9

function Module9.new(p1)
	-- upvalues: Module9 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module9))
end

function Module9:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, Label.TextYAlignment.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module9.decode(Buf)
	-- upvalues: Module9 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module9.new()
	local v10 = 0
	while v10 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v245 = ProtoModule.readTag(Buf, v10)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v245 = ProtoModule.readVarIntI32(Buf, v10)
				NewModule.kind = {
					type = "literal",
					value = Label.TextYAlignment.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v245 = ProtoModule.readVarInt(Buf, v10)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v245 = ProtoModule.readBuffer(Buf, v10)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v245 = ProtoModule.readBuffer(Buf, v10)
				NewModule.kind = {
					type = "conditional",
					value = Label.TextYAlignmentProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v10)
				v10 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v245 = ProtoModule.readFixed32(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v245 = ProtoModule.readFixed64(Buf, v10)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module9:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.TextYAlignment.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module9:jsonDecode()
	-- upvalues: Module9 (copy), Label (copy)
	local NewModule = Module9.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.TextYAlignment.fromNumber(self.literal) else Label.TextYAlignment.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = Label.TextYAlignmentProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module9.descriptor = {
	name = "TextYAlignmentProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextYAlignmentProp"
}
Label.TextYAlignmentProp = Module9
TypeRegistryModule.default:register(Label.TextYAlignmentProp)
local Module10 = {}
Module10.__index = Module10

function Module10.new(p1)
	-- upvalues: Module10 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module10))
end

function Module10:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, Label.TextYAlignment.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module10.decode(Buf)
	-- upvalues: Module10 (copy), ProtoModule (copy), Label (copy), PropConditionModule (copy)
	local NewModule = Module10.new()
	local v11 = 0
	while v11 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v268 = ProtoModule.readTag(Buf, v11)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v268 = ProtoModule.readVarIntI32(Buf, v11)
				NewModule.kind = {
					type = "literal",
					value = Label.TextYAlignment.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v268 = ProtoModule.readVarInt(Buf, v11)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v268 = ProtoModule.readBuffer(Buf, v11)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v268 = ProtoModule.readBuffer(Buf, v11)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v11)
				v11 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v268 = ProtoModule.readFixed32(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v268 = ProtoModule.readFixed64(Buf, v11)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module10:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.TextYAlignment.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module10:jsonDecode()
	-- upvalues: Module10 (copy), PropConditionModule (copy), Label (copy)
	local NewModule = Module10.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.TextYAlignment.fromNumber(self.literal) else Label.TextYAlignment.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module10.descriptor = {
	name = "TextYAlignmentProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
Label.TextYAlignmentProp_ConditionalOption = Module10
TypeRegistryModule.default:register(Label.TextYAlignmentProp_ConditionalOption)
local Module11 = {}
Module11.__index = Module11

function Module11.new(p1)
	-- upvalues: Module11 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module11))
end

function Module11:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module11.decode(Buf)
	-- upvalues: Module11 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module11.new()
	local v12 = 0
	while v12 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v287 = ProtoModule.readTag(Buf, v12)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v287 = ProtoModule.readVarInt(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v287 = ProtoModule.readBuffer(Buf, v12)
				table.insert(NewModule.options, Label.TextYAlignmentProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v12)
				v12 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v287 = ProtoModule.readFixed32(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v287 = ProtoModule.readFixed64(Buf, v12)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module11:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module11:jsonDecode()
	-- upvalues: Module11 (copy), Label (copy)
	local NewModule = Module11.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, Label.TextYAlignmentProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module11.descriptor = {
	name = "TextYAlignmentProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
Label.TextYAlignmentProp_ConditionalOptions = Module11
TypeRegistryModule.default:register(Label.TextYAlignmentProp_ConditionalOptions)
local Module12 = {}
Module12.__index = Module12

function Module12.new(p1)
	-- upvalues: Module12 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module12))
end

function Module12:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, Label.UIFlexMode.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module12.decode(Buf)
	-- upvalues: Module12 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module12.new()
	local v13 = 0
	while v13 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v310 = ProtoModule.readTag(Buf, v13)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v310 = ProtoModule.readVarIntI32(Buf, v13)
				NewModule.kind = {
					type = "literal",
					value = Label.UIFlexMode.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v310 = ProtoModule.readVarInt(Buf, v13)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v310 = ProtoModule.readBuffer(Buf, v13)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v310 = ProtoModule.readBuffer(Buf, v13)
				NewModule.kind = {
					type = "conditional",
					value = Label.UIFlexModeProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v13)
				v13 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v310 = ProtoModule.readFixed32(Buf, v13)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v310 = ProtoModule.readFixed64(Buf, v13)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module12:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.UIFlexMode.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module12:jsonDecode()
	-- upvalues: Module12 (copy), Label (copy)
	local NewModule = Module12.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.UIFlexMode.fromNumber(self.literal) else Label.UIFlexMode.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = Label.UIFlexModeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module12.descriptor = {
	name = "UIFlexModeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UIFlexModeProp"
}
Label.UIFlexModeProp = Module12
TypeRegistryModule.default:register(Label.UIFlexModeProp)
local Module13 = {}
Module13.__index = Module13

function Module13.new(p1)
	-- upvalues: Module13 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module13))
end

function Module13:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, Label.UIFlexMode.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module13.decode(Buf)
	-- upvalues: Module13 (copy), ProtoModule (copy), Label (copy), PropConditionModule (copy)
	local NewModule = Module13.new()
	local v14 = 0
	while v14 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v333 = ProtoModule.readTag(Buf, v14)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v333 = ProtoModule.readVarIntI32(Buf, v14)
				NewModule.kind = {
					type = "literal",
					value = Label.UIFlexMode.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v333 = ProtoModule.readVarInt(Buf, v14)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v333 = ProtoModule.readBuffer(Buf, v14)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v333 = ProtoModule.readBuffer(Buf, v14)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v14)
				v14 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v333 = ProtoModule.readFixed32(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v333 = ProtoModule.readFixed64(Buf, v14)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module13:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.UIFlexMode.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module13:jsonDecode()
	-- upvalues: Module13 (copy), PropConditionModule (copy), Label (copy)
	local NewModule = Module13.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.UIFlexMode.fromNumber(self.literal) else Label.UIFlexMode.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module13.descriptor = {
	name = "UIFlexModeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
Label.UIFlexModeProp_ConditionalOption = Module13
TypeRegistryModule.default:register(Label.UIFlexModeProp_ConditionalOption)
local Module14 = {}
Module14.__index = Module14

function Module14.new(p1)
	-- upvalues: Module14 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module14))
end

function Module14:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module14.decode(Buf)
	-- upvalues: Module14 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module14.new()
	local v15 = 0
	while v15 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v352 = ProtoModule.readTag(Buf, v15)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v352 = ProtoModule.readVarInt(Buf, v15)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v352 = ProtoModule.readBuffer(Buf, v15)
				table.insert(NewModule.options, Label.UIFlexModeProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v15)
				v15 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v352 = ProtoModule.readFixed32(Buf, v15)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v352 = ProtoModule.readFixed64(Buf, v15)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module14:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module14:jsonDecode()
	-- upvalues: Module14 (copy), Label (copy)
	local NewModule = Module14.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, Label.UIFlexModeProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module14.descriptor = {
	name = "UIFlexModeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
Label.UIFlexModeProp_ConditionalOptions = Module14
TypeRegistryModule.default:register(Label.UIFlexModeProp_ConditionalOptions)
local Module15 = {}
Module15.__index = Module15

function Module15.new(p1)
	-- upvalues: Module15 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module15))
end

function Module15:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, Label.ScaleType.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module15.decode(Buf)
	-- upvalues: Module15 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module15.new()
	local v16 = 0
	while v16 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v375 = ProtoModule.readTag(Buf, v16)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v375 = ProtoModule.readVarIntI32(Buf, v16)
				NewModule.kind = {
					type = "literal",
					value = Label.ScaleType.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v375 = ProtoModule.readVarInt(Buf, v16)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v375 = ProtoModule.readBuffer(Buf, v16)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v375 = ProtoModule.readBuffer(Buf, v16)
				NewModule.kind = {
					type = "conditional",
					value = Label.ScaleTypeProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v16)
				v16 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v375 = ProtoModule.readFixed32(Buf, v16)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v375 = ProtoModule.readFixed64(Buf, v16)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module15:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.ScaleType.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module15:jsonDecode()
	-- upvalues: Module15 (copy), Label (copy)
	local NewModule = Module15.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.ScaleType.fromNumber(self.literal) else Label.ScaleType.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = Label.ScaleTypeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module15.descriptor = {
	name = "ScaleTypeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ScaleTypeProp"
}
Label.ScaleTypeProp = Module15
TypeRegistryModule.default:register(Label.ScaleTypeProp)
local Module16 = {}
Module16.__index = Module16

function Module16.new(p1)
	-- upvalues: Module16 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module16))
end

function Module16:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, Label.ScaleType.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module16.decode(Buf)
	-- upvalues: Module16 (copy), ProtoModule (copy), Label (copy), PropConditionModule (copy)
	local NewModule = Module16.new()
	local v17 = 0
	while v17 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v398 = ProtoModule.readTag(Buf, v17)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v398 = ProtoModule.readVarIntI32(Buf, v17)
				NewModule.kind = {
					type = "literal",
					value = Label.ScaleType.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v398 = ProtoModule.readVarInt(Buf, v17)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v398 = ProtoModule.readBuffer(Buf, v17)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v398 = ProtoModule.readBuffer(Buf, v17)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v17)
				v17 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v398 = ProtoModule.readFixed32(Buf, v17)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v398 = ProtoModule.readFixed64(Buf, v17)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module16:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.ScaleType.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module16:jsonDecode()
	-- upvalues: Module16 (copy), PropConditionModule (copy), Label (copy)
	local NewModule = Module16.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.ScaleType.fromNumber(self.literal) else Label.ScaleType.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module16.descriptor = {
	name = "ScaleTypeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
Label.ScaleTypeProp_ConditionalOption = Module16
TypeRegistryModule.default:register(Label.ScaleTypeProp_ConditionalOption)
local Module17 = {}
Module17.__index = Module17

function Module17.new(p1)
	-- upvalues: Module17 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module17))
end

function Module17:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module17.decode(Buf)
	-- upvalues: Module17 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module17.new()
	local v18 = 0
	while v18 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v417 = ProtoModule.readTag(Buf, v18)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v417 = ProtoModule.readVarInt(Buf, v18)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v417 = ProtoModule.readBuffer(Buf, v18)
				table.insert(NewModule.options, Label.ScaleTypeProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v18)
				v18 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v417 = ProtoModule.readFixed32(Buf, v18)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v417 = ProtoModule.readFixed64(Buf, v18)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module17:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module17:jsonDecode()
	-- upvalues: Module17 (copy), Label (copy)
	local NewModule = Module17.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, Label.ScaleTypeProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module17.descriptor = {
	name = "ScaleTypeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
Label.ScaleTypeProp_ConditionalOptions = Module17
TypeRegistryModule.default:register(Label.ScaleTypeProp_ConditionalOptions)
local Module18 = {}
Module18.__index = Module18

function Module18.new(p1)
	-- upvalues: Module18 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module18))
end

function Module18:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, Label.ResamplerMode.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module18.decode(Buf)
	-- upvalues: Module18 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module18.new()
	local v19 = 0
	while v19 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v440 = ProtoModule.readTag(Buf, v19)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v440 = ProtoModule.readVarIntI32(Buf, v19)
				NewModule.kind = {
					type = "literal",
					value = Label.ResamplerMode.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v440 = ProtoModule.readVarInt(Buf, v19)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v440 = ProtoModule.readBuffer(Buf, v19)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v440 = ProtoModule.readBuffer(Buf, v19)
				NewModule.kind = {
					type = "conditional",
					value = Label.ResamplerModeProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v19)
				v19 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v440 = ProtoModule.readFixed32(Buf, v19)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v440 = ProtoModule.readFixed64(Buf, v19)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module18:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.ResamplerMode.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module18:jsonDecode()
	-- upvalues: Module18 (copy), Label (copy)
	local NewModule = Module18.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.ResamplerMode.fromNumber(self.literal) else Label.ResamplerMode.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = Label.ResamplerModeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module18.descriptor = {
	name = "ResamplerModeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ResamplerModeProp"
}
Label.ResamplerModeProp = Module18
TypeRegistryModule.default:register(Label.ResamplerModeProp)
local Module19 = {}
Module19.__index = Module19

function Module19.new(p1)
	-- upvalues: Module19 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module19))
end

function Module19:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, Label.ResamplerMode.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module19.decode(Buf)
	-- upvalues: Module19 (copy), ProtoModule (copy), Label (copy), PropConditionModule (copy)
	local NewModule = Module19.new()
	local v20 = 0
	while v20 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v463 = ProtoModule.readTag(Buf, v20)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v463 = ProtoModule.readVarIntI32(Buf, v20)
				NewModule.kind = {
					type = "literal",
					value = Label.ResamplerMode.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v463 = ProtoModule.readVarInt(Buf, v20)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v463 = ProtoModule.readBuffer(Buf, v20)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v463 = ProtoModule.readBuffer(Buf, v20)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v20)
				v20 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v463 = ProtoModule.readFixed32(Buf, v20)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v463 = ProtoModule.readFixed64(Buf, v20)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module19:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.ResamplerMode.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module19:jsonDecode()
	-- upvalues: Module19 (copy), PropConditionModule (copy), Label (copy)
	local NewModule = Module19.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.ResamplerMode.fromNumber(self.literal) else Label.ResamplerMode.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module19.descriptor = {
	name = "ResamplerModeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
Label.ResamplerModeProp_ConditionalOption = Module19
TypeRegistryModule.default:register(Label.ResamplerModeProp_ConditionalOption)
local Module20 = {}
Module20.__index = Module20

function Module20.new(p1)
	-- upvalues: Module20 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module20))
end

function Module20:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module20.decode(Buf)
	-- upvalues: Module20 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module20.new()
	local v21 = 0
	while v21 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v482 = ProtoModule.readTag(Buf, v21)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v482 = ProtoModule.readVarInt(Buf, v21)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v482 = ProtoModule.readBuffer(Buf, v21)
				table.insert(NewModule.options, Label.ResamplerModeProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v21)
				v21 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v482 = ProtoModule.readFixed32(Buf, v21)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v482 = ProtoModule.readFixed64(Buf, v21)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module20:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module20:jsonDecode()
	-- upvalues: Module20 (copy), Label (copy)
	local NewModule = Module20.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, Label.ResamplerModeProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module20.descriptor = {
	name = "ResamplerModeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
Label.ResamplerModeProp_ConditionalOptions = Module20
TypeRegistryModule.default:register(Label.ResamplerModeProp_ConditionalOptions)
local Module21 = {}
Module21.__index = Module21

function Module21.new(p1)
	-- upvalues: Module21 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module21))
end

function Module21:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, Label.SizeConstraint.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module21.decode(Buf)
	-- upvalues: Module21 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module21.new()
	local v22 = 0
	while v22 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v505 = ProtoModule.readTag(Buf, v22)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v505 = ProtoModule.readVarIntI32(Buf, v22)
				NewModule.kind = {
					type = "literal",
					value = Label.SizeConstraint.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v505 = ProtoModule.readVarInt(Buf, v22)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v505 = ProtoModule.readBuffer(Buf, v22)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v505 = ProtoModule.readBuffer(Buf, v22)
				NewModule.kind = {
					type = "conditional",
					value = Label.SizeConstraintProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v22)
				v22 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v505 = ProtoModule.readFixed32(Buf, v22)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v505 = ProtoModule.readFixed64(Buf, v22)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module21:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.SizeConstraint.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module21:jsonDecode()
	-- upvalues: Module21 (copy), Label (copy)
	local NewModule = Module21.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.SizeConstraint.fromNumber(self.literal) else Label.SizeConstraint.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = Label.SizeConstraintProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module21.descriptor = {
	name = "SizeConstraintProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.SizeConstraintProp"
}
Label.SizeConstraintProp = Module21
TypeRegistryModule.default:register(Label.SizeConstraintProp)
local Module22 = {}
Module22.__index = Module22

function Module22.new(p1)
	-- upvalues: Module22 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module22))
end

function Module22:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, Label.SizeConstraint.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module22.decode(Buf)
	-- upvalues: Module22 (copy), ProtoModule (copy), Label (copy), PropConditionModule (copy)
	local NewModule = Module22.new()
	local v23 = 0
	while v23 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v528 = ProtoModule.readTag(Buf, v23)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v528 = ProtoModule.readVarIntI32(Buf, v23)
				NewModule.kind = {
					type = "literal",
					value = Label.SizeConstraint.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v528 = ProtoModule.readVarInt(Buf, v23)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v528 = ProtoModule.readBuffer(Buf, v23)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v528 = ProtoModule.readBuffer(Buf, v23)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v23)
				v23 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v528 = ProtoModule.readFixed32(Buf, v23)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v528 = ProtoModule.readFixed64(Buf, v23)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module22:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.SizeConstraint.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module22:jsonDecode()
	-- upvalues: Module22 (copy), PropConditionModule (copy), Label (copy)
	local NewModule = Module22.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.SizeConstraint.fromNumber(self.literal) else Label.SizeConstraint.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module22.descriptor = {
	name = "SizeConstraintProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
Label.SizeConstraintProp_ConditionalOption = Module22
TypeRegistryModule.default:register(Label.SizeConstraintProp_ConditionalOption)
local Module23 = {}
Module23.__index = Module23

function Module23.new(p1)
	-- upvalues: Module23 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module23))
end

function Module23:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module23.decode(Buf)
	-- upvalues: Module23 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module23.new()
	local v24 = 0
	while v24 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v547 = ProtoModule.readTag(Buf, v24)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v547 = ProtoModule.readVarInt(Buf, v24)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v547 = ProtoModule.readBuffer(Buf, v24)
				table.insert(NewModule.options, Label.SizeConstraintProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v24)
				v24 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v547 = ProtoModule.readFixed32(Buf, v24)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v547 = ProtoModule.readFixed64(Buf, v24)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module23:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module23:jsonDecode()
	-- upvalues: Module23 (copy), Label (copy)
	local NewModule = Module23.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, Label.SizeConstraintProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module23.descriptor = {
	name = "SizeConstraintProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
Label.SizeConstraintProp_ConditionalOptions = Module23
TypeRegistryModule.default:register(Label.SizeConstraintProp_ConditionalOptions)
local Module24 = {}
Module24.__index = Module24

function Module24.new(p1)
	-- upvalues: Module24 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module24))
end

function Module24:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, Label.HorizontalAlignment.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module24.decode(Buf)
	-- upvalues: Module24 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module24.new()
	local v25 = 0
	while v25 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v570 = ProtoModule.readTag(Buf, v25)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v570 = ProtoModule.readVarIntI32(Buf, v25)
				NewModule.kind = {
					type = "literal",
					value = Label.HorizontalAlignment.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v570 = ProtoModule.readVarInt(Buf, v25)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v570 = ProtoModule.readBuffer(Buf, v25)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v570 = ProtoModule.readBuffer(Buf, v25)
				NewModule.kind = {
					type = "conditional",
					value = Label.HorizontalAlignmentProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v25)
				v25 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v570 = ProtoModule.readFixed32(Buf, v25)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v570 = ProtoModule.readFixed64(Buf, v25)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module24:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.HorizontalAlignment.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module24:jsonDecode()
	-- upvalues: Module24 (copy), Label (copy)
	local NewModule = Module24.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.HorizontalAlignment.fromNumber(self.literal) else Label.HorizontalAlignment.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = Label.HorizontalAlignmentProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module24.descriptor = {
	name = "HorizontalAlignmentProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.HorizontalAlignmentProp"
}
Label.HorizontalAlignmentProp = Module24
TypeRegistryModule.default:register(Label.HorizontalAlignmentProp)
local Module25 = {}
Module25.__index = Module25

function Module25.new(p1)
	-- upvalues: Module25 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module25))
end

function Module25:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, Label.HorizontalAlignment.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module25.decode(Buf)
	-- upvalues: Module25 (copy), ProtoModule (copy), Label (copy), PropConditionModule (copy)
	local NewModule = Module25.new()
	local v26 = 0
	while v26 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v593 = ProtoModule.readTag(Buf, v26)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v593 = ProtoModule.readVarIntI32(Buf, v26)
				NewModule.kind = {
					type = "literal",
					value = Label.HorizontalAlignment.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v593 = ProtoModule.readVarInt(Buf, v26)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v593 = ProtoModule.readBuffer(Buf, v26)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v593 = ProtoModule.readBuffer(Buf, v26)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v26)
				v26 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v593 = ProtoModule.readFixed32(Buf, v26)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v593 = ProtoModule.readFixed64(Buf, v26)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module25:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.HorizontalAlignment.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module25:jsonDecode()
	-- upvalues: Module25 (copy), PropConditionModule (copy), Label (copy)
	local NewModule = Module25.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.HorizontalAlignment.fromNumber(self.literal) else Label.HorizontalAlignment.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module25.descriptor = {
	name = "HorizontalAlignmentProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
Label.HorizontalAlignmentProp_ConditionalOption = Module25
TypeRegistryModule.default:register(Label.HorizontalAlignmentProp_ConditionalOption)
local Module26 = {}
Module26.__index = Module26

function Module26.new(p1)
	-- upvalues: Module26 (copy)
	return (setmetatable({
		option = if p1 == nil or p1.option == nil then {} else p1.option
	}, Module26))
end

function Module26:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.option ~= nil and #self.option > 0 then
		for _, value in self.option do
			local EncodeResult = value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module26.decode(Buf)
	-- upvalues: Module26 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module26.new()
	local v27 = 0
	while v27 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v612 = ProtoModule.readTag(Buf, v27)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v612 = ProtoModule.readVarInt(Buf, v27)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v612 = ProtoModule.readBuffer(Buf, v27)
				table.insert(NewModule.option, Label.HorizontalAlignmentProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v27)
				v27 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v612 = ProtoModule.readFixed32(Buf, v27)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v612 = ProtoModule.readFixed64(Buf, v27)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module26:jsonEncode()
	local t = {}
	
	if self.option ~= nil and #self.option > 0 then
		local Option = {}
		
		for _, value in self.option do
			table.insert(Option, value:jsonEncode())
		end
		t.option = Option
	end
	return t
end

function Module26:jsonDecode()
	-- upvalues: Module26 (copy), Label (copy)
	local NewModule = Module26.new()
	
	if self.option ~= nil then
		local Option = {}
		
		for _, value in self.option do
			table.insert(Option, Label.HorizontalAlignmentProp_ConditionalOption.jsonDecode(value))
		end
		NewModule.option = Option
	end
	return NewModule
end

Module26.descriptor = {
	name = "HorizontalAlignmentProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
Label.HorizontalAlignmentProp_ConditionalOptions = Module26
TypeRegistryModule.default:register(Label.HorizontalAlignmentProp_ConditionalOptions)
local Module27 = {}
Module27.__index = Module27

function Module27.new(p1)
	-- upvalues: Module27 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module27))
end

function Module27:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, Label.SelectionBehavior.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module27.decode(Buf)
	-- upvalues: Module27 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module27.new()
	local v28 = 0
	while v28 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v635 = ProtoModule.readTag(Buf, v28)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v635 = ProtoModule.readVarIntI32(Buf, v28)
				NewModule.kind = {
					type = "literal",
					value = Label.SelectionBehavior.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v635 = ProtoModule.readVarInt(Buf, v28)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v635 = ProtoModule.readBuffer(Buf, v28)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v635 = ProtoModule.readBuffer(Buf, v28)
				NewModule.kind = {
					type = "conditional",
					value = Label.SelectionBehaviorProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v28)
				v28 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v635 = ProtoModule.readFixed32(Buf, v28)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v635 = ProtoModule.readFixed64(Buf, v28)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module27:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.SelectionBehavior.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module27:jsonDecode()
	-- upvalues: Module27 (copy), Label (copy)
	local NewModule = Module27.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.SelectionBehavior.fromNumber(self.literal) else Label.SelectionBehavior.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = Label.SelectionBehaviorProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module27.descriptor = {
	name = "SelectionBehaviorProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectionBehaviorProp"
}
Label.SelectionBehaviorProp = Module27
TypeRegistryModule.default:register(Label.SelectionBehaviorProp)
local Module28 = {}
Module28.__index = Module28

function Module28.new(p1)
	-- upvalues: Module28 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module28))
end

function Module28:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, Label.SelectionBehavior.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module28.decode(Buf)
	-- upvalues: Module28 (copy), ProtoModule (copy), Label (copy), PropConditionModule (copy)
	local NewModule = Module28.new()
	local v29 = 0
	while v29 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v658 = ProtoModule.readTag(Buf, v29)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v658 = ProtoModule.readVarIntI32(Buf, v29)
				NewModule.kind = {
					type = "literal",
					value = Label.SelectionBehavior.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v658 = ProtoModule.readVarInt(Buf, v29)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v658 = ProtoModule.readBuffer(Buf, v29)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v658 = ProtoModule.readBuffer(Buf, v29)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v29)
				v29 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v658 = ProtoModule.readFixed32(Buf, v29)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v658 = ProtoModule.readFixed64(Buf, v29)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module28:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.SelectionBehavior.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module28:jsonDecode()
	-- upvalues: Module28 (copy), PropConditionModule (copy), Label (copy)
	local NewModule = Module28.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.SelectionBehavior.fromNumber(self.literal) else Label.SelectionBehavior.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module28.descriptor = {
	name = "SelectionBehaviorProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
Label.SelectionBehaviorProp_ConditionalOption = Module28
TypeRegistryModule.default:register(Label.SelectionBehaviorProp_ConditionalOption)
local Module29 = {}
Module29.__index = Module29

function Module29.new(p1)
	-- upvalues: Module29 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module29))
end

function Module29:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module29.decode(Buf)
	-- upvalues: Module29 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module29.new()
	local v30 = 0
	while v30 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v677 = ProtoModule.readTag(Buf, v30)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v677 = ProtoModule.readVarInt(Buf, v30)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v677 = ProtoModule.readBuffer(Buf, v30)
				table.insert(NewModule.options, Label.SelectionBehaviorProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v30)
				v30 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v677 = ProtoModule.readFixed32(Buf, v30)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v677 = ProtoModule.readFixed64(Buf, v30)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module29:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module29:jsonDecode()
	-- upvalues: Module29 (copy), Label (copy)
	local NewModule = Module29.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, Label.SelectionBehaviorProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module29.descriptor = {
	name = "SelectionBehaviorProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
Label.SelectionBehaviorProp_ConditionalOptions = Module29
TypeRegistryModule.default:register(Label.SelectionBehaviorProp_ConditionalOptions)
local Module30 = {}
Module30.__index = Module30

function Module30.new(p1)
	-- upvalues: Module30 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module30))
end

function Module30:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, Label.KeyCode.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module30.decode(Buf)
	-- upvalues: Module30 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module30.new()
	local v31 = 0
	while v31 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v700 = ProtoModule.readTag(Buf, v31)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v700 = ProtoModule.readVarIntI32(Buf, v31)
				NewModule.kind = {
					type = "literal",
					value = Label.KeyCode.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v700 = ProtoModule.readVarInt(Buf, v31)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v700 = ProtoModule.readBuffer(Buf, v31)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v700 = ProtoModule.readBuffer(Buf, v31)
				NewModule.kind = {
					type = "conditional",
					value = Label.KeyCodeProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v31)
				v31 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v700 = ProtoModule.readFixed32(Buf, v31)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v700 = ProtoModule.readFixed64(Buf, v31)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module30:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.KeyCode.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module30:jsonDecode()
	-- upvalues: Module30 (copy), Label (copy)
	local NewModule = Module30.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.KeyCode.fromNumber(self.literal) else Label.KeyCode.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = Label.KeyCodeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module30.descriptor = {
	name = "KeyCodeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.KeyCodeProp"
}
Label.KeyCodeProp = Module30
TypeRegistryModule.default:register(Label.KeyCodeProp)
local Module31 = {}
Module31.__index = Module31

function Module31.new(p1)
	-- upvalues: Module31 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module31))
end

function Module31:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, Label.KeyCode.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module31.decode(Buf)
	-- upvalues: Module31 (copy), ProtoModule (copy), Label (copy), PropConditionModule (copy)
	local NewModule = Module31.new()
	local v32 = 0
	while v32 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v723 = ProtoModule.readTag(Buf, v32)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v723 = ProtoModule.readVarIntI32(Buf, v32)
				NewModule.kind = {
					type = "literal",
					value = Label.KeyCode.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v723 = ProtoModule.readVarInt(Buf, v32)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v723 = ProtoModule.readBuffer(Buf, v32)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v723 = ProtoModule.readBuffer(Buf, v32)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v32)
				v32 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v723 = ProtoModule.readFixed32(Buf, v32)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v723 = ProtoModule.readFixed64(Buf, v32)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module31:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.KeyCode.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module31:jsonDecode()
	-- upvalues: Module31 (copy), PropConditionModule (copy), Label (copy)
	local NewModule = Module31.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.KeyCode.fromNumber(self.literal) else Label.KeyCode.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module31.descriptor = {
	name = "KeyCodeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
Label.KeyCodeProp_ConditionalOption = Module31
TypeRegistryModule.default:register(Label.KeyCodeProp_ConditionalOption)
local Module32 = {}
Module32.__index = Module32

function Module32.new(p1)
	-- upvalues: Module32 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module32))
end

function Module32:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module32.decode(Buf)
	-- upvalues: Module32 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module32.new()
	local v33 = 0
	while v33 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v742 = ProtoModule.readTag(Buf, v33)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v742 = ProtoModule.readVarInt(Buf, v33)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v742 = ProtoModule.readBuffer(Buf, v33)
				table.insert(NewModule.options, Label.KeyCodeProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v33)
				v33 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v742 = ProtoModule.readFixed32(Buf, v33)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v742 = ProtoModule.readFixed64(Buf, v33)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module32:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module32:jsonDecode()
	-- upvalues: Module32 (copy), Label (copy)
	local NewModule = Module32.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, Label.KeyCodeProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module32.descriptor = {
	name = "KeyCodeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
Label.KeyCodeProp_ConditionalOptions = Module32
TypeRegistryModule.default:register(Label.KeyCodeProp_ConditionalOptions)
local Module33 = {}
Module33.__index = Module33

function Module33.new(p1)
	-- upvalues: Module33 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module33))
end

function Module33:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, Label.VerticalAlignment.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module33.decode(Buf)
	-- upvalues: Module33 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module33.new()
	local v34 = 0
	while v34 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v765 = ProtoModule.readTag(Buf, v34)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v765 = ProtoModule.readVarIntI32(Buf, v34)
				NewModule.kind = {
					type = "literal",
					value = Label.VerticalAlignment.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v765 = ProtoModule.readVarInt(Buf, v34)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v765 = ProtoModule.readBuffer(Buf, v34)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v765 = ProtoModule.readBuffer(Buf, v34)
				NewModule.kind = {
					type = "conditional",
					value = Label.VerticalAlignmentProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v34)
				v34 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v765 = ProtoModule.readFixed32(Buf, v34)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v765 = ProtoModule.readFixed64(Buf, v34)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module33:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.VerticalAlignment.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module33:jsonDecode()
	-- upvalues: Module33 (copy), Label (copy)
	local NewModule = Module33.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.VerticalAlignment.fromNumber(self.literal) else Label.VerticalAlignment.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = Label.VerticalAlignmentProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module33.descriptor = {
	name = "VerticalAlignmentProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalAlignmentProp"
}
Label.VerticalAlignmentProp = Module33
TypeRegistryModule.default:register(Label.VerticalAlignmentProp)
local Module34 = {}
Module34.__index = Module34

function Module34.new(p1)
	-- upvalues: Module34 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module34))
end

function Module34:encode()
	-- upvalues: ProtoModule (copy), Label (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, Label.VerticalAlignment.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module34.decode(Buf)
	-- upvalues: Module34 (copy), ProtoModule (copy), Label (copy), PropConditionModule (copy)
	local NewModule = Module34.new()
	local v35 = 0
	while v35 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v788 = ProtoModule.readTag(Buf, v35)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v788 = ProtoModule.readVarIntI32(Buf, v35)
				NewModule.kind = {
					type = "literal",
					value = Label.VerticalAlignment.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v788 = ProtoModule.readVarInt(Buf, v35)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v788 = ProtoModule.readBuffer(Buf, v35)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v788 = ProtoModule.readBuffer(Buf, v35)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v35)
				v35 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v788 = ProtoModule.readFixed32(Buf, v35)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v788 = ProtoModule.readFixed64(Buf, v35)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module34:jsonEncode()
	-- upvalues: Label (copy)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else Label.VerticalAlignment.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module34:jsonDecode()
	-- upvalues: Module34 (copy), PropConditionModule (copy), Label (copy)
	local NewModule = Module34.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then Label.VerticalAlignment.fromNumber(self.literal) else Label.VerticalAlignment.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module34.descriptor = {
	name = "VerticalAlignmentProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
Label.VerticalAlignmentProp_ConditionalOption = Module34
TypeRegistryModule.default:register(Label.VerticalAlignmentProp_ConditionalOption)
local Module35 = {}
Module35.__index = Module35

function Module35.new(p1)
	-- upvalues: Module35 (copy)
	return (setmetatable({
		option = if p1 == nil or p1.option == nil then {} else p1.option
	}, Module35))
end

function Module35:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.option ~= nil and #self.option > 0 then
		for _, value in self.option do
			local EncodeResult = value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module35.decode(Buf)
	-- upvalues: Module35 (copy), ProtoModule (copy), Label (copy)
	local NewModule = Module35.new()
	local v36 = 0
	while v36 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v807 = ProtoModule.readTag(Buf, v36)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v807 = ProtoModule.readVarInt(Buf, v36)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v807 = ProtoModule.readBuffer(Buf, v36)
				table.insert(NewModule.option, Label.VerticalAlignmentProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v36)
				v36 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v807 = ProtoModule.readFixed32(Buf, v36)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v807 = ProtoModule.readFixed64(Buf, v36)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module35:jsonEncode()
	local t = {}
	
	if self.option ~= nil and #self.option > 0 then
		local Option = {}
		
		for _, value in self.option do
			table.insert(Option, value:jsonEncode())
		end
		t.option = Option
	end
	return t
end

function Module35:jsonDecode()
	-- upvalues: Module35 (copy), Label (copy)
	local NewModule = Module35.new()
	
	if self.option ~= nil then
		local Option = {}
		
		for _, value in self.option do
			table.insert(Option, Label.VerticalAlignmentProp_ConditionalOption.jsonDecode(value))
		end
		NewModule.option = Option
	end
	return NewModule
end

Module35.descriptor = {
	name = "VerticalAlignmentProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
Label.VerticalAlignmentProp_ConditionalOptions = Module35
TypeRegistryModule.default:register(Label.VerticalAlignmentProp_ConditionalOptions)
Label.AutomaticSize = {
	fromNumber = function(p1)
		return if p1 == 0 then "AUTOMATIC_SIZE_INVALID" elseif p1 == 1 then "AUTOMATIC_SIZE_NONE" elseif p1 == 2 then "AUTOMATIC_SIZE_X" elseif p1 == 3 then "AUTOMATIC_SIZE_Y" elseif p1 == 4 then "AUTOMATIC_SIZE_XY" else nil
	end,
	toNumber = function(p1)
		return if p1 == "AUTOMATIC_SIZE_INVALID" then 0 elseif p1 == "AUTOMATIC_SIZE_NONE" then 1 elseif p1 == "AUTOMATIC_SIZE_X" then 2 elseif p1 == "AUTOMATIC_SIZE_Y" then 3 elseif p1 == "AUTOMATIC_SIZE_XY" then 4 else p1
	end,
	fromName = function(p1)
		return if p1 == "AUTOMATIC_SIZE_INVALID" then "AUTOMATIC_SIZE_INVALID" elseif p1 == "AUTOMATIC_SIZE_NONE" then "AUTOMATIC_SIZE_NONE" elseif p1 == "AUTOMATIC_SIZE_X" then "AUTOMATIC_SIZE_X" elseif p1 == "AUTOMATIC_SIZE_Y" then "AUTOMATIC_SIZE_Y" elseif p1 == "AUTOMATIC_SIZE_XY" then "AUTOMATIC_SIZE_XY" else nil
	end
}
Label.TextTruncate = {
	fromNumber = function(p1)
		return if p1 == 0 then "TEXT_TRUNCATE_INVALID" elseif p1 == 1 then "TEXT_TRUNCATE_NONE" elseif p1 == 2 then "TEXT_TRUNCATE_AT_END" elseif p1 == 3 then "TEXT_TRUNCATE_SPLIT_WORD" else nil
	end,
	toNumber = function(p1)
		return if p1 == "TEXT_TRUNCATE_INVALID" then 0 elseif p1 == "TEXT_TRUNCATE_NONE" then 1 elseif p1 == "TEXT_TRUNCATE_AT_END" then 2 elseif p1 == "TEXT_TRUNCATE_SPLIT_WORD" then 3 else p1
	end,
	fromName = function(p1)
		return if p1 == "TEXT_TRUNCATE_INVALID" then "TEXT_TRUNCATE_INVALID" elseif p1 == "TEXT_TRUNCATE_NONE" then "TEXT_TRUNCATE_NONE" elseif p1 == "TEXT_TRUNCATE_AT_END" then "TEXT_TRUNCATE_AT_END" elseif p1 == "TEXT_TRUNCATE_SPLIT_WORD" then "TEXT_TRUNCATE_SPLIT_WORD" else nil
	end
}
Label.TextXAlignment = {
	fromNumber = function(p1)
		return if p1 == 0 then "TEXT_X_ALIGNMENT_INVALID" elseif p1 == 1 then "TEXT_X_ALIGNMENT_LEFT" elseif p1 == 2 then "TEXT_X_ALIGNMENT_CENTER" elseif p1 == 3 then "TEXT_X_ALIGNMENT_RIGHT" else nil
	end,
	toNumber = function(p1)
		return if p1 == "TEXT_X_ALIGNMENT_INVALID" then 0 elseif p1 == "TEXT_X_ALIGNMENT_LEFT" then 1 elseif p1 == "TEXT_X_ALIGNMENT_CENTER" then 2 elseif p1 == "TEXT_X_ALIGNMENT_RIGHT" then 3 else p1
	end,
	fromName = function(p1)
		return if p1 == "TEXT_X_ALIGNMENT_INVALID" then "TEXT_X_ALIGNMENT_INVALID" elseif p1 == "TEXT_X_ALIGNMENT_LEFT" then "TEXT_X_ALIGNMENT_LEFT" elseif p1 == "TEXT_X_ALIGNMENT_CENTER" then "TEXT_X_ALIGNMENT_CENTER" elseif p1 == "TEXT_X_ALIGNMENT_RIGHT" then "TEXT_X_ALIGNMENT_RIGHT" else nil
	end
}
Label.TextYAlignment = {
	fromNumber = function(p1)
		return if p1 == 0 then "TEXT_Y_ALIGNMENT_INVALID" elseif p1 == 1 then "TEXT_Y_ALIGNMENT_TOP" elseif p1 == 2 then "TEXT_Y_ALIGNMENT_CENTER" elseif p1 == 3 then "TEXT_Y_ALIGNMENT_BOTTOM" else nil
	end,
	toNumber = function(p1)
		return if p1 == "TEXT_Y_ALIGNMENT_INVALID" then 0 elseif p1 == "TEXT_Y_ALIGNMENT_TOP" then 1 elseif p1 == "TEXT_Y_ALIGNMENT_CENTER" then 2 elseif p1 == "TEXT_Y_ALIGNMENT_BOTTOM" then 3 else p1
	end,
	fromName = function(p1)
		return if p1 == "TEXT_Y_ALIGNMENT_INVALID" then "TEXT_Y_ALIGNMENT_INVALID" elseif p1 == "TEXT_Y_ALIGNMENT_TOP" then "TEXT_Y_ALIGNMENT_TOP" elseif p1 == "TEXT_Y_ALIGNMENT_CENTER" then "TEXT_Y_ALIGNMENT_CENTER" elseif p1 == "TEXT_Y_ALIGNMENT_BOTTOM" then "TEXT_Y_ALIGNMENT_BOTTOM" else nil
	end
}
Label.UIFlexMode = {
	fromNumber = function(p1)
		return if p1 == 0 then "UI_FLEX_MODE_INVALID" elseif p1 == 1 then "UI_FLEX_MODE_NONE" elseif p1 == 2 then "UI_FLEX_MODE_GROW" elseif p1 == 3 then "UI_FLEX_MODE_SHRINK" elseif p1 == 4 then "UI_FLEX_MODE_FILL" elseif p1 == 5 then "UI_FLEX_MODE_CUSTOM" else nil
	end,
	toNumber = function(p1)
		return if p1 == "UI_FLEX_MODE_INVALID" then 0 elseif p1 == "UI_FLEX_MODE_NONE" then 1 elseif p1 == "UI_FLEX_MODE_GROW" then 2 elseif p1 == "UI_FLEX_MODE_SHRINK" then 3 elseif p1 == "UI_FLEX_MODE_FILL" then 4 elseif p1 == "UI_FLEX_MODE_CUSTOM" then 5 else p1
	end,
	fromName = function(p1)
		return if p1 == "UI_FLEX_MODE_INVALID" then "UI_FLEX_MODE_INVALID" elseif p1 == "UI_FLEX_MODE_NONE" then "UI_FLEX_MODE_NONE" elseif p1 == "UI_FLEX_MODE_GROW" then "UI_FLEX_MODE_GROW" elseif p1 == "UI_FLEX_MODE_SHRINK" then "UI_FLEX_MODE_SHRINK" elseif p1 == "UI_FLEX_MODE_FILL" then "UI_FLEX_MODE_FILL" elseif p1 == "UI_FLEX_MODE_CUSTOM" then "UI_FLEX_MODE_CUSTOM" else nil
	end
}
Label.ScaleType = {
	fromNumber = function(p1)
		return if p1 == 0 then "SCALE_TYPE_INVALID" elseif p1 == 1 then "SCALE_TYPE_STRETCH" elseif p1 == 2 then "SCALE_TYPE_SLICE" elseif p1 == 3 then "SCALE_TYPE_TILE" elseif p1 == 4 then "SCALE_TYPE_FIT" elseif p1 == 5 then "SCALE_TYPE_CROP" else nil
	end,
	toNumber = function(p1)
		return if p1 == "SCALE_TYPE_INVALID" then 0 elseif p1 == "SCALE_TYPE_STRETCH" then 1 elseif p1 == "SCALE_TYPE_SLICE" then 2 elseif p1 == "SCALE_TYPE_TILE" then 3 elseif p1 == "SCALE_TYPE_FIT" then 4 elseif p1 == "SCALE_TYPE_CROP" then 5 else p1
	end,
	fromName = function(p1)
		return if p1 == "SCALE_TYPE_INVALID" then "SCALE_TYPE_INVALID" elseif p1 == "SCALE_TYPE_STRETCH" then "SCALE_TYPE_STRETCH" elseif p1 == "SCALE_TYPE_SLICE" then "SCALE_TYPE_SLICE" elseif p1 == "SCALE_TYPE_TILE" then "SCALE_TYPE_TILE" elseif p1 == "SCALE_TYPE_FIT" then "SCALE_TYPE_FIT" elseif p1 == "SCALE_TYPE_CROP" then "SCALE_TYPE_CROP" else nil
	end
}
Label.ResamplerMode = {
	fromNumber = function(p1)
		return if p1 == 0 then "RESAMPLER_MODE_INVALID" elseif p1 == 1 then "RESAMPLER_MODE_DEFAULT" elseif p1 == 2 then "RESAMPLER_MODE_PIXELATED" else nil
	end,
	toNumber = function(p1)
		return if p1 == "RESAMPLER_MODE_INVALID" then 0 elseif p1 == "RESAMPLER_MODE_DEFAULT" then 1 elseif p1 == "RESAMPLER_MODE_PIXELATED" then 2 else p1
	end,
	fromName = function(p1)
		return if p1 == "RESAMPLER_MODE_INVALID" then "RESAMPLER_MODE_INVALID" elseif p1 == "RESAMPLER_MODE_DEFAULT" then "RESAMPLER_MODE_DEFAULT" elseif p1 == "RESAMPLER_MODE_PIXELATED" then "RESAMPLER_MODE_PIXELATED" else nil
	end
}
Label.SizeConstraint = {
	fromNumber = function(p1)
		return if p1 == 0 then "SIZE_CONSTRAINT_INVALID" elseif p1 == 1 then "SIZE_CONSTRAINT_RELATIVE_XY" elseif p1 == 2 then "SIZE_CONSTRAINT_RELATIVE_XX" elseif p1 == 3 then "SIZE_CONSTRAINT_RELATIVE_YY" else nil
	end,
	toNumber = function(p1)
		return if p1 == "SIZE_CONSTRAINT_INVALID" then 0 elseif p1 == "SIZE_CONSTRAINT_RELATIVE_XY" then 1 elseif p1 == "SIZE_CONSTRAINT_RELATIVE_XX" then 2 elseif p1 == "SIZE_CONSTRAINT_RELATIVE_YY" then 3 else p1
	end,
	fromName = function(p1)
		return if p1 == "SIZE_CONSTRAINT_INVALID" then "SIZE_CONSTRAINT_INVALID" elseif p1 == "SIZE_CONSTRAINT_RELATIVE_XY" then "SIZE_CONSTRAINT_RELATIVE_XY" elseif p1 == "SIZE_CONSTRAINT_RELATIVE_XX" then "SIZE_CONSTRAINT_RELATIVE_XX" elseif p1 == "SIZE_CONSTRAINT_RELATIVE_YY" then "SIZE_CONSTRAINT_RELATIVE_YY" else nil
	end
}
Label.HorizontalAlignment = {
	fromNumber = function(p1)
		return if p1 == 0 then "HORIZONTAL_ALIGNMENT_INVALID" elseif p1 == 1 then "HORIZONTAL_ALIGNMENT_LEFT" elseif p1 == 2 then "HORIZONTAL_ALIGNMENT_CENTER" elseif p1 == 3 then "HORIZONTAL_ALIGNMENT_RIGHT" else nil
	end,
	toNumber = function(p1)
		return if p1 == "HORIZONTAL_ALIGNMENT_INVALID" then 0 elseif p1 == "HORIZONTAL_ALIGNMENT_LEFT" then 1 elseif p1 == "HORIZONTAL_ALIGNMENT_CENTER" then 2 elseif p1 == "HORIZONTAL_ALIGNMENT_RIGHT" then 3 else p1
	end,
	fromName = function(p1)
		return if p1 == "HORIZONTAL_ALIGNMENT_INVALID" then "HORIZONTAL_ALIGNMENT_INVALID" elseif p1 == "HORIZONTAL_ALIGNMENT_LEFT" then "HORIZONTAL_ALIGNMENT_LEFT" elseif p1 == "HORIZONTAL_ALIGNMENT_CENTER" then "HORIZONTAL_ALIGNMENT_CENTER" elseif p1 == "HORIZONTAL_ALIGNMENT_RIGHT" then "HORIZONTAL_ALIGNMENT_RIGHT" else nil
	end
}
Label.VerticalAlignment = {
	fromNumber = function(p1)
		return if p1 == 0 then "VERTICAL_ALIGNMENT_INVALID" elseif p1 == 1 then "VERTICAL_ALIGNMENT_TOP" elseif p1 == 2 then "VERTICAL_ALIGNMENT_CENTER" elseif p1 == 3 then "VERTICAL_ALIGNMENT_BOTTOM" else nil
	end,
	toNumber = function(p1)
		return if p1 == "VERTICAL_ALIGNMENT_INVALID" then 0 elseif p1 == "VERTICAL_ALIGNMENT_TOP" then 1 elseif p1 == "VERTICAL_ALIGNMENT_CENTER" then 2 elseif p1 == "VERTICAL_ALIGNMENT_BOTTOM" then 3 else p1
	end,
	fromName = function(p1)
		return if p1 == "VERTICAL_ALIGNMENT_INVALID" then "VERTICAL_ALIGNMENT_INVALID" elseif p1 == "VERTICAL_ALIGNMENT_TOP" then "VERTICAL_ALIGNMENT_TOP" elseif p1 == "VERTICAL_ALIGNMENT_CENTER" then "VERTICAL_ALIGNMENT_CENTER" elseif p1 == "VERTICAL_ALIGNMENT_BOTTOM" then "VERTICAL_ALIGNMENT_BOTTOM" else nil
	end
}
Label.SelectionBehavior = {
	fromNumber = function(p1)
		return if p1 == 0 then "SELECTION_BEHAVIOR_INVALID" elseif p1 == 1 then "SELECTION_BEHAVIOR_ESCAPE" elseif p1 == 2 then "SELECTION_BEHAVIOR_STOP" else nil
	end,
	toNumber = function(p1)
		return if p1 == "SELECTION_BEHAVIOR_INVALID" then 0 elseif p1 == "SELECTION_BEHAVIOR_ESCAPE" then 1 elseif p1 == "SELECTION_BEHAVIOR_STOP" then 2 else p1
	end,
	fromName = function(p1)
		return if p1 == "SELECTION_BEHAVIOR_INVALID" then "SELECTION_BEHAVIOR_INVALID" elseif p1 == "SELECTION_BEHAVIOR_ESCAPE" then "SELECTION_BEHAVIOR_ESCAPE" elseif p1 == "SELECTION_BEHAVIOR_STOP" then "SELECTION_BEHAVIOR_STOP" else nil
	end
}
Label.KeyCode = {
	fromNumber = function(p1)
		return if p1 == 0 then "KEY_CODE_INVALID" elseif p1 == 1 then "KEY_CODE_BUTTON_A" elseif p1 == 2 then "KEY_CODE_BUTTON_B" elseif p1 == 3 then "KEY_CODE_BUTTON_X" elseif p1 == 4 then "KEY_CODE_BUTTON_Y" elseif p1 == 5 then "KEY_CODE_BUTTON_L1" elseif p1 == 6 then "KEY_CODE_BUTTON_R1" elseif p1 == 7 then "KEY_CODE_BUTTON_L2" elseif p1 == 8 then "KEY_CODE_BUTTON_R2" elseif p1 == 9 then "KEY_CODE_BUTTON_L3" elseif p1 == 10 then "KEY_CODE_BUTTON_R3" else nil
	end,
	toNumber = function(p1)
		return if p1 == "KEY_CODE_INVALID" then 0 elseif p1 == "KEY_CODE_BUTTON_A" then 1 elseif p1 == "KEY_CODE_BUTTON_B" then 2 elseif p1 == "KEY_CODE_BUTTON_X" then 3 elseif p1 == "KEY_CODE_BUTTON_Y" then 4 elseif p1 == "KEY_CODE_BUTTON_L1" then 5 elseif p1 == "KEY_CODE_BUTTON_R1" then 6 elseif p1 == "KEY_CODE_BUTTON_L2" then 7 elseif p1 == "KEY_CODE_BUTTON_R2" then 8 elseif p1 == "KEY_CODE_BUTTON_L3" then 9 elseif p1 == "KEY_CODE_BUTTON_R3" then 10 else p1
	end,
	fromName = function(p1)
		return if p1 == "KEY_CODE_INVALID" then "KEY_CODE_INVALID" elseif p1 == "KEY_CODE_BUTTON_A" then "KEY_CODE_BUTTON_A" elseif p1 == "KEY_CODE_BUTTON_B" then "KEY_CODE_BUTTON_B" elseif p1 == "KEY_CODE_BUTTON_X" then "KEY_CODE_BUTTON_X" elseif p1 == "KEY_CODE_BUTTON_Y" then "KEY_CODE_BUTTON_Y" elseif p1 == "KEY_CODE_BUTTON_L1" then "KEY_CODE_BUTTON_L1" elseif p1 == "KEY_CODE_BUTTON_R1" then "KEY_CODE_BUTTON_R1" elseif p1 == "KEY_CODE_BUTTON_L2" then "KEY_CODE_BUTTON_L2" elseif p1 == "KEY_CODE_BUTTON_R2" then "KEY_CODE_BUTTON_R2" elseif p1 == "KEY_CODE_BUTTON_L3" then "KEY_CODE_BUTTON_L3" elseif p1 == "KEY_CODE_BUTTON_R3" then "KEY_CODE_BUTTON_R3" else nil
	end
}

return {
	AutomaticSizeProp = Label.AutomaticSizeProp,
	AutomaticSizeProp_ConditionalOption = Label.AutomaticSizeProp_ConditionalOption,
	AutomaticSizeProp_ConditionalOptions = Label.AutomaticSizeProp_ConditionalOptions,
	TextTruncateProp = Label.TextTruncateProp,
	TextTruncateProp_ConditionalOption = Label.TextTruncateProp_ConditionalOption,
	TextTruncateProp_ConditionalOptions = Label.TextTruncateProp_ConditionalOptions,
	TextXAlignmentProp = Label.TextXAlignmentProp,
	TextXAlignmentProp_ConditionalOption = Label.TextXAlignmentProp_ConditionalOption,
	TextXAlignmentProp_ConditionalOptions = Label.TextXAlignmentProp_ConditionalOptions,
	TextYAlignmentProp = Label.TextYAlignmentProp,
	TextYAlignmentProp_ConditionalOption = Label.TextYAlignmentProp_ConditionalOption,
	TextYAlignmentProp_ConditionalOptions = Label.TextYAlignmentProp_ConditionalOptions,
	UIFlexModeProp = Label.UIFlexModeProp,
	UIFlexModeProp_ConditionalOption = Label.UIFlexModeProp_ConditionalOption,
	UIFlexModeProp_ConditionalOptions = Label.UIFlexModeProp_ConditionalOptions,
	ScaleTypeProp = Label.ScaleTypeProp,
	ScaleTypeProp_ConditionalOption = Label.ScaleTypeProp_ConditionalOption,
	ScaleTypeProp_ConditionalOptions = Label.ScaleTypeProp_ConditionalOptions,
	ResamplerModeProp = Label.ResamplerModeProp,
	ResamplerModeProp_ConditionalOption = Label.ResamplerModeProp_ConditionalOption,
	ResamplerModeProp_ConditionalOptions = Label.ResamplerModeProp_ConditionalOptions,
	SizeConstraintProp = Label.SizeConstraintProp,
	SizeConstraintProp_ConditionalOption = Label.SizeConstraintProp_ConditionalOption,
	SizeConstraintProp_ConditionalOptions = Label.SizeConstraintProp_ConditionalOptions,
	HorizontalAlignmentProp = Label.HorizontalAlignmentProp,
	HorizontalAlignmentProp_ConditionalOption = Label.HorizontalAlignmentProp_ConditionalOption,
	HorizontalAlignmentProp_ConditionalOptions = Label.HorizontalAlignmentProp_ConditionalOptions,
	SelectionBehaviorProp = Label.SelectionBehaviorProp,
	SelectionBehaviorProp_ConditionalOption = Label.SelectionBehaviorProp_ConditionalOption,
	SelectionBehaviorProp_ConditionalOptions = Label.SelectionBehaviorProp_ConditionalOptions,
	KeyCodeProp = Label.KeyCodeProp,
	KeyCodeProp_ConditionalOption = Label.KeyCodeProp_ConditionalOption,
	KeyCodeProp_ConditionalOptions = Label.KeyCodeProp_ConditionalOptions,
	VerticalAlignmentProp = Label.VerticalAlignmentProp,
	VerticalAlignmentProp_ConditionalOption = Label.VerticalAlignmentProp_ConditionalOption,
	VerticalAlignmentProp_ConditionalOptions = Label.VerticalAlignmentProp_ConditionalOptions,
	AutomaticSize = Label.AutomaticSize,
	TextTruncate = Label.TextTruncate,
	TextXAlignment = Label.TextXAlignment,
	TextYAlignment = Label.TextYAlignment,
	UIFlexMode = Label.UIFlexMode,
	ScaleType = Label.ScaleType,
	ResamplerMode = Label.ResamplerMode,
	SizeConstraint = Label.SizeConstraint,
	HorizontalAlignment = Label.HorizontalAlignment,
	VerticalAlignment = Label.VerticalAlignment,
	SelectionBehavior = Label.SelectionBehavior,
	KeyCode = Label.KeyCode
}