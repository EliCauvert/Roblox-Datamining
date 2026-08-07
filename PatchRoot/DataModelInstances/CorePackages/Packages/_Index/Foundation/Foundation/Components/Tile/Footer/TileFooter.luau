-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:10 2026 Pacific Standard Time.

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