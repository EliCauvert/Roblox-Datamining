local Parent = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent
local HttpRequestModule = require(script.Parent.HttpRequest)
local AXGetEventEligibilityEventName = game:DefineFastString("AXGetEventEligibilityEventName", "TurkeyTrot")
local AXGetEventEligibilityProductId = game:DefineFastString("AXGetEventEligibilityProductId", "3401490850583284716")
local AXGetEventEligibilityProductType = game:DefineFastString("AXGetEventEligibilityProductType", "RobloxPlus")
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "subscriptions/v2/events/claim",
	base = require(Parent.UrlBuilder).UrlBase.APIS
})

return function()
	-- upvalues: HttpRequestModule (copy), NewResult (copy), AXGetEventEligibilityEventName (copy), AXGetEventEligibilityProductId (copy), AXGetEventEligibilityProductType (copy)
	return HttpRequestModule.new():post(NewResult(), {
		eventType = AXGetEventEligibilityEventName,
		subscriptionProductKey = {
			id = AXGetEventEligibilityProductId,
			type = AXGetEventEligibilityProductType
		}
	})
end