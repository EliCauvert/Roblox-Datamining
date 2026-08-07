return require(script:FindFirstAncestor("Foundation").Parent.Dash).memoize(function(p0) --[[ line: 6 | named "isBuilderIcon" ]]
	return p0 ~= nil and (p0 ~= "" and p0:find("[^%l%d%-]") == nil)
end)