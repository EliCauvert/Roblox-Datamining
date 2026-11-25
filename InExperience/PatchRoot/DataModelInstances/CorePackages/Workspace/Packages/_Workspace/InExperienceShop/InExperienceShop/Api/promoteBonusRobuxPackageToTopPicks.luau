local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local SharedFlagsModule = require(InExperienceShop.Parent.SharedFlags)
local _ = require(InExperienceShop.Types)
local FindTopPicksSectionIndexModule = require(InExperienceShop.Utils.findTopPicksSectionIndex)
local FFlagPromoteRobuxInTopPicksModule = require(InExperienceShop.Flags.FFlagPromoteRobuxInTopPicks)
local FFlagHideBonusInShopWhenNotClaimableModule = require(InExperienceShop.Flags.FFlagHideBonusInShopWhenNotClaimable)
local FFlagEnableRobuxInExperienceShop = SharedFlagsModule.FFlagEnableRobuxInExperienceShop
local FFlagEnableBonusJwtInShop = SharedFlagsModule.FFlagEnableBonusJwtInShop
local BonusPromotionEligibilityModule = require(InExperienceShop.Api.BonusPromotionEligibility)

local function findFirstBonusRobuxPackageWithPaymentSession(List)
	for _, value in List do
		local RobuxPackages = value.robuxPackages
		
		if RobuxPackages ~= nil then
			for _, robuxPackage in RobuxPackages do
				if robuxPackage.bonusItem ~= nil then
					return robuxPackage, value.paymentSessionId, value.bonusJwt
				end
			end
		end
	end
	return nil, nil, nil
end

local function withoutFeaturedPromotion(Tbl)
	-- upvalues: FindTopPicksSectionIndexModule (copy)
	local TopPicksSectionIndexModule = FindTopPicksSectionIndexModule(Tbl)
	
	if TopPicksSectionIndexModule == nil then
		return Tbl
	end
	local Entry = Tbl[TopPicksSectionIndexModule]
	
	if Entry.featuredRobuxPackage == nil then
		return Tbl
	else
		local Copy = table.clone(Tbl)
		Copy[TopPicksSectionIndexModule] = {
			featuredRobuxPackage = nil,
			id = Entry.id,
			name = Entry.name,
			items = Entry.items,
			categoryType = Entry.categoryType,
			stableCategoryId = Entry.stableCategoryId,
			categoryGroup = Entry.categoryGroup,
			robuxPackages = Entry.robuxPackages
		}
		
		return Copy
	end
end

local function _(p1, p2): boolean
	-- upvalues: BonusPromotionEligibilityModule (copy)
	local BonusItem = p1.bonusItem
	local Text = if BonusItem == nil or BonusItem.type ~= "GamePass" then nil else tostring(BonusItem.id)
	
	return Text ~= nil and (p1.bonusItemDetails ~= nil and p2[Text] == BonusPromotionEligibilityModule.Eligible)
end

return {
	findFirstBonusRobuxPackage = function(p1)
		-- upvalues: findFirstBonusRobuxPackageWithPaymentSession (copy)
		local FirstBonusRobuxPackageWithPaymentSession, _, _ = findFirstBonusRobuxPackageWithPaymentSession(p1)
		
		return FirstBonusRobuxPackageWithPaymentSession
	end,
	getBonusGamePassId = function(p1)
		local BonusItem = p1.bonusItem
		
		return if BonusItem == nil or BonusItem.type ~= "GamePass" then nil else tostring(BonusItem.id)
	end,
	withoutFeaturedPromotion = withoutFeaturedPromotion,
	promoteBonusRobuxPackageToTopPicks = function(Tbl, p1)
		-- upvalues: FFlagEnableRobuxInExperienceShop (copy), FFlagPromoteRobuxInTopPicksModule (copy), withoutFeaturedPromotion (copy), findFirstBonusRobuxPackageWithPaymentSession (copy), FFlagEnableBonusJwtInShop (copy), FFlagHideBonusInShopWhenNotClaimableModule (copy), FindTopPicksSectionIndexModule (copy), BonusPromotionEligibilityModule (copy)
		if not FFlagEnableRobuxInExperienceShop or not FFlagPromoteRobuxInTopPicksModule then
			return (withoutFeaturedPromotion(Tbl))
		end
		local FirstBonusRobuxPackageWithPaymentSession, FirstBonusRobuxPackageWithPaymentSession2, FirstBonusRobuxPackageWithPaymentSession3 = findFirstBonusRobuxPackageWithPaymentSession(Tbl)
		
		if FirstBonusRobuxPackageWithPaymentSession == nil then
			return (withoutFeaturedPromotion(Tbl))
		end
		if FFlagHideBonusInShopWhenNotClaimableModule and not (if FirstBonusRobuxPackageWithPaymentSession2 == nil then FFlagEnableBonusJwtInShop and (FirstBonusRobuxPackageWithPaymentSession3 ~= nil and FirstBonusRobuxPackageWithPaymentSession3 ~= "") else FirstBonusRobuxPackageWithPaymentSession2 ~= "" or FFlagEnableBonusJwtInShop and (FirstBonusRobuxPackageWithPaymentSession3 ~= nil and FirstBonusRobuxPackageWithPaymentSession3 ~= "")) then
			return (withoutFeaturedPromotion(Tbl))
		end
		local TopPicksSectionIndexModule = FindTopPicksSectionIndexModule(Tbl)
		
		if TopPicksSectionIndexModule == nil then
			return (withoutFeaturedPromotion(Tbl))
		end
		local BonusItem = FirstBonusRobuxPackageWithPaymentSession.bonusItem
		local Text = if BonusItem == nil or BonusItem.type ~= "GamePass" then nil else tostring(BonusItem.id)
		
		if Text == nil or (FirstBonusRobuxPackageWithPaymentSession.bonusItemDetails == nil or p1[Text] ~= BonusPromotionEligibilityModule.Eligible) then
			return (withoutFeaturedPromotion(Tbl))
		end
		local Entry = Tbl[TopPicksSectionIndexModule]
		local FeaturedRobuxPackage = Entry.featuredRobuxPackage
		
		if FeaturedRobuxPackage ~= nil and FeaturedRobuxPackage.id == FirstBonusRobuxPackageWithPaymentSession.id then
			local NoFFlagEnableBonusJwtInShop: boolean = not FFlagEnableBonusJwtInShop or Entry.bonusJwt == FirstBonusRobuxPackageWithPaymentSession3
			
			if Entry.paymentSessionId == FirstBonusRobuxPackageWithPaymentSession2 and NoFFlagEnableBonusJwtInShop then
				return Tbl
			end
		end
		local Copy = table.clone(Tbl)
		local config = {
			id = Entry.id,
			name = Entry.name,
			items = Entry.items,
			categoryType = Entry.categoryType,
			stableCategoryId = Entry.stableCategoryId,
			categoryGroup = Entry.categoryGroup,
			paymentSessionId = Entry.paymentSessionId,
			bonusJwt = Entry.bonusJwt,
			robuxPackages = Entry.robuxPackages,
			featuredRobuxPackage = FirstBonusRobuxPackageWithPaymentSession
		}
		
		if FirstBonusRobuxPackageWithPaymentSession2 ~= nil then
			config.paymentSessionId = FirstBonusRobuxPackageWithPaymentSession2
		end
		if FFlagEnableBonusJwtInShop and FirstBonusRobuxPackageWithPaymentSession3 ~= nil then
			config.bonusJwt = FirstBonusRobuxPackageWithPaymentSession3
		end
		Copy[TopPicksSectionIndexModule] = config
		
		return Copy
	end
}