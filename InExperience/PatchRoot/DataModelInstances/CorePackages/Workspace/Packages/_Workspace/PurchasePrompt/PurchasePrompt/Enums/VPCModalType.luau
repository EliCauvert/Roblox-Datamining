local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local config = { None = "None", EnablePurchase = "EnablePurchase" }
local EnumerateResult = require(PurchasePrompt.Parent.PurchasePromptDeps).enumerate(script.Name, config)
require(PurchasePrompt.Utils.addRawValueMethodToEnum)(EnumerateResult, config)

return EnumerateResult