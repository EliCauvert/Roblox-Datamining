return require(script:FindFirstAncestor("Foundation").Parent.Dash).memoize(function(p0)
	return p0 ~= nil and (p0 ~= "" and p0:find("[^%l%d%-]") == nil)
end)