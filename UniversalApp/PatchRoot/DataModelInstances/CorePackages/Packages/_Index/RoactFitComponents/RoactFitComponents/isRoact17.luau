local roactModule = require(script.Parent.Parent.Roact)

return function()
	-- upvalues: roactModule (ref)
	return roactModule.Ref == "ref"
end