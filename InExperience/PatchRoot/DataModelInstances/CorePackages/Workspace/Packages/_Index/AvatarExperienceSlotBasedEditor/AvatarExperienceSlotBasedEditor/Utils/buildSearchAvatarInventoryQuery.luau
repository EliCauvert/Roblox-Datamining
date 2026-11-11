local HttpService = game:GetService("HttpService")
local AvatarExperienceSlotBasedEditor = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor")
local InventorySearchConstantsModule = require(AvatarExperienceSlotBasedEditor.InventorySearchConstants)
local _ = require(AvatarExperienceSlotBasedEditor.Types)
local InventorySearchSortOptionModule = require(AvatarExperienceSlotBasedEditor.Enums.InventorySearchSortOption)

local function _(p1): boolean
	-- upvalues: InventorySearchSortOptionModule (copy)
	for _, value in InventorySearchSortOptionModule do
		if value == p1 then
			return true
		end
	end
	return false
end

local _ = function(p2: number): boolean
	return type(p2) == "number" and p2 >= 1 and p2 % 1 == 0
end

return function(ItemSubTypes)
	-- upvalues: InventorySearchSortOptionModule (copy), InventorySearchConstantsModule (copy), HttpService (copy)
	if type(ItemSubTypes.query) ~= "string" then
		return nil
	end
	local Match: string? = string.match(ItemSubTypes.query, "^%s*(.-)%s*$")
	
	if Match == "" then
		return nil
	end
	if not utf8.len(Match) then
		return nil
	end
	local SortOption = ItemSubTypes.sortOption or InventorySearchSortOptionModule.Relevance
	local Flag = false
	
	for _, value in InventorySearchSortOptionModule do
		if value == SortOption then
			Flag = true
			break
		end
	end
	if not Flag then
		return nil
	end
	local config = { query = Match, sortOption = SortOption }
	local ItemCategories = ItemSubTypes.itemCategories
	
	if ItemCategories ~= nil then
		if #ItemCategories == 0 then
			return nil
		end
		for i, itemCategory in ItemCategories do
			local SearchableSubtypesByItemTypeEntry = InventorySearchConstantsModule.SearchableSubtypesByItemType[itemCategory.itemType]
			
			if not SearchableSubtypesByItemTypeEntry or not SearchableSubtypesByItemTypeEntry[itemCategory.itemSubType] then
				return nil
			end
			local IDelta = i - 1
			config[`itemCategories[{IDelta}].itemType`] = itemCategory.itemType
			config[`itemCategories[{IDelta}].itemSubType`] = itemCategory.itemSubType
		end
	end
	if ItemSubTypes.pageLimit ~= nil then
		local PageLimit: number = ItemSubTypes.pageLimit
		
		if type(PageLimit) ~= "number" or (PageLimit < 1 or PageLimit % 1 ~= 0) or InventorySearchConstantsModule.MaxPageLimit < ItemSubTypes.pageLimit then
			return nil
		end
		config.pageLimit = ItemSubTypes.pageLimit
	end
	if ItemSubTypes.pageToken ~= nil and ItemSubTypes.pageToken ~= "" then
		config.pageToken = ItemSubTypes.pageToken
	end
	local t = {}
	
	for i1, value1 in config do
		t[i1] = HttpService:UrlEncode((tostring(value1)))
	end
	return t
end