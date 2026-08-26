local var1 = require(script.Parent.pageLogger):new()
var1:setContext({ bar = "bar" })

return function()
	-- upvalues: var1 (ref)
	var1:info("calling {root} {foo} {bar}")
	
	return "done"
end