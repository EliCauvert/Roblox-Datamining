local HttpRbxApiService = game:GetService("HttpRbxApiService")
local ContentProvider = game:GetService("ContentProvider")

local function requestAndRetry(p1, p2: number)
	-- upvalues: requestAndRetry (copy)
	if p2 == nil then
		p2 = 0
	end
	local Success, Result = pcall(p1)
	
	if Success then
		return true, Result
	elseif p2 >= 2 then
		return false, Result
	else
		wait(2 ^ (p2 - 1))
		
		return requestAndRetry(p1, p2 + 1)
	end
end

return {
	getBaseDomain = function(): string
		-- upvalues: ContentProvider (copy)
		local BaseUrl = ContentProvider.BaseUrl
		
		if string.sub(BaseUrl, #BaseUrl) ~= "/" then
			BaseUrl ..= "/"
		end
		local _, EndIndex = string.find(BaseUrl, "://")
		local _, EndIndex1 = string.find(BaseUrl, "%.", EndIndex + 1)
		
		return (string.sub(BaseUrl, EndIndex1 + 1))
	end,
	requestAndRetryPost = function(ApiUrl, Data)
		-- upvalues: requestAndRetry (copy), HttpRbxApiService (copy)
		return requestAndRetry(function()
			-- upvalues: HttpRbxApiService (upval), ApiUrl (copy), Data (copy)
			return HttpRbxApiService:PostAsyncFullUrl(ApiUrl, Data)
		end)
	end,
	requestAndRetryGet = function(ApiUrl)
		-- upvalues: requestAndRetry (copy), HttpRbxApiService (copy)
		return requestAndRetry(function()
			-- upvalues: HttpRbxApiService (upval), ApiUrl (copy)
			return HttpRbxApiService:GetAsyncFullUrl(ApiUrl)
		end)
	end
}