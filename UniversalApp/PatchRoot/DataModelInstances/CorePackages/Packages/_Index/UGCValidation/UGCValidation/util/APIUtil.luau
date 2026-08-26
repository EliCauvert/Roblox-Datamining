local httpRbxApiService = game:GetService("HttpRbxApiService")
local contentProviderService = game:GetService("ContentProvider")
local t = {
	getBaseDomain = function()
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

local function requestAndRetry(p1, p2)
	-- upvalues: requestAndRetry (ref)
	if p2 == nil then
		p2 = 0
	end
	local ok, status = pcall(p1)
	
	if ok then
		return true, status
	elseif p2 >= 2 then
		return false, status
	end
	wait(2 ^ (p2 - 1))
	
	return requestAndRetry(p1, p2 + 1)
end

function t.requestAndRetryPost(p1, p2)
	-- upvalues: requestAndRetry (ref), httpRbxApiService (ref)
	return requestAndRetry(function()
		-- upvalues: httpRbxApiService (copy), p1 (ref), p2 (ref)
		return httpRbxApiService:PostAsyncFullUrl(p1, p2)
	end)
end

function t.requestAndRetryGet(p1)
	-- upvalues: requestAndRetry (ref), httpRbxApiService (ref)
	return requestAndRetry(function()
		-- upvalues: httpRbxApiService (copy), p1 (ref)
		return httpRbxApiService:GetAsyncFullUrl(p1)
	end)
end

return t