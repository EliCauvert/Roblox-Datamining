local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local useTileModule = require(foundation.Components.Tile.useTile)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)

return function(p1)
	-- upvalues: useTileModule (ref), reactModule (ref), viewModule (ref)
	return reactModule.createElement(viewModule, {
		LayoutOrder = 3,
		tag = "shrink size-full-0 auto-y",
		Visible = p1.Visible,
		testId = `{useTileModule().testId}--actions`
	}, p1.children)
end