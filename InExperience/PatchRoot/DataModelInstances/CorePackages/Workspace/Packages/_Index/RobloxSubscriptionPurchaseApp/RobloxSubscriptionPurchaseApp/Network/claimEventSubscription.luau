local Parent = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local HttpRequestModule = require(script.Parent.HttpRequest)
local AXGetEventEligibilityEventName = game:DefineFastString("AXGetEventEligibilityEventName", "TurkeyTrot")
local AXGetEventEligibilityProductId = game:DefineFastString("AXGetEventEligibilityProductId", "3401490850583284716")
local AXGetEventEligibilityProductType = game:DefineFastString("AXGetEventEligibilityProductType", "RobloxPlus")
local NewUrlBuilder = UrlBuilder.new({
	path = "subscriptions/v2/events/claim",
	base = UrlBase.APIS
})

return function()
	-- upvalues: HttpRequestModule (copy), NewUrlBuilder (copy), AXGetEventEligibilityEventName (copy), AXGetEventEligibilityProductId (copy), AXGetEventEligibilityProductType (copy)
	return HttpRequestModule.new():post(NewUrlBuilder(), {
		eventType = AXGetEventEligibilityEventName,
		subscriptionProductKey = {
			id = AXGetEventEligibilityProductId,
			type = AXGetEventEligibilityProductType
		}
	})
end