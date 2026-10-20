local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local PromiseModule = require(PurchasePrompt.Promise)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local _ = require(PurchasePrompt.Enums.PaymentPlatform)
local PaymentPlatformToUpsellPlatformModule = require(PurchasePrompt.Utils.paymentPlatformToUpsellPlatform)
local _ = game:GetService("HttpService")
local GetUpsellSuggestionsFunction = require(Parent.PurchasePromptDeps).IAPExperience.Api.PaymentsGateway.GetUpsellSuggestions
local UpsellSuggestionsAPIMaxPackages = require(Parent.SharedFlags).UpsellSuggestionsAPIMaxPackages

return function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: PaymentPlatformToUpsellPlatformModule (copy), PromiseModule (copy), GetUpsellSuggestionsFunction (copy), UpsellSuggestionsAPIMaxPackages (copy), PurchaseErrorModule (copy)
	local PaymentPlatformToUpsellPlatformModuleResult = PaymentPlatformToUpsellPlatformModule(p3)
	
	return (PromiseModule.new(function(Callback, Callback1)
		-- upvalues: GetUpsellSuggestionsFunction (upval), PaymentPlatformToUpsellPlatformModuleResult (copy), p2 (copy), p1 (copy), UpsellSuggestionsAPIMaxPackages (upval), p5 (copy), p6 (copy), p7 (copy), p8 (copy), p4 (copy), PurchaseErrorModule (upval)
		spawn(function()
			-- upvalues: GetUpsellSuggestionsFunction (upval), PaymentPlatformToUpsellPlatformModuleResult (upval), p2 (upval), p1 (upval), UpsellSuggestionsAPIMaxPackages (upval), p5 (upval), p6 (upval), p7 (upval), p8 (upval), p4 (upval), Callback1 (copy), PurchaseErrorModule (upval), Callback (copy)
			local UpsellSuggestions, UpsellSuggestions2 = GetUpsellSuggestionsFunction(PaymentPlatformToUpsellPlatformModuleResult, p2, p1, UpsellSuggestionsAPIMaxPackages, p5, p6, p7, p8, p4)
			
			return if UpsellSuggestions and (UpsellSuggestions2 and UpsellSuggestions2.products and #UpsellSuggestions2.products ~= 0) then Callback(UpsellSuggestions2) else Callback1(PurchaseErrorModule.UnknownFailure)
		end)
	end))
end