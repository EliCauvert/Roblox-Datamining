local markdown = script:FindFirstAncestor("Markdown")
local parent = markdown.Parent
local dashModule = require(parent.Dash)
local _ = require(markdown.Types)
local _ = require(parent.InlineLayout)
local inlineEngineTag = require(parent.MarkdownCore).Enums.InlineEngineTag

return {
	getCodeTextStyles = function(p1)
		-- upvalues: dashModule (ref)
		return dashModule.joinDeep(p1.textStyles, p1.codeStyles)
	end,
	getBaseTextElementEngineTags = function(value)
		-- upvalues: inlineEngineTag (ref)
		if not value then
			return nil
		end
		local t = {}
		
		if value.bold then
			table.insert(t, { name = inlineEngineTag.BOLD, attributes = {} })
		end
		if value.italic then
			table.insert(t, { name = inlineEngineTag.ITALIC, attributes = {} })
		end
		if value.strike then
			table.insert(t, { name = inlineEngineTag.STRIKE, attributes = {} })
		end
		if value.color then
			table.insert(t, {
				name = inlineEngineTag.FONT,
				attributes = { color = value.color }
			})
		end
		return t
	end,
	normalizeStyleFont = function(p1)
		-- upvalues: dashModule (ref)
		if not p1 then
			return p1
		end
		local var1 = dashModule.omit(p1, { "font" })
		
		if var1.fontFace == nil and p1.font ~= nil then
			var1.fontFace = if typeof(p1.font) == "Font" then p1.font else Font.fromEnum(p1.font)
		end
		return var1
	end
}