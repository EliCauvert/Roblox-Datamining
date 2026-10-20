return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(CanUserChat)
	return { canUserChat = CanUserChat }
end)