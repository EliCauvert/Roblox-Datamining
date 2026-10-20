local Symbol = require(script.Parent.class)("Symbol", function(Name)
	return { name = Name }
end)

function Symbol.toString(p1): string
	return ("Symbol(%s)"):format(p1.name)
end

return Symbol