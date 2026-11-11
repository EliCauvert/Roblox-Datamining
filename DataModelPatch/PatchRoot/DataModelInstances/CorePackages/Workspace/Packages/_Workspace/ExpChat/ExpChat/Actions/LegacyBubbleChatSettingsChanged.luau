return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(ChatSettings)
	return { chatSettings = ChatSettings }
end)