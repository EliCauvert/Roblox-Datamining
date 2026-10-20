return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(UseTranslation)
	return { useTranslation = UseTranslation }
end)