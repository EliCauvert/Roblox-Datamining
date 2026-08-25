local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local constantsModule = require(inExperienceShop.Constants)
local _ = require(inExperienceShop.Types)

local function _(p0, p1)
	return p0 .. string.format("%.2f", p1)
end

local _ = function(p2, p3)
	warn("[Shop] toRobuxPackageItem failed (" .. p3 .. ") id=" .. tostring(p2.id))
end

local _ = function(p4)
	local bonusItem = p4.bonusItem
	
	if bonusItem == nil then
		return nil
	elseif bonusItem.type == "GamePass" then
		return bonusItem
	end
	warn("[Shop] toRobuxPackageItem ignored bonusItem with invalid type=" .. tostring(bonusItem.type) .. " id=" .. tostring(p4.id))
	
	return nil
end

return {
	toRobuxPackageItem = function(p5)
		-- upvalues: constantsModule (ref)
		if p5.type ~= "Robux" then
			return nil
		end
		local info = p5.info
		
		if info == nil then
			warn("[Shop] toRobuxPackageItem failed (" .. "missing info" .. ") id=" .. tostring(p5.id))
			
			return nil
		end
		local robux = info.robux
		local productId = info.productId
		local providerProductId = info.providerProductId
		local price = info.price
		
		if typeof(robux) ~= "number" or typeof(productId) ~= "number" then
			warn("[Shop] toRobuxPackageItem failed (" .. "invalid robux or productId" .. ") id=" .. tostring(p5.id))
			
			return nil
		elseif typeof(providerProductId) ~= "string" or providerProductId == "" then
			warn("[Shop] toRobuxPackageItem failed (" .. "missing providerProductId" .. ") id=" .. tostring(p5.id))
			
			return nil
		elseif price == nil or typeof(price.amount) ~= "number" then
			warn("[Shop] toRobuxPackageItem failed (" .. "missing price.amount" .. ") id=" .. tostring(p5.id))
			
			return nil
		end
		local currency = price.currency
		
		if currency == nil or typeof(currency.currencySymbol) ~= "string" or currency.currencySymbol == "" then
			warn("[Shop] toRobuxPackageItem failed (" .. "missing price.currency.currencySymbol" .. ") id=" .. tostring(p5.id))
			
			return nil
		end
		local var3
		local t = {
			id = tostring(p5.id),
			robuxAmount = robux,
			currencyAmountStr = currency.currencySymbol .. string.format("%.2f", price.amount),
			robuxImage = constantsModule.ROBUX_PACKAGE_IMAGE,
			productId = productId,
			mobileProductId = providerProductId
		}
		local bonusItem = p5.bonusItem
		
		if bonusItem == nil then
			var3 = nil
		elseif bonusItem.type == "GamePass" then
			var3 = bonusItem
		else
			warn("[Shop] toRobuxPackageItem ignored bonusItem with invalid type=" .. tostring(bonusItem.type) .. " id=" .. tostring(p5.id))
			var3 = nil
		end
		t.bonusItem = var3
		
		return t
	end
}