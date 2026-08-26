local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: appStorageService (ref), httpService (ref), t (ref)
	local t_1 = {
		_appStorageService = p1 or appStorageService,
		_httpService = httpService,
		_jsonDecodeCache = {}
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:getCachedJsonForKey(p1, p2)
	local var1
	local _ = nil
	
	if self._jsonDecodeCache[p1] == nil or p2 then
		var1 = self:decodeInternal(p1)
		self._jsonDecodeCache[p1] = var1
	else
		var1 = self._jsonDecodeCache[p1]
	end
	return var1.result
end

function t.decodeInternal(p1, p2)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), p2 (ref)
		return p1._appStorageService:GetItem(p2)
	end)
	
	if not ok then
		return { result = nil }
	end
	local ok_1, status_1 = pcall(function()
		-- upvalues: p1 (ref), status (ref)
		return p1._httpService:JSONDecode(status)
	end)
	
	return if ok_1 then { result = status_1 } else { result = nil }
end

t.default = t.new(nil)

return t