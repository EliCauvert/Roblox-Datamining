return require(script:FindFirstAncestor("SocialContextToasts").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { isConfirmationModalOpen = p0, closeCallback = p1 }
end)