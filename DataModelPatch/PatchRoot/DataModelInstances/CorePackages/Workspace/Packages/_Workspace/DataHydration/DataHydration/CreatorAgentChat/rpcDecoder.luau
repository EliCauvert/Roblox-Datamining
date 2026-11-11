local HttpService = game:GetService("HttpService")
local _ = require(script:FindFirstAncestor("DataHydration").Parent.HttpClient)

local function _(Buf)
	-- upvalues: HttpService (copy)
	if Buf == nil or Buf == "" then
		return nil
	else
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, if typeof(Buf) == "buffer" then buffer.tostring(Buf) else Buf)
		
		return if Success then Result else nil
	end
end

return function()
	-- upvalues: HttpService (copy)
	return function(p1)
		-- upvalues: HttpService (upval)
		local ResponseBody = p1.responseBody
		local v1 = nil
		
		if ResponseBody == nil or ResponseBody == "" then
			v1 = nil
		else
			local Success, Result = pcall(HttpService.JSONDecode, HttpService, if typeof(ResponseBody) == "buffer" then buffer.tostring(ResponseBody) else ResponseBody)
			v1 = if Success then Result else nil
		end
		if typeof(v1) == "table" and v1.error then
			local Error = v1.error
			
			return nil, ("CAS error %d: %s"):format(Error.code or 0, (tostring(Error.message or "JSON-RPC error"))), Error.code
		elseif p1.statusCode >= 200 and p1.statusCode < 300 then
			return if typeof(v1) == "table" then v1.result else nil, nil, nil
		else
			return nil, ("CAS HTTP %d: %s"):format(p1.statusCode, if typeof(p1.responseBody) == "buffer" then buffer.tostring(p1.responseBody) else p1.responseBody or ""), nil
		end
	end
end