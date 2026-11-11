local TModule = require(game:GetService("CorePackages").Packages.t)

return TModule.union(TModule.instanceIsA("Player"), TModule.interface({
	UserId = TModule.integer,
	Name = TModule.string,
	DisplayName = TModule.string
}))