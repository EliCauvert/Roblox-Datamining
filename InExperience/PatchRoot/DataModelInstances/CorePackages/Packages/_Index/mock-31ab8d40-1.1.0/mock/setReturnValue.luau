local symbolsModule = require(script.Parent.symbols)

return function(p1, p2)
	-- upvalues: symbolsModule (ref)
	getmetatable(p1)[symbolsModule.ReturnValue] = { p2 }
end