local symbolsModule = require(script.Parent.symbols)
local isAMagicMockModule = require(script.Parent.isAMagicMock)
local t = {}
t.__index = t

function t:__call(...)
	return self.inner(...)
end

local t_1 = {}
setmetatable(t_1, { __mode = "kv" })

function t.new(p1)
	-- upvalues: symbolsModule (ref), t (ref), t_1 (ref)
	local t_2 = { [symbolsModule.isSpy] = true, [symbolsModule.Calls] = {} }
	setmetatable(t_2, t)
	
	local var1 = function(...)
		-- upvalues: p1 (ref), t_2 (ref), symbolsModule (copy)
		local t = { args = table.pack(...), result = table.pack(p1(...)) }
		table.insert(t_2[symbolsModule.Calls], t)
		
		return table.unpack(t.result)
	end
	
	t_2.inner = var1
	t_1[var1] = t_2
	
	return t_2, var1
end

function t.lookup(p1)
	-- upvalues: t_1 (ref)
	return t_1[p1]
end

function t:is()
	-- upvalues: isAMagicMockModule (ref), symbolsModule (ref)
	return if isAMagicMockModule(self) then false else type(self) == "table" and self[symbolsModule.isSpy] ~= nil
end

return t