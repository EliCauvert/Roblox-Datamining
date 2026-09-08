local parent = script.Parent.Parent
local parent_1 = parent.Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.types)
local _ = require(parent_1.IAPExperience)
local _ = require(parent_1.PurchasePromptLite)

local function _(p1)
	if p1 == nil then
		return false
	end
	for i, v in p1 do
		if v == "be86b44b-462a-41a2-a059-01411756f07d" then
			return true
		end
	end
	return false
end

local function buildMockResponse(p2)
	local var1
	if p2 == nil then
		var1 = false
	else
		for i, v in p2 do
			if v == "be86b44b-462a-41a2-a059-01411756f07d" then
				var1 = true
			end
		end
		var1 = false
	end
	local var2 = not var1
	local t = {
		regularPriceInRobux = 100,
		productIdentifier = { namespace = "GamePass", targetIdentifier = "12345" },
		priceInRobux = if var2 then 80 else 100
	}
	
	if var2 then
		t.discountInformation = {
			originalPrice = 100,
			totalDiscountPercentage = 20,
			totalDiscountAmount = 20,
			discounts = {
				{
					robuxDiscountAmount = 20,
					robuxDiscountPercentage = 20,
					discountCampaign = "sample-campaign",
					localizedDiscountAttribution = "XX% offer",
					discountType = "MARKETPLACE_OFFER",
					discountId = "be86b44b-462a-41a2-a059-01411756f07d"
				}
			}
		}
	end
	return {
		items = { t },
		savingsSummary = if var2 then "Saving R$ XX" else nil,
		availableOffers = {
			{
				offerId = "be86b44b-462a-41a2-a059-01411756f07d",
				localizedDescription = "XX% off one item up to R$ XX",
				expirationTimeUtc = DateTime.fromUnixTimestamp(DateTime.now().UnixTimestamp + 259200):ToIsoDate(),
				selected = var2
			}
		}
	}
end

return function(_, _, _, p3, p4, _, _)
	-- upvalues: promiseModule (ref), buildMockResponse (ref)
	return if p3 == nil or #p3 == 0 then promiseModule.resolve(nil) else promiseModule.resolve(buildMockResponse(p4))
end