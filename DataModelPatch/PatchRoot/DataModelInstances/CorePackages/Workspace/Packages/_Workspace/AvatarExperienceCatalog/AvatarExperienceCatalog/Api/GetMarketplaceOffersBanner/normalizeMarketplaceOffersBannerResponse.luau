local Normalize = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.AvatarExperienceCommon).Utils.normalize
local NormalizeNotEmptyStringFunction = Normalize.normalizeNotEmptyString
local MakeRequiredFunction = Normalize.makeRequired
local _ = require(script.Parent.MarketplaceOffersBannerTypes)
local DecodeLuauUnicodeEscapesModule = require(script.Parent.decodeLuauUnicodeEscapes)

local function normalizeDisplayString(p1)
	-- upvalues: NormalizeNotEmptyStringFunction (copy), DecodeLuauUnicodeEscapesModule (copy)
	local NormalizeNotEmptyStringResult, NormalizeNotEmptyStringResult2 = NormalizeNotEmptyStringFunction(p1)
	
	if NormalizeNotEmptyStringResult == nil then
		return nil, NormalizeNotEmptyStringResult2
	else
		return DecodeLuauUnicodeEscapesModule(NormalizeNotEmptyStringResult), nil
	end
end

local NormalizeTableFn = Normalize.makeNormalizeTableFn({
	modalTitle = MakeRequiredFunction(normalizeDisplayString),
	offerBodyLinkText = MakeRequiredFunction(normalizeDisplayString),
	modalHeroIcon = NormalizeNotEmptyStringFunction,
	termsBody = normalizeDisplayString,
	termsModalTitle = normalizeDisplayString
})

local function _(p1)
	-- upvalues: NormalizeNotEmptyStringFunction (copy), NormalizeTableFn (copy)
	local Modal = nil
	
	if type(p1.modal) == "table" then
		Modal = p1.modal
	elseif NormalizeNotEmptyStringFunction(p1.modalTitle) ~= nil then
		Modal = p1
	end
	if Modal then
		local NormalizeTableFnResult = NormalizeTableFn(Modal)
		
		return if NormalizeTableFnResult and NormalizeTableFnResult.modalTitle and NormalizeTableFnResult.offerBodyLinkText then NormalizeTableFnResult else nil
	else
		return nil
	end
end

local function normalizeOfferRow(p1)
	-- upvalues: NormalizeNotEmptyStringFunction (copy), DecodeLuauUnicodeEscapesModule (copy), NormalizeTableFn (copy)
	if type(p1) ~= "table" then
		return nil, `expected offer row to be a table, got {type(p1)}`
	end
	local NormalizeNotEmptyStringResult = NormalizeNotEmptyStringFunction(p1.icon)
	local NormalizeNotEmptyStringResult1, _ = NormalizeNotEmptyStringFunction(p1.localizedText)
	local DecodeLuauUnicodeEscapesModuleResult = if NormalizeNotEmptyStringResult1 == nil then nil else DecodeLuauUnicodeEscapesModule(NormalizeNotEmptyStringResult1)
	local NormalizeNotEmptyStringResult2 = NormalizeNotEmptyStringFunction(p1.offerId)
	
	if not NormalizeNotEmptyStringResult and not DecodeLuauUnicodeEscapesModuleResult and not NormalizeNotEmptyStringResult2 then
		return nil, "offer row has no recognized identity fields (icon, localizedText, offerId)"
	end
	local t = {}
	
	if NormalizeNotEmptyStringResult then
		t.icon = NormalizeNotEmptyStringResult
	end
	if DecodeLuauUnicodeEscapesModuleResult then
		t.localizedText = DecodeLuauUnicodeEscapesModuleResult
	end
	if NormalizeNotEmptyStringResult2 then
		t.offerId = NormalizeNotEmptyStringResult2
	end
	local Modal = nil
	
	if type(p1.modal) == "table" then
		Modal = p1.modal
	elseif NormalizeNotEmptyStringFunction(p1.modalTitle) ~= nil then
		Modal = p1
	end
	local Modal1 = nil
	if Modal then
		local NormalizeTableFnResult = NormalizeTableFn(Modal)
		Modal1 = if NormalizeTableFnResult and NormalizeTableFnResult.modalTitle and NormalizeTableFnResult.offerBodyLinkText then NormalizeTableFnResult else nil
	else
		Modal1 = nil
	end
	t.modal = Modal1
	
	return t, nil
end

return function(p1)
	-- upvalues: normalizeOfferRow (copy)
	if p1 == nil then
		return nil, nil
	end
	if type(p1) ~= "table" then
		return nil, `MarketplaceOffersBanner: expected response body to be a table, got {type(p1)}`
	end
	local Offers = p1.offers
	
	if Offers == nil then
		return nil, nil
	end
	if type(Offers) ~= "table" then
		return nil, `MarketplaceOffersBanner: expected 'offers' field to be a table, got {type(Offers)}`
	end
	if #Offers == 0 then
		return nil, nil
	end
	local List = {}
	local Offers1 = {}
	
	for i, offer in Offers do
		local NormalizeOfferRowResult, NormalizeOfferRowResult2 = normalizeOfferRow(offer)
		
		if NormalizeOfferRowResult2 then
			table.insert(List, `offers[{i}]: {NormalizeOfferRowResult2}`)
		end
		if NormalizeOfferRowResult then
			table.insert(Offers1, NormalizeOfferRowResult)
		end
	end
	local Text = if next(List) then "MarketplaceOffersBanner: " .. table.concat(List, "; ") else nil
	
	if #Offers1 == 0 then
		return nil, Text
	else
		return { offers = Offers1 }, Text
	end
end