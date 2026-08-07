local _ = require(script:FindFirstAncestor("InExperienceShop").Types)

local function findItemById(p0, p1, p2) --[[ line: 10 ]]
	if p1 == nil or p2 == nil then
		return nil
	end
	for i, v in p0 do
		for i_1, v_1 in v.items do
			if v_1.id == p1 and v_1.itemType == p2 then
				return v_1
			end
		end
	end
	return nil
end

local function findBonusItemById(p3, p4, p5) --[[ line: 24 ]]
	if p4 == nil or p5 == nil then
		return nil
	end
	for i, v in p3 do
		local bonusItemDetails
		local featuredRobuxPackage = v.featuredRobuxPackage
		
		if featuredRobuxPackage ~= nil then
			bonusItemDetails = featuredRobuxPackage.bonusItemDetails
			
			if bonusItemDetails == nil or bonusItemDetails.id ~= p4 or bonusItemDetails.itemType ~= p5 then
				bonusItemDetails = v.robuxPackages
				
				if bonusItemDetails ~= nil then
					for i_1, v_1 in bonusItemDetails do
						local bonusItemDetails_1 = v_1.bonusItemDetails
						
						if bonusItemDetails_1 ~= nil and bonusItemDetails_1.id == p4 and bonusItemDetails_1.itemType == p5 then
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
	resolveItemForSelection = function(p6, p7, p8, p9) --[[ line: 53 ]]
		-- upvalues: findItemById (ref), findBonusItemById (ref)
		local var2 = findItemById(p6, p7, p8)
		
		return if var2 == nil then if p9 then findBonusItemById(p6, p7, p8) else nil else var2
	end,
	isRobuxBonusOnlySelection = function(p10, p11, p12, p13) --[[ line: 71 ]]
		-- upvalues: findItemById (ref), findBonusItemById (ref)
		return not (not p13 or p11 == nil or p12 == nil) and (findItemById(p10, p11, p12) == nil and findBonusItemById(p10, p11, p12) ~= nil)
	end
}