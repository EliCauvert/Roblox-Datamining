local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local enumerate = require(purchasePrompt.Parent.PurchasePromptDeps).enumerate
local addRawValueMethodToEnumModule = require(purchasePrompt.Utils.addRawValueMethodToEnum)
local t = { None = "None", EnablePurchase = "EnablePurchase" }
local var3 = enumerate(script.Name, t)
addRawValueMethodToEnumModule(var3, t)

return var3