local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local viewModule = require(foundation.Components.View)
local useTileModule = require(foundation.Components.Tile.useTile)

return function(p0) --[[ line: 14 | named "TileFooter" ]]
	-- upvalues: useTileModule (ref), reactModule (ref), viewModule (ref)
	return reactModule.createElement(viewModule, {
		LayoutOrder = 2,
		tag = "shrink size-full-0 auto-y",
		testId = `{useTileModule().testId}--footer`
	}, p0.children)
end