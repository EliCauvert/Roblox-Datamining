local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local sharedFlagsModule = require(inExperienceShop.Parent.SharedFlags)
local _ = require(inExperienceShop.Types)
local fFlagPromoteRobuxInTopPicksModule = require(inExperienceShop.Flags.FFlagPromoteRobuxInTopPicks)
local fFlagEnableRobuxInExperienceShop = sharedFlagsModule.FFlagEnableRobuxInExperienceShop
local bonusPromotionEligibilityModule = require(inExperienceShop.Api.BonusPromotionEligibility)

local function findFirstBonusRobuxPackageWithPaymentSession(p0) --[[ line: 17 ]]
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

local function findFirstBonusRobuxPackage(p1) --[[ line: 32 ]]
	-- upvalues: findFirstBonusRobuxPackageWithPaymentSession (ref)
	local var7, _ = findFirstBonusRobuxPackageWithPaymentSession(p1)
	
	return var7
end

local function _(p2) --[[ line: 37 | named "findTopPicksSectionIndex" ]]
	for i, v in p2 do
		if string.lower(v.name) == "top picks" then
			return i
		end
	end
	return nil
end

local function withoutFeaturedPromotion(p3) --[[ line: 46 ]]
	local var8
	for i, v in p3 do
		if string.lower(v.name) == "top picks" then
			var8 = i
			if var8 == nil then
				return p3
			end
			local var9 = p3[var8]
			
			if var9.featuredRobuxPackage == nil then
				return p3
			end
			local cloned = table.clone(p3)
			cloned[var8] = {
				featuredRobuxPackage = nil,
				id = var9.id,
				name = var9.name,
				items = var9.items,
				robuxPackages = var9.robuxPackages
			}
			
			return cloned
		end
	end
	var8 = nil
end

local _ = function(p4, p5) --[[ line: 76 | named "canPromoteBonusPackage" ]]
	-- upvalues: bonusPromotionEligibilityModule (ref)
	local bonusItem = p4.bonusItem
	local var11 = if bonusItem == nil or bonusItem.type ~= "GamePass" then nil else tostring(bonusItem.id)
	
	return if var11 == nil then false elseif p4.bonusItemDetails == nil then false else p5[var11] == bonusPromotionEligibilityModule.Eligible
end

return {
	findFirstBonusRobuxPackage = findFirstBonusRobuxPackage,
	getBonusGamePassId = function(p6) --[[ line: 68 ]]
		local bonusItem = p6.bonusItem
		
		return if bonusItem == nil or bonusItem.type ~= "GamePass" then nil else tostring(bonusItem.id)
	end,
	withoutFeaturedPromotion = withoutFeaturedPromotion,
	promoteBonusRobuxPackageToTopPicks = function(p7, p8) --[[ line: 99 ]]
		-- upvalues: fFlagEnableRobuxInExperienceShop (ref), fFlagPromoteRobuxInTopPicksModule (ref), withoutFeaturedPromotion (ref), findFirstBonusRobuxPackageWithPaymentSession (ref), bonusPromotionEligibilityModule (ref)
		if not fFlagEnableRobuxInExperienceShop or not fFlagPromoteRobuxInTopPicksModule then
			return withoutFeaturedPromotion(p7)
		end
		local var12, var13 = findFirstBonusRobuxPackageWithPaymentSession(p7)
		
		if var12 == nil then
			return withoutFeaturedPromotion(p7)
		end
		local var14
		for i, v in p7 do
			if string.lower(v.name) == "top picks" then
				var14 = i
				if var14 == nil then
					return withoutFeaturedPromotion(p7)
				end
				local bonusItem = var12.bonusItem
				local var15 = if bonusItem == nil or bonusItem.type ~= "GamePass" then nil else tostring(bonusItem.id)
				
				if not (if var15 == nil then false elseif var12.bonusItemDetails == nil then false else p8[var15] == bonusPromotionEligibilityModule.Eligible) then
					return withoutFeaturedPromotion(p7)
				end
				local var16 = p7[var14]
				local featuredRobuxPackage = var16.featuredRobuxPackage
				
				if featuredRobuxPackage ~= nil and featuredRobuxPackage.id == var12.id and var16.paymentSessionId == var13 then
					return p7
				end
				bonusItem = table.clone(p7)
				local t = {
					id = var16.id,
					name = var16.name,
					items = var16.items,
					paymentSessionId = var16.paymentSessionId,
					robuxPackages = var16.robuxPackages,
					featuredRobuxPackage = var12
				}
				
				if var13 ~= nil then
					t.paymentSessionId = var13
				end
				bonusItem[var14] = t
				
				return bonusItem
			end
		end
		var14 = nil
	end
}