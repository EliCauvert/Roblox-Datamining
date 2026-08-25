return function(value)
	return if typeof(value) == "string" and value:find("^.+://") then value else `rbxassetid://{value}`
end