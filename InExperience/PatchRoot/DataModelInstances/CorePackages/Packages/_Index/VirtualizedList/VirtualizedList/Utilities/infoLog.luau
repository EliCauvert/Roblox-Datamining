local console = require(script.Parent.Parent.Parent.LuauPolyfill).console

return function(...) --[[ line: 18 | named "infoLog" ]]
	-- upvalues: console (ref)
	return console.log(...)
end