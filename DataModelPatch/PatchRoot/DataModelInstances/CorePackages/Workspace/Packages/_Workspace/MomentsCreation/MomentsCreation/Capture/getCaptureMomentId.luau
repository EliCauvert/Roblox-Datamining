return function(p1)
	return if typeof(p1) == "table" then if p1.assetId == nil then if p1.LocalId == nil then nil else `creation:{p1.LocalId}` else `creation:{p1.assetId}` else nil
end