local NewResult = require(script.Parent.Parent.Parent.Logger).new()
NewResult:setContext({ foo = "foo" })

return NewResult