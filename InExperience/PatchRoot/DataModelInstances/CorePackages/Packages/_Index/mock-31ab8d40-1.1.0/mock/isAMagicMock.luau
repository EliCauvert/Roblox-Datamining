local symbolsModule = require(script.Parent.symbols)

return function(p1)
	-- upvalues: symbolsModule (ref)
	local var1 = getmetatable(p1)
	
	return if var1 then var1[symbolsModule.isMagicMock] ~= nil else false
end