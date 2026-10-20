local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local Normalize = AvatarExperienceCommonModule.Utils.normalize
local NormalizeBooleanFunction = Normalize.normalizeBoolean
local NormalizeStringFunction = Normalize.normalizeString
local NormalizeNumberFunction = Normalize.normalizeNumber
local GetRawItemLicensingInfoFunction = AvatarExperienceCommonModule.Utils.getRawItemLicensingInfo
local ConvertToPascalCaseModule = require(AvatarExperienceCatalog.Utils.convertToPascalCase)
local FFlagAXMarketplaceLicensing = require(Parent.AvatarExperienceFlags).FFlagAXMarketplaceLicensing
local ASSETTYPEIDSTRINGTONAME = require(Parent.AvatarExperienceCommon).Constants.ASSET_TYPE_ID_STRING_TO_NAME
local _ = require(AvatarExperienceCatalog.Models.CatalogV2SearchItemDetails)
local config = {
	[1] = "BodyParts",
	[2] = "Animations",
	[3] = "Shoes",
	[4] = "DynamicHead"
}

local function _(p1)
	-- upvalues: NormalizeNumberFunction (copy), NormalizeStringFunction (copy)
	return {
		Id = NormalizeNumberFunction(p1.id),
		Name = NormalizeStringFunction(p1.name),
		Type = NormalizeStringFunction(p1.type)
	}
end

local function normalizeBundledItems(BundledItems)
	-- upvalues: NormalizeNumberFunction (copy), NormalizeStringFunction (copy)
	if typeof(BundledItems) ~= "table" then
		return nil
	end
	local List = {}
	
	for _, bundledItem in BundledItems do
		table.insert(List, {
			Id = NormalizeNumberFunction(bundledItem.id),
			Name = NormalizeStringFunction(bundledItem.name),
			Type = NormalizeStringFunction(bundledItem.type)
		})
	end
	return List
end

local function normalizeTimedOptions(p1)
	-- upvalues: NormalizeNumberFunction (copy), NormalizeBooleanFunction (copy)
	local List = nil
	
	if p1.timedOptions then
		List = {}
		
		for _, timedOption in p1.timedOptions do
			table.insert(List, {
				days = NormalizeNumberFunction(timedOption.days),
				price = NormalizeNumberFunction(timedOption.price),
				selected = if timedOption.selected then NormalizeBooleanFunction(timedOption.selected) else nil,
				discountInformation = timedOption.discountInformation
			})
		end
	end
	return List
end

local function normalizeItem(p2)
	-- upvalues: ASSETTYPEIDSTRINGTONAME (copy), config (copy), GetRawItemLicensingInfoFunction (copy), NormalizeStringFunction (copy), normalizeBundledItems (copy), NormalizeBooleanFunction (copy), NormalizeNumberFunction (copy), normalizeTimedOptions (copy), FFlagAXMarketplaceLicensing (copy), ConvertToPascalCaseModule (copy)
	if type(p2) == "table" then
		local RawItemLicensingInfo = GetRawItemLicensingInfoFunction(p2)
		
		return ConvertToPascalCaseModule({
			assetType = NormalizeStringFunction(if p2.assetType then ASSETTYPEIDSTRINGTONAME[tostring(p2.assetType)] else nil),
			bundleType = NormalizeStringFunction(if type(p2.bundleType) == "number" then config[p2.bundleType] or tostring(p2.bundleType) else p2.bundleType),
			bundledItems = normalizeBundledItems(p2.bundledItems),
			collectibleItemId = NormalizeStringFunction(p2.collectibleItemId),
			creatorHasVerifiedBadge = NormalizeBooleanFunction(p2.creatorHasVerifiedBadge),
			creatorName = NormalizeStringFunction(p2.creatorName),
			creatorTargetId = NormalizeNumberFunction(p2.creatorTargetId),
			creatorType = NormalizeStringFunction(p2.creatorType),
			description = NormalizeStringFunction(p2.description),
			favoriteCount = NormalizeNumberFunction(p2.favoriteCount),
			hasResellers = NormalizeBooleanFunction(p2.hasResellers),
			id = NormalizeNumberFunction(p2.id),
			isRecolorable = NormalizeBooleanFunction(p2.isRecolorable),
			itemRestrictions = p2.itemRestrictions or {},
			itemStatus = p2.itemStatus or {},
			itemType = NormalizeStringFunction(p2.itemType),
			lowestPrice = NormalizeNumberFunction(p2.lowestPrice),
			lowestResalePrice = NormalizeNumberFunction(p2.lowestResalePrice),
			name = NormalizeStringFunction(p2.name),
			price = NormalizeNumberFunction(p2.price),
			productId = NormalizeNumberFunction(p2.productId),
			priceStatus = NormalizeStringFunction(p2.priceStatus),
			saleLocationType = NormalizeStringFunction(p2.saleLocationType),
			totalQuantity = NormalizeNumberFunction(p2.totalQuantity),
			unitsAvailableForConsumption = NormalizeNumberFunction(p2.unitsAvailableForConsumption),
			offSaleDeadline = NormalizeStringFunction(p2.offSaleDeadline),
			quantityLimitPerUser = NormalizeNumberFunction(p2.quantityLimitPerUser),
			isOffSale = NormalizeBooleanFunction(p2.isOffSale),
			timedOptions = normalizeTimedOptions(p2),
			itemLicensingInfo = if FFlagAXMarketplaceLicensing then RawItemLicensingInfo else nil
		}), nil
	else
		return nil, "Item must be a table"
	end
end

return (Normalize.makeNormalizeTableFn({
	data = function(List)
		-- upvalues: normalizeItem (copy)
		if typeof(List) ~= "table" then
			return nil, nil
		end
		local t = {}
		local List1 = {}
		
		for i, value in List do
			local NormalizeItemResult, NormalizeItemResult2 = normalizeItem(value)
			table.insert(List1, NormalizeItemResult2)
			t[i] = NormalizeItemResult
		end
		return t, if next(List1) then table.concat(List1, " ") else nil
	end,
	nextPageCursor = NormalizeStringFunction
}))