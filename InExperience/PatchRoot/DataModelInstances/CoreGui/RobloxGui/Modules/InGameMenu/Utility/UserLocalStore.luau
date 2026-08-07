local appStorageService = game:GetService("AppStorageService")
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")

local function _() --[[ line: 5 | named "getCurrentUser" ]]
	-- upvalues: playersService (ref)
	return if playersService.LocalPlayer and playersService.LocalPlayer.UserId > 0 then tostring(playersService.LocalPlayer.UserId) else "0"
end

local _ = function(p0) --[[ line: 14 | named "getUserKey" ]]
	return "u_" .. tostring(p0 or "0")
end

local function getValuesForAllUsers(p1) --[[ line: 18 ]]
	-- upvalues: appStorageService (ref), httpService (ref)
	local var5 = appStorageService:GetItem(p1)
	local ok, status = pcall(function() --[[ line: 20 ]]
		-- upvalues: httpService (copy), var5 (ref)
		return httpService:JSONDecode(var5)
	end)
	
	return if ok and type(status) == "table" then status else { default = var5 }
end

local _ = function(value, p2) --[[ line: 32 | named "setValuesForAllUsers" ]]
	-- upvalues: httpService (ref), appStorageService (ref)
	appStorageService:SetItem(value, httpService:JSONEncode(p2))
end

local t = {}
t.__index = t

function t.new(p3) --[[ line: 40 ]]
	-- upvalues: playersService (ref), t (ref)
	if not p3 then
		p3 = if playersService.LocalPlayer and playersService.LocalPlayer.UserId > 0 then tostring(playersService.LocalPlayer.UserId) else "0"
	end
	local t_1 = { userId = tostring(p3) }
	setmetatable(t_1, t)
	
	return t_1
end

function t:GetItem(p4) --[[ line: 52 ]]
	-- upvalues: getValuesForAllUsers (ref)
	local var7 = getValuesForAllUsers(p4)
	local var8 = var7["u_" .. tostring(self.userId or "0")]
	
	if var8 == nil then
		var8 = var7.default
	end
	return var8
end

function t:SetItem(p5, p6) --[[ line: 62 ]]
	-- upvalues: getValuesForAllUsers (ref), httpService (ref), appStorageService (ref)
	local var9 = getValuesForAllUsers(p5)
	var9["u_" .. tostring(self.userId or "0")] = p6
	appStorageService:SetItem(p5, httpService:JSONEncode(var9))
end

function t.Flush(_) --[[ line: 69 ]]
	-- upvalues: appStorageService (ref)
	appStorageService:Flush()
end

t.getItem = t.GetItem
t.setItem = t.SetItem
t.flush = t.Flush

return t