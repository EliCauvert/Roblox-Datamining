local httpService = game:GetService("HttpService")
local parseApiErrorModule = require(script.Parent.parseApiError)
local parseLegacyErrorModule = require(script.Parent.parseLegacyError)
local _ = require(script.Parent.types)
local isSuccess = require(script.Parent.httpStatus).isSuccess

local function _(p1)
	return if p1 == nil then nil elseif typeof(p1) == "buffer" then buffer.tostring(p1) else p1
end

local _ = function(p1)
	-- upvalues: httpService (ref)
	local var1 = if p1 == nil then nil elseif typeof(p1) == "buffer" then buffer.tostring(p1) else p1
	
	if var1 == nil or var1 == "" then
		return nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, var1)
	
	return if ok then status else nil
end

return {
	decodeJson = function(p1)
		-- upvalues: httpService (ref), parseApiErrorModule (ref), isSuccess (ref)
		return function(p2)
			-- upvalues: httpService (copy), parseApiErrorModule (copy), isSuccess (copy), p1 (ref)
			local var1
			local responseBody = p2.responseBody
			local var2 = if responseBody == nil then nil elseif typeof(responseBody) == "buffer" then buffer.tostring(responseBody) else responseBody
			
			if var2 == nil or var2 == "" then
				var1 = nil
			else
				local ok, status = pcall(httpService.JSONDecode, httpService, var2)
				var1 = if ok then status else nil
			end
			local var3 = parseApiErrorModule(var1)
			
			if var3 then
				return nil, `api error {var3.code}: {var3.message}`, var3.code
			elseif isSuccess(p2.statusCode) then
				return p1(var1), nil, nil
			end
			local responseBody_1 = p2.responseBody
			
			return nil, `http {p2.statusCode}: {(if responseBody_1 == nil then nil elseif typeof(responseBody_1) == "buffer" then buffer.tostring(responseBody_1) else responseBody_1) or ""}`, p2.statusCode
		end
	end,
	decodeLegacyJson = function(p1)
		-- upvalues: httpService (ref), parseLegacyErrorModule (ref), isSuccess (ref)
		return function(p2)
			-- upvalues: httpService (copy), parseLegacyErrorModule (copy), isSuccess (copy), p1 (ref)
			local var1
			local responseBody = p2.responseBody
			local var2 = if responseBody == nil then nil elseif typeof(responseBody) == "buffer" then buffer.tostring(responseBody) else responseBody
			
			if var2 == nil or var2 == "" then
				var1 = nil
			else
				local ok, status = pcall(httpService.JSONDecode, httpService, var2)
				var1 = if ok then status else nil
			end
			local var3 = parseLegacyErrorModule(var1)
			
			if var3 then
				var2 = var3.errors[1]
				
				return nil, `api error {var2.code}: {var2.message}`, var2.code
			elseif isSuccess(p2.statusCode) then
				return p1(var1), nil, nil
			end
			local responseBody_1 = p2.responseBody
			
			return nil, `http {p2.statusCode}: {(if responseBody_1 == nil then nil elseif typeof(responseBody_1) == "buffer" then buffer.tostring(responseBody_1) else responseBody_1) or ""}`, p2.statusCode
		end
	end
}