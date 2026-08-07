local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p0) --[[ line: 9 | named "BaseMenuDivider" ]]
	-- upvalues: useTokensModule (ref), reactModule (ref), viewModule (ref)
	local var4 = useTokensModule()
	
	return reactModule.createElement(viewModule, {
		tag = "row flex-x-fill",
		testId = "--foundation-menu-divider-item",
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.new(1, 0, 0, var4.Stroke.Standard)
	}, reactModule.createElement(viewModule, {
		tag = "grow size-0-full",
		backgroundStyle = var4.Color.Stroke.Default
	}))
end