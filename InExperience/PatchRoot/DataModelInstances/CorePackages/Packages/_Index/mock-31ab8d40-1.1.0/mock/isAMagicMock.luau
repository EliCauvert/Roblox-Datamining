local symbolsModule = require(script.Parent.symbols)

return function(p0) --[[ line: 3 ]]
	-- upvalues: symbolsModule (ref)
	local var1 = getmetatable(p0)
	
	return if var1 then var1[symbolsModule.isMagicMock] ~= nil else false
end