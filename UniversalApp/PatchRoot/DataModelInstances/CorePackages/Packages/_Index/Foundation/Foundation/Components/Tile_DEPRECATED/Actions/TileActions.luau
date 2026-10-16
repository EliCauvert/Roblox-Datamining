local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local UseTileModule = require(Foundation.Components.Tile_DEPRECATED.useTile)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)

return function(p1) --[[ Line: 17 | Named "TileActions" ]]
	-- upvalues: UseTileModule (copy), ReactModule (copy), ViewModule (copy)
	return ReactModule.createElement(ViewModule, {
		LayoutOrder = 3,
		tag = "shrink size-full-0 auto-y",
		Visible = p1.Visible,
		testId = `{UseTileModule().testId}--actions`
	}, p1.children)
end