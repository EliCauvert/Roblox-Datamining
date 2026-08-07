local symbolsModule = require(script.Parent.symbols)

return function(p0, p1) --[[ line: 3 ]]
	-- upvalues: symbolsModule (ref)
	getmetatable(p0)[symbolsModule.SideEffect] = if p1 then { calls = 0, value = p1 } else nil
end