local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local AppContextModule = require(PurchasePrompt.Utils.AppContext)
local ProductPurchaseSurface = require(PurchasePrompt.Parent.PurchasePromptLite).Enums.ProductPurchaseSurface

return function(p1) --[[ Line: 6 | Named "getPurchaseSurface" ]]
	-- upvalues: AppContextModule (copy), ProductPurchaseSurface (copy)
	return if p1 and p1.surface then p1.surface elseif AppContextModule.get() == AppContextModule.Enum.IN_EXPERIENCE then ProductPurchaseSurface.InExperience else ProductPurchaseSurface.Unknown
end