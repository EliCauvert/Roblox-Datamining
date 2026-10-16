local SymbolsModule = require(script.Parent.symbols)
local SpyModule = require(script.Parent.Spy)
local SetReturnValueModule = require(script.Parent.setReturnValue)
local SetSideEffectModule = require(script.Parent.setSideEffect)

local function _(p1, p2) --[[ Line: 8 | Named "isKeyInSpec" ]]
	-- upvalues: SymbolsModule (copy)
	local v1 = p1[SymbolsModule.Spec]
	
	if v1 then
		local Success, Result = pcall(function() --[[ Line: 11 ]]
			-- upvalues: v1 (copy), p2 (copy)
			return v1[p2]
		end)
		
		return Success and Result
	else
		return true
	end
end

local MagicMockModule = { is = require(script.Parent.isAMagicMock) }

local _ = function(p1): boolean? --[[ Line: 78 | Named "isTuple" ]]
	-- upvalues: SymbolsModule (copy), MagicMockModule (copy)
	if type(p1) ~= "table" or not p1[SymbolsModule.isTuple] then return end
	return not MagicMockModule.is(p1)
end

local function getReturnValue(p1, ...) --[[ Line: 84 ]]
	-- upvalues: SymbolsModule (copy), SpyModule (copy), MagicMockModule (copy)
	if p1[SymbolsModule.ReturnValue] then
		return p1[SymbolsModule.ReturnValue]
	end
	local v1 = p1[SymbolsModule.SideEffect]
	
	if v1 then
		v1.calls += 1
		
		if type(v1.value) == "function" or SpyModule.is(v1.value) then
			return { v1.value(...) }
		end
		if type(v1.value) == "table" then
			local Calls = v1.calls
			local Value = v1.value
			local Inverted = if type(Value) == "table" and Value[SymbolsModule.isTuple] then not MagicMockModule.is(Value) else nil
			local Value1 = if Inverted then v1.value.values[Calls] else v1.value[Calls]
			
			if Value1 then
				return { Value1 }
			end
			error("MagicMock Error: SideEffect iteration reached")
		else
			error("MagicMock Error: Invalid SideEffect")
		end
	end
	return nil
end

local _ = function(p1) --[[ Line: 144 | Named "operation" ]]
	-- upvalues: SymbolsModule (copy), MagicMockModule (copy)
	return function(p2, p3) --[[ Line: 145 ]]
		-- upvalues: p1 (copy), SymbolsModule (upval), MagicMockModule (upval)
		local Meta = nil
		local Formatted = nil
		if type(p2) == "string" or not getmetatable(p2) then
			Meta = getmetatable(p3)
			Formatted = string.format("__r_%s()", p1)
		else
			Meta = getmetatable(p2)
			Formatted = string.format("__%s()", p1)
		end
		local Entry = Meta[SymbolsModule.Operations][Formatted]
		
		if Entry == nil then
			local NewMagicMock = MagicMockModule.new({ name = Meta[SymbolsModule.Name] .. "." .. Formatted })
			Meta[SymbolsModule.Operations][Formatted] = NewMagicMock
			
			return NewMagicMock
		else
			return Entry
		end
	end
end

local v1 = "add"

local function v9(p1, p2) --[[ Line: 145 ]]
	-- upvalues: v1 (copy), SymbolsModule (copy), MagicMockModule (copy)
	local Meta = nil
	local Formatted = nil
	if type(p1) == "string" or not getmetatable(p1) then
		Meta = getmetatable(p2)
		Formatted = string.format("__r_%s()", v1)
	else
		Meta = getmetatable(p1)
		Formatted = string.format("__%s()", v1)
	end
	local Entry = Meta[SymbolsModule.Operations][Formatted]
	
	if Entry == nil then
		local NewMagicMock = MagicMockModule.new({ name = Meta[SymbolsModule.Name] .. "." .. Formatted })
		Meta[SymbolsModule.Operations][Formatted] = NewMagicMock
		
		return NewMagicMock
	else
		return Entry
	end
