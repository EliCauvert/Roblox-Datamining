local httpService = game:GetService("HttpService")
local _ = require(script:FindFirstAncestor("DataHydration").Parent.HttpClient)

local function _(p1)
	-- upvalues: httpService (ref)
	if p1 == nil or p1 == "" then
		return nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, if typeof(p1) == "buffer" then buffer.tostring(p1) else p1)
	
	return if ok then status else nil
end

return function(p1)
	-- upvalues: httpService (ref)
	return function(p2)
		-- upvalues: httpService (copy), p1 (ref)
		local var1
		local responseBody = p2.responseBody
		
		if responseBody == nil or responseBody == "" then
			var1 = nil
		else
			local ok, status = pcall(httpService.JSONDecode, httpService, if typeof(responseBody) == "buffer" then buffer.tostring(responseBody) else responseBody)
			var1 = if ok then status else nil
		end
		if typeof(var1) == "table" and var1.error then
			responseBody = var1.error
			
			return nil, tostring(responseBody.message or "JSON-RPC error"), responseBody.code
		elseif p2.statusCode < 200 or p2.statusCode >= 300 then
			return nil, ("CAS HTTP %d: %s"):format(p2.statusCode, if typeof(p2.responseBody) == "buffer" then buffer.tostring(p2.responseBody) else p2.responseBody or ""), nil
		end
		responseBody = if typeof(var1) == "table" then var1.result else nil
		
		if p1 == nil then
			return responseBody, nil, nil
		end
		local var2, var3 = p1(responseBody)
		
		return var2, var3, nil
	end
end