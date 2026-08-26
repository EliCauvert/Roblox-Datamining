local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local constantsModule = require(inExperienceShop.Constants)
local _ = require(inExperienceShop.Types)

local function _(p1, p2)
	return p1 .. string.format("%.2f", p2)
end

local _ = function(p1, p2)
	warn("[Shop] toRobuxPackageItem failed (" .. p3 .. ") id=" .. tostring(p1.id))
end

local _ = function(p1)
	local bonusItem = p1.bonusItem
	
	if bonusItem == nil then
		return nil
	elseif bonusItem.type == "GamePass" then
		return bonusItem
	end
	warn("[Shop] toRobuxPackageItem ignored bonusItem with invalid type=" .. tostring(bonusItem.type) .. " id=" .. tostring(p1.id))
	
	return nil
end

return {
	toRobuxPackageItem = function(p1)
		-- upvalues: constantsModule (ref)
		if p1.type ~= "Robux" then
			return nil
		end
		local info = p1.info
		
		if info == nil then
			warn("[Shop] toRobuxPackageItem failed (" .. "missing info" .. ") id=" .. tostring(p1.id))
			
			return nil
		end
		local robux = info.robux
		local productId = info.productId
		local providerProductId = info.providerProductId
		local price = info.price
		
		if typeof(robux) ~= "number" or typeof(productId) ~= "number" then
			warn("[Shop] toRobuxPackageItem failed (" .. "invalid robux or productId" .. ") id=" .. tostring(p1.id))
			
			return nil
		elseif typeof(providerProductId) ~= "string" or providerProductId == "" then
			warn("[Shop] toRobuxPackageItem failed (" .. "missing providerProductId" .. ") id=" .. tostring(p1.id))
			
			return nil
		elseif price == nil or typeof(price.amount) ~= "number" then
			warn("[Shop] toRobuxPackageItem failed (" .. "missing price.amount" .. ") id=" .. tostring(p1.id))
			
			return nil
		end
		local currency = price.currency
		
		if currency == nil or typeof(currency.currencySymbol) ~= "string" or currency.currencySymbol == "" then
			warn("[Shop] toRobuxPackageItem failed (" .. "missing price.currency.currencySymbol" .. ") id=" .. tostring(p1.id))
			
			return nil
		end
		local var1
		local t = {
			id = tostring(p1.id),
			robuxAmount = robux,
			currencyAmountStr = currency.currencySymbol .. string.format("%.2f", price.amount),
			robuxImage = constantsModule.ROBUX_PACKAGE_IMAGE,
			productId = productId,
			mobileProductId = providerProductId
		}
		local bonusItem = p1.bonusItem
		
		if bonusItem == nil then
			var1 = nil
		elseif bonusItem.type == "GamePass" then
			var1 = bonusItem
		else
			warn("[Shop] toRobuxPackageItem ignored bonusItem with invalid type=" .. tostring(bonusItem.type) .. " id=" .. tostring(p1.id))
			var1 = nil
		end
		t.bonusItem = var1
		
		return t
	end
}