return function(p1: string): string --[[ Line: 1 | Named "assetIdAsContent" ]]
	return if typeof(p1) == "string" and p1:find("^.+://") then p1 else `rbxassetid://{p1}`
end