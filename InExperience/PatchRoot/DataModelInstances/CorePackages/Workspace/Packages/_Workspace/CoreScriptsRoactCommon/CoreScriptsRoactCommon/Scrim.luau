local parent = script.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(reactModule.forwardRef(function(p0, _) --[[ line: 15 | named "Scrim" ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "size-full",
		backgroundStyle = useTokens().Color.Common.Scrim,
		Visible = p0 and p0.Visible,
		ZIndex = p0 and p0.ZIndex
	})
end))