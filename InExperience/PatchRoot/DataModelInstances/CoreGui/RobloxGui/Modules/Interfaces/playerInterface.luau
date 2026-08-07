local tModule = require(game:GetService("CorePackages").Packages.t)

return tModule.union(tModule.instanceIsA("Player"), tModule.interface({
	UserId = tModule.integer,
	Name = tModule.string,
	DisplayName = tModule.string
}))