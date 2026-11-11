local _ = require(script:FindFirstAncestor("InExperienceShop").Types)

local function findItemById(List, Id, ItemType)
	if Id == nil or ItemType == nil then
		return nil
	end
	for _, value in List do
		for _, item in value.items do
			if item.id == Id and item.itemType == ItemType then
				return item
			end
		end
	end
	return nil
end

local function findBonusItemById(List, Id, ItemType)
	if Id == nil or ItemType == nil then
		return nil
	end
	local BonusItemDetails = nil
	local BonusItemDetails1 = nil
	for _, value in List do
		local FeaturedRobuxPackage = value.featuredRobuxPackage
		local NoFeaturedRobuxPackage = FeaturedRobuxPackage == nil
		
		if not NoFeaturedRobuxPackage then
			BonusItemDetails = FeaturedRobuxPackage.bonusItemDetails
			NoFeaturedRobuxPackage = BonusItemDetails == nil or BonusItemDetails.id ~= Id or BonusItemDetails.itemType ~= ItemType
		end
		if not NoFeaturedRobuxPackage then
			return BonusItemDetails
		end
		local RobuxPackages = value.robuxPackages
		
		if RobuxPackages ~= nil then
			for _, robuxPackage in RobuxPackages do
				BonusItemDetails1 = robuxPackage.bonusItemDetails
				
				if BonusItemDetails1 ~= nil and BonusItemDetails1.id == Id and BonusItemDetails1.itemType == ItemType then
					return BonusItemDetails1
				end
			end
		end
	end
	return nil
end

return {
	findItemById = findItemById,
	findBonusItemById = findBonusItemById,
	resolveItemForSelection = function(p1, Id, ItemType, p2)
		-- upvalues: findItemById (copy), findBonusItemById (copy)
		local ItemById = findItemById(p1, Id, ItemType)
		
		return if ItemById == nil then if p2 then findBonusItemById(p1, Id, ItemType) else nil else ItemById
	end,
	isRobuxBonusOnlySelection = function(p1, Id, ItemType, p2): boolean
		-- upvalues: findItemById (copy), findBonusItemById (copy)
		return if p2 and Id ~= nil and ItemType ~= nil and findItemById(p1, Id, ItemType) == nil then findBonusItemById(p1, Id, ItemType) ~= nil else false
	end
}