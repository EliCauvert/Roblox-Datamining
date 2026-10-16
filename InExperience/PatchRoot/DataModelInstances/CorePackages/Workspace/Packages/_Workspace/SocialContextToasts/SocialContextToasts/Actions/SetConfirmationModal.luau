return require(script:FindFirstAncestor("SocialContextToasts").Parent.Rodux).makeActionCreator(script.Name, function(IsConfirmationModalOpen, CloseCallback) --[[ Line: 5 ]]
	return {
		isConfirmationModalOpen = IsConfirmationModalOpen,
		closeCallback = CloseCallback
	}
end)