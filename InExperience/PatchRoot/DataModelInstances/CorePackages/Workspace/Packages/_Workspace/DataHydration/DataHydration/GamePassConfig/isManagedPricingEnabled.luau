local _ = require(script.Parent.GamePassConfigTypes)

return function(p1)
	if p1.isManagedPricingEnabled == nil then
		local EnabledFeatures = if p1.priceInformation == nil then nil else p1.priceInformation.enabledFeatures
		
		return if EnabledFeatures == nil then nil else table.find(EnabledFeatures, "RegionalPricing") ~= nil
	else
		return p1.isManagedPricingEnabled
	end
end