end

local v2 = "sub"

local function v11(p1, p2) --[[ Line: 145 ]]
	-- upvalues: v2 (copy), SymbolsModule (copy), MagicMockModule (copy)
	local Meta = nil
	local Formatted = nil
	if type(p1) == "string" or not getmetatable(p1) then
		Meta = getmetatable(p2)
		Formatted = string.format("__r_%s()", v2)
	else
		Meta = getmetatable(p1)
		Formatted = string.format("__%s()", v2)
	end
	local Entry = Meta[SymbolsModule.Operations][Formatted]
	
	if Entry == nil then
		local NewMagicMock = MagicMockModule.new({ name = Meta[SymbolsModule.Name] .. "." .. Formatted })
		Meta[SymbolsModule.Operations][Formatted] = NewMagicMock
		
		return NewMagicMock
	else
		return Entry
	end
end

local v3 = "div"

local function v13(p1, p2) --[[ Line: 145 ]]
	-- upvalues: v3 (copy), SymbolsModule (copy), MagicMockModule (copy)
	local Meta = nil
	local Formatted = nil
	if type(p1) == "string" or not getmetatable(p1) then
		Meta = getmetatable(p2)
		Formatted = string.format("__r_%s()", v3)
	else
		Meta = getmetatable(p1)
		Formatted = string.format("__%s()", v3)
	end
	local Entry = Meta[SymbolsModule.Operations][Formatted]
	
	if Entry == nil then
		local NewMagicMock = MagicMockModule.new({ name = Meta[SymbolsModule.Name] .. "." .. Formatted })
		Meta[SymbolsModule.Operations][Formatted] = NewMagicMock
		
		return NewMagicMock
	else
		return Entry
	end
end

local v4 = "mul"

local function v15(p1, p2) --[[ Line: 145 ]]
	-- upvalues: v4 (copy), SymbolsModule (copy), MagicMockModule (copy)
	local Meta = nil
	local Formatted = nil
	if type(p1) == "string" or not getmetatable(p1) then
		Meta = getmetatable(p2)
		Formatted = string.format("__r_%s()", v4)
	else
		Meta = getmetatable(p1)
		Formatted = string.format("__%s()", v4)
	end
	local Entry = Meta[SymbolsModule.Operations][Formatted]
	
	if Entry == nil then
		local NewMagicMock = MagicMockModule.new({ name = Meta[SymbolsModule.Name] .. "." .. Formatted })
		Meta[SymbolsModule.Operations][Formatted] = NewMagicMock
		
		return NewMagicMock
	else
		return Entry
	end
end

local v5 = "mod"

local function v17(p1, p2) --[[ Line: 145 ]]
	-- upvalues: v5 (copy), SymbolsModule (copy), MagicMockModule (copy)
	local Meta = nil
	local Formatted = nil
	if type(p1) == "string" or not getmetatable(p1) then
		Meta = getmetatable(p2)
		Formatted = string.format("__r_%s()", v5)
	else
		Meta = getmetatable(p1)
		Formatted = string.format("__%s()", v5)
	end
	local Entry = Meta[SymbolsModule.Operations][Formatted]
	
	if Entry == nil then
		local NewMagicMock = MagicMockModule.new({ name = Meta[SymbolsModule.Name] .. "." .. Formatted })
		Meta[SymbolsModule.Operations][Formatted] = NewMagicMock
		
		return NewMagicMock
	else
		return Entry
	end
end

local v6 = "pow"

