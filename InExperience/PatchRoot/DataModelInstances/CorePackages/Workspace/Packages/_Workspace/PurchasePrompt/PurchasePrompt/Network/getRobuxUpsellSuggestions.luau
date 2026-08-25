local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local promiseModule = require(purchasePrompt.Promise)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local _ = require(purchasePrompt.Enums.PaymentPlatform)
local paymentPlatformToUpsellPlatformModule = require(purchasePrompt.Utils.paymentPlatformToUpsellPlatform)
local _ = game:GetService("HttpService")
local getUpsellSuggestions = require(parent.PurchasePromptDeps).IAPExperience.Api.PaymentsGateway.GetUpsellSuggestions
local upsellSuggestionsAPIMaxPackages = require(parent.SharedFlags).UpsellSuggestionsAPIMaxPackages

return function(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: paymentPlatformToUpsellPlatformModule (ref), promiseModule (ref), getUpsellSuggestions (ref), upsellSuggestionsAPIMaxPackages (ref), purchaseErrorModule (ref)
	local var4 = paymentPlatformToUpsellPlatformModule(p2)
	
	return promiseModule.new(function(p7, p8)
		-- upvalues: getUpsellSuggestions (copy), var4 (ref), p1 (ref), p0 (ref), upsellSuggestionsAPIMaxPackages (copy), p3 (ref), p4 (ref), p5 (ref), p6 (ref), purchaseErrorModule (copy)
		spawn(function()
			-- upvalues: getUpsellSuggestions (copy), var4 (copy), p1 (copy), p0 (copy), upsellSuggestionsAPIMaxPackages (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy), p8 (ref), purchaseErrorModule (copy), p7 (ref)
			local var5, var6 = getUpsellSuggestions(var4, p1, p0, upsellSuggestionsAPIMaxPackages, p3, p4, p5, p6)
			
			return if var5 then if var6 and var6.products and #var6.products ~= 0 then p7(var6) else p8(purchaseErrorModule.UnknownFailure) else p8(purchaseErrorModule.UnknownFailure)
		end)
	end)
end