local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local statusCodeModule = require(script.Parent.Parent.StatusCode)
local extreme = Enum.ThrottlingPriority.Extreme
local applicationJson = Enum.HttpContentType.ApplicationJson

local function _(p1, p2)
	-- upvalues: httpRbxApiService (ref), extreme (ref)
	return pcall(function()
		-- upvalues: httpRbxApiService (copy), p1 (ref), p2 (ref), extreme (copy)
		return httpRbxApiService:GetAsyncFullUrl(p1, p2.throttlingPriority or extreme, p2.httpRequestType or nil)
	end)
end

local function doHttpPost(p1, p2)
	-- upvalues: httpService (ref), httpRbxApiService (ref), extreme (ref), applicationJson (ref)
	local postBody = nil
	assert(p2.postBody, "Expected a postBody to be specified with this request")
	
	if type(p2.postBody) == "table" then
		postBody = httpService:JSONEncode(p2.postBody)
	elseif type(p2.postBody) == "string" then
		postBody = p2.postBody
	else
		error("Expected postBody to be a string or table")
	end
	return pcall(function()
		-- upvalues: httpRbxApiService (copy), p1 (ref), postBody (write), p2 (ref), extreme (copy), applicationJson (copy)
		return httpRbxApiService:PostAsyncFullUrl(p1, postBody, p2.throttlingPriority or extreme, p2.contentType or applicationJson, p2.httpRequestType or nil)
	end)
end

local function createResponse(p1)
	-- upvalues: statusCodeModule (ref), httpService (ref)
	local OK = statusCodeModule.OK
	local ok, _ = pcall(function()
		-- upvalues: httpService (copy), p1 (ref)
		return httpService:JSONDecode(p1)
	end)
	
	if not ok then
		OK = tonumber(p1:sub(6, 8))
	end
	return { Body = p1, StatusCode = OK, Headers = {} }
end

return function(p1, p2, p3)
	-- upvalues: httpRbxApiService (ref), extreme (ref), doHttpPost (ref), createResponse (ref)
	return {
		Start = function(_, p4)
			-- upvalues: p2 (ref), p1 (ref), p3 (ref), httpRbxApiService (copy), extreme (copy), doHttpPost (copy), createResponse (copy)
			local var1 = nil
			local var2 = nil
			
			if p2 == "GET" then
				local var3 = p1
				local var4 = p3
				local ok, status = pcall(function()
					-- upvalues: httpRbxApiService (copy), var3 (ref), var4 (ref), extreme (copy)
					return httpRbxApiService:GetAsyncFullUrl(var3, var4.throttlingPriority or extreme, var4.httpRequestType or nil)
				end)
				var1 = ok
				var2 = status
			elseif p2 == "POST" then
				local var5, var6 = doHttpPost(p1, p3)
				var1 = var5
				var2 = var6
			else
				error("Unsupported method: " .. p6)
			end
			p4(var1, createResponse(var2))
		end,
		Cancel = function() end
	}
end