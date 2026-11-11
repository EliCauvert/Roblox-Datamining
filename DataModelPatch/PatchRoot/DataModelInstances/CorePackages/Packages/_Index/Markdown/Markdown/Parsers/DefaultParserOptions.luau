local NodeTypeModule = require(script:FindFirstAncestor("Markdown").Enums.NodeType)

return {
	inlineTags = { font = true, img = true },
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