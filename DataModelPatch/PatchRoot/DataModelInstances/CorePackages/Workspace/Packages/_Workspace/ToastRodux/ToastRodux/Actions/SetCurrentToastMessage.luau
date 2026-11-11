return require(script:FindFirstAncestor("ToastRodux").Parent.Rodux).makeActionCreator(script.Name, function(ToastMessage)
	assert(type(ToastMessage) == "table", "SetCurrentToastMessage action expects toastMessage to be a table")
	
	return { toastMessage = ToastMessage }
end)