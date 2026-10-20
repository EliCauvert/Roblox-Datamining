local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local ConstantsModule = require(InExperienceShop.Constants)
local _ = require(InExperienceShop.Types)

local function _(Text, p1): string
	return Text .. string.format("%.2f", p1)
end

local _ = function(p1, Text)
	warn("[Shop] toRobuxPackageItem failed (" .. Text .. ") id=" .. tostring(p1.id))
end

local _ = function(p1)
	local BonusItem = p1.bonusItem
	
	if BonusItem == nil then
		return nil
	elseif BonusItem.type == "GamePass" then
		return BonusItem
	else
		warn("[Shop] toRobuxPackageItem ignored bonusItem with invalid type=" .. tostring(BonusItem.type) .. " id=" .. tostring(p1.id))
		
		return nil
	end
end

return {
	toRobuxPackageItem = function(p1)
		-- upvalues: ConstantsModule (copy)
		if p1.type ~= "Robux" then
			return nil
		end
		local Info = p1.info
		
		if Info == nil then
			warn("[Shop] toRobuxPackageItem failed (" .. "missing info" .. ") id=" .. tostring(p1.id))
			
			return nil
		end
		local Robux = Info.robux
		local ProductId = Info.productId
		local ProviderProductId = Info.providerProductId
		local Price = Info.price
		
		if typeof(Robux) ~= "number" or typeof(ProductId) ~= "number" then
			warn("[Shop] toRobuxPackageItem failed (" .. "invalid robux or productId" .. ") id=" .. tostring(p1.id))
			
			return nil
		end
		if typeof(ProviderProductId) ~= "string" or ProviderProductId == "" then
			warn("[Shop] toRobuxPackageItem failed (" .. "missing providerProductId" .. ") id=" .. tostring(p1.id))
			
			return nil
		end
		if Price == nil or typeof(Price.amount) ~= "number" then
			warn("[Shop] toRobuxPackageItem failed (" .. "missing price.amount" .. ") id=" .. tostring(p1.id))
			
			return nil
		end
		local Currency = Price.currency
		
		if Currency == nil or typeof(Currency.currencySymbol) ~= "string" or Currency.currencySymbol == "" then
			warn("[Shop] toRobuxPackageItem failed (" .. "missing price.currency.currencySymbol" .. ") id=" .. tostring(p1.id))
			
			return nil
		end
		local config = {
			id = tostring(p1.id),
			robuxAmount = Robux,
			currencyAmountStr = Currency.currencySymbol .. string.format("%.2f", Price.amount),
			robuxImage = ConstantsModule.ROBUX_PACKAGE_IMAGE,
			productId = ProductId,
			mobileProductId = ProviderProductId
		}
		local BonusItem = p1.bonusItem
		local BonusItem1 = nil
		
		if BonusItem == nil then
			BonusItem1 = nil
		elseif BonusItem.type == "GamePass" then
			BonusItem1 = BonusItem
		else
			warn("[Shop] toRobuxPackageItem ignored bonusItem with invalid type=" .. tostring(BonusItem.type) .. " id=" .. tostring(p1.id))
			BonusItem1 = nil
		end
		config.bonusItem = BonusItem1
		
		return config
	end
}