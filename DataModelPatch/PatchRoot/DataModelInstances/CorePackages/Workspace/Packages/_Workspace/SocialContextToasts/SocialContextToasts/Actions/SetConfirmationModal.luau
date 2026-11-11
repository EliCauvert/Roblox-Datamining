return require(script:FindFirstAncestor("SocialContextToasts").Parent.Rodux).makeActionCreator(script.Name, function(IsConfirmationModalOpen, CloseCallback)
	return {
		isConfirmationModalOpen = IsConfirmationModalOpen,
		closeCallback = CloseCallback
	}
end)