local APIUtilModule = require(script.Parent.Parent.util.APIUtil)
local HttpService = game:GetService("HttpService")
local Text = string.format("https://itemconfiguration.%s", (APIUtilModule.getBaseDomain())) .. "v1/creations/get-asset-details"

return function(AssetIds)
	-- upvalues: APIUtilModule (copy), Text (copy), HttpService (copy)
	local RequestAndRetryPostResult, RequestAndRetryPostResult2 = APIUtilModule.requestAndRetryPost(Text, HttpService:JSONEncode({ assetIds = AssetIds }))
	
	if RequestAndRetryPostResult then
		return true, HttpService:JSONDecode(RequestAndRetryPostResult2)
	else
		return false, RequestAndRetryPostResult2
	end
end