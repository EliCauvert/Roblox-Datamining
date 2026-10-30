local Markdown = script:FindFirstAncestor("Markdown")
local ParentModule = require(script.Parent)
local CommonMarkModule = require(Markdown.Parent.CommonMark)
local _ = require(Markdown.Types)

return function(p1)
	-- upvalues: ParentModule (copy), CommonMarkModule (copy)
	local T = if p1 == nil or p1.extensions == nil then {} else p1.extensions
	local T1 = if p1 == nil or p1.parserOptions == nil then {} else table.clone(p1.parserOptions)
	local Tbl = T
	
	if T1.extensions ~= nil then
		Tbl = table.clone(T1.extensions)
		table.move(T, 1, #T, #Tbl + 1, Tbl)
		table.freeze(Tbl)
	end
	T1.extensions = Tbl
	table.freeze(T1)
	local BuildResult = ParentModule.build(Tbl)
	local config = {
		parseOptions = T1,
		parseDocument = function(p2)
			-- upvalues: CommonMarkModule (upval), T1 (copy)
			return CommonMarkModule.parse(p2, T1)
		end,
		toRendererAst = function(ParseDocumentResult, p2)
			-- upvalues: BuildResult (copy)
			return BuildResult.toRendererAst(ParseDocumentResult, p2)
		end
	}
	
	function config.parse(p2, ParseOptions)
		-- upvalues: config (copy)
		return (config.toRendererAst(config.parseDocument(p2), ParseOptions))
	end
	
	function config.safeParse(p2, p3)
		-- upvalues: config (copy)
		return if p3 == nil then pcall(config.parse, p2) else pcall(config.parse, p2, p3)
	end
	
	return config
end