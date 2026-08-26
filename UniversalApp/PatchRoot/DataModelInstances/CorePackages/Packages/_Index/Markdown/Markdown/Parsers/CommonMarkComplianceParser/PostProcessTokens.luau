local _ = require(script:FindFirstAncestor("Markdown").Types)
local emphasisParserModule = require(script.Parent.EmphasisParser)

return ({
	postProcessTokens = function(p1)
		-- upvalues: emphasisParserModule (ref)
		local t = {}
		local var1 = 1
		
		for i = 1, #p1 do
			local var2 = p1[i]
			
			if not var2.isBlock and var2.name ~= "LINE_BREAK" then
				continue
			end
			if var1 < i then
				for i, v in emphasisParserModule.processEmphasisRun(p1, var1, i - 1) do
					table.insert(t, v)
				end
			end
			table.insert(t, var2)
			var1 = i + 1
		end
		if var1 <= #p1 then
			for i_1, v in emphasisParserModule.processEmphasisRun(p1, var1, #p1) do
				table.insert(t, v)
			end
		end
		return t
	end
}).postProcessTokens