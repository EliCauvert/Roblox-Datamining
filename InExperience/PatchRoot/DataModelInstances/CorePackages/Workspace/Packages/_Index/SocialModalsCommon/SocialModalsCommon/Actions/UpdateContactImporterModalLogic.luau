return require(script:FindFirstAncestor("SocialModalsCommon").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	assert(type(p1) == "table", string.format("UpdateContactImporterModalLogic action expects params to be a table, was %s", type(p1)))
	
	return p1
end)