local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local sharedFlagsModule = require(inExperienceShop.Parent.SharedFlags)
local _ = require(inExperienceShop.Types)
local findTopPicksSectionIndexModule = require(inExperienceShop.Utils.findTopPicksSectionIndex)
local fFlagPromoteRobuxInTopPicksModule = require(inExperienceShop.Flags.FFlagPromoteRobuxInTopPicks)
local fFlagHideBonusInShopWhenNotClaimableModule = require(inExperienceShop.Flags.FFlagHideBonusInShopWhenNotClaimable)
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
		categoryType = var2.categoryType,
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
		-- upvalues: fFlagEnableRobuxInExperienceShop (ref), fFlagPromoteRobuxInTopPicksModule (ref), withoutFeaturedPromotion (ref), findFirstBonusRobuxPackageWithPaymentSession (ref), fFlagEnableBonusJwtInShop (ref), fFlagHideBonusInShopWhenNotClaimableModule (ref), findTopPicksSectionIndexModule (ref), bonusPromotionEligibilityModule (ref)
		if not fFlagEnableRobuxInExperienceShop or not fFlagPromoteRobuxInTopPicksModule then
			return withoutFeaturedPromotion(p2)
		end
		local var1
		local var2, var3, var4 = findFirstBonusRobuxPackageWithPaymentSession(p2)
		
		if var2 == nil then
			return withoutFeaturedPromotion(p2)
		elseif var3 ~= nil then
			var1 = true
			
			if var3 == "" then
				var1 = fFlagEnableBonusJwtInShop and (var4 ~= nil and var4 ~= "")
			end
			if fFlagHideBonusInShopWhenNotClaimableModule and not var1 then
				return withoutFeaturedPromotion(p2)
			end
			local var5 = findTopPicksSectionIndexModule(p2)
			
			if var5 == nil then
				return withoutFeaturedPromotion(p2)
			end
			local bonusItem = var2.bonusItem
			local var6 = if bonusItem == nil or bonusItem.type ~= "GamePass" then nil else tostring(bonusItem.id)
			
			if not (if var6 == nil then false elseif var2.bonusItemDetails == nil then false else p3[var6] == bonusPromotionEligibilityModule.Eligible) then
				return withoutFeaturedPromotion(p2)
			end
			local var7 = p2[var5]
			local featuredRobuxPackage = var7.featuredRobuxPackage
			
			if featuredRobuxPackage ~= nil and featuredRobuxPackage.id == var2.id then
				local var8
				bonusItem = var7.paymentSessionId == var3
				
				if fFlagEnableBonusJwtInShop then
					var8 = var7.bonusJwt == var4
					var8 = nil
				else
					var8 = true
				end
				if bonusItem and var8 then
					return p2
				end
			end
			bonusItem = table.clone(p2)
			local t = {
				id = var7.id,
				name = var7.name,
				items = var7.items,
				categoryType = var7.categoryType,
				paymentSessionId = var7.paymentSessionId,
				bonusJwt = var7.bonusJwt,
				robuxPackages = var7.robuxPackages,
				featuredRobuxPackage = var2
			}
			
			if var3 ~= nil then
				t.paymentSessionId = var3
			end
			if fFlagEnableBonusJwtInShop and var4 ~= nil then
				t.bonusJwt = var4
			end
			bonusItem[var5] = t
			
			return bonusItem
		end
	end
}