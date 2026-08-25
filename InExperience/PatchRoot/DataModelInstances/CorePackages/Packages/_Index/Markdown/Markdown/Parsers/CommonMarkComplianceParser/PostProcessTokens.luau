local _ = require(script:FindFirstAncestor("Markdown").Types)
local emphasisParserModule = require(script.Parent.EmphasisParser)

return ({
	postProcessTokens = function(p0)
		-- upvalues: emphasisParserModule (ref)
		local t = {}
		local var2 = 1
		
		for i = 1, #p0 do
			local var3 = p0[i]
			
			if not var3.isBlock and var3.name ~= "LINE_BREAK" then
				continue
			end
			if var2 < i then
				for i, v in emphasisParserModule.processEmphasisRun(p0, var2, i - 1) do
					table.insert(t, v)
				end
			end
			table.insert(t, var3)
			var2 = i + 1
		end
		if var2 <= #p0 then
			for i_1, v in emphasisParserModule.processEmphasisRun(p0, var2, #p0) do
				table.insert(t, v)
			end
		end
		return t
	end
}).postProcessTokens