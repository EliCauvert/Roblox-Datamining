local cryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local var1 = 0

return function(p1)
	-- upvalues: var1 (write), cryoModule (ref)
	var1 += 1
	
	return cryoModule.Dictionary.join({
		name = "Foo",
		userId = "1",
		text = "Hello, World!",
		id = tostring(var1),
		timestamp = var1
	}, p1)
end