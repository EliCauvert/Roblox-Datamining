return require(script.Parent.Parent.dependencies).Rodux.makeActionCreator(script.Name, function(p0)
	assert(type(p0) == "table", string.format("SetIsPhoneVerified action expects params to be a table, was %s", type(p0)))
	
	return p0
end)