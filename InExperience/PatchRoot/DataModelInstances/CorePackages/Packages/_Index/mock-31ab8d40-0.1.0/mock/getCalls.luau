local SymbolsModule = require(script.Parent.symbols)
local SpyModule = require(script.Parent.Spy)

return function(Callback) --[[ Line: 4 ]]
	-- upvalues: SpyModule (copy), SymbolsModule (copy)
	if type(Callback) == "function" then
		local LookupResult = SpyModule.lookup(Callback)
		
		if LookupResult then
			return LookupResult[SymbolsModule.Calls]
		end
		error("Calling getCalls on a non-spy function")
	end
	local RawValue = rawget(Callback, SymbolsModule.Calls)
	
	if RawValue == nil then
		RawValue = getmetatable(Callback)[SymbolsModule.Calls]
	end
	if RawValue == nil then
		error("Calling getCalls on a non-mock")
	end
	return RawValue
end