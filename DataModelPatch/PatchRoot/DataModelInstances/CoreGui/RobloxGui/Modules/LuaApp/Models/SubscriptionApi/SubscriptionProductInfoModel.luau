local SubscriptionProductInfoModelModule = {
	new = function()
		return {
			name = "",
			description = "",
			iconImageAssetId = 0,
			subscriptionPeriod = "",
			priceTier = 0,
			displayPrice = "",
			subscriptionProviderName = "",
			subscriptionProviderId = "",
			isForSale = false,
			subscriptionTargetKey = "",
			priceInRobux = nil
		}
	end
}

function SubscriptionProductInfoModelModule.mock(SubscriptionProviderId, Name)
	-- upvalues: SubscriptionProductInfoModelModule (copy)
	local NewSubscriptionProductInfoModel = SubscriptionProductInfoModelModule.new()
	NewSubscriptionProductInfoModel.name = Name
	NewSubscriptionProductInfoModel.description = "This is MeepCity"
	NewSubscriptionProductInfoModel.iconImageAssetId = 123456
	NewSubscriptionProductInfoModel.subscriptionPeriod = "Month"
	NewSubscriptionProductInfoModel.priceTier = 299
	NewSubscriptionProductInfoModel.displayPrice = "$2.99"
	NewSubscriptionProductInfoModel.subscriptionProviderName = "RobloxTest"
	NewSubscriptionProductInfoModel.subscriptionProviderId = SubscriptionProviderId
	NewSubscriptionProductInfoModel.isForSale = true
	NewSubscriptionProductInfoModel.subscriptionTargetKey = "EXP-123456"
	
	return NewSubscriptionProductInfoModel
end

function SubscriptionProductInfoModelModule.fromJsonData(p1)
	-- upvalues: SubscriptionProductInfoModelModule (copy)
	local NewSubscriptionProductInfoModel = SubscriptionProductInfoModelModule.new()
	NewSubscriptionProductInfoModel.name = p1.name
	NewSubscriptionProductInfoModel.description = p1.description
	NewSubscriptionProductInfoModel.iconImageAssetId = p1.iconImageAssetId
	NewSubscriptionProductInfoModel.subscriptionPeriod = p1.subscriptionPeriod
	NewSubscriptionProductInfoModel.priceTier = p1.priceTier
	NewSubscriptionProductInfoModel.displayPrice = p1.displayPrice
	NewSubscriptionProductInfoModel.subscriptionProviderName = p1.subscriptionProviderName
	NewSubscriptionProductInfoModel.subscriptionProviderId = p1.subscriptionProviderId
	NewSubscriptionProductInfoModel.isForSale = p1.isForSale
	NewSubscriptionProductInfoModel.subscriptionTargetKey = p1.subscriptionTargetKey
	NewSubscriptionProductInfoModel.priceInRobux = p1.priceInRobux
	
	return NewSubscriptionProductInfoModel
end

return SubscriptionProductInfoModelModule