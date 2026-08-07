local var0 = require(script.Parent.class)("Symbol", function(p0) --[[ line: 20 ]]
	return { name = p0 }
end)

function var0.toString(p1) --[[ line: 26 ]]
	return ("Symbol(%s)"):format(p1.name)
end

return var0