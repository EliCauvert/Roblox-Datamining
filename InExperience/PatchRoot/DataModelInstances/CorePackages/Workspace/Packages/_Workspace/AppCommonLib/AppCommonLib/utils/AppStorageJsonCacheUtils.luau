local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local AppStorageJsonCacheUtils = {}
AppStorageJsonCacheUtils.__index = AppStorageJsonCacheUtils

function AppStorageJsonCacheUtils.new(p1) --[[ Line: 20 ]]
	-- upvalues: AppStorageService (copy), HttpService (copy), AppStorageJsonCacheUtils (copy)
	local config = {
		_appStorageService = p1 or AppStorageService,
		_httpService = HttpService,
		_jsonDecodeCache = {}
	}
	setmetatable(config, AppStorageJsonCacheUtils)
	
	return config
end

function AppStorageJsonCacheUtils:getCachedJsonForKey(p1, p2) --[[ Line: 30 ]]
	local DecodeInternalResult = nil
	if self._jsonDecodeCache[p1] == nil or p2 then
		DecodeInternalResult = self:decodeInternal(p1)
		self._jsonDecodeCache[p1] = DecodeInternalResult
	else
		DecodeInternalResult = self._jsonDecodeCache[p1]
	end
	return DecodeInternalResult.result
end

function AppStorageJsonCacheUtils.decodeInternal(p1, p2) --[[ Line: 41 ]]
	local Success, Result = pcall(function() --[[ Line: 42 ]]
		-- upvalues: p1 (copy), p2 (copy)
		return p1._appStorageService:GetItem(p2)
	end)
	
	if Success then
		local Success1, Result1 = pcall(function() --[[ Line: 50 ]]
			-- upvalues: p1 (copy), Result (copy)
			return p1._httpService:JSONDecode(Result)
		end)
		
		return if Success1 then { result = Result1 } else { result = nil }
	else
		return { result = nil }
	end
end

AppStorageJsonCacheUtils.default = AppStorageJsonCacheUtils.new(nil)

return AppStorageJsonCacheUtils