local function v19(p1, p2) --[[ Line: 145 ]]
	-- upvalues: v6 (copy), SymbolsModule (copy), MagicMockModule (copy)
	local Meta = nil
	local Formatted = nil
	if type(p1) == "string" or not getmetatable(p1) then
		Meta = getmetatable(p2)
		Formatted = string.format("__r_%s()", v6)
	else
		Meta = getmetatable(p1)
		Formatted = string.format("__%s()", v6)
	end
	local Entry = Meta[SymbolsModule.Operations][Formatted]
	
	if Entry == nil then
		local NewMagicMock = MagicMockModule.new({ name = Meta[SymbolsModule.Name] .. "." .. Formatted })
		Meta[SymbolsModule.Operations][Formatted] = NewMagicMock
		
		return NewMagicMock
	else
		return Entry
	end
end

local v7 = "neg"

local function v21(p1, p2) --[[ Line: 145 ]]
	-- upvalues: v7 (copy), SymbolsModule (copy), MagicMockModule (copy)
	local Meta = nil
	local Formatted = nil
	if type(p1) == "string" or not getmetatable(p1) then
		Meta = getmetatable(p2)
		Formatted = string.format("__r_%s()", v7)
	else
		Meta = getmetatable(p1)
		Formatted = string.format("__%s()", v7)
	end
	local Entry = Meta[SymbolsModule.Operations][Formatted]
	
	if Entry == nil then
		local NewMagicMock = MagicMockModule.new({ name = Meta[SymbolsModule.Name] .. "." .. Formatted })
		Meta[SymbolsModule.Operations][Formatted] = NewMagicMock
		
		return NewMagicMock
	else
		return Entry
	end
end

local v8 = "concat"
local config = {
	__tostring = function(p1): string --[[ Line: 24 ]]
		-- upvalues: SymbolsModule (copy)
		local Meta = getmetatable(p1)
		local List = { "id=" .. Meta[SymbolsModule.Address] }
		local Entry = Meta[SymbolsModule.Name]
		
		if Entry ~= nil and Entry ~= "mock" then
			table.insert(List, "name=" .. Entry)
		end
		return "<MagicMock " .. table.concat(List, " ") .. ">"
	end,
	__index = function(p1, p2) --[[ Line: 36 ]]
		-- upvalues: SymbolsModule (copy), MagicMockModule (copy)
		local Meta = getmetatable(p1)
		local Entry = Meta[SymbolsModule.Spec]
		local Result1 = nil
		
		if Entry then
			local Success, Result = pcall(function() --[[ Line: 11 ]]
				-- upvalues: Entry (copy), p2 (copy)
				return Entry[p2]
			end)
			Result1 = Success and Result
		else
			Result1 = true
		end
		if not Result1 then
			error(string.format("MagicMock Error: Cannot index key %q since it is out of spec.", (tostring(p2))))
		end
		local Entry1 = Meta[SymbolsModule.Children][p2]
		
		if Entry1 == nil then
			Entry1 = MagicMockModule.new({ name = Meta[SymbolsModule.Name] .. "." .. tostring(p2) })
			Meta[SymbolsModule.Children][p2] = Entry1
			
			return Entry1
		else
			return if Entry1 == SymbolsModule.None then nil else Entry1
		end
	end,
	__newindex = function(p1, ReturnValue, NoneFunction) --[[ Line: 56 ]]
		-- upvalues: SymbolsModule (copy), SpyModule (copy)
		local Meta = getmetatable(p1)
		local Entry = Meta[SymbolsModule.Spec]
		local Result1 = nil
		
		if Entry then
			local Success, Result = pcall(function() --[[ Line: 11 ]]
				-- upvalues: Entry (copy), ReturnValue (copy)
				return Entry[ReturnValue]
			end)
			Result1 = Success and Result
		else
			Result1 = true
		end
		if not Result1 then
			error(string.format("MagicMock Error: Cannot write key %q since it is out of spec", (tostring(ReturnValue))))
		end
		if type(NoneFunction) == "function" then
			local _, NewSpy2 = SpyModule.new(NoneFunction)
			NoneFunction = NewSpy2
		elseif NoneFunction == nil then
			NoneFunction = SymbolsModule.None
		end
		if ReturnValue == SymbolsModule.ReturnValue then
			Meta[SymbolsModule.ReturnValue] = { NoneFunction, n = 1 }
			
			return
		else
			Meta[SymbolsModule.Children][ReturnValue] = NoneFunction
		end
	end,
	__call = function(p1, ...) --[[ Line: 117 ]]
		-- upvalues: getReturnValue (copy), MagicMockModule (copy), SymbolsModule (copy)
		local Meta = getmetatable(p1)
		local config = {
			args = table.pack(...),
			result = getReturnValue(Meta, ...)
		}
		
		if config.result == nil then
			config.result = {
				MagicMockModule.new({ name = Meta[SymbolsModule.Name] .. "()" }),
				n = 1
			}
			Meta[SymbolsModule.ReturnValue] = config.result
		elseif config.result == SymbolsModule.None then
			config.result = { n = 1 }
		else
			local Entry = config.result[1]
			
			if if type(Entry) == "table" and Entry[SymbolsModule.isTuple] then not MagicMockModule.is(Entry) else nil then
				config.result = config.result[1].values
			end
		end
		table.insert(Meta[SymbolsModule.Calls], config)
		
		return table.unpack(config.result)
	end,
	__add = v9,
	__sub = v11,
	__div = v13,
	__mul = v15,
	__mod = v17,
	__pow = v19,
	__unm = v21,
	__concat = function(p1, p2) --[[ Line: 145 ]]
		-- upvalues: v8 (copy), SymbolsModule (copy), MagicMockModule (copy)
		local Meta = nil
		local Formatted = nil
		if type(p1) == "string" or not getmetatable(p1) then
			Meta = getmetatable(p2)
			Formatted = string.format("__r_%s()", v8)
		else
			Meta = getmetatable(p1)
			Formatted = string.format("__%s()", v8)
		end
		local Entry = Meta[SymbolsModule.Operations][Formatted]
		
		if Entry == nil then
			local NewMagicMock = MagicMockModule.new({ name = Meta[SymbolsModule.Name] .. "." .. Formatted })
			Meta[SymbolsModule.Operations][Formatted] = NewMagicMock
			
			return NewMagicMock
		else
			return Entry
		end
	end
}

