local SymbolsModule = require(script.Parent.symbols)

return function(p1, p2) --[[ Line: 3 ]]
	-- upvalues: SymbolsModule (copy)
	getmetatable(p1)[SymbolsModule.ReturnValue] = { p2 }
end