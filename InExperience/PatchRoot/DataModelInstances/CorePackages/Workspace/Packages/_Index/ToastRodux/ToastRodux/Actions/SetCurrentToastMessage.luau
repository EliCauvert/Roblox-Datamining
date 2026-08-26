return require(script:FindFirstAncestor("ToastRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	assert(type(p1) == "table", "SetCurrentToastMessage action expects toastMessage to be a table")
	
	return { toastMessage = p1 }
end)