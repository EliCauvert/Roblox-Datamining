return require(script:FindFirstAncestor("RoduxAliases").Parent.Rodux).makeActionCreator(require(script.Parent.ActionDomain) .. script.Name, function(p1)
	return { payload = { showUserAlias = p1 } }
end)