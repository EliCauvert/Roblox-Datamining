return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { useTranslation = p1, messageId = p2 }
end)