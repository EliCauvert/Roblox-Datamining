local roactModule = require(script.Parent.Parent.Roact)

return function() --[[ line: 7 ]]
	-- upvalues: roactModule (ref)
	return roactModule.Ref == "ref"
end