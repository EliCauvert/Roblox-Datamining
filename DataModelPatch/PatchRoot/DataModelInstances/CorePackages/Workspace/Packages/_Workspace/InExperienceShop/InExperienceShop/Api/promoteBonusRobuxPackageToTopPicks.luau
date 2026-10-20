local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(InExperienceShop.Types)
local FFlagPromoteRobuxInTopPicksModule = require(InExperienceShop.Flags.FFlagPromoteRobuxInTopPicks)
local FFlagEnableRobuxInExperienceShop = require(InExperienceShop.Parent.SharedFlags).FFlagEnableRobuxInExperienceShop
local BonusPromotionEligibilityModule = require(InExperienceShop.Api.BonusPromotionEligibility)

local function findFirstBonusRobuxPackageWithPaymentSession(List)
	for _, value in List do
		local RobuxPackages = value.robuxPackages
		
		if RobuxPackages ~= nil then
			for _, robuxPackage in RobuxPackages do
				if robuxPackage.bonusItem ~= nil then
					return robuxPackage, value.paymentSessionId
				end
			end
		end
	end
	return nil, nil
end

local function _(List)
	for i, value in List do
		if string.lower(value.name) == "top picks" then
			return i
		end
	end
	return nil
end

local function withoutFeaturedPromotion(Tbl)
	local v1 = nil
	
	for i, value in Tbl do
		if string.lower(value.name) == "top picks" then
			v1 = i
			break
		end
	end
	if v1 == nil then
		return Tbl
	end
	local Entry = Tbl[v1]
	
	if Entry.featuredRobuxPackage == nil then
		return Tbl
	else
		local Copy = table.clone(Tbl)
		Copy[v1] = {
			featuredRobuxPackage = nil,
			id = Entry.id,
			name = Entry.name,
			items = Entry.items,
			robuxPackages = Entry.robuxPackages
		}
		
		return Copy
	end
end

local _ = function(p1, p2): boolean
	-- upvalues: BonusPromotionEligibilityModule (copy)
	local BonusItem = p1.bonusItem
	local Text = if BonusItem == nil or BonusItem.type ~= "GamePass" then nil else tostring(BonusItem.id)
	
	return Text ~= nil and (p1.bonusItemDetails ~= nil and p2[Text] == BonusPromotionEligibilityModule.Eligible)
end

return {
	findFirstBonusRobuxPackage = function(p1)
		-- upvalues: findFirstBonusRobuxPackageWithPaymentSession (copy)
		local FirstBonusRobuxPackageWithPaymentSession, _ = findFirstBonusRobuxPackageWithPaymentSession(p1)
		
		return FirstBonusRobuxPackageWithPaymentSession
	end,
	getBonusGamePassId = function(p1)
		local BonusItem = p1.bonusItem
		
		return if BonusItem == nil or BonusItem.type ~= "GamePass" then nil else tostring(BonusItem.id)
	end,
	withoutFeaturedPromotion = withoutFeaturedPromotion,
	promoteBonusRobuxPackageToTopPicks = function(Tbl, p1)
		-- upvalues: FFlagEnableRobuxInExperienceShop (copy), FFlagPromoteRobuxInTopPicksModule (copy), withoutFeaturedPromotion (copy), findFirstBonusRobuxPackageWithPaymentSession (copy), BonusPromotionEligibilityModule (copy)
		if not FFlagEnableRobuxInExperienceShop or not FFlagPromoteRobuxInTopPicksModule then
			return (withoutFeaturedPromotion(Tbl))
		end
		local FirstBonusRobuxPackageWithPaymentSession, FirstBonusRobuxPackageWithPaymentSession2 = findFirstBonusRobuxPackageWithPaymentSession(Tbl)
		
		if FirstBonusRobuxPackageWithPaymentSession == nil then
			return (withoutFeaturedPromotion(Tbl))
		end
		local v2 = nil
		
		for i, value in Tbl do
			if string.lower(value.name) == "top picks" then
				v2 = i
				break
			end
		end
		if v2 == nil then
			return (withoutFeaturedPromotion(Tbl))
		end
		local BonusItem = FirstBonusRobuxPackageWithPaymentSession.bonusItem
		local Text = if BonusItem == nil or BonusItem.type ~= "GamePass" then nil else tostring(BonusItem.id)
		
		if Text == nil or (FirstBonusRobuxPackageWithPaymentSession.bonusItemDetails == nil or p1[Text] ~= BonusPromotionEligibilityModule.Eligible) then
			return (withoutFeaturedPromotion(Tbl))
		end
		local Entry = Tbl[v2]
		local FeaturedRobuxPackage = Entry.featuredRobuxPackage
		
		if FeaturedRobuxPackage ~= nil and FeaturedRobuxPackage.id == FirstBonusRobuxPackageWithPaymentSession.id and Entry.paymentSessionId == FirstBonusRobuxPackageWithPaymentSession2 then
			return Tbl
		end
		local Copy = table.clone(Tbl)
		local config = {
			id = Entry.id,
			name = Entry.name,
			items = Entry.items,
			paymentSessionId = Entry.paymentSessionId,
			robuxPackages = Entry.robuxPackages,
			featuredRobuxPackage = FirstBonusRobuxPackageWithPaymentSession
		}
		
		if FirstBonusRobuxPackageWithPaymentSession2 ~= nil then
			config.paymentSessionId = FirstBonusRobuxPackageWithPaymentSession2
		end
		Copy[v2] = config
		
		return Copy
	end
}