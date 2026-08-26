local symbolsModule = require(script.Parent.symbols)
local spyModule = require(script.Parent.Spy)

return function(p1)
	-- upvalues: spyModule (ref), symbolsModule (ref)
	if type(p1) == "function" then
		local var1 = spyModule.lookup(p1)
		
		if var1 then
			return var1[symbolsModule.Calls]
		end
		error("Calling getCalls on a non-spy function")
	end
	local var2 = rawget(p1, symbolsModule.Calls)
	
	if var2 == nil then
		var2 = getmetatable(p1)[symbolsModule.Calls]
	end
	if var2 == nil then
		error("Calling getCalls on a non-mock")
	end
	return var2
end