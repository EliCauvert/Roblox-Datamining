local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local t = {}
t.__index = t

function t.new(p0) --[[ line: 20 ]]
	-- upvalues: appStorageService (ref), httpService (ref), t (ref)
	local t_1 = {
		_appStorageService = p0 or appStorageService,
		_httpService = httpService,
		_jsonDecodeCache = {}
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:getCachedJsonForKey(p1, p2) --[[ line: 30 ]]
	local var4
	local _ = nil
	
	if self._jsonDecodeCache[p1] == nil or p2 then
		var4 = self:decodeInternal(p1)
		self._jsonDecodeCache[p1] = var4
	else
		var4 = self._jsonDecodeCache[p1]
	end
	return var4.result
end

function t.decodeInternal(p3, p4) --[[ line: 41 ]]
	local ok, status = pcall(function() --[[ line: 42 ]]
		-- upvalues: p3 (ref), p4 (ref)
		return p3._appStorageService:GetItem(p4)
	end)
	
	if not ok then
		return { result = nil }
	end
	local ok_1, status_1 = pcall(function() --[[ line: 50 ]]
		-- upvalues: p3 (ref), status (ref)
		return p3._httpService:JSONDecode(status)
	end)
	
	return if ok_1 then { result = status_1 } else { result = nil }
end

t.default = t.new(nil)

return t