local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local promiseModule = require(purchasePrompt.Promise)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local _ = require(purchasePrompt.Enums.PaymentPlatform)
local paymentPlatformToUpsellPlatformModule = require(purchasePrompt.Utils.paymentPlatformToUpsellPlatform)
local _ = game:GetService("HttpService")
local getUpsellSuggestions = require(parent.PurchasePromptDeps).IAPExperience.Api.PaymentsGateway.GetUpsellSuggestions
local upsellSuggestionsAPIMaxPackages = require(parent.SharedFlags).UpsellSuggestionsAPIMaxPackages

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: paymentPlatformToUpsellPlatformModule (ref), promiseModule (ref), getUpsellSuggestions (ref), upsellSuggestionsAPIMaxPackages (ref), purchaseErrorModule (ref)
	local var1 = paymentPlatformToUpsellPlatformModule(p3)
	
	return promiseModule.new(function(p8, p9)
		-- upvalues: getUpsellSuggestions (copy), var1 (ref), p2 (ref), p1 (ref), upsellSuggestionsAPIMaxPackages (copy), p4 (ref), p5 (ref), p6 (ref), p7 (ref), purchaseErrorModule (copy)
		spawn(function()
			-- upvalues: getUpsellSuggestions (copy), var1 (copy), p2 (copy), p1 (copy), upsellSuggestionsAPIMaxPackages (copy), p4 (copy), p5 (copy), p6 (copy), p7 (copy), p9 (ref), purchaseErrorModule (copy), p8 (ref)
			local var2, var3 = getUpsellSuggestions(var1, p2, p1, upsellSuggestionsAPIMaxPackages, p4, p5, p6, p7)
			
			return if var2 then if var3 and var3.products and #var3.products ~= 0 then p8(var3) else p9(purchaseErrorModule.UnknownFailure) else p9(purchaseErrorModule.UnknownFailure)
		end)
	end)
end