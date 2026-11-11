return function(p1)
	return if typeof(p1) == "table" and p1.assetId ~= nil then Content.fromUri(`rbxthumb://type=Asset&id={p1.assetId}&w=420&h=420`) else Content.fromObject(p1)
end