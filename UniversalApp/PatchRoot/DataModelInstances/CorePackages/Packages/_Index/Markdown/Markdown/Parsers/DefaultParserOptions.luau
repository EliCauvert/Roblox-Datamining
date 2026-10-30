local Markdown = script:FindFirstAncestor("Markdown")
local NodeTypeModule = require(Markdown.Enums.NodeType)

return {
	inlineTags = if require(Markdown.Parent.MarkdownCore).Flags.FFlagMarkdownTagFallbacks then {
		font = true,
		img = true,
		a = true,
		abbr = true,
		b = true,
		code = true,
		del = true,
		em = true,
		i = true,
		kbd = true,
		mark = true,
		s = true,
		small = true,
		span = true,
		strike = true,
		strong = true,
		sub = true,
		sup = true,
		u = true
	} else { font = true, img = true },
	nodeConfiguration = {
		ROOT = { type = NodeTypeModule.Root },
		LIST_ITEM = { type = NodeTypeModule.TextBlock },
		PARAGRAPH = { type = NodeTypeModule.TextBlock },
		HEADING = { type = NodeTypeModule.TextBlock },
		STYLED_TEXT = { type = NodeTypeModule.InlineSpan },
		LINK = { type = NodeTypeModule.InlineSpan },
		IMAGE = { type = NodeTypeModule.InlineLeaf },
		ACTION = { type = NodeTypeModule.InlineLeaf },
		TABLE_DIVIDER = { type = NodeTypeModule.Block },
		TABLE_HEADER = { type = NodeTypeModule.Block },
		TABLE_HEADER_2 = { type = NodeTypeModule.Block },
		TABLE = { type = NodeTypeModule.Block },
		TABLE_CELL = { type = NodeTypeModule.TextBlock },
		TABLE_ROW = { type = NodeTypeModule.Block },
		LIST = { type = NodeTypeModule.Block },
		TEXT = { type = NodeTypeModule.InlineLeaf },
		BREAK = { type = NodeTypeModule.InlineLeaf },
		LINE_BREAK = { type = NodeTypeModule.InlineLeaf },
		DIVIDER = { type = NodeTypeModule.Block },
		CODE_BLOCK = { type = NodeTypeModule.Block },
		QUOTE = { type = NodeTypeModule.TextBlock }
	}
}