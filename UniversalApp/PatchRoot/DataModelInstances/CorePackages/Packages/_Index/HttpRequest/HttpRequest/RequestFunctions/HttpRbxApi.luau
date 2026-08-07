local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local statusCodeModule = require(script.Parent.Parent.StatusCode)
local extreme = Enum.ThrottlingPriority.Extreme
local applicationJson = Enum.HttpContentType.ApplicationJson

local function _(p0, p1) --[[ line: 9 | named "doHttpGet" ]]
	-- upvalues: httpRbxApiService (ref), extreme (ref)
	return pcall(function() --[[ line: 10 ]]
		-- upvalues: httpRbxApiService (copy), p0 (ref), p1 (ref), extreme (copy)
		return httpRbxApiService:GetAsyncFullUrl(p0, p1.throttlingPriority or extreme, p1.httpRequestType or nil)
	end)
end

local function doHttpPost(p2, p3) --[[ line: 19 ]]
	-- upvalues: httpService (ref), httpRbxApiService (ref), extreme (ref), applicationJson (ref)
	local postBody = nil
	assert(p3.postBody, "Expected a postBody to be specified with this request")
	
	if type(p3.postBody) == "table" then
		postBody = httpService:JSONEncode(p3.postBody)
	elseif type(p3.postBody) == "string" then
		postBody = p3.postBody
	else
		error("Expected postBody to be a string or table")
	end
	return pcall(function() --[[ line: 30 ]]
		-- upvalues: httpRbxApiService (copy), p2 (ref), postBody (write), p3 (ref), extreme (copy), applicationJson (copy)
		return httpRbxApiService:PostAsyncFullUrl(p2, postBody, p3.throttlingPriority or extreme, p3.contentType or applicationJson, p3.httpRequestType or nil)
	end)
end

local function createResponse(p4) --[[ line: 41 ]]
	-- upvalues: statusCodeModule (ref), httpService (ref)
	local OK = statusCodeModule.OK
	local ok, _ = pcall(function() --[[ line: 44 ]]
		-- upvalues: httpService (copy), p4 (ref)
		return httpService:JSONDecode(p4)
	end)
	
	if not ok then
		OK = tonumber(p4:sub(6, 8))
	end
	return { Body = p4, StatusCode = OK, Headers = {} }
end

return function(p5, p6, p7) --[[ line: 61 ]]
	-- upvalues: httpRbxApiService (ref), extreme (ref), doHttpPost (ref), createResponse (ref)
	return {
		Start = function(_, p8) --[[ line: 63 ]]
			-- upvalues: p6 (ref), p5 (ref), p7 (ref), httpRbxApiService (copy), extreme (copy), doHttpPost (copy), createResponse (copy)
			local var5 = nil
			local var6 = nil
			
			if p6 == "GET" then
				local var7 = p5
				local var8 = p7
				local ok, status = pcall(function() --[[ line: 10 ]]
					-- upvalues: httpRbxApiService (copy), var7 (ref), var8 (ref), extreme (copy)
					return httpRbxApiService:GetAsyncFullUrl(var7, var8.throttlingPriority or extreme, var8.httpRequestType or nil)
				end)
				var5 = ok
				var6 = status
			elseif p6 == "POST" then
				local var9, var10 = doHttpPost(p5, p7)
				var5 = var9
				var6 = var10
			else
				error("Unsupported method: " .. p6)
			end
			p8(var5, createResponse(var6))
		end,
		Cancel = function() --[[ line: 77 ]] end
	}
end