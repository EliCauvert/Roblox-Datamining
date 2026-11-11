local InlineRichText = script:FindFirstAncestor("InlineRichText")
local _ = require(InlineRichText.Types)
local NodeTypeModule = require(InlineRichText.Enums.NodeType)

return {
	TagConfigurations = {
		b = { NodeType = NodeTypeModule.EngineTag },
		i = { NodeType = NodeTypeModule.EngineTag },
		u = { NodeType = NodeTypeModule.EngineTag },
		s = { NodeType = NodeTypeModule.EngineTag },
		font = { NodeType = NodeTypeModule.EngineTag },
		stroke = { NodeType = NodeTypeModule.EngineTag },
		uc = { NodeType = NodeTypeModule.EngineTag },
		sc = { NodeType = NodeTypeModule.EngineTag },
		mark = { NodeType = NodeTypeModule.EngineTag },
		a = {
			OverrideName = "LINK",
			NodeType = NodeTypeModule.InlineCustom
		},
		icon = {
			OverrideName = "ICON",
			NodeType = NodeTypeModule.InlineCustom
		}
	},
	TagAliases = {
		strong = "b",
		em = "i",
		strike = "s",
		del = "s",
		uppercase = "uc",
		smallcaps = "sc"
	}
}