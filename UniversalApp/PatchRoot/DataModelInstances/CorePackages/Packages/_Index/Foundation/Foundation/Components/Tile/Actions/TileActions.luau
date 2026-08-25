local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local useTileModule = require(foundation.Components.Tile.useTile)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)

return function(p0)
	-- upvalues: useTileModule (ref), reactModule (ref), viewModule (ref)
	return reactModule.createElement(viewModule, {
		LayoutOrder = 3,
		tag = "shrink size-full-0 auto-y",
		Visible = p0.Visible,
		testId = `{useTileModule().testId}--actions`
	}, p0.children)
end