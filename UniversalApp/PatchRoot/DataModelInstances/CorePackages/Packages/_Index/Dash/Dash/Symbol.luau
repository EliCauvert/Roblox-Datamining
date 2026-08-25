local var0 = require(script.Parent.class)("Symbol", function(p0)
	return { name = p0 }
end)

function var0.toString(p1)
	return ("Symbol(%s)"):format(p1.name)
end

return var0