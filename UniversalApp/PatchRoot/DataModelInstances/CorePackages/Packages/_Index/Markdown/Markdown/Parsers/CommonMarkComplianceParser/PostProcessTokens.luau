local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(Markdown.Types)
local EmphasisParserModule = require(script.Parent.EmphasisParser)
local Flags = require(Markdown.Parent.MarkdownCore).Flags

return ({
	postProcessTokens = function(p1)
		-- upvalues: Flags (copy), EmphasisParserModule (copy)
		local List = {}
		local v1 = 1
		local IsTABLEROW = false
		
		for i = 1, #p1 do
			local v2 = p1[i]
			local IsTABLEDIVIDER: boolean = IsTABLEROW and v2.name == "TABLE_DIVIDER"
			
			if Flags.FFlagMarkdownTables and v2.isBlock then
				IsTABLEROW = v2.name == "TABLE_ROW"
			end
			if v2.isBlock or v2.name == "LINE_BREAK" or IsTABLEDIVIDER then
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