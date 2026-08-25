return require(script:FindFirstAncestor("RoduxAliases").Parent.Rodux).makeActionCreator(require(script.Parent.ActionDomain) .. script.Name, function(p0)
	return { payload = { showUserAlias = p0 } }
end)