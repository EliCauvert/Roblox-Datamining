local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ViewModule = require(Foundation.Components.View)
local UseTileModule = require(Foundation.Components.Tile_DEPRECATED.useTile)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = { LayoutOrder = 2 }

return function(p1) --[[ Line: 20 | Named "TileContent" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseTileModule (copy), ReactModule (copy), ViewModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseTileModuleResult = UseTileModule()
	
	return ReactModule.createElement(ViewModule, {
		tag = "col align-y-top gap-small size-full",
		flexItem = { FlexMode = Enum.UIFlexMode.Shrink },
		padding = if UseTileModuleResult.isContained then UseTokensModuleResult.Padding.Small else nil,
		LayoutOrder = WithDefaultsModuleResult.LayoutOrder,
		testId = `{UseTileModuleResult.testId}--content`
	}, WithDefaultsModuleResult.children)
end