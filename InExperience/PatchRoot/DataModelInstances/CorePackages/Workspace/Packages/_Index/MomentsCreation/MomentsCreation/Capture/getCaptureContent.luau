return function(p0)
	return if typeof(p0) == "table" and p0.assetId ~= nil then Content.fromUri(`rbxthumb://type=Asset&id={p0.assetId}&w=420&h=420`) else Content.fromObject(p0)
end