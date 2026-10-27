local Markdown = script:FindFirstAncestor("Markdown")
local MergeContextsModule = require(Markdown.Utils.mergeContexts)
local _ = require(Markdown.Types)

return function(p1, p2)
	-- upvalues: MergeContextsModule (copy)
	return if p1.name == "TABLE_HEADER" then MergeContextsModule(p2, { textStyles = { bold = true } }) else p2
end