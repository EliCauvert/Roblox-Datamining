local _ = require(script:FindFirstAncestor("InExperienceShop").Types)

local function findItemById(p1, p2, p3)
	if p2 == nil or p3 == nil then
		return nil
	end
	for i, v in p1 do
		for i_1, v_1 in v.items do
			if v_1.id == p2 and v_1.itemType == p3 then
				return v_1
			end
		end
	end
	return nil
end

local function findBonusItemById(p4, p5, p6)
	if p5 == nil or p6 == nil then
		return nil
	end
	for i, v in p4 do
		local bonusItemDetails
		local featuredRobuxPackage = v.featuredRobuxPackage
		
		if featuredRobuxPackage ~= nil then
			bonusItemDetails = featuredRobuxPackage.bonusItemDetails
			
			if bonusItemDetails == nil or bonusItemDetails.id ~= p5 or bonusItemDetails.itemType ~= p6 then
				bonusItemDetails = v.robuxPackages
				
				if bonusItemDetails ~= nil then
					for i_1, v_1 in bonusItemDetails do
						local bonusItemDetails_1 = v_1.bonusItemDetails
						
						if bonusItemDetails_1 ~= nil and bonusItemDetails_1.id == p5 and bonusItemDetails_1.itemType == p6 then
							return bonusItemDetails_1
						end
					end
				end
			end
			return bonusItemDetails
		end
	end
	return nil
end

return {
	findItemById = findItemById,
	findBonusItemById = findBonusItemById,
	resolveItemForSelection = function(p7, p8, p9, p10)
		-- upvalues: findItemById (ref), findBonusItemById (ref)
		local var1 = findItemById(p7, p8, p9)
		
		return if var1 == nil then if p10 then findBonusItemById(p7, p8, p9) else nil else var1
	end,
	isRobuxBonusOnlySelection = function(p7, p8, p9, p10)
		-- upvalues: findItemById (ref), findBonusItemById (ref)
		return not (not p10 or p8 == nil or p9 == nil) and (findItemById(p7, p8, p9) == nil and findBonusItemById(p7, p8, p9) ~= nil)
	end
}