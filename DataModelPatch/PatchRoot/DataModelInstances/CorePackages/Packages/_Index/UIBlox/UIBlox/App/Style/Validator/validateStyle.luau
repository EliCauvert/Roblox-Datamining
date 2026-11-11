local Parent = script.Parent
local TModule = require(Parent.Parent.Parent.Parent.Parent.t)

return (TModule.strictInterface({
	Theme = TModule.optional((require(Parent.validateTheme))),
	Font = TModule.optional((require(Parent.validateFont))),
	Tokens = TModule.optional((require(Parent.validateTokens))),
	Settings = TModule.optional((require(Parent.validateSettings)))
}))