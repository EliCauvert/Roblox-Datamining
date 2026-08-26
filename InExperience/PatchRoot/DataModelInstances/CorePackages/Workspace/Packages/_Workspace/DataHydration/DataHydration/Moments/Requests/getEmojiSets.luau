local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local _ = require(parent.MomentsTypes)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local constructApiUrlModule = require(dataHydration.Moments.Util.constructApiUrl)
local decodeEmojiSetsModule = require(dataHydration.Moments.Util.decodeEmojiSets)

return function(value)
	-- upvalues: constructApiUrlModule (ref), httpClientModule (ref), decodeEmojiSetsModule (ref)
	local var1, var2 = constructApiUrlModule("emoji-api/v1/get-emoji-sets?product=Moments")
	
	return httpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-emoji-sets",
		url = var1,
		headers = var2,
		network = value,
		decode = function(p1)
			-- upvalues: decodeEmojiSetsModule (copy)
			return decodeEmojiSetsModule.decodeGetEmojiSetsResponse(p1)
		end
	})
end