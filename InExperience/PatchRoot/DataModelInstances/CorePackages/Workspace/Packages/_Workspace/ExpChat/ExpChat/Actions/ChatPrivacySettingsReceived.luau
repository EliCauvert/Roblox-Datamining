return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(CanUserChat) --[[ Line: 10 ]]
	return { canUserChat = CanUserChat }
end)