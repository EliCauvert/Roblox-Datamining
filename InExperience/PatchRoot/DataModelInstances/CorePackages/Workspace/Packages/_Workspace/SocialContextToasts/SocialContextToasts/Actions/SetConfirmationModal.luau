return require(script:FindFirstAncestor("SocialContextToasts").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { isConfirmationModalOpen = p1, closeCallback = p2 }
end)