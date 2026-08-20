local normalize = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Utils.normalize
local normalizeNotEmptyString = normalize.normalizeNotEmptyString
local makeNormalizeTableFn = normalize.makeNormalizeTableFn
local makeRequired = normalize.makeRequired
local _ = require(script.Parent.MarketplaceOffersBannerTypes)
local decodeLuauUnicodeEscapesModule = require(script.Parent.decodeLuauUnicodeEscapes)

local function normalizeDisplayString(p0) --[[ line: 18 ]]
	-- upvalues: normalizeNotEmptyString (ref), decodeLuauUnicodeEscapesModule (ref)
	local var4, var5 = normalizeNotEmptyString(p0)
	
	if var4 == nil then
		return nil, var5
	end
	return decodeLuauUnicodeEscapesModule(var4), nil
end

local var2 = makeNormalizeTableFn({
	modalTitle = makeRequired(normalizeDisplayString),
	offerBodyLinkText = makeRequired(normalizeDisplayString),
	modalHeroIcon = normalizeNotEmptyString,
	termsBody = normalizeDisplayString,
	termsModalTitle = normalizeDisplayString
})

local function _(p1) --[[ line: 77 | named "normalizeModalForOfferRow" ]]
	-- upvalues: normalizeNotEmptyString (ref), var2 (ref)
	local var6 = nil
	
	if type(p1.modal) == "table" then
		var6 = p1.modal
	elseif normalizeNotEmptyString(p1.modalTitle) ~= nil then
		var6 = p1
	end
	if not var6 then
		return nil
	end
	local var7 = var2(var6)
	
	return if var7 and var7.modalTitle and var7.offerBodyLinkText then var7 else nil
end

local function normalizeOfferRow(p2) --[[ line: 96 ]]
	-- upvalues: normalizeNotEmptyString (ref), decodeLuauUnicodeEscapesModule (ref), var2 (ref)
	if type(p2) ~= "table" then
		return nil, `expected offer row to be a table, got {type(p2)}`
	end
	local var8 = normalizeNotEmptyString(p2.icon)
	local var9, _ = normalizeNotEmptyString(p2.localizedText)
	local var10 = if var9 == nil then nil else decodeLuauUnicodeEscapesModule(var9)
	local var11 = normalizeNotEmptyString(p2.offerId)
	
	if not var8 and not var10 and not var11 then
		return nil, "offer row has no recognized identity fields (icon, localizedText, offerId)"
	end
	local t = {}
	
	if var8 then
		t.icon = var8
	end
	if var10 then
		t.localizedText = var10
	end
	if var11 then
		t.offerId = var11
	end
	local var14
	local var13 = nil
	
	if type(p2.modal) == "table" then
		var13 = p2.modal
	elseif normalizeNotEmptyString(p2.modalTitle) ~= nil then
		var13 = p2
	end
	if var13 then
		local var15 = var2(var13)
		var14 = if var15 and var15.modalTitle and var15.offerBodyLinkText then var15 else nil
	else
		var14 = nil
	end
	t.modal = var14
	
	return t, nil
end

return function(p3) --[[ line: 123 | named "normalizeMarketplaceOffersBannerResponse" ]]
	-- upvalues: normalizeOfferRow (ref)
	if p3 == nil then
		return nil, nil
	elseif type(p3) ~= "table" then
		return nil, `MarketplaceOffersBanner: expected response body to be a table, got {type(p3)}`
	end
	local offers = p3.offers
	
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
		local var19, var20 = normalizeOfferRow(v)
		
		if var20 then
			table.insert(t, `offers[{i}]: {var20}`)
		end
		if var19 then
			table.insert(t_1, var19)
		end
	end
	local var18 = if next(t) then "MarketplaceOffersBanner: " .. table.concat(t, "; ") else nil
	
	if #t_1 == 0 then
		return nil, var18
	end
	return { offers = t_1 }, var18
end