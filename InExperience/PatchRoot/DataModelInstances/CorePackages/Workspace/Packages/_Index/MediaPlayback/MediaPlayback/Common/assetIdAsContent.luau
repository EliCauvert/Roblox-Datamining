return function(value) --[[ line: 1 | named "assetIdAsContent" ]]
	return if typeof(value) == "string" and value:find("^.+://") then value else `rbxassetid://{value}`
end