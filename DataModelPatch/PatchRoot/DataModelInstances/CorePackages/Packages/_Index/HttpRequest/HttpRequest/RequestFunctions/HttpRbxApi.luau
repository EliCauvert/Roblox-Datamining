local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local StatusCodeModule = require(script.Parent.Parent.StatusCode)
local Extreme = Enum.ThrottlingPriority.Extreme
local ApplicationJson = Enum.HttpContentType.ApplicationJson

local function _(p1, p2)
	-- upvalues: HttpRbxApiService (copy), Extreme (copy)
	return pcall(function()
		-- upvalues: HttpRbxApiService (upval), p1 (copy), p2 (copy), Extreme (upval)
		return HttpRbxApiService:GetAsyncFullUrl(p1, p2.throttlingPriority or Extreme, p2.httpRequestType or nil)
	end)
end

local function doHttpPost(ApiUrl, p1)
	-- upvalues: HttpService (copy), HttpRbxApiService (copy), Extreme (copy), ApplicationJson (copy)
	local Json = nil
	assert(p1.postBody, "Expected a postBody to be specified with this request")
	
	if type(p1.postBody) == "table" then
		Json = HttpService:JSONEncode(p1.postBody)
	elseif type(p1.postBody) == "string" then
		Json = p1.postBody
	else
		error("Expected postBody to be a string or table")
	end
	return pcall(function()
		-- upvalues: HttpRbxApiService (upval), ApiUrl (copy), Json (ref), p1 (copy), Extreme (upval), ApplicationJson (upval)
		return HttpRbxApiService:PostAsyncFullUrl(ApiUrl, Json, p1.throttlingPriority or Extreme, p1.contentType or ApplicationJson, p1.httpRequestType or nil)
	end)
end

local function createResponse(Text: string)
	-- upvalues: StatusCodeModule (copy), HttpService (copy)
	local OK = StatusCodeModule.OK
	local Success, _ = pcall(function()
		-- upvalues: HttpService (upval), Text (copy)
		return HttpService:JSONDecode(Text)
	end)
	
	if not Success then
		OK = tonumber(Text:sub(6, 8))
	end
	return { Body = Text, StatusCode = OK, Headers = {} }
end

return function(ApiUrl, p1, p2)
	-- upvalues: HttpRbxApiService (copy), Extreme (copy), doHttpPost (copy), createResponse (copy)
	return {
		Start = function(_, Callback: (any, any) -> ())
			-- upvalues: p1 (copy), ApiUrl (copy), p2 (copy), HttpRbxApiService (upval), Extreme (upval), doHttpPost (upval), createResponse (upval)
			local v1 = nil
			local v2 = nil
			
			if p1 == "GET" then
				v1, v13 = pcall(function()
					-- upvalues: HttpRbxApiService (upval), ApiUrl (copy), p2 (copy), Extreme (upval)
					return HttpRbxApiService:GetAsyncFullUrl(ApiUrl, p2.throttlingPriority or Extreme, p2.httpRequestType or nil)
				end)
			elseif p1 == "POST" then
				v1, v13 = doHttpPost(ApiUrl, p2)
			else
				error("Unsupported method: " .. p1)
			end
			Callback(v1, (createResponse(v2)))
		end,
		Cancel = function() end
	}
end