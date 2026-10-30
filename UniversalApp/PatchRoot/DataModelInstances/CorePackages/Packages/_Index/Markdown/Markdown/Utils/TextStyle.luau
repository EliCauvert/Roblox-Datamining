local Markdown = script:FindFirstAncestor("Markdown")
local Parent = Markdown.Parent
local DashModule = require(Parent.Dash)
local _ = require(Markdown.Types)
local _ = require(Parent.InlineLayout)
local InlineEngineTag = require(Parent.MarkdownCore).Enums.InlineEngineTag

return {
	getCodeTextStyles = function(p1)
		-- upvalues: DashModule (copy)
		return DashModule.joinDeep(p1.textStyles, p1.codeStyles)
	end,
	getBaseTextElementEngineTags = function(p1)
		-- upvalues: InlineEngineTag (copy)
		if not p1 then
			return nil
		end
		local List = {}
		
		if p1.bold then
			table.insert(List, { name = InlineEngineTag.BOLD, attributes = {} })
		end
		if p1.italic then
			table.insert(List, { name = InlineEngineTag.ITALIC, attributes = {} })
		end
		if p1.strike then
			table.insert(List, { name = InlineEngineTag.STRIKE, attributes = {} })
		end
		if p1.color then
			table.insert(List, {
				name = InlineEngineTag.FONT,
				attributes = { color = p1.color }
			})
		end
		if p1.underline then
			table.insert(List, { name = InlineEngineTag.UNDERLINE, attributes = {} })
		end
		return List
	end,
	normalizeStyleFont = function(p1)
		-- upvalues: DashModule (copy)
		if not p1 then
			return p1
		end
		local OmitResult = DashModule.omit(p1, { "font" })
		
		if OmitResult.fontFace == nil and p1.font ~= nil then
			OmitResult.fontFace = if typeof(p1.font) == "Font" then p1.font else Font.fromEnum(p1.font)
		end
		return OmitResult
	end
}