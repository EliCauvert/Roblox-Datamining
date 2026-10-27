local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(Markdown.Adapter)
local ParentModule = require(script.Parent)
local _ = require(Markdown.Types)
local RendererParserModule = {
	parse = function(p1, p2)
		-- upvalues: ParentModule (copy)
		return (ParentModule.toRendererAst(ParentModule.parse(p1), p2))
	end
}

function RendererParserModule.safeParse(p1, p2)
	-- upvalues: RendererParserModule (copy)
	return if p2 == nil then pcall(RendererParserModule.parse, p1) else pcall(RendererParserModule.parse, p1, p2)
end

return RendererParserModule