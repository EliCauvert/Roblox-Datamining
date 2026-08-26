local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p1)
	-- upvalues: useTokensModule (ref), reactModule (ref), viewModule (ref)
	local var1 = useTokensModule()
	
	return reactModule.createElement(viewModule, {
		tag = "row flex-x-fill",
		testId = "--foundation-menu-divider-item",
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(1, 0, 0, var1.Stroke.Standard)
	}, reactModule.createElement(viewModule, {
		tag = "grow size-0-full",
		backgroundStyle = var1.Color.Stroke.Default
	}))
end