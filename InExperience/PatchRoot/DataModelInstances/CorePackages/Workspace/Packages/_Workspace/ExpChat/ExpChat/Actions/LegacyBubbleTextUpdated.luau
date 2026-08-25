return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { messageId = p0, newText = p1 }
end)