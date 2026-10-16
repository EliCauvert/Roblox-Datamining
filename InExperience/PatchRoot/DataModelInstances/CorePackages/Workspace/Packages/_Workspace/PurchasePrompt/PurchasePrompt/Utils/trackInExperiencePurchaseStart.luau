local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local PurchasePromptLiteModule = require(Parent.PurchasePromptLite)
local ProductPurchaseSurface = PurchasePromptLiteModule.Enums.ProductPurchaseSurface
local GetTTIEventNameFunction = PurchasePromptLiteModule.getTTIEventName
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local GetPurchaseSurfaceModule = require(PurchasePrompt.Utils.getPurchaseSurface)
local GetProductTypeFromRequestTypeModule = require(PurchasePrompt.Utils.getProductTypeFromRequestType)

return function(p1) --[[ Line: 15 | Named "trackInExperiencePurchaseStart" ]]
	-- upvalues: GetPurchaseSurfaceModule (copy), ProductPurchaseSurface (copy), GetTTIEventNameFunction (copy), TimeToInteractiveTracker (copy), GetProductTypeFromRequestTypeModule (copy)
	local State = p1:getState()
	
	if GetPurchaseSurfaceModule(State.purchaseAnalyticsMetadata) == ProductPurchaseSurface.InExperience then
		local TTIEventName = GetTTIEventNameFunction(ProductPurchaseSurface.InExperience)
		TimeToInteractiveTracker.trackStart(TTIEventName)
		TimeToInteractiveTracker.updateMetadata(TTIEventName, {
			category = "unified_purchase_modal",
			page = ProductPurchaseSurface.InExperience,
			subcategory = GetProductTypeFromRequestTypeModule(State.promptRequest.requestType)
		})
		
		return
	end
end