return require(script:FindFirstAncestor("Foundation").Parent.Dash).memoize(function(p1)
	return p1 ~= nil and (p1 ~= "" and p1:find("[^%l%d%-]") == nil)
end)