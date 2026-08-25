local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local sharedFlagsModule = require(inExperienceShop.Parent.SharedFlags)
local _ = require(inExperienceShop.Types)
local findTopPicksSectionIndexModule = require(inExperienceShop.Utils.findTopPicksSectionIndex)
local fFlagPromoteRobuxInTopPicksModule = require(inExperienceShop.Flags.FFlagPromoteRobuxInTopPicks)
local fFlagEnableRobuxInExperienceShop = sharedFlagsModule.FFlagEnableRobuxInExperienceShop
local bonusPromotionEligibilityModule = require(inExperienceShop.Api.BonusPromotionEligibility)

local function findFirstBonusRobuxPackageWithPaymentSession(p0)
	for i, v in p0 do
		local robuxPackages = v.robuxPackages
		
		if robuxPackages ~= nil then
			for i_1, v_1 in robuxPackages do
				if v_1.bonusItem ~= nil then
					return v_1, v.paymentSessionId
				end
			end
		end
	end
	return nil, nil
end

local function findFirstBonusRobuxPackage(p1)
	-- upvalues: findFirstBonusRobuxPackageWithPaymentSession (ref)
	local var8, _ = findFirstBonusRobuxPackageWithPaymentSession(p1)
	
	return var8
end

local function withoutFeaturedPromotion(p2)
	-- upvalues: findTopPicksSectionIndexModule (ref)
	local var9 = findTopPicksSectionIndexModule(p2)
	
	if var9 == nil then
		return p2
	end
	local var10 = p2[var9]
	
	if var10.featuredRobuxPackage == nil then
		return p2
	end
	local cloned = table.clone(p2)
	cloned[var9] = {
		featuredRobuxPackage = nil,
		id = var10.id,
		name = var10.name,
		items = var10.items,
		robuxPackages = var10.robuxPackages
	}
	
	return cloned
end

local function _(p3, p4)
	-- upvalues: bonusPromotionEligibilityModule (ref)
	local bonusItem = p3.bonusItem
	local var12 = if bonusItem == nil or bonusItem.type ~= "GamePass" then nil else tostring(bonusItem.id)
	
	return if var12 == nil then false elseif p3.bonusItemDetails == nil then false else p4[var12] == bonusPromotionEligibilityModule.Eligible
end

return {
	findFirstBonusRobuxPackage = findFirstBonusRobuxPackage,
	getBonusGamePassId = function(p5)
		local bonusItem = p5.bonusItem
		
		return if bonusItem == nil or bonusItem.type ~= "GamePass" then nil else tostring(bonusItem.id)
	end,
	withoutFeaturedPromotion = withoutFeaturedPromotion,
	promoteBonusRobuxPackageToTopPicks = function(p6, p7)
		-- upvalues: fFlagEnableRobuxInExperienceShop (ref), fFlagPromoteRobuxInTopPicksModule (ref), withoutFeaturedPromotion (ref), findFirstBonusRobuxPackageWithPaymentSession (ref), findTopPicksSectionIndexModule (ref), bonusPromotionEligibilityModule (ref)
		if not fFlagEnableRobuxInExperienceShop or not fFlagPromoteRobuxInTopPicksModule then
			return withoutFeaturedPromotion(p6)
		end
		local var13, var14 = findFirstBonusRobuxPackageWithPaymentSession(p6)
		
		if var13 == nil then
			return withoutFeaturedPromotion(p6)
		end
		local var15 = findTopPicksSectionIndexModule(p6)
		
		if var15 == nil then
			return withoutFeaturedPromotion(p6)
		end
		local bonusItem = var13.bonusItem
		local var16 = if bonusItem == nil or bonusItem.type ~= "GamePass" then nil else tostring(bonusItem.id)
		
		if not (if var16 == nil then false elseif var13.bonusItemDetails == nil then false else p7[var16] == bonusPromotionEligibilityModule.Eligible) then
			return withoutFeaturedPromotion(p6)
		end
		local var17 = p6[var15]
		local featuredRobuxPackage = var17.featuredRobuxPackage
		
		if featuredRobuxPackage ~= nil and featuredRobuxPackage.id == var13.id and var17.paymentSessionId == var14 then
			return p6
		end
		bonusItem = table.clone(p6)
		local t = {
			id = var17.id,
			name = var17.name,
			items = var17.items,
			paymentSessionId = var17.paymentSessionId,
			robuxPackages = var17.robuxPackages,
			featuredRobuxPackage = var13
		}
		
		if var14 ~= nil then
			t.paymentSessionId = var14
		end
		bonusItem[var15] = t
		
		return bonusItem
	end
}