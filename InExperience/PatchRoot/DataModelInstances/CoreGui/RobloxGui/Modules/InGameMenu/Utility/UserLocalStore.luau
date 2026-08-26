local appStorageService = game:GetService("AppStorageService")
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")

local function _()
	-- upvalues: playersService (ref)
	return if playersService.LocalPlayer and playersService.LocalPlayer.UserId > 0 then tostring(playersService.LocalPlayer.UserId) else "0"
end

local _ = function(p1)
	return "u_" .. tostring(p1 or "0")
end

local function getValuesForAllUsers(p1)
	-- upvalues: appStorageService (ref), httpService (ref)
	local var1 = appStorageService:GetItem(p1)
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), var1 (ref)
		return httpService:JSONDecode(var1)
	end)
	
	return if ok and type(status) == "table" then status else { default = var1 }
end

local _ = function(value, p1)
	-- upvalues: httpService (ref), appStorageService (ref)
	appStorageService:SetItem(value, httpService:JSONEncode(p1))
end

local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: playersService (ref), t (ref)
	if not p1 then
		p1 = if playersService.LocalPlayer and playersService.LocalPlayer.UserId > 0 then tostring(playersService.LocalPlayer.UserId) else "0"
	end
	local t_1 = { userId = tostring(p1) }
	setmetatable(t_1, t)
	
	return t_1
end

function t:GetItem(p1)
	-- upvalues: getValuesForAllUsers (ref)
	local var1 = getValuesForAllUsers(p1)
	local var2 = var1["u_" .. tostring(self.userId or "0")]
	
	if var2 == nil then
		var2 = var1.default
	end
	return var2
end

function t:SetItem(p1, p2)
	-- upvalues: getValuesForAllUsers (ref), httpService (ref), appStorageService (ref)
	local var1 = getValuesForAllUsers(p1)
	var1["u_" .. tostring(self.userId or "0")] = p2
	appStorageService:SetItem(p1, httpService:JSONEncode(var1))
end

function t.Flush(_)
	-- upvalues: appStorageService (ref)
	appStorageService:Flush()
end

t.getItem = t.GetItem
t.setItem = t.SetItem
t.flush = t.Flush

return t