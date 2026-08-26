local httpService = game:GetService("HttpService")
local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)
local decodeEmojiSetsModule = require(script.Parent.decodeEmojiSets)
local validateMomentsEmojiCatalogModule = require(script.Parent.validateMomentsEmojiCatalog)

return {
	parseMomentsEmojiFallbackCatalogJson = function(p1)
		-- upvalues: httpService (ref), validateMomentsEmojiCatalogModule (ref), decodeEmojiSetsModule (ref)
		if p1 == "" then
			return nil
		end
		local ok, status = pcall(httpService.JSONDecode, httpService, p1)
		
		return if ok and validateMomentsEmojiCatalogModule.isValidGetEmojiSetsResponseShape(status) then decodeEmojiSetsModule.flattenEmojis(decodeEmojiSetsModule.decodeGetEmojiSetsResponse(status)) else nil
	end
}