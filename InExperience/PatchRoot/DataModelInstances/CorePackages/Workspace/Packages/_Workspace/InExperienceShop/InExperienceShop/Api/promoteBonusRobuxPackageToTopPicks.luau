local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local sharedFlagsModule = require(inExperienceShop.Parent.SharedFlags)
local _ = require(inExperienceShop.Types)
local findTopPicksSectionIndexModule = require(inExperienceShop.Utils.findTopPicksSectionIndex)
local fFlagPromoteRobuxInTopPicksModule = require(inExperienceShop.Flags.FFlagPromoteRobuxInTopPicks)
local fFlagEnableRobuxInExperienceShop = sharedFlagsModule.FFlagEnableRobuxInExperienceShop
local fFlagEnableBonusJwtInShop = sharedFlagsModule.FFlagEnableBonusJwtInShop
local bonusPromotionEligibilityModule = require(inExperienceShop.Api.BonusPromotionEligibility)

local function findFirstBonusRobuxPackageWithPaymentSession(p1)
	for i, v in p1 do
		local robuxPackages = v.robuxPackages
		
		if robuxPackages ~= nil then
			for i_1, v_1 in robuxPackages do
				if v_1.bonusItem ~= nil then
					return v_1, v.paymentSessionId, v.bonusJwt
				end
			end
		end
	end
	return nil, nil, nil
end

local function findFirstBonusRobuxPackage(p2)
	-- upvalues: findFirstBonusRobuxPackageWithPaymentSession (ref)
	local var1, _, _ = findFirstBonusRobuxPackageWithPaymentSession(p2)
	
	return var1
end

local function withoutFeaturedPromotion(p2)
	-- upvalues: findTopPicksSectionIndexModule (ref)
	local var1 = findTopPicksSectionIndexModule(p2)
	
	if var1 == nil then
		return p2
	end
	local var2 = p2[var1]
	
	if var2.featuredRobuxPackage == nil then
		return p2
	end
	local cloned = table.clone(p2)
	cloned[var1] = {
		featuredRobuxPackage = nil,
		id = var2.id,
		name = var2.name,
		items = var2.items,
		robuxPackages = var2.robuxPackages
	}
	
	return cloned
end

local function _(p2, p3)
	-- upvalues: bonusPromotionEligibilityModule (ref)
	local bonusItem = p2.bonusItem
	local var1 = if bonusItem == nil or bonusItem.type ~= "GamePass" then nil else tostring(bonusItem.id)
	
	return if var1 == nil then false elseif p2.bonusItemDetails == nil then false else p3[var1] == bonusPromotionEligibilityModule.Eligible
end

return {
	findFirstBonusRobuxPackage = findFirstBonusRobuxPackage,
	getBonusGamePassId = function(p2)
		local bonusItem = p2.bonusItem
		
		return if bonusItem == nil or bonusItem.type ~= "GamePass" then nil else tostring(bonusItem.id)
	end,
	withoutFeaturedPromotion = withoutFeaturedPromotion,
	promoteBonusRobuxPackageToTopPicks = function(p2, p3)
		-- upvalues: fFlagEnableRobuxInExperienceShop (ref), fFlagPromoteRobuxInTopPicksModule (ref), withoutFeaturedPromotion (ref), findFirstBonusRobuxPackageWithPaymentSession (ref), findTopPicksSectionIndexModule (ref), bonusPromotionEligibilityModule (ref), fFlagEnableBonusJwtInShop (ref)
		if not fFlagEnableRobuxInExperienceShop or not fFlagPromoteRobuxInTopPicksModule then
			return withoutFeaturedPromotion(p2)
		end
		local var1, var2, var3 = findFirstBonusRobuxPackageWithPaymentSession(p2)
		
		if var1 == nil then
			return withoutFeaturedPromotion(p2)
		end
		local var4 = findTopPicksSectionIndexModule(p2)
		
		if var4 == nil then
			return withoutFeaturedPromotion(p2)
		end
		local bonusItem = var1.bonusItem
		local var5 = if bonusItem == nil or bonusItem.type ~= "GamePass" then nil else tostring(bonusItem.id)
		
		if not (if var5 == nil then false elseif var1.bonusItemDetails == nil then false else p3[var5] == bonusPromotionEligibilityModule.Eligible) then
			return withoutFeaturedPromotion(p2)
		end
		local var6 = p2[var4]
		local featuredRobuxPackage = var6.featuredRobuxPackage
		
		if featuredRobuxPackage ~= nil and featuredRobuxPackage.id == var1.id then
			local var7
			bonusItem = var6.paymentSessionId == var2
			
			if fFlagEnableBonusJwtInShop then
				var7 = var6.bonusJwt == var3
				var7 = nil
			else
				var7 = true
			end
			if bonusItem and var7 then
				return p2
			end
		end
		bonusItem = table.clone(p2)
		local t = {
			id = var6.id,
			name = var6.name,
			items = var6.items,
			paymentSessionId = var6.paymentSessionId,
			bonusJwt = var6.bonusJwt,
			robuxPackages = var6.robuxPackages,
			featuredRobuxPackage = var1
		}
		
		if var2 ~= nil then
			t.paymentSessionId = var2
		end
		if fFlagEnableBonusJwtInShop and var3 ~= nil then
			t.bonusJwt = var3
		end
		bonusItem[var4] = t
		
		return bonusItem
	end
}