local HttpService = game:GetService("HttpService")
local _ = require(script:FindFirstAncestor("DataHydration").Parent.HttpClient)

local function _(Buf) --[[ Line: 10 | Named "tryJsonDecode" ]]
	-- upvalues: HttpService (copy)
	if Buf == nil or Buf == "" then
		return nil
	else
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, if typeof(Buf) == "buffer" then buffer.tostring(Buf) else Buf)
		
		return if Success then Result else nil
	end
end

return function(Callback) --[[ Line: 21 | Named "rpcDecoder" ]]
	-- upvalues: HttpService (copy)
	return function(p1) --[[ Line: 22 ]]
		-- upvalues: HttpService (upval), Callback (copy)
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
			
			return nil, tostring(Error.message or "JSON-RPC error"), Error.code
		elseif p1.statusCode < 200 or p1.statusCode >= 300 then
			return nil, ("CAS HTTP %d: %s"):format(p1.statusCode, if typeof(p1.responseBody) == "buffer" then buffer.tostring(p1.responseBody) else p1.responseBody or ""), nil
		else
			local Result1 = if typeof(v1) == "table" then v1.result else nil
			
			if Callback == nil then
				return Result1, nil, nil
			else
				local CallbackResult, CallbackResult2 = Callback(Result1)
				
				return CallbackResult, CallbackResult2, nil
			end
		end
	end
end