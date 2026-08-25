local console = require(script.Parent.Parent.Parent.LuauPolyfill).console

return function(...)
	-- upvalues: console (ref)
	return console.log(...)
end