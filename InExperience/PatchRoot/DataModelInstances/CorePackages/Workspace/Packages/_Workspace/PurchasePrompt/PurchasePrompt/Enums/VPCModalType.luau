local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local EnumerateFunction = require(PurchasePrompt.Parent.PurchasePromptDeps).enumerate
local AddRawValueMethodToEnumModule: (any, any) -> () = require(PurchasePrompt.Utils.addRawValueMethodToEnum)
local config = { None = "None", EnablePurchase = "EnablePurchase" }
local EnumerateResult = EnumerateFunction(script.Name, config)
AddRawValueMethodToEnumModule(EnumerateResult, config)

return EnumerateResult