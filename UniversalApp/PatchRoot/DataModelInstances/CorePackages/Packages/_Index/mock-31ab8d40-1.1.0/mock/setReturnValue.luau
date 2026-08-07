local symbolsModule = require(script.Parent.symbols)

return function(p0, p1) --[[ line: 3 ]]
	-- upvalues: symbolsModule (ref)
	getmetatable(p0)[symbolsModule.ReturnValue] = { p1 }
end