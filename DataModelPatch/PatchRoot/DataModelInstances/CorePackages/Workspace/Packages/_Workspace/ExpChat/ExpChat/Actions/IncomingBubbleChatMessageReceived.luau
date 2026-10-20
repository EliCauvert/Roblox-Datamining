return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(BubbleChatMessageTable)
	return { bubbleChatMessageTable = BubbleChatMessageTable }
end)