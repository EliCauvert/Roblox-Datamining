local SymbolsModule = require(script.Parent.symbols)

return function(p1): boolean
	-- upvalues: SymbolsModule (copy)
	local Meta = getmetatable(p1)
	
	return if Meta then Meta[SymbolsModule.isMagicMock] ~= nil else false
end