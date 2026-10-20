local Console = require(script.Parent.Parent.Parent.LuauPolyfill).console

return function(...)
	-- upvalues: Console (copy)
	return Console.log(...)
end