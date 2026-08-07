return function(p0) --[[ line: 12 | named "getCaptureMomentId" ]]
	return if typeof(p0) == "table" then if p0.assetId == nil then if p0.LocalId == nil then nil else `creation:{p0.LocalId}` else `creation:{p0.assetId}` else nil
end