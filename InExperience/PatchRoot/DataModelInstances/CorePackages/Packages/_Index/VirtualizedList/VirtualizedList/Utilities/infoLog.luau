local Console = require(script.Parent.Parent.Parent.LuauPolyfill).console

return function(...) --[[ Line: 18 | Named "infoLog" ]]
	-- upvalues: Console (copy)
	return Console.log(...)
end