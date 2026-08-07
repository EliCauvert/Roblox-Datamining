local dictionary = require(script:FindFirstAncestor("ExpChat").Parent.llama).Dictionary
local var0 = 0

return function(p0) --[[ line: 7 | named "createMockMessage" ]]
	-- upvalues: var0 (write), dictionary (ref)
	var0 += 1
	
	return dictionary.join({
		name = "Foo",
		userId = "1",
		text = "Hello, World!",
		id = tostring(var0),
		timestamp = var0
	}, p0)
end