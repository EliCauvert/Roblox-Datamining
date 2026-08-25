local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local viewModule = require(foundation.Components.View)
local useTileModule = require(foundation.Components.Tile.useTile)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = { LayoutOrder = 2 }

return function(p0)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useTileModule (ref), reactModule (ref), viewModule (ref)
	local var7 = withDefaultsModule(p0, t)
	local var8 = useTileModule()
	
	return reactModule.createElement(viewModule, {
		tag = "col align-y-top gap-small size-full",
		flexItem = { FlexMode = Enum.UIFlexMode.Shrink },
		padding = if var8.isContained then useTokensModule().Padding.Small else nil,
		LayoutOrder = var7.LayoutOrder,
		testId = `{var8.testId}--content`
	}, var7.children)
end