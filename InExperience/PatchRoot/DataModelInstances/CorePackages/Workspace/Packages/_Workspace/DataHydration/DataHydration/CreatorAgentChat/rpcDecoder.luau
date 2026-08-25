local httpService = game:GetService("HttpService")
local _ = require(script:FindFirstAncestor("DataHydration").Parent.HttpClient)

local function _(p0)
	-- upvalues: httpService (ref)
	if p0 == nil or p0 == "" then
		return nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, if typeof(p0) == "buffer" then buffer.tostring(p0) else p0)
	
	return if ok then status else nil
end

return function()
	-- upvalues: httpService (ref)
	return function(p1)
		-- upvalues: httpService (copy)
		local var1
		local responseBody = p1.responseBody
		
		if responseBody == nil or responseBody == "" then
			var1 = nil
		else
			local ok, status = pcall(httpService.JSONDecode, httpService, if typeof(responseBody) == "buffer" then buffer.tostring(responseBody) else responseBody)
			var1 = if ok then status else nil
		end
		if typeof(var1) == "table" and var1.error then
			responseBody = var1.error
			
			return nil, tostring(responseBody.message or "JSON-RPC error"), responseBody.code
		elseif p1.statusCode >= 200 and p1.statusCode < 300 then
			return if typeof(var1) == "table" then var1.result else nil, nil, nil
		end
		return nil, ("CAS HTTP %d: %s"):format(p1.statusCode, if typeof(p1.responseBody) == "buffer" then buffer.tostring(p1.responseBody) else p1.responseBody or ""), nil
	end
end