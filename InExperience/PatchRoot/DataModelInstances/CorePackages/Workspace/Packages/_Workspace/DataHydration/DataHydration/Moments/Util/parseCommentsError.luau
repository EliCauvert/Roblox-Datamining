local HttpService = game:GetService("HttpService")
local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)

return function(Text: string)
	-- upvalues: HttpService (copy)
	if type(Text) == "string" and Text ~= "" then
		local FoundAt: number? = string.find(Text, "{", 1, true)
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, if FoundAt == nil then Text else string.sub(Text, FoundAt))
		
		return if Success and type(Result) == "table" and (type(Result.errorCode) == "string" and type(Result.message) == "string") then { errorCode = Result.errorCode, message = Result.message } else nil
	else
		return nil
	end
end