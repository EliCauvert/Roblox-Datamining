local _ = require(script:FindFirstAncestor("Markdown").Types)
local EmphasisParserModule = require(script.Parent.EmphasisParser)

return ({
	postProcessTokens = function(p1) --[[ Line: 11 ]]
		-- upvalues: EmphasisParserModule (copy)
		local List = {}
		local v1 = 1
		
		for i = 1, #p1 do
			local v2 = p1[i]
			
			if v2.isBlock or v2.name == "LINE_BREAK" then
				if v1 < i then
					for _, value in EmphasisParserModule.processEmphasisRun(p1, v1, i - 1) do
						table.insert(List, value)
					end
				end
				table.insert(List, v2)
				v1 = i + 1
			end
		end
		if v1 <= #p1 then
			for _, value1 in EmphasisParserModule.processEmphasisRun(p1, v1, #p1) do
				table.insert(List, value1)
			end
		end
		return List
	end
}).postProcessTokens