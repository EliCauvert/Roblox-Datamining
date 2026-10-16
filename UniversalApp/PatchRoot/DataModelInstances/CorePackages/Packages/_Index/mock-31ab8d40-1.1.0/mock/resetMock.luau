local SymbolsModule = require(script.Parent.symbols)

local function resetMock(p1, p2) --[[ Line: 3 ]]
	-- upvalues: SymbolsModule (copy), resetMock (copy)
	local Meta = getmetatable(p1)
	Meta[SymbolsModule.Calls] = {}
	
	for _, value in pairs(Meta[SymbolsModule.Children]) do
		if not p2[value] then
			p2[value] = true
			resetMock(value, p2)
		end
	end
end

return function(p3) --[[ Line: 15 ]]
	-- upvalues: resetMock (copy)
	resetMock(p3, {})
end