local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ViewModule = require(Foundation.Components.View)
local UseTileModule = require(Foundation.Components.Tile_DEPRECATED.useTile)

return function(p1)
	-- upvalues: UseTileModule (copy), ReactModule (copy), ViewModule (copy)
	return ReactModule.createElement(ViewModule, {
		LayoutOrder = 2,
		tag = "shrink size-full-0 auto-y",
		testId = `{UseTileModule().testId}--footer`
	}, p1.children)
end