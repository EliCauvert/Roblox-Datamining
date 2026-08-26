local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local appContextModule = require(purchasePrompt.Utils.AppContext)
local productPurchaseSurface = require(purchasePrompt.Parent.PurchasePromptLite).Enums.ProductPurchaseSurface

return function(p1)
	-- upvalues: appContextModule (ref), productPurchaseSurface (ref)
	local _ = nil
	
	return if p1 and p1.surface then p1.surface elseif appContextModule.get() == appContextModule.Enum.IN_EXPERIENCE then productPurchaseSurface.InExperience else productPurchaseSurface.Unknown
end