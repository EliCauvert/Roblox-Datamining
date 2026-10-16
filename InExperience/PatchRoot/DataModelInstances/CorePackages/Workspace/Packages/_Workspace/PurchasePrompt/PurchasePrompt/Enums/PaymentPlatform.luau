local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local config = {
	None = "None",
	Apple = "Apple",
	Google = "Google",
	Amazon = "Amazon",
	Xbox = "Xbox",
	UWP = "UWP",
	Midas = "Midas",
	Web = "Web",
	Maquettes = "Maquettes",
	Palisades = "Palisades",
	Microsoft = "Microsoft",
	MilkyWay = "MilkyWay",
	Pioneer = "Pioneer"
}
local EnumerateResult = require(PurchasePrompt.Parent.PurchasePromptDeps).enumerate(script.Name, config)
require(PurchasePrompt.Utils.addRawValueMethodToEnum)(EnumerateResult, config)

return EnumerateResult