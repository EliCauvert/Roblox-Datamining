local TModule = require(game:GetService("CorePackages").Packages.t)

return TModule.interface({
	version = TModule.string,
	order = TModule.optional(TModule.number),
	type = TModule.optional(TModule.enum(Enum.AccessoryType)),
	isLayered = TModule.optional(TModule.boolean)
})