local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local _ = require(Parent.MomentsTypes)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)
local DecodeEmojiSetsModule = require(DataHydration.Moments.Util.decodeEmojiSets)

return function(Network)
	-- upvalues: ConstructApiUrlModule (copy), HttpClientModule (copy), DecodeEmojiSetsModule (copy)
	local GetEmojiSetsProductMoments, GetEmojiSetsProductMoments2 = ConstructApiUrlModule("emoji-api/v1/get-emoji-sets?product=Moments")
	
	return HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-emoji-sets",
		url = GetEmojiSetsProductMoments,
		headers = GetEmojiSetsProductMoments2,
		network = Network,
		decode = function(p1)
			-- upvalues: DecodeEmojiSetsModule (upval)
			return DecodeEmojiSetsModule.decodeGetEmojiSetsResponse(p1)
		end
	})
end