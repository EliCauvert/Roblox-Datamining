local inlineRichText = script:FindFirstAncestor("InlineRichText")
local _ = require(inlineRichText.Types)
local nodeTypeModule = require(inlineRichText.Enums.NodeType)

return {
	TagConfigurations = {
		b = { NodeType = nodeTypeModule.EngineTag },
		i = { NodeType = nodeTypeModule.EngineTag },
		u = { NodeType = nodeTypeModule.EngineTag },
		s = { NodeType = nodeTypeModule.EngineTag },
		font = { NodeType = nodeTypeModule.EngineTag },
		stroke = { NodeType = nodeTypeModule.EngineTag },
		uc = { NodeType = nodeTypeModule.EngineTag },
		sc = { NodeType = nodeTypeModule.EngineTag },
		mark = { NodeType = nodeTypeModule.EngineTag },
		a = {
			OverrideName = "LINK",
			NodeType = nodeTypeModule.InlineCustom
		},
		icon = {
			OverrideName = "ICON",
			NodeType = nodeTypeModule.InlineCustom
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