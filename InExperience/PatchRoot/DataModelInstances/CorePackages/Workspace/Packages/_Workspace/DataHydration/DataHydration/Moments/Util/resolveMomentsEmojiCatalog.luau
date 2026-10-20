local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.MomentsTypes)
local GetFStringMomentsEmojiFallbackCatalogJSONModule = require(DataHydration.Moments.Flags.GetFStringMomentsEmojiFallbackCatalogJSON)
local FFlagMomentsEmojiSetsApiModule = require(DataHydration.Moments.FFlagMomentsEmojiSetsApi)
local FFlagMomentsReactToFeedItemV2Module = require(DataHydration.Moments.FFlagMomentsReactToFeedItemV2)
local DecodeEmojiSetsModule = require(DataHydration.Moments.Util.decodeEmojiSets)
local HardcodedMomentsEmojisModule = require(DataHydration.Moments.Util.hardcodedMomentsEmojis)
local ParseMomentsEmojiFallbackCatalogModule = require(DataHydration.Moments.Util.parseMomentsEmojiFallbackCatalog)
local ValidateMomentsEmojiCatalogModule = require(DataHydration.Moments.Util.validateMomentsEmojiCatalog)
local FlattenEmojisResult = DecodeEmojiSetsModule.flattenEmojis((DecodeEmojiSetsModule.decodeGetEmojiSetsResponse(require(DataHydration.Moments.Util.compiledMomentsEmojiFallbackCatalog).COMPILED_MOMENTS_EMOJI_FALLBACK_API_PAYLOAD)))

local function _(p1)
	-- upvalues: ValidateMomentsEmojiCatalogModule (copy), DecodeEmojiSetsModule (copy)
	return if ValidateMomentsEmojiCatalogModule.isValidCachedGetEmojiSetsResponse(p1) then DecodeEmojiSetsModule.flattenEmojis(p1) else nil
end

local _ = function()
	-- upvalues: ParseMomentsEmojiFallbackCatalogModule (copy), GetFStringMomentsEmojiFallbackCatalogJSONModule (copy)
	return ParseMomentsEmojiFallbackCatalogModule.parseMomentsEmojiFallbackCatalogJson(GetFStringMomentsEmojiFallbackCatalogJSONModule())
end

return {
	resolveMomentsEmojiCatalog = function(p1)
		-- upvalues: FFlagMomentsEmojiSetsApiModule (copy), HardcodedMomentsEmojisModule (copy), ValidateMomentsEmojiCatalogModule (copy), DecodeEmojiSetsModule (copy), FFlagMomentsReactToFeedItemV2Module (copy), ParseMomentsEmojiFallbackCatalogModule (copy), GetFStringMomentsEmojiFallbackCatalogJSONModule (copy), FlattenEmojisResult (copy)
		if not FFlagMomentsEmojiSetsApiModule then
			return { source = "legacy", emojis = HardcodedMomentsEmojisModule }
		end
		local FlattenEmojisResult1 = if ValidateMomentsEmojiCatalogModule.isValidCachedGetEmojiSetsResponse(p1) then DecodeEmojiSetsModule.flattenEmojis(p1) else nil
		
		if FlattenEmojisResult1 ~= nil then
			return { source = "cache", emojis = FlattenEmojisResult1 }
		elseif FFlagMomentsReactToFeedItemV2Module then
			local ParseMomentsEmojiFallbackCatalogJsonResult = ParseMomentsEmojiFallbackCatalogModule.parseMomentsEmojiFallbackCatalogJson(GetFStringMomentsEmojiFallbackCatalogJSONModule())
			
			return if ParseMomentsEmojiFallbackCatalogJsonResult == nil then { source = "compiled", emojis = FlattenEmojisResult } else {
				source = "fstring",
				emojis = ParseMomentsEmojiFallbackCatalogJsonResult
			}
		else
			return { source = "legacy", emojis = HardcodedMomentsEmojisModule }
		end
	end,
	shouldUseLegacyWireStringCatalog = function(): boolean
		-- upvalues: FFlagMomentsEmojiSetsApiModule (copy)
		return not FFlagMomentsEmojiSetsApiModule
	end,
	shouldUseUuidFallbackCatalog = function()
		-- upvalues: FFlagMomentsReactToFeedItemV2Module (copy)
		return FFlagMomentsReactToFeedItemV2Module
	end
}