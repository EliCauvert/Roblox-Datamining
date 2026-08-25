local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local viewModule = require(foundation.Components.View)
local useTileModule = require(foundation.Components.Tile.useTile)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = { LayoutOrder = 2 }

return function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useTileModule (ref), reactModule (ref), viewModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTileModule()
	
	return reactModule.createElement(viewModule, {
		tag = "col align-y-top gap-small size-full",
		flexItem = { FlexMode = Enum.UIFlexMode.Shrink },
		padding = if var2.isContained then useTokensModule().Padding.Small else nil,
		LayoutOrder = var1.LayoutOrder,
		testId = `{var2.testId}--content`
	}, var1.children)
end