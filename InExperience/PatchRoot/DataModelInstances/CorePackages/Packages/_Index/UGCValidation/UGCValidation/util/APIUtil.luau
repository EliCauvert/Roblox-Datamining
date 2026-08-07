local httpRbxApiService = game:GetService("HttpRbxApiService")
local contentProviderService = game:GetService("ContentProvider")
local t = {
	getBaseDomain = function() --[[ line: 10 ]]
		-- upvalues: contentProviderService (ref)
		local baseUrl = contentProviderService.BaseUrl
		
		if string.sub(baseUrl, #baseUrl) ~= "/" then
			baseUrl ..= "/"
		end
		local _, matchIndex = string.find(baseUrl, "://")
		local _, matchIndex_1 = string.find(baseUrl, "%.", matchIndex + 1)
		
		return string.sub(baseUrl, matchIndex_1 + 1)
	end
}

local function requestAndRetry(p0, p1) --[[ line: 21 ]]
	-- upvalues: requestAndRetry (ref)
	if p1 == nil then
		p1 = 0
	end
	local ok, status = pcall(p0)
	
	if ok then
		return true, status
	elseif p1 >= 2 then
		return false, status
	end
	wait(2 ^ (p1 - 1))
	
	return requestAndRetry(p0, p1 + 1)
end

function t.requestAndRetryPost(p2, p3) --[[ line: 39 ]]
	-- upvalues: requestAndRetry (ref), httpRbxApiService (ref)
	return requestAndRetry(function() --[[ line: 40 ]]
		-- upvalues: httpRbxApiService (copy), p2 (ref), p3 (ref)
		return httpRbxApiService:PostAsyncFullUrl(p2, p3)
	end)
end

function t.requestAndRetryGet(p4) --[[ line: 45 ]]
	-- upvalues: requestAndRetry (ref), httpRbxApiService (ref)
	return requestAndRetry(function() --[[ line: 46 ]]
		-- upvalues: httpRbxApiService (copy), p4 (ref)
		return httpRbxApiService:GetAsyncFullUrl(p4)
	end)
end

return t