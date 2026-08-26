local dictionary = require(script:FindFirstAncestor("ExpChat").Parent.llama).Dictionary
local var1 = 0

return function(p1)
	-- upvalues: var1 (write), dictionary (ref)
	var1 += 1
	
	return dictionary.join({
		name = "Foo",
		userId = "1",
		text = "Hello, World!",
		id = tostring(var1),
		timestamp = var1
	}, p1)
end