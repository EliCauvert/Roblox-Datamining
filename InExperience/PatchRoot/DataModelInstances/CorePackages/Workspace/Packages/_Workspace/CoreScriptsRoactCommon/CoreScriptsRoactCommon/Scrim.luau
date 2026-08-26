local parent = script.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(reactModule.forwardRef(function(p1, _)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "size-full",
		backgroundStyle = useTokens().Color.Common.Scrim,
		Visible = p1 and p1.Visible,
		ZIndex = p1 and p1.ZIndex
	})
end))