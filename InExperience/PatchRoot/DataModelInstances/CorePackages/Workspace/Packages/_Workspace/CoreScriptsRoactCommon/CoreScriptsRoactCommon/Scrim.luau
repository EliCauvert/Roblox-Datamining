local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return ReactModule.memo(ReactModule.forwardRef(function(p1, _) --[[ Line: 15 | Named "Scrim" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "size-full",
		backgroundStyle = UseTokensFunction().Color.Common.Scrim,
		Visible = p1 and p1.Visible,
		ZIndex = p1 and p1.ZIndex
	})
end))