local APIUtilModule = require(script.Parent.Parent.util.APIUtil)
local httpService = game:GetService("HttpService")
local text = string.format("https://apis.%s", APIUtilModule.getBaseDomain()) .. "assets/rcc/v1/assets/%s"

return function(value)
	-- upvalues: text (ref), APIUtilModule (ref), httpService (ref)
	local var1, var2 = APIUtilModule.requestAndRetryGet(string.format(text, value))
	
	if var1 then
		return true, httpService:JSONDecode(var2)
	end
	return false, var2
end