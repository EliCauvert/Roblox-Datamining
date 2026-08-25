local _ = require(script:FindFirstAncestor("GameTile").GameTileTypes)
local t = {}

return function(p0, p1)
	-- upvalues: t (ref)
	return if p0 and p0.layoutDataBySort and (p1 and p1 ~= "") and p0.layoutDataBySort[p1] then p0.layoutDataBySort[p1] elseif p0 and p0.defaultLayoutData then p0.defaultLayoutData else t
end