return require(script.Parent.Parent.Parent.Rodux).makeActionCreator(script.Name, function(Count) --[[ Line: 5 ]]
	assert(type(Count) == "number", "Request count must be a number")
	
	return { payload = { count = Count } }
end)