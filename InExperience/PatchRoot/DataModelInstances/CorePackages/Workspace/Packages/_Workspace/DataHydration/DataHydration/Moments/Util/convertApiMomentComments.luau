local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)

return function(p1)
	return if type(p1) == "table" then if type(p1.creatorEnabled) == "boolean" and type(p1.viewerCanRead) == "boolean" and type(p1.viewerCanWrite) == "boolean" then {
		count = if type(p1.count) == "number" then p1.count else nil,
		countIsCapped = if type(p1.countIsCapped) == "boolean" then p1.countIsCapped else nil,
		creatorEnabled = p1.creatorEnabled,
		viewerCanRead = p1.viewerCanRead,
		viewerCanWrite = p1.viewerCanWrite
	} else nil else nil
end