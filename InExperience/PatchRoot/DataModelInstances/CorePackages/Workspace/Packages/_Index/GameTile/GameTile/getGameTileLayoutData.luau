local _ = require(script:FindFirstAncestor("GameTile").GameTileTypes)
local t = {}

return function(p1, p2)
	-- upvalues: t (ref)
	return if p1 and p1.layoutDataBySort and (p2 and p2 ~= "") and p1.layoutDataBySort[p2] then p1.layoutDataBySort[p2] elseif p1 and p1.defaultLayoutData then p1.defaultLayoutData else t
end