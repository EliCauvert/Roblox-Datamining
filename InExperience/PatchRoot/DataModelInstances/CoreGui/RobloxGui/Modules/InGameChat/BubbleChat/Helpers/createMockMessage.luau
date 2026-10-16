local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local Timestamp = 0

return function(p1) --[[ Line: 7 | Named "createMockMessage" ]]
	-- upvalues: Timestamp (ref), CryoModule (copy)
	Timestamp += 1
	
	return CryoModule.Dictionary.join({
		name = "Foo",
		userId = "1",
		text = "Hello, World!",
		id = tostring(Timestamp),
		timestamp = Timestamp
	}, p1)
end