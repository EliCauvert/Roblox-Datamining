local symbolsModule = require(script.Parent.symbols)

return function(p1, p2)
	-- upvalues: symbolsModule (ref)
	getmetatable(p1)[symbolsModule.SideEffect] = if p2 then { calls = 0, value = p2 } else nil
end