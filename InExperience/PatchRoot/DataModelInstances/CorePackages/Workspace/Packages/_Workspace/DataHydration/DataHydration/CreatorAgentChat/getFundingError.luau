local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.types)
local DecodeFundingErrorModule = require(script.Parent.decodeFundingError)

return function(p1)
	-- upvalues: HttpService (copy), DecodeFundingErrorModule (copy)
	if p1.status ~= "failed" or p1.response == nil then
		return nil, nil
	end
	local ResponseBody = p1.response.responseBody
	
	if ResponseBody == nil or ResponseBody == "" then
		return nil, nil
	end
	local Success, Result = pcall(HttpService.JSONDecode, HttpService, if typeof(ResponseBody) == "buffer" then buffer.tostring(ResponseBody) else ResponseBody)
	
	if Success and typeof(Result) == "table" then
		return DecodeFundingErrorModule(Result.error)
	else
		return nil, nil
	end
end