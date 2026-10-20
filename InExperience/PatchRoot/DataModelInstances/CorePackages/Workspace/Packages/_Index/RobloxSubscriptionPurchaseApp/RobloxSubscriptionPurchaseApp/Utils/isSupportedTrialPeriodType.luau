local config = { week = true }

return function(Text: string): boolean
	-- upvalues: config (copy)
	return Text ~= nil and config[string.lower(Text)] == true
end