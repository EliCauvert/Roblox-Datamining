local NewResult = require(script.Parent.pageLogger):new()
NewResult:setContext({ bar = "bar" })

return function(): string --[[ Line: 4 ]]
	-- upvalues: NewResult (copy)
	NewResult:info("calling {root} {foo} {bar}")
	
	return "done"
end