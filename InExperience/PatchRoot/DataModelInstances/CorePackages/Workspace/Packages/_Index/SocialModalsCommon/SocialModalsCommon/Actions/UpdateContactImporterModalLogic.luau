return require(script:FindFirstAncestor("SocialModalsCommon").Parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 10 ]]
	assert(type(p0) == "table", string.format("UpdateContactImporterModalLogic action expects params to be a table, was %s", type(p0)))
	
	return p0
end)