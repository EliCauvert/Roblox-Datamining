local Url = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.Http).Url
local HttpRequestModule = require(script.Parent.HttpRequest)
local Text = Url.APIS_URL .. "subscriptions/v2/referral-eligibility?"

return function(p1)
	-- upvalues: Text (copy), Url (copy), HttpRequestModule (copy)
	return HttpRequestModule.new():get(Text .. Url:makeQueryString({ referrerId = tostring(p1) })):andThen(function(Result)
		return if Result and Result.eligibility == "Eligible" then { eligible = true, reason = nil } else {
			eligible = false,
			reason = if Result then Result.ineligibilityReason else nil
		}
	end, function()
		return { eligible = false, reason = nil }
	end)
end