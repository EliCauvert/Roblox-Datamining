local httpService = game:GetService("HttpService")
local parseApiErrorModule = require(script.Parent.parseApiError)
local parseLegacyErrorModule = require(script.Parent.parseLegacyError)
local _ = require(script.Parent.types)
local isSuccess = require(script.Parent.httpStatus).isSuccess

local function _(p0)
	return if p0 == nil then nil elseif typeof(p0) == "buffer" then buffer.tostring(p0) else p0
end

local _ = function(p1)
	-- upvalues: httpService (ref)
	local var3 = if p1 == nil then nil elseif typeof(p1) == "buffer" then buffer.tostring(p1) else p1
	
	if var3 == nil or var3 == "" then
		return nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, var3)
	
	return if ok then status else nil
end

return {
	decodeJson = function(p2)
		-- upvalues: httpService (ref), parseApiErrorModule (ref), isSuccess (ref)
		return function(p3)
			-- upvalues: httpService (copy), parseApiErrorModule (copy), isSuccess (copy), p2 (ref)
			local var5
			local responseBody = p3.responseBody
			local var4 = if responseBody == nil then nil elseif typeof(responseBody) == "buffer" then buffer.tostring(responseBody) else responseBody
			
			if var4 == nil or var4 == "" then
				var5 = nil
			else
				local ok, status = pcall(httpService.JSONDecode, httpService, var4)
				var5 = if ok then status else nil
			end
			local var6 = parseApiErrorModule(var5)
			
			if var6 then
				return nil, `api error {var6.code}: {var6.message}`, var6.code
			elseif isSuccess(p3.statusCode) then
				return p2(var5), nil, nil
			end
			local responseBody_1 = p3.responseBody
			
			return nil, `http {p3.statusCode}: {(if responseBody_1 == nil then nil elseif typeof(responseBody_1) == "buffer" then buffer.tostring(responseBody_1) else responseBody_1) or ""}`, p3.statusCode
		end
	end,
	decodeLegacyJson = function(p4)
		-- upvalues: httpService (ref), parseLegacyErrorModule (ref), isSuccess (ref)
		return function(p5)
			-- upvalues: httpService (copy), parseLegacyErrorModule (copy), isSuccess (copy), p4 (ref)
			local var8
			local responseBody = p5.responseBody
			local var7 = if responseBody == nil then nil elseif typeof(responseBody) == "buffer" then buffer.tostring(responseBody) else responseBody
			
			if var7 == nil or var7 == "" then
				var8 = nil
			else
				local ok, status = pcall(httpService.JSONDecode, httpService, var7)
				var8 = if ok then status else nil
			end
			local var9 = parseLegacyErrorModule(var8)
			
			if var9 then
				var7 = var9.errors[1]
				
				return nil, `api error {var7.code}: {var7.message}`, var7.code
			elseif isSuccess(p5.statusCode) then
				return p4(var8), nil, nil
			end
			local responseBody_1 = p5.responseBody
			
			return nil, `http {p5.statusCode}: {(if responseBody_1 == nil then nil elseif typeof(responseBody_1) == "buffer" then buffer.tostring(responseBody_1) else responseBody_1) or ""}`, p5.statusCode
		end
	end
}