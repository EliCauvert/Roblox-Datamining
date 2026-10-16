local HttpService = game:GetService("HttpService")
local ParseApiErrorModule = require(script.Parent.parseApiError)
local ParseLegacyErrorModule = require(script.Parent.parseLegacyError)
local _ = require(script.Parent.types)
local IsSuccessFunction = require(script.Parent.httpStatus).isSuccess

local function _(Buf) --[[ Line: 11 | Named "bodyToString" ]]
	return if Buf == nil then nil elseif typeof(Buf) == "buffer" then buffer.tostring(Buf) else Buf
end

local _ = function(Buf) --[[ Line: 21 | Named "tryJsonDecode" ]]
	-- upvalues: HttpService (copy)
	local Text = if Buf == nil then nil elseif typeof(Buf) == "buffer" then buffer.tostring(Buf) else Buf
	
	if Text == nil or Text == "" then
		return nil
	else
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, Text)
		
		return if Success then Result else nil
	end
end

return {
	decodeJson = function(Callback) --[[ Line: 30 ]]
		-- upvalues: HttpService (copy), ParseApiErrorModule (copy), IsSuccessFunction (copy)
		return function(p1) --[[ Line: 31 ]]
			-- upvalues: HttpService (upval), ParseApiErrorModule (upval), IsSuccessFunction (upval), Callback (copy)
			local ResponseBody = p1.responseBody
			local Text = if ResponseBody == nil then nil elseif typeof(ResponseBody) == "buffer" then buffer.tostring(ResponseBody) else ResponseBody
			local v1 = nil
			
			if Text == nil or Text == "" then
				v1 = nil
			else
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, Text)
				v1 = if Success then Result else nil
			end
			local ParseApiErrorModuleResult = ParseApiErrorModule(v1)
			
			if ParseApiErrorModuleResult then
				return nil, `api error {ParseApiErrorModuleResult.code}: {ParseApiErrorModuleResult.message}`, ParseApiErrorModuleResult.code
			elseif IsSuccessFunction(p1.statusCode) then
				return Callback(v1), nil, nil
			else
				local ResponseBody1 = p1.responseBody
				
				return nil, `http {p1.statusCode}: {(if ResponseBody1 == nil then nil elseif typeof(ResponseBody1) == "buffer" then buffer.tostring(ResponseBody1) else ResponseBody1) or ""}`, p1.statusCode
			end
		end
	end,
	decodeLegacyJson = function(Callback) --[[ Line: 44 ]]
		-- upvalues: HttpService (copy), ParseLegacyErrorModule (copy), IsSuccessFunction (copy)
		return function(p1) --[[ Line: 45 ]]
			-- upvalues: HttpService (upval), ParseLegacyErrorModule (upval), IsSuccessFunction (upval), Callback (copy)
			local ResponseBody = p1.responseBody
			local Text = if ResponseBody == nil then nil elseif typeof(ResponseBody) == "buffer" then buffer.tostring(ResponseBody) else ResponseBody
			local v1 = nil
			
			if Text == nil or Text == "" then
				v1 = nil
			else
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, Text)
				v1 = if Success then Result else nil
			end
			local ParseLegacyErrorModuleResult = ParseLegacyErrorModule(v1)
			
			if ParseLegacyErrorModuleResult then
				local Error = ParseLegacyErrorModuleResult.errors[1]
				
				return nil, `api error {Error.code}: {Error.message}`, Error.code
			elseif IsSuccessFunction(p1.statusCode) then
				return Callback(v1), nil, nil
			else
				local ResponseBody1 = p1.responseBody
				
				return nil, `http {p1.statusCode}: {(if ResponseBody1 == nil then nil elseif typeof(ResponseBody1) == "buffer" then buffer.tostring(ResponseBody1) else ResponseBody1) or ""}`, p1.statusCode
			end
		end
	end
}