local symbolsModule = require(script.Parent.symbols)

local function resetMock(value, p1)
	-- upvalues: symbolsModule (ref), resetMock (ref)
	local var1 = getmetatable(value)
	var1[symbolsModule.Calls] = {}
	
	for i, v in pairs(var1[symbolsModule.Children]) do
		if not p1[v] then
			p1[v] = true
			resetMock(v, p1)
		end
	end
end

return function(p2)
	-- upvalues: resetMock (ref)
	resetMock(p2, {})
end