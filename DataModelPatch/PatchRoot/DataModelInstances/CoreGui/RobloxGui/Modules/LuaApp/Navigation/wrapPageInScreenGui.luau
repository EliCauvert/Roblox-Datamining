local RoactModule = require(game:GetService("CorePackages").Packages.Roact)

return function(p1, _, _, p2)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement(p1, p2)
end