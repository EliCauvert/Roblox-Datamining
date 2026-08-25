local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.MomentsTypes)
local getFStringMomentsEmojiFallbackCatalogJSONModule = require(dataHydration.Moments.Flags.GetFStringMomentsEmojiFallbackCatalogJSON)
local fFlagMomentsEmojiSetsApiModule = require(dataHydration.Moments.FFlagMomentsEmojiSetsApi)
local fFlagMomentsReactToFeedItemV2Module = require(dataHydration.Moments.FFlagMomentsReactToFeedItemV2)
local compiledMomentsEmojiFallbackCatalogModule = require(dataHydration.Moments.Util.compiledMomentsEmojiFallbackCatalog)
local decodeEmojiSetsModule = require(dataHydration.Moments.Util.decodeEmojiSets)
local hardcodedMomentsEmojisModule = require(dataHydration.Moments.Util.hardcodedMomentsEmojis)
local parseMomentsEmojiFallbackCatalogModule = require(dataHydration.Moments.Util.parseMomentsEmojiFallbackCatalog)
local validateMomentsEmojiCatalogModule = require(dataHydration.Moments.Util.validateMomentsEmojiCatalog)
local var9 = decodeEmojiSetsModule.flattenEmojis(decodeEmojiSetsModule.decodeGetEmojiSetsResponse(compiledMomentsEmojiFallbackCatalogModule.COMPILED_MOMENTS_EMOJI_FALLBACK_API_PAYLOAD))

local function shouldUseLegacyWireStringCatalog()
	-- upvalues: fFlagMomentsEmojiSetsApiModule (ref)
	return not fFlagMomentsEmojiSetsApiModule
end

local function shouldUseUuidFallbackCatalog()
	-- upvalues: fFlagMomentsReactToFeedItemV2Module (ref)
	return fFlagMomentsReactToFeedItemV2Module
end

local function _(p0)
	-- upvalues: validateMomentsEmojiCatalogModule (ref), decodeEmojiSetsModule (ref)
	return if validateMomentsEmojiCatalogModule.isValidCachedGetEmojiSetsResponse(p0) then decodeEmojiSetsModule.flattenEmojis(p0) else nil
end

local _ = function()
	-- upvalues: parseMomentsEmojiFallbackCatalogModule (ref), getFStringMomentsEmojiFallbackCatalogJSONModule (ref)
	return parseMomentsEmojiFallbackCatalogModule.parseMomentsEmojiFallbackCatalogJson(getFStringMomentsEmojiFallbackCatalogJSONModule())
end

return {
	resolveMomentsEmojiCatalog = function(p1)
		-- upvalues: fFlagMomentsEmojiSetsApiModule (ref), hardcodedMomentsEmojisModule (ref), validateMomentsEmojiCatalogModule (ref), decodeEmojiSetsModule (ref), fFlagMomentsReactToFeedItemV2Module (ref), parseMomentsEmojiFallbackCatalogModule (ref), getFStringMomentsEmojiFallbackCatalogJSONModule (ref), var9 (ref)
		if fFlagMomentsEmojiSetsApiModule then
			return { source = "legacy", emojis = hardcodedMomentsEmojisModule }
		end
		local var12 = if not validateMomentsEmojiCatalogModule.isValidCachedGetEmojiSetsResponse(p1) then nil else decodeEmojiSetsModule.flattenEmojis(p1)
		
		if var12 ~= nil then
			return { source = "cache", emojis = var12 }
		elseif not fFlagMomentsReactToFeedItemV2Module then
			return { source = "legacy", emojis = hardcodedMomentsEmojisModule }
		end
		local var13 = parseMomentsEmojiFallbackCatalogModule.parseMomentsEmojiFallbackCatalogJson(getFStringMomentsEmojiFallbackCatalogJSONModule())
		
		return if var13 == nil then { source = "compiled", emojis = var9 } else { source = "fstring", emojis = var13 }
	end,
	shouldUseLegacyWireStringCatalog = shouldUseLegacyWireStringCatalog,
	shouldUseUuidFallbackCatalog = shouldUseUuidFallbackCatalog
}