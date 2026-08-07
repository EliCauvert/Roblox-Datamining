-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:47 2026 Pacific Standard Time.

local markdown = script:FindFirstAncestor("Markdown")
local parent = markdown.Parent
local dashModule = require(parent.Dash)
local _ = require(markdown.Types)
local _ = require(parent.InlineLayout)
local inlineEngineTag = require(parent.MarkdownCore).Enums.InlineEngineTag

return {
	getCodeTextStyles = function(p0) --[[ line: 8 ]]
		-- upvalues: dashModule (ref)
		return dashModule.joinDeep(p0.textStyles, p0.codeStyles)
	end,
	getBaseTextElementEngineTags = function(value) --[[ line: 12 ]]
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
	end
}