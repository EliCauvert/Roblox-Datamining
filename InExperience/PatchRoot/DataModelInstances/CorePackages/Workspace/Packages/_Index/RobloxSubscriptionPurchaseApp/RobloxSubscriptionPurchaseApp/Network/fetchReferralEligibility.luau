local url = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.Http).Url
local httpRequestModule = require(script.Parent.HttpRequest)
local text = url.APIS_URL .. "subscriptions/v2/referral-eligibility?"

return function(p1)
	-- upvalues: text (ref), url (ref), httpRequestModule (ref)
	return httpRequestModule.new():get(text .. url:makeQueryString({ referrerId = tostring(p1) })):andThen(function(p2)
		return if p2 and p2.eligibility == "Eligible" then { eligible = true, reason = nil } else {
			eligible = false,
			reason = if p2 then p2.ineligibilityReason else nil
		}
	end, function()
		return { eligible = false, reason = nil }
	end)
end