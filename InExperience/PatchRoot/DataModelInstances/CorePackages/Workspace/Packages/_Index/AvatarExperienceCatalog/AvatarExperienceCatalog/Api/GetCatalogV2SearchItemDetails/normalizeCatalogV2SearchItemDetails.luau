local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local normalize = require(parent.AvatarExperienceCommon).Utils.normalize
local normalizeBoolean = normalize.normalizeBoolean
local normalizeString = normalize.normalizeString
local normalizeNumber = normalize.normalizeNumber
local makeNormalizeTableFn = normalize.makeNormalizeTableFn
local convertToPascalCaseModule = require(avatarExperienceCatalog.Utils.convertToPascalCase)
local ASSET_TYPE_ID_STRING_TO_NAME = require(parent.AvatarExperienceCommon).Constants.ASSET_TYPE_ID_STRING_TO_NAME
local _ = require(avatarExperienceCatalog.Models.CatalogV2SearchItemDetails)
local t = {
	[1] = "BodyParts",
	[2] = "Animations",
	[3] = "Shoes",
	[4] = "DynamicHead"
}

local function _(p1)
	-- upvalues: normalizeNumber (ref), normalizeString (ref)
	return {
		Id = normalizeNumber(p1.id),
		Name = normalizeString(p1.name),
		Type = normalizeString(p1.type)
	}
end

local function normalizeBundledItems(p1)
	-- upvalues: normalizeNumber (ref), normalizeString (ref)
	if typeof(p1) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in p1 do
		table.insert(t, {
			Id = normalizeNumber(v.id),
			Name = normalizeString(v.name),
			Type = normalizeString(v.type)
		})
	end
	return t
end

local function normalizeTimedOptions(p2)
	-- upvalues: normalizeNumber (ref), normalizeBoolean (ref)
	local t = nil
	
	if p2.timedOptions then
		t = {}
		
		for i, v in p2.timedOptions do
			table.insert(t, {
				days = normalizeNumber(v.days),
				price = normalizeNumber(v.price),
				selected = if v.selected then normalizeBoolean(v.selected) else nil,
				discountInformation = v.discountInformation
			})
		end
	end
	return t
end

local function normalizeItem(p3)
	-- upvalues: ASSET_TYPE_ID_STRING_TO_NAME (ref), t (ref), normalizeString (ref), normalizeBundledItems (ref), normalizeBoolean (ref), normalizeNumber (ref), normalizeTimedOptions (ref), convertToPascalCaseModule (ref)
	if type(p3) ~= "table" then
		return nil, "Item must be a table"
	end
	local _ = nil
	
	return convertToPascalCaseModule({
		assetType = normalizeString(if p3.assetType then ASSET_TYPE_ID_STRING_TO_NAME[tostring(p3.assetType)] else nil),
		bundleType = normalizeString(if type(p3.bundleType) == "number" then t[p3.bundleType] or tostring(p3.bundleType) else p3.bundleType),
		bundledItems = normalizeBundledItems(p3.bundledItems),
		collectibleItemId = normalizeString(p3.collectibleItemId),
		creatorHasVerifiedBadge = normalizeBoolean(p3.creatorHasVerifiedBadge),
		creatorName = normalizeString(p3.creatorName),
		creatorTargetId = normalizeNumber(p3.creatorTargetId),
		creatorType = normalizeString(p3.creatorType),
		description = normalizeString(p3.description),
		favoriteCount = normalizeNumber(p3.favoriteCount),
		hasResellers = normalizeBoolean(p3.hasResellers),
		id = normalizeNumber(p3.id),
		isRecolorable = normalizeBoolean(p3.isRecolorable),
		itemRestrictions = p3.itemRestrictions or {},
		itemStatus = p3.itemStatus or {},
		itemType = normalizeString(p3.itemType),
		lowestPrice = normalizeNumber(p3.lowestPrice),
		lowestResalePrice = normalizeNumber(p3.lowestResalePrice),
		name = normalizeString(p3.name),
		price = normalizeNumber(p3.price),
		productId = normalizeNumber(p3.productId),
		priceStatus = normalizeString(p3.priceStatus),
		saleLocationType = normalizeString(p3.saleLocationType),
		totalQuantity = normalizeNumber(p3.totalQuantity),
		unitsAvailableForConsumption = normalizeNumber(p3.unitsAvailableForConsumption),
		offSaleDeadline = normalizeString(p3.offSaleDeadline),
		quantityLimitPerUser = normalizeNumber(p3.quantityLimitPerUser),
		isOffSale = normalizeBoolean(p3.isOffSale),
		timedOptions = normalizeTimedOptions(p3)
	}), nil
end

return makeNormalizeTableFn({
	data = function(p3)
		-- upvalues: normalizeItem (ref)
		if typeof(p3) ~= "table" then
			return nil, nil
		end
		local t = {}
		local t_1 = {}
		
		for i, v in p3 do
			local var1, var2 = normalizeItem(v)
			table.insert(t_1, var2)
			t[i] = var1
		end
		return t, if next(t_1) then table.concat(t_1, " ") else nil
	end,
	nextPageCursor = normalizeString
})