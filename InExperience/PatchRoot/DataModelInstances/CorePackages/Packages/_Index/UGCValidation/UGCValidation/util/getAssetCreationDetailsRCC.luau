local APIUtilModule = require(script.Parent.Parent.util.APIUtil)
local HttpService = game:GetService("HttpService")
local Text = string.format("https://apis.%s", (APIUtilModule.getBaseDomain())) .. "assets/rcc/v1/assets/%s"

return function(p1) --[[ Line: 15 | Named "getAssetCreationDetailsRCC" ]]
	-- upvalues: Text (copy), APIUtilModule (copy), HttpService (copy)
	local RequestAndRetryGetResult, RequestAndRetryGetResult2 = APIUtilModule.requestAndRetryGet((string.format(Text, p1)))
	
	if RequestAndRetryGetResult then
		return true, HttpService:JSONDecode(RequestAndRetryGetResult2)
	else
		return false, RequestAndRetryGetResult2
	end
end