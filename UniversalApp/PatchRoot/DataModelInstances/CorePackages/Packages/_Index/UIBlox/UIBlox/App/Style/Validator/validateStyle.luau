local parent = script.Parent
local tModule = require(parent.Parent.Parent.Parent.Parent.t)

return tModule.strictInterface({
	Theme = tModule.optional(require(parent.validateTheme)),
	Font = tModule.optional(require(parent.validateFont)),
	Tokens = tModule.optional(require(parent.validateTokens)),
	Settings = tModule.optional(require(parent.validateSettings))
})