function MagicMockModule.new(None) --[[ Line: 176 ]]
	-- upvalues: SymbolsModule (copy), config (copy), SetReturnValueModule (copy), SetSideEffectModule (copy)
	local None1 = None or {}
	
	local function _() --[[ Line: 179 | Named "getName" ]]
		-- upvalues: None1 (ref)
		return if None1.name then None1.name elseif None1.spec then tostring(None1.spec) else "mock"
	end
	
	local t = {}
	local config1 = {
		[SymbolsModule.isMagicMock] = true,
		[SymbolsModule.Address] = tostring(t),
		[SymbolsModule.Name] = if None1.name then None1.name elseif None1.spec then tostring(None1.spec) else "mock",
		[SymbolsModule.Operations] = {},
		[SymbolsModule.Calls] = {},
		[SymbolsModule.Children] = {},
		[SymbolsModule.Spec] = None1.spec or nil,
		[SymbolsModule.ReturnValue] = nil,
		[SymbolsModule.SideEffect] = nil
	}
	
	for i, value in pairs(config) do
		config1[i] = value
	end
	local self = setmetatable(t, config1)
	
	if None1.returnValue then
		SetReturnValueModule(self, None1.returnValue)
	end
	if None1.sideEffect then
		SetSideEffectModule(self, None1.sideEffect)
	end
	return self
end

function MagicMockModule.is(p1): boolean --[[ Line: 218 ]]
	-- upvalues: SymbolsModule (copy)
	local Meta = getmetatable(p1)
	
	return if Meta then Meta[SymbolsModule.isMagicMock] ~= nil else false
end

return MagicMockModule