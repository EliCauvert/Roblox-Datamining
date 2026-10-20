local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(Frame)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), ViewModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	
	return ReactModule.createElement(ViewModule, {
		tag = "row flex-x-fill",
		testId = "--foundation-menu-divider-item",
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(1, 0, 0, UseTokensModuleResult.Stroke.Standard)
	}, ReactModule.createElement(ViewModule, {
		tag = "grow size-0-full",
		backgroundStyle = UseTokensModuleResult.Color.Stroke.Default
	}))
end