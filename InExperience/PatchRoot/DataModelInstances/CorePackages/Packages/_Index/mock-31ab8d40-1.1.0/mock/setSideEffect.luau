local SymbolsModule = require(script.Parent.symbols)

return function(p1, Value) --[[ Line: 3 ]]
	-- upvalues: SymbolsModule (copy)
	getmetatable(p1)[SymbolsModule.SideEffect] = if Value then { calls = 0, value = Value } else nil
end