local normalize = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Utils.normalize
local normalizeNotEmptyString = normalize.normalizeNotEmptyString
local makeNormalizeTableFn = normalize.makeNormalizeTableFn
local makeRequired = normalize.makeRequired
local _ = require(script.Parent.MarketplaceOffersBannerTypes)
local decodeLuauUnicodeEscapesModule = require(script.Parent.decodeLuauUnicodeEscapes)

local function normalizeDisplayString(p1)
	-- upvalues: normalizeNotEmptyString (ref), decodeLuauUnicodeEscapesModule (ref)
	local var1, var2 = normalizeNotEmptyString(p1)
	
	if var1 == nil then
		return nil, var2
	end
	return decodeLuauUnicodeEscapesModule(var1), nil
end

local var1 = makeNormalizeTableFn({
	modalTitle = makeRequired(normalizeDisplayString),
	offerBodyLinkText = makeRequired(normalizeDisplayString),
	modalHeroIcon = normalizeNotEmptyString,
	termsBody = normalizeDisplayString,
	termsModalTitle = normalizeDisplayString
})

local function _(p1)
	-- upvalues: normalizeNotEmptyString (ref), var1 (ref)
	local var2 = nil
	
	if type(p1.modal) == "table" then
		var2 = p1.modal
	elseif normalizeNotEmptyString(p1.modalTitle) ~= nil then
		var2 = p1
	end
	if not var2 then
		return nil
	end
	local var3 = var1(var2)
	
	return if var3 and var3.modalTitle and var3.offerBodyLinkText then var3 else nil
end

local function normalizeOfferRow(p1)
	-- upvalues: normalizeNotEmptyString (ref), decodeLuauUnicodeEscapesModule (ref), var1 (ref)
	if type(p1) ~= "table" then
		return nil, `expected offer row to be a table, got {type(p1)}`
	end
	local var2 = normalizeNotEmptyString(p1.icon)
	local var3, _ = normalizeNotEmptyString(p1.localizedText)
	local var4 = if var3 == nil then nil else decodeLuauUnicodeEscapesModule(var3)
	local var5 = normalizeNotEmptyString(p1.offerId)
	
	if not var2 and not var4 and not var5 then
		return nil, "offer row has no recognized identity fields (icon, localizedText, offerId)"
	end
	local t = {}
	
	if var2 then
		t.icon = var2
	end
	if var4 then
		t.localizedText = var4
	end
	if var5 then
		t.offerId = var5
	end
	local var6
	local var7 = nil
	
	if type(p1.modal) == "table" then
		var7 = p1.modal
	elseif normalizeNotEmptyString(p1.modalTitle) ~= nil then
		var7 = p1
	end
	if var7 then
		local var8 = var1(var7)
		var6 = if var8 and var8.modalTitle and var8.offerBodyLinkText then var8 else nil
	else
		var6 = nil
	end
	t.modal = var6
	
	return t, nil
end

return function(p1)
	-- upvalues: normalizeOfferRow (ref)
	if p1 == nil then
		return nil, nil
	elseif type(p1) ~= "table" then
		return nil, `MarketplaceOffersBanner: expected response body to be a table, got {type(p1)}`
	end
	local offers = p1.offers
	
	if offers == nil then
		return nil, nil
	elseif type(offers) ~= "table" then
		return nil, `MarketplaceOffersBanner: expected 'offers' field to be a table, got {type(offers)}`
	elseif #offers == 0 then
		return nil, nil
	end
	local t = {}
	local t_1 = {}
	
	for i, v in offers do
		local var2, var3 = normalizeOfferRow(v)
		
		if var3 then
			table.insert(t, `offers[{i}]: {var3}`)
		end
		if var2 then
			table.insert(t_1, var2)
		end
	end
	local var4 = if next(t) then "MarketplaceOffersBanner: " .. table.concat(t, "; ") else nil
	
	if #t_1 == 0 then
		return nil, var4
	end
	return { offers = t_1 }, var4
end