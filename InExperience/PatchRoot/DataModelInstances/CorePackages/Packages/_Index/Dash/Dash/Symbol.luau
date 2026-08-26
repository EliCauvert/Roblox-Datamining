local var1 = require(script.Parent.class)("Symbol", function(p1)
	return { name = p1 }
end)

function var0.toString(p1)
	return ("Symbol(%s)"):format(p1.name)
end

return var1