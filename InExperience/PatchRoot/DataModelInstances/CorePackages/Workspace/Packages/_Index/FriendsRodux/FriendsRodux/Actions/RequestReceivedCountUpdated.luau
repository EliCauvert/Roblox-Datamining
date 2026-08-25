return require(script.Parent.Parent.Parent.Rodux).makeActionCreator(script.Name, function(p0)
	assert(type(p0) == "number", "Request count must be a number")
	
	return { payload = { count = p0 } }
end)