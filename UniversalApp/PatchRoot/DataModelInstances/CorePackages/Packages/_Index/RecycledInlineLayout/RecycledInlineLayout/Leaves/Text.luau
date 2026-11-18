local ToolkitModule = require(script:FindFirstAncestor("RecycledInlineLayout").Toolkit)
local TextLeaf = ToolkitModule.TextLeaf
local Text, Text2 = ToolkitModule.defineLeaf({
	name = "Text",
	canForceSplit = true,
	view = TextLeaf.View,
	pool = TextLeaf.View,
	props = {
		Text = { layout = "split", delivery = "binding" },
		fontStyle = { layout = "measure", delivery = "binding" },
		SplitBy = { layout = "measure", delivery = "binding" },
		EngineTags = {
			layout = "measure",
			delivery = "binding",
			equals = ToolkitModule.Utils.deepEqual
		},
		textStyle = { layout = "none", delivery = "binding" },
		strokeStyle = { layout = "none", delivery = "binding" },
		strokeThickness = { layout = "none", delivery = "binding" }
	},
	measure = TextLeaf.measureFoundationText,
	split = TextLeaf.split,
	trimStart = TextLeaf.trimStart,
	trimEnd = TextLeaf.trimEnd,
	merge = TextLeaf.createMerge(TextLeaf.label)
})

return { Text = Text, definition = Text2 }