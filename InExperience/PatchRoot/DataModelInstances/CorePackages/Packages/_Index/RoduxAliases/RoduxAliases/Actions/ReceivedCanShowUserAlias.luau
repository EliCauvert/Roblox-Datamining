return require(script:FindFirstAncestor("RoduxAliases").Parent.Rodux).makeActionCreator(require(script.Parent.ActionDomain) .. script.Name, function(ShowUserAlias) --[[ Line: 6 ]]
	return { payload = { showUserAlias = ShowUserAlias } }
end)