local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local appContextModule = require(purchasePrompt.Utils.AppContext)
local productPurchaseSurface = require(purchasePrompt.Parent.PurchasePromptLite).Enums.ProductPurchaseSurface

return function(p0) --[[ line: 6 | named "getPurchaseSurface" ]]
	-- upvalues: appContextModule (ref), productPurchaseSurface (ref)
	local _ = nil
	
	return if p0 and p0.surface then p0.surface elseif appContextModule.get() == appContextModule.Enum.IN_EXPERIENCE then productPurchaseSurface.InExperience else productPurchaseSurface.Unknown
end