return require(script.Parent.Parent.Parent.Rodux).makeActionCreator(script.Name, function(PromptId)
	return { promptId = PromptId }
end)