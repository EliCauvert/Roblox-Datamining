local Dictionary = require(script:FindFirstAncestor("ExpChat").Parent.llama).Dictionary
local Timestamp = 0

return function(p1) --[[ Line: 7 | Named "createMockMessage" ]]
	-- upvalues: Timestamp (ref), Dictionary (copy)
	Timestamp += 1
	
	return Dictionary.join({
		name = "Foo",
		userId = "1",
		text = "Hello, World!",
		id = tostring(Timestamp),
		timestamp = Timestamp
	}, p1)
end