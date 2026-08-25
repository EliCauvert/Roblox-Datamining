local symbolsModule = require(script.Parent.symbols)
local spyModule = require(script.Parent.Spy)

return function(p0)
	-- upvalues: spyModule (ref), symbolsModule (ref)
	if type(p0) == "function" then
		local var2 = spyModule.lookup(p0)
		
		if var2 then
			return var2[symbolsModule.Calls]
		end
		error("Calling getCalls on a non-spy function")
	end
	local var3 = rawget(p0, symbolsModule.Calls)
	
	if var3 == nil then
		var3 = getmetatable(p0)[symbolsModule.Calls]
	end
	if var3 == nil then
		error("Calling getCalls on a non-mock")
	end
	return var3
end