local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local enumerate = require(purchasePrompt.Parent.PurchasePromptDeps).enumerate
local addRawValueMethodToEnumModule = require(purchasePrompt.Utils.addRawValueMethodToEnum)
local t = {
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
	MilkyWay = "MilkyWay"
}
local var3 = enumerate(script.Name, t)
addRawValueMethodToEnumModule(var3, t)

return var3