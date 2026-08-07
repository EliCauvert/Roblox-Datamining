local APIUtilModule = require(script.Parent.Parent.util.APIUtil)
local httpService = game:GetService("HttpService")
local text = string.format("https://itemconfiguration.%s", APIUtilModule.getBaseDomain()) .. "v1/creations/get-asset-details"

return function(value) --[[ line: 13 | named "getAssetCreationDetails" ]]
	-- upvalues: APIUtilModule (ref), text (ref), httpService (ref)
	local var3, var4 = APIUtilModule.requestAndRetryPost(text, httpService:JSONEncode({ assetIds = value }))
	
	if var3 then
		return true, httpService:JSONDecode(var4)
	end
	return false, var4
end