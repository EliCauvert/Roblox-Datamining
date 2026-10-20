local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.types)
local _ = require(Parent1.IAPExperience)
local _ = require(Parent1.PurchasePromptLite)

local function _(List): boolean
	if List == nil then
		return false
	end
	for _, value in List do
		if value == "be86b44b-462a-41a2-a059-01411756f07d" then
			return true
		end
	end
	return false
end

local function buildMockResponse(List)
	local Flag = nil
	if List == nil then
		Flag = false
	else
		Flag = false
		
		for _, value in List do
			if value == "be86b44b-462a-41a2-a059-01411756f07d" then
				Flag = true
				break
			end
		end
	end
	local NoFlag = not Flag
	local config = {
		regularPriceInRobux = 100,
		productIdentifier = { namespace = "GamePass", targetIdentifier = "12345" },
		priceInRobux = if NoFlag then 80 else 100
	}
	
	if NoFlag then
		config.discountInformation = {
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
		items = { config },
		savingsSummary = if NoFlag then "Saving R$ XX" else nil,
		availableOffers = {
			{
				offerId = "be86b44b-462a-41a2-a059-01411756f07d",
				localizedDescription = "XX% off one item up to R$ XX",
				expirationTimeUtc = DateTime.fromUnixTimestamp(DateTime.now().UnixTimestamp + 259200):ToIsoDate(),
				selected = NoFlag
			}
		}
	}
end

return function(_, _, _, p1, p2, _, _)
	-- upvalues: PromiseModule (copy), buildMockResponse (copy)
	return if p1 == nil or #p1 == 0 then PromiseModule.resolve(nil) else PromiseModule.resolve((buildMockResponse(p2)))
end