local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local purchasePromptLiteModule = require(parent.PurchasePromptLite)
local productPurchaseSurface = purchasePromptLiteModule.Enums.ProductPurchaseSurface
local getTTIEventName = purchasePromptLiteModule.getTTIEventName
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local getPurchaseSurfaceModule = require(purchasePrompt.Utils.getPurchaseSurface)
local getProductTypeFromRequestTypeModule = require(purchasePrompt.Utils.getProductTypeFromRequestType)

return function(p0)
	-- upvalues: getPurchaseSurfaceModule (ref), productPurchaseSurface (ref), getTTIEventName (ref), timeToInteractiveTracker (ref), getProductTypeFromRequestTypeModule (ref)
	local state = p0:getState()
	
	if getPurchaseSurfaceModule(state.purchaseAnalyticsMetadata) == productPurchaseSurface.InExperience then
		local var5 = getTTIEventName(productPurchaseSurface.InExperience)
		timeToInteractiveTracker.trackStart(var5)
		timeToInteractiveTracker.updateMetadata(var5, {
			category = "unified_purchase_modal",
			page = productPurchaseSurface.InExperience,
			subcategory = getProductTypeFromRequestTypeModule(state.promptRequest.requestType)
		})
		
		return
	end
end