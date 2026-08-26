local symbolsModule = require(script.Parent.symbols)
local spyModule = require(script.Parent.Spy)
local t = {}
local t_1 = {
	__index = function(p1, p2)
		-- upvalues: symbolsModule (ref), t (ref)
		local var1 = getmetatable(p1)
		local var2 = var1[symbolsModule.Children][p2]
		
		if var2 == nil then
			var2 = t.new()
			var1[symbolsModule.Children][p2] = var2
			
			return var2
		end
		return if var2 == symbolsModule.None then nil else var2
	end,
	__newindex = function(p1, p2, p3)
		-- upvalues: spyModule (ref), symbolsModule (ref)
		local var1 = getmetatable(p1)
		
		if type(p3) == "function" then
			local _, var2 = spyModule.new(p3)
			p3 = var2
		elseif p3 == nil then
			p3 = symbolsModule.None
		end
		if p2 == symbolsModule.ReturnValue then
			var1[symbolsModule.ReturnValue] = { p3, n = 1 }
			
			return
		end
		var1[symbolsModule.Children][p2] = p3
	end,
	__call = function(p1, ...)
		-- upvalues: symbolsModule (ref), t (ref)
		local var1 = getmetatable(p1)
		local t_1 = {
			args = table.pack(...),
			result = var1[symbolsModule.ReturnValue]
		}
		
		if t_1.result == nil then
			t_1.result = { t.new(), n = 1 }
			var1[symbolsModule.ReturnValue] = t_1.result
		elseif t_1.result == symbolsModule.None then
			t_1.result = { n = 1 }
		end
		table.insert(var1[symbolsModule.Calls], t_1)
		
		return table.unpack(t_1.result)
	end
}

function t.new(p1)
	-- upvalues: symbolsModule (ref), t_1 (ref)
	local t = {
		[symbolsModule.Calls] = {},
		[symbolsModule.Children] = {},
		[symbolsModule.Lock] = p1,
		[symbolsModule.ReturnValue] = nil
	}
	
	for i, v in pairs(t_1) do
		t[i] = v
	end
	return setmetatable({}, t)
end

return t