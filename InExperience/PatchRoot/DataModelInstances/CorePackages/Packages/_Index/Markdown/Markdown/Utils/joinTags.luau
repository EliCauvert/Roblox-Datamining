local forEachArgs = require(script:FindFirstAncestor("Markdown").Parent.Dash).forEachArgs
local concat = table.concat

return function(...)
	-- upvalues: forEachArgs (ref), concat (ref)
	local t = {}
	forEachArgs(function(p1)
		-- upvalues: t (ref)
		if typeof(p1) == "string" then
			table.insert(t, p1)
			
			return
		elseif typeof(p1) == "table" then
			for i, v in p1 do
				if v then
					table.insert(t, i)
				end
			end
		end
	end, ...)
	
	return concat(t, " ")
end