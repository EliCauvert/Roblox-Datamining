local APIUtilModule = require(script.Parent.Parent.util.APIUtil)
local httpService = game:GetService("HttpService")
local text = string.format("https://itemconfiguration.%s", APIUtilModule.getBaseDomain()) .. "v1/creations/get-asset-details"

return function(value)
	-- upvalues: APIUtilModule (ref), text (ref), httpService (ref)
	local var1, var2 = APIUtilModule.requestAndRetryPost(text, httpService:JSONEncode({ assetIds = value }))
	
	if var1 then
		return true, httpService:JSONDecode(var2)
	end
	return false, var2
end