local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local EnumerateFunction = require(PurchasePrompt.Parent.PurchasePromptDeps).enumerate
local AddRawValueMethodToEnumModule: (any, any) -> () = require(PurchasePrompt.Utils.addRawValueMethodToEnum)
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
local EnumerateResult = EnumerateFunction(script.Name, config)
AddRawValueMethodToEnumModule(EnumerateResult, config)

return EnumerateResult