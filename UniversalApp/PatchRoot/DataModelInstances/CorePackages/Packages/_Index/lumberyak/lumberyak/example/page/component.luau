local var0 = require(script.Parent.pageLogger):new()
var0:setContext({ bar = "bar" })

return function()
	-- upvalues: var0 (ref)
	var0:info("calling {root} {foo} {bar}")
	
	return "done"
end