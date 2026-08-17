local parent = script.Parent
local tModule = require(parent.Parent.Parent.Parent.Parent.t)

return tModule.strictInterface({
	Theme = tModule.optional(require(parent.validateTheme)),
	Font = tModule.optional(require(parent.validateFont)),
	Tokens = tModule.optional(tModule.any),
	Settings = tModule.optional(require(parent.validateSettings))
})