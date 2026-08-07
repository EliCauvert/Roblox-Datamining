-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:46 2026 Pacific Standard Time.

local nodeTypeModule = require(script:FindFirstAncestor("Markdown").Enums.NodeType)

return {
	inlineTags = { font = true, img = true },
	nodeConfiguration = {
		ROOT = { type = nodeTypeModule.Root },
		LIST_ITEM = { type = nodeTypeModule.TextBlock },
		PARAGRAPH = { type = nodeTypeModule.TextBlock },
		HEADING = { type = nodeTypeModule.TextBlock },
		STYLED_TEXT = { type = nodeTypeModule.InlineSpan },
		LINK = { type = nodeTypeModule.InlineSpan },
		IMAGE = { type = nodeTypeModule.InlineLeaf },
		ACTION = { type = nodeTypeModule.InlineLeaf },
		TABLE_DIVIDER = { type = nodeTypeModule.Block },
		TABLE_HEADER = { type = nodeTypeModule.Block },
		TABLE_HEADER_2 = { type = nodeTypeModule.Block },
		TABLE = { type = nodeTypeModule.Block },
		TABLE_CELL = { type = nodeTypeModule.TextBlock },
		TABLE_ROW = { type = nodeTypeModule.Block },
		LIST = { type = nodeTypeModule.Block },
		TEXT = { type = nodeTypeModule.InlineLeaf },
		BREAK = { type = nodeTypeModule.InlineLeaf },
		LINE_BREAK = { type = nodeTypeModule.InlineLeaf },
		DIVIDER = { type = nodeTypeModule.Block },
		CODE_BLOCK = { type = nodeTypeModule.Block },
		QUOTE = { type = nodeTypeModule.TextBlock }
	}
}