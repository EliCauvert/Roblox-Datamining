return require(script:FindFirstAncestor("ToastRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	assert(type(p0) == "table", "SetCurrentToastMessage action expects toastMessage to be a table")
	
	return { toastMessage = p0 }
end)