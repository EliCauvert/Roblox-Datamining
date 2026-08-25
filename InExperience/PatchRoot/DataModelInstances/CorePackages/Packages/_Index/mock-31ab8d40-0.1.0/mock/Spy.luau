local symbolsModule = require(script.Parent.symbols)
local t = {}
t.__index = t
local t_1 = {}
setmetatable(t_1, { __mode = "kv" })

function t.new(p0)
	-- upvalues: symbolsModule (ref), t (ref), t_1 (ref)
	local t_2 = { [symbolsModule.Calls] = {} }
	setmetatable(t_2, t)
	
	local var4 = function(...)
		-- upvalues: p0 (ref), t_2 (ref), symbolsModule (copy)
		local t = { args = table.pack(...), result = table.pack(p0(...)) }
		table.insert(t_2[symbolsModule.Calls], t)
		
		return table.unpack(t.result)
	end
	
	t_2.inner = var4
	t_1[var4] = t_2
	
	return t_2, var4
end

function t.lookup(p1)
	-- upvalues: t_1 (ref)
	return t_1[p1]
end

return t