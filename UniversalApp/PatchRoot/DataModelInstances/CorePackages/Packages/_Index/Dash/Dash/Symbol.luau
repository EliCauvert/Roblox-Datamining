local Symbol = require(script.Parent.class)("Symbol", function(Name) --[[ Line: 20 ]]
	return { name = Name }
end)

function Symbol.toString(p1): string --[[ Line: 26 ]]
	return ("Symbol(%s)"):format(p1.name)
end

return Symbol