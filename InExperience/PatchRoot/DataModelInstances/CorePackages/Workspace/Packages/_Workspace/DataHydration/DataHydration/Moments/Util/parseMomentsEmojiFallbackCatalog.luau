local HttpService = game:GetService("HttpService")
local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)
local DecodeEmojiSetsModule = require(script.Parent.decodeEmojiSets)
local ValidateMomentsEmojiCatalogModule = require(script.Parent.validateMomentsEmojiCatalog)

return {
	parseMomentsEmojiFallbackCatalogJson = function(p1)
		-- upvalues: HttpService (copy), ValidateMomentsEmojiCatalogModule (copy), DecodeEmojiSetsModule (copy)
		if p1 == "" then
			return nil
		else
			local Success, Result = pcall(HttpService.JSONDecode, HttpService, p1)
			
			return if Success and ValidateMomentsEmojiCatalogModule.isValidGetEmojiSetsResponseShape(Result) then DecodeEmojiSetsModule.flattenEmojis(DecodeEmojiSetsModule.decodeGetEmojiSetsResponse(Result)) else nil
		end
	end
}