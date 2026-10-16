local ForEachArgsFunction = require(script:FindFirstAncestor("Markdown").Parent.Dash).forEachArgs
local ConcatFunction = table.concat

return function(...) --[[ Line: 11 | Named "joinTags" ]]
	-- upvalues: ForEachArgsFunction (copy), ConcatFunction (copy)
	local List = {}
	ForEachArgsFunction(function(List1) --[[ Line: 13 ]]
		-- upvalues: List (copy)
		if typeof(List1) == "string" then
			table.insert(List, List1)
			
			return
		end
		if typeof(List1) == "table" then
			for i, value in List1 do
				if value then
					table.insert(List, i)
				end
			end
		end
	end, ...)
	
	return ConcatFunction(List, " ")
end