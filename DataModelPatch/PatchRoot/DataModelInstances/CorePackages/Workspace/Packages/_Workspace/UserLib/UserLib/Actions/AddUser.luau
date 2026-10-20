return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(User)
	return { user = User }
end)