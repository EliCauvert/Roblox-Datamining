local symbolsModule = require(script.Parent.symbols)

local function resetMock(value, p0)
	-- upvalues: symbolsModule (ref), resetMock (ref)
	local var2 = getmetatable(value)
	var2[symbolsModule.Calls] = {}
	
	for i, v in pairs(var2[symbolsModule.Children]) do
		if not p0[v] then
			p0[v] = true
			resetMock(v, p0)
		end
	end
end

return function(p1)
	-- upvalues: resetMock (ref)
	resetMock(p1, {})
end