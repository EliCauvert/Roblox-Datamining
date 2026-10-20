local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)

return function(p1, p2)
	-- upvalues: CryoModule (copy)
	return CryoModule.Dictionary.join(p1, p2)
end