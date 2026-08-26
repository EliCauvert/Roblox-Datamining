return require(script.Parent.Parent.dependencies).Rodux.makeActionCreator(script.Name, function(p1)
	assert(type(p1) == "table", string.format("SetIsPhoneVerified action expects params to be a table, was %s", type(p1)))
	
	return p1
end)