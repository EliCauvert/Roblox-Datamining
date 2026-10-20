local NewResult = require(script.Parent.pageLogger):new()
NewResult:setContext({ bar = "bar" })

return function(): string
	-- upvalues: NewResult (copy)
	NewResult:info("calling {root} {foo} {bar}")
	
	return "done"
end