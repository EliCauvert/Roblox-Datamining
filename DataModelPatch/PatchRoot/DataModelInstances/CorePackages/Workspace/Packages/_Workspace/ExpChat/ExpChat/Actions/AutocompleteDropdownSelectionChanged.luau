return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(SelectedIndex)
	return { selectedIndex = SelectedIndex }